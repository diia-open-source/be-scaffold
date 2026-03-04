---
to:  <%= actionPath %>/adminExecuteQuery.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { ModelExposer } from '@diia-inhouse/pkg-admin'
import { SessionType } from '@diia-inhouse/types'

import { ActionResult, Context } from '@interfaces/actions/v1/admin/adminExecuteQuery'

export default class AdminExecuteQueryAction implements GrpcAppAction<Context> {
    readonly name = 'adminExecuteQuery'

    readonly sessionType = SessionType.None

    constructor(private readonly modelExposer: ModelExposer) {}

    async handler(args: Context): Promise<ActionResult> {
        return await this.modelExposer.executeQuery(args.params.params)
    }
}
