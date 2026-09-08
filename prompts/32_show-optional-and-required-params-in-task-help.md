---
title: "Show optional and required params in task help"
state: draft
model: 
input_tokens: 
---

# Run 32

Note: @Clanker refers to the "ai agent" (you) who is working on this task.

@Clanker when working on this task, make sure to:

- Read context and task section first
- Prepare a list of todos
- Update the todo list while working on the task

## Context

@Clanker Read the `AGENTS.md` and `README.md` to get an understanding of the project.

## Task

Currently the parameters of commands defined the `task` file are shown as optional:

```bash
[main][~/Odoo-Build]$ task help start-odoo-jupyter

   start-odoo-jupyter               [path][db]                 Start juypter lab in directory.                         

``` 

In this case the correct definition is:

```
[main][~/Odoo-Build]$ task help start-odoo-jupyter

   start-odoo-jupyter               <path>[db]                 Start juypter lab in directory.                         
```

Because according to the function the path is requied and db params is optional:

```bash
start-odoo-jupyter() {
    if [[ -z "$1" ]]; then
        echo '$1/path is empty.'
        exit
    fi
    local database="$2"
    if [[ -z "$database" ]]; then
        database="$DB_NAME"
    fi
```

For every command check the if the functions expect the param as required or optional.

While checking the functions also add the var name to empty check. This

```bash
record-with-py-spy() {
    if [[ -z "$1" ]]; then
        echo '$1 is empty.'
        exit
    fi
```

Must become:

```bash
record-with-py-spy() {
    if [[ -z "$1" ]]; then
        echo '$1/pid is empty.'
        exit
    fi
```

The name of the var can be derived from the help rows.

## Worklog

@Clanker Add a summary here once the task has been completed.

@Clanker Set frontmatter state to completed and update info about model and token usage.
