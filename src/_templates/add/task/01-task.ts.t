---
to:  <%= taskPath %>
---

import { TaskListener } from '@diia-inhouse/diia-queue'

<% if (isTaskWithValidation) { %>
import { ValidationSchema } from '@diia-inhouse/validators'

import { TaskPayload } from '#tasks/<%= h.changeCase.camel(taskEnumKey) %>.types.js'
<% } %>

import { ServiceTask } from '#tasks/types.js'

export default class <%= taskEnumKey %>Task implements TaskListener {
    readonly name: string = ServiceTask.<%= taskEnumKey %>

    <% if (isDelayedTask) { %>
    readonly isDelayed: boolean = true
    <% } %>


    <% if (isTaskWithValidation) { %>
    readonly validationRules: ValidationSchema<TaskPayload> = {}
    <% } %>

    async handler(<%= isTaskWithValidation ? "payload: TaskPayload" : '' %>): Promise<void> {}
}
