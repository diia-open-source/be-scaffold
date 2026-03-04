---
to:  <%= interfacePath %>/adminExecuteQuery.ts
---
import { ActionContext } from '@diia-inhouse/types'

import { AdminExecuteQueryReq, AdminExecuteQueryRes } from '@src/generated'

export type Context = ActionContext<AdminExecuteQueryReq>

export type ActionResult = AdminExecuteQueryRes
