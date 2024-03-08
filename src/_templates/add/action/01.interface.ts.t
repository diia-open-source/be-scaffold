---
to:  <%= interfacePath %>
---

<% if (inheritedActionInterface) { %>
    import { <%= inheritedActionInterface  %> } from '@diia-inhouse/types'
<% } %>
import { <%= h.changeCase.pascal(name) %>Req, <%= h.changeCase.pascal(name) %>Res } from '@src/generated'


export interface CustomActionArguments <%= inheritedActionInterface ? `extends ${inheritedActionInterface}` : '' %> {
    params: <%= h.changeCase.pascal(name) %>Req
}

export type ActionResult = <%= h.changeCase.pascal(name) %>Res
