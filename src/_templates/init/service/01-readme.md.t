---
to:  <%= serviceName %>/README.md
---

# Service setup instructions. Remove after setup.

- [ ] Init git repo and push separate branch "semantic-dummy-release". It's needed for semantic release mechanism.
- [ ] Ask DevOps to add service to the infra repo
- [ ] Create an mr to setup envoy to proxy grpc requests to this service - [example](https://gitlab.diia.org.ua/diia-devops/master-core/-/merge_requests/589/diffs)


### <%= serviceName %>

<%= description %>

<%= selectedReadmePointValues.has('figma') ? `🖼️ [Figma](${selectedReadmePointValues.get('figma')})` : '' %>
<%= selectedReadmePointValues.has('api') ? `🚪 [API](${selectedReadmePointValues.get('api')})` : '' %>
<%= selectedReadmePointValues.has('docs') ? `📄 [Docs](${selectedReadmePointValues.get('docs')})` : '' %>