---
to:  <%= workerRoot %>/activities/index.ts
---

import { ExampleActivities } from './activityExample'

export const workerActivities = {
    exampleActivities: ExampleActivities,
} as const
