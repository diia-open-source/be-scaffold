---
to:  <%= serviceName %>/.gitlab-ci.yml
---

variables:
    CHART_NAME: <%= serviceName.replace(/-service$/, '') %>
    NEW_TEST: 'true'
    RUN_INTEGRATION_TESTS: 'true'
    RUN_UNIT_TESTS: 'false'
    TEST_RUNNER: 'vitest'
    CI_PIPELINE_TYPE: nodeJS-tag
    CI_BUFBUILD_PROTOBUF_VERSION: '2.12.0'

include:
    - project: diia-inhouse/ci
      ref: main
      file: main/node.gitlab-ci.yaml
    - project: diia-inhouse/ci
      ref: main
      file: main/proto.gitlab-ci.yaml
