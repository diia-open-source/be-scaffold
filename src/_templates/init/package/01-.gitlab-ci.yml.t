---
to:  <%= packageName %>/.gitlab-ci.yml
---

variables:
    LINT_COMMIT: 'true'
    RUN_UNIT_TESTS: 'true'
    NODE_PACKAGE_MANAGER: 'npm'

include:
    project: diia-inhouse/ci
    ref: main
    file: main/package.gitlab-ci.yaml
