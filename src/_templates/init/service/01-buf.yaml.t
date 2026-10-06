---
to:  <%= serviceName %>/buf.yaml
---
version: v2
modules:
    - path: proto
    - path: node_modules/@diia-inhouse/design-system/dist/proto
    - path: node_modules/@diia-inhouse/types/dist/proto
deps:
    - buf.build/googleapis/googleapis
