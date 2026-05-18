---
to:  <%= viewPath %>
---

import { ViewParams, ViewScreen } from './interface.js'

export class <%= className %> {
    toScreen(params: ViewParams): ViewScreen {
        return {
            topGroup: [],
            body: [],
            bottomGroup: [],
        }
    }
}
