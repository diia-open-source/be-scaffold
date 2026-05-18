---
to:  <%= serviceName %>/src/views/exampleViews/index.ts
---

export { <%= h.changeCase.pascalCase(serviceName) %>InfoViews as default } from './view.js'

export * from './interface.js'
