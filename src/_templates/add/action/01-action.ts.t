---
to:  <%= actionPath %>
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { ActionContext } from '@diia-inhouse/types'
<% if (isActionWithValidation) { %>
  import { ValidationSchema } from '@diia-inhouse/validators'
<% } %>

import { <%= h.changeCase.pascal(name) %>Req, <%= h.changeCase.pascal(name) %>Res } from '@src/generated'

export default class <%= h.changeCase.pascal(name) %>Action implements GrpcAppAction<ActionContext<<%= h.changeCase.pascal(name) %>Req>> {
    constructor(private readonly service: unknown) {}

    readonly name: string = '<%= name %>'

    <% if (isActionWithValidation) { %>
      readonly validationRules: ValidationSchema<<%= h.changeCase.pascal(name) %>Req> = {}
    <% } %>
      
    async handler(args: ActionContext<<%= h.changeCase.pascal(name) %>Req>): Promise<<%= h.changeCase.pascal(name) %>Res> {
        const {
            params: {},
        } = args
    }
}

