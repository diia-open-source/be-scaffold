---
to:  <%= actionPath %>
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

<% if (isActionWithValidation) { %>
  import { ValidationSchema } from '@diia-inhouse/validators'
<% } %>

import { ActionResult, Context } from '<%= relativeInterfacePath %>'

export default class <%= h.changeCase.pascal(name) %>Action implements GrpcAppAction<Context> {
    constructor(private readonly service: unknown) {}

    readonly name: string = '<%= name %>'

    <% if (isActionWithValidation) { %>
      readonly validationRules: ValidationSchema<Context['params']> = {}
    <% } %>
      
    async handler(args: Context): Promise<ActionResult> {
        const {
            params: {},
        } = args
    }
}

