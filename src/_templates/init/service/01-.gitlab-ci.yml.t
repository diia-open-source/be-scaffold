---
to:  <%= serviceName %>/.gitlab-ci.yml
---

variables:
    CHART_NAME: <%= serviceName.replace(/-service$/, '') %>
    NEW_TEST: 'true'
    RUN_INTEGRATION_TESTS: 'true'
    RUN_UNIT_TESTS: 'false'
    CI_PIPELINE_TYPE: nodeJS-tag
    CI_BUFBUILD_PROTOBUF_VERSION: '2.12.0'
    NODE_DEBIAN_BUILD_ENABLED: 'true'
    CI_PROTO_BUF: 'true'
    CI_PROTO_BREAKING: 'true'

include:
    - project: diia-inhouse/ci
      ref: main
      file: main/node.gitlab-ci.yaml
