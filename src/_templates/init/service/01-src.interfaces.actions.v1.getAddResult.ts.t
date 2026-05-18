---
to:  <%= serviceName %>/src/interfaces/actions/v1/getAddResult.ts
---

import { ActionContext } from '@diia-inhouse/types'

import { GetAddResultReq, GetAddResultRes } from '@src/generated/index.js'

export type Context = ActionContext<GetAddResultReq>

export type ActionResult = GetAddResultRes
