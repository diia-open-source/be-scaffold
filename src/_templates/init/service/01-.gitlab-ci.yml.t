---
to:  <%= serviceName %>/.gitlab-ci.yml
---

variables:
    CHART_NAME: <%= serviceName %> 
    NEW_TEST: 'true'
    RUN_INTEGRATION_TESTS: 'true'
    RUN_UNIT_TESTS: 'false'
    NODE_PACKAGE_MANAGER: 'npm'
    CI_BUILD_INSTALLS: protobuf-dev
    CI_RELEASE_INSTALLS: protobuf-dev

include:
    - project: diia-inhouse/ci
      ref: main
      file: main/node.gitlab-ci.yaml
    - project: diia-inhouse/ci
      ref: main
      file: main/proto.gitlab-ci.yaml
