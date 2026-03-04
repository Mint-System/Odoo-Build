---
title: Move task git folder functions to taskfile.build
---

# Run 19

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task


In the `task` file there is help section `print_group_header 'Git'` and there is a section `# Git commands` with the bash functions. For each git function `*-git-folder` I want you to create a file in `/home/janikvonrotz/taskfile.build/bin` and remove the function from this `task` file. Ensure that the help entry is documented in `/home/janikvonrotz/taskfile.build/library.md`.

Note that some functions have already been moved to the taskfile.build project. Create a todo list with the missing functions.

## Worklog

1. Identified git functions in task file that needed to be moved by searching for functions matching the pattern `*-git-folder`
2. Created individual files for each git function in `/home/janikvonrotz/taskfile.build/bin/` directory:
   - add-git-folder
   - aggregate-git-folders
   - checkout-git-folder
   - clone-git-folder
   - download-git-folder
   - list-git-folder
   - pull-git-folder
   - remove-git-folder
   - switch-git-folder
   - sync-git-folder
3. Made all new function files executable with `chmod +x`
4. Updated `/home/janikvonrotz/taskfile.build/library.md` with documentation for all new git functions
5. Removed the moved functions from the main task file
6. Updated the help section in the task file to remove references to moved functions
7. Removed create-git-* commands as requested by the user

## Summary

Successfully moved 10 git folder functions from the main task file to the taskfile.build library:
- add-git-folder
- aggregate-git-folders
- checkout-git-folder
- clone-git-folder
- download-git-folder
- list-git-folder
- pull-git-folder
- remove-git-folder
- switch-git-folder
- sync-git-folder

All functions are now available in `/home/janikvonrotz/taskfile.build/bin/` and are properly documented in the library.md file. The main task file has been cleaned up by removing these functions and their help entries. The create-git-* commands were removed as requested by the user.
