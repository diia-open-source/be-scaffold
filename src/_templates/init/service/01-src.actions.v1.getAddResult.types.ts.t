---
to:  <%= serviceName %>/src/actions/v1/getAddResult.types.ts
---

import { ActionContext } from '@diia-inhouse/types'

import { GetAddResultReq, GetAddResultRes } from '#generated/index.js'

export type Context = ActionContext<GetAddResultReq>

export type ActionResult = GetAddResultRes
