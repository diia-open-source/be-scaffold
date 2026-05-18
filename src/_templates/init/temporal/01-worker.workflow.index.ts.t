---
to:  <%= workerRoot %>/workflows/index.ts
---

import { WorkflowInterceptorsFactory, workflowInterceptors } from '@diia-inhouse/workflow/operations'

export * from './workflowExample.js'

export const interceptors: WorkflowInterceptorsFactory = workflowInterceptors
