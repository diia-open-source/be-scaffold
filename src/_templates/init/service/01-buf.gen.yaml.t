---
to:  <%= serviceName %>/buf.gen.yaml
---
version: v2
inputs:
    - directory: proto
plugins:
    - local: protoc-gen-diia-ts
      out: src/generated
      strategy: all
