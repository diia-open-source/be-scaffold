---
to:  <%= workerRoot %>/workflows/workflowExample.ts
---

import { buildActivitiesProxy, log } from '@diia-inhouse/workflow/operations'

import type { workerActivities } from '../../activities'

const { exampleActivities } = buildActivitiesProxy<typeof workerActivities>()

const activities = exampleActivities({
    startToCloseTimeout: '24 hours',
    heartbeatTimeout: '120 seconds',
    retry: {
        maximumAttempts: 7,
        initialInterval: '5 minutes',
        maximumInterval: '60 minutes',
    },
})

export async function exampleWorkflow(): Promise<void> {
    log.info('Starting example workflow')

    await activities.exampleActivity()
}
