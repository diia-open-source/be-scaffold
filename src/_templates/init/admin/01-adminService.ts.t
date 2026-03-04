---
to:  <%= adminServicePath %>/index.ts
---
import { AdminExposer, ExtractEvents } from '@diia-inhouse/admin'

import { AdminActions } from './actions'

export default class AdminService {
    constructor(
        private readonly adminExposer: AdminExposer,
    ) {}

    async executeCustom(event: ExtractEvents<typeof AdminActions>, params: string): Promise<{ result: string }> {
        const actionExposer = this.adminExposer.getActionExposer<typeof AdminActions>()

        const { execute, isEventType } = actionExposer.process(event, params)

        return await execute(async (parsedParams) => {
            if (isEventType('testCustomAction', parsedParams)) {
            }
        })
    }
}
