---
to:  <%= interfacePath %>/adminExecuteQuery.types.ts
---
import { ActionContext } from '@diia-inhouse/types'

import { AdminExecuteQueryReq, AdminExecuteQueryRes } from '#generated/index.js'

export type Context = ActionContext<AdminExecuteQueryReq>

export type ActionResult = AdminExecuteQueryRes
