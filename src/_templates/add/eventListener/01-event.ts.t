---
to: <%= eventPath %>
---

import { EventBusListener, InternalEvent } from '@diia-inhouse/diia-queue'
import { ValidationSchema } from '@diia-inhouse/validators'

import { EventPayload } from '@interfaces/eventListeners/<%= h.changeCase.camel(eventEnumKey) %>'

export default class <%= eventEnumKey %>EventListener implements EventBusListener {
    readonly event: InternalEvent = InternalEvent.<%= eventEnumKey %>

    readonly validationRules: ValidationSchema<EventPayload> = {}
    
    constructor(private readonly service: unknown) {}

    async handler(message: EventPayload): Promise<void> {}
}