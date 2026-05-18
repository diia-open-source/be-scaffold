---
to:  <%= workerRoot %>/activities/index.ts
---

import { ExampleActivities } from './activityExample.js'

export const workerActivities = {
    exampleActivities: ExampleActivities,
} as const
