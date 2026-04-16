---
title: Add var name to is empty checks
---

# Run 23

Note: @Agent refers to the AI agent (you) who is working on this task.

@Agent when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

In the task file there are many functions with checks like this:

```
    if [[ -z "$1" ]]; then
        echo '$1 is empty.'
        exit
    fi
```

The checks work, but it is unclear what the name of variable is.

Some functions have fixed:

```
prepare-migration-brach() {
    if [[ -z "$1" ]]; then
        echo '$1/path is empty.'
        exit
    fi
    if [[ -z "$2" ]]; then
        echo '$2/module is empty.'
        exit
    fi
    if [[ -z "$3" ]]; then
        echo '$3/version is empty.'
        exit
    fi
```

The names of the variables also match the help rows definition:

```
rows+=("prepare-migration-brach|[path][module][version]|Create migration branch for a module.")
```

I want you to update every function with a check with a variable name. Here is an example:

```
get-modules() {
    if [[ -z "$1" ]]; then echo '\$1 is empty.'; exit; fi
```

This becomes:

```
get-modules() {
    if [[ -z "$1" ]]; then echo '\$1/path is empty.'; exit; fi
```

Because the helper sys this:

```
rows+=("get-modules|[path][option]|Get list of modules in path. 'basename' or 'dirname'.") 
```

Another example:

```
generate-module-security() {
    if [[ -z "$1" ]]; then
        echo '$1 is empty.'
        exit
    fi
    if [[ -z "$2" ]]; then
        echo '$2 is empty.'
        exit
    fi
```

Becomes:

```
generate-module-security() {
    if [[ -z "$1" ]]; then
        echo '$1/path is empty.'
        exit
    fi
    if [[ -z "$2" ]]; then
        echo '$2/model is empty.'
        exit
    fi
```

Because:

```
rows+=("generate-module-security|[path][model]|Generate model access file.")
```

Do not script this process. Check every function of the task script and update according to the help row.

Some variables are optional, this is not mentioned explicitly. You can upate the help row. Here is an exapmle:

```
rows+=("get-modules|<path>[option]|Get list of modules in path. 'basename' or 'dirname'.")
```

After every change execute the `task` script to check if it still works.