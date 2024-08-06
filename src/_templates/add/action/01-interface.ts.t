---
to:  <%= interfacePath %>
---

import { ActionContext } from '@diia-inhouse/types'

import { <%= h.changeCase.pascal(name) %>Req, <%= h.changeCase.pascal(name) %>Res } from '@src/generated'


export type Context = ActionContext<<%= h.changeCase.pascal(name) %>Req>

export type ActionResult = <%= h.changeCase.pascal(name) %>Res
