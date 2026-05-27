---
to:  <%= interfacePath %>/adminExecuteCustom.types.ts
---
import { ActionContext } from '@diia-inhouse/types'

import { AdminExecuteCustomReq, AdminExecuteCustomRes } from '#generated/index.js'

export type Context = ActionContext<AdminExecuteCustomReq>

export type ActionResult = AdminExecuteCustomRes
