#!/usr/bin/env python3
import ast
import logging
import os
import re
import sys

logging.basicConfig(level=logging.INFO, format="%(message)s", stream=sys.stdout)

logger = logging.getLogger(__name__)

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "."))


def load_gitignore_patterns():
    """
    Load patterns from .gitignore file if it exists.
    """
    gitignore_path = os.path.join(PROJECT_ROOT, ".gitignore")
    patterns = set()

    if os.path.exists(gitignore_path):
        with open(gitignore_path, encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#"):
                    if line.endswith("/"):
                        patterns.add(line[:-1])
                    elif "*" not in line and "?" not in line and "/" not in line:
                        patterns.add(line)

    return patterns


EXCLUDED_PATTERNS = load_gitignore_patterns()

RED = "\033[91m"
YELLOW = "\033[93m"
GREEN = "\033[92m"
RESET = "\033[0m"


def find_python_files(base_dir):
    """
    Find all Python files recursively, excluding directories and files from .gitignore.
    """
    for root, dirs, files in os.walk(base_dir):
        dirs[:] = [d for d in dirs if d not in EXCLUDED_PATTERNS]

        for file in files:
            if file in EXCLUDED_PATTERNS:
                continue

            if file.endswith(".py"):
                filepath = os.path.join(root, file)
                rel_path = os.path.relpath(filepath, base_dir)

                if any(part in EXCLUDED_PATTERNS for part in rel_path.split(os.sep)):
                    continue

                yield rel_path


def extract_routes_with_underscores(filepath):
    """
    Extract routes with invalid underscores from a Python file.
    """
    routes_with_underscores = []

    try:
        with open(filepath, encoding="utf-8") as f:
            content = f.read()
            tree = ast.parse(content, filename=filepath)
    except (SyntaxError, UnicodeDecodeError, FileNotFoundError) as e:
        logger.info(f"{YELLOW}Warning: Could not parse {filepath}: {str(e)}{RESET}")
        return []

    for node in ast.walk(tree):
        if isinstance(node, ast.Call) and hasattr(node.func, "attr"):
            # Check for FastAPI and HTTP route decorators
            if node.func.attr in {"get", "post", "put", "delete", "patch", "route"}:
                for arg in node.args:
                    if isinstance(arg, ast.Constant) and isinstance(arg.value, str):
                        if has_invalid_underscore_in_route(arg.value):
                            routes_with_underscores.append((arg.value, filepath))

    return routes_with_underscores


def has_invalid_underscore_in_route(path: str) -> bool:
    """
    Check if a route path contains invalid underscores (excluding path variables).
    """
    stripped_path = re.sub(r"{[^}]*}", "", path)
    return "_" in stripped_path


def check_framework_routes(base_path, framework_identifier, check_message):
    """
    Check routes for a specific framework.
    """
    violations = []

    for py_file in find_python_files(base_path):
        try:
            with open(py_file, encoding="utf-8") as f:
                content = f.read()
                if framework_identifier in content:
                    violations.extend(extract_routes_with_underscores(py_file))
        except (UnicodeDecodeError, FileNotFoundError) as e:
            logger.info(f"{YELLOW}Warning: Could not read {py_file}: {str(e)}{RESET}")

    if violations:
        logger.info(f"{check_message} violations (underscores in paths):{RESET}")
        for route, file in violations:
            logger.info(f"{RED}{file}:{RESET} {YELLOW}{route}{RESET}")
        return True

    logger.info(f"{GREEN}No {check_message} violations found.{RESET}")
    return False


def main():
    """
    Main function to check for coding guidelines violations."
    """
    base_path = PROJECT_ROOT

    has_fastapi_violations = check_framework_routes(base_path, "fastapi", "FastAPI route")

    has_http_route_violations = check_framework_routes(base_path, "http.route", "HTTP route decorator")

    if has_fastapi_violations or has_http_route_violations:
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
