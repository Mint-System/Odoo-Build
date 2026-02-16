---
title: Setup tests for kubectl module
---

# Run 04

Replace the `==` marked instructions in this file while you work on the task.

## Context

Read the `AGENTS.md` and `README.md` to get understanding of the project.

## Task

I want you to update the module `addons/kubernetes/kubectl`. It has a file `addons/kubernetes/kubectl/tests/TEST_INSTRUCTIONS.rst` with manual testing instructions. I want you to implement the first test.

Create a file `tests/test_kubectl_context.py`. Define a cluster and context similar to the demo data.

Mock the `run` method for the `test_connection_to_kind_cluster` test. Check if the correct command has been built by the module.

Once you have implemented this test, you can run the tests like this:

```bash
task init-module addons/kubernetes/kubectl
```

```bash
task test-module kubectl
```
