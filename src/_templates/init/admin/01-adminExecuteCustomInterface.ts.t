---
to:  <%= interfacePath %>/adminExecuteCommand.ts
---
import { ActionContext } from '@diia-inhouse/types'

import { AdminExecuteCustomReq, AdminExecuteCustomRes } from '@src/generated'

export type Context = ActionContext<AdminExecuteCustomReq>

export type ActionResult = AdminExecuteCustomRes
