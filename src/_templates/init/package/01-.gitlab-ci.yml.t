---
to:  <%= packageName %>/.gitlab-ci.yml
---

include:
    - project: diia-inhouse/ci
      ref: main
      file: main/package.gitlab-ci.yaml

variables:
    LINT_COMMIT: 'true'
    NODE_PACKAGE_MANAGER: 'npm'
    CHART_NAME: <%= packageName %>
    CI_PROTO_JAVA_DISABLE_TYPES: 'true'
