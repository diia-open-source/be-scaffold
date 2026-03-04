---
to:  <%= workerRoot %>/workflows/index.ts
---

import { WorkflowInterceptorsFactory, workflowInterceptors } from '@diia-inhouse/workflow/operations'

export * from './workflowExample'

export const interceptors: WorkflowInterceptorsFactory = workflowInterceptors
