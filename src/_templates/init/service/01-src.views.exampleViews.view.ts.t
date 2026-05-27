---
to:  <%= serviceName %>/src/views/exampleViews/view.ts
---

import { ViewParams, ViewScreen } from '#views/types.js'

export class <%= h.changeCase.pascalCase(serviceName) %>InfoViews {
    toScreen(_params: ViewParams): ViewScreen {
        return {
            topGroup: [],
            body: [],
            bottomGroup: [],
        }
    }
}
