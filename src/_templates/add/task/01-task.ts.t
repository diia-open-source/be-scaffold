---
to:  <%= taskPath %>
---

import { TaskListener } from '@diia-inhouse/diia-queue'

<% if (isTaskWithValidation) { %>
  import { ValidationSchema } from '@diia-inhouse/validators'
  import { ExternalEventPayload } from '@interfaces/externalEventListeners/<%= h.changeCase.camel(taskEnumKey) %>'
  import { TaskPayload } from '@interfaces/tasks/<%= h.changeCase.camel(taskEnumKey) %>'
<% } %>


import { ServiceTask } from '@interfaces/tasks'

export default class <%= taskEnumKey %>Task implements TaskListener {
  readonly name: string = ServiceTask.<%= taskEnumKey %>

  <% if (isDelayedTask) { %>
    readonly isDelayed: boolean = true
  <% } %>


  <% if (isTaskWithValidation) { %>
    readonly validationRules: ValidationSchema<TaskPayload> =  {}
  <% } %>

  async handler(<%= isTaskWithValidation ? "payload: TaskPayload" : '' %>): Promise<void> {}
}
