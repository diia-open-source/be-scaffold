---
to: <%= eventPath %>
---

import { EventBusListener, InternalEvent } from '@diia-inhouse/diia-queue'
import { ValidationSchema } from '@diia-inhouse/validators'

import { EventPayload } from '@interfaces/eventListeners/<%= h.changeCase.camel(eventEnumKey) %>'

export default class <%= eventEnumKey %>EventListener implements EventBusListener {
    constructor(private readonly service: unknown) {}

    readonly event: InternalEvent = InternalEvent.<%= eventEnumKey %>

    readonly validationRules: ValidationSchema<EventPayload> = {}

    async handler(message: EventPayload): Promise<void> {}
}