---
to:  <%= actionPath %>
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'
import { SessionType } from '@diia-inhouse/types'

<% if (isActionWithValidation) { %>
  import { ValidationSchema } from '@diia-inhouse/validators'
<% } %>

import { ActionResult, Context } from '<%= relativeInterfacePath %>'

export default class <%= h.changeCase.pascal(name) %>Action implements GrpcAppAction<Context> {
    readonly name = '<%= name %>'

    readonly sessionType = SessionType.None

    <% if (isActionWithValidation) { %>
      readonly validationRules: ValidationSchema<Context['params']> = {}
    <% } %>

    constructor(private readonly service: unknown) {}
  
    async handler(args: Context): Promise<ActionResult> {
        const {
            params: {},
        } = args
    }
}

