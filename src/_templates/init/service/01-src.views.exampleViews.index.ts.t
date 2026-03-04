---
to:  <%= serviceName %>/src/views/exampleViews/index.ts
---

export { <%= h.changeCase.pascalCase(serviceName) %>InfoViews as default } from './view'

export * from './interface'
