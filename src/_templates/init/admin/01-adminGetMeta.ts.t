---
to:  <%= actionPath %>/adminGetMeta.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { AdminExposer } from '@diia-inhouse/admin'
import { SessionType } from '@diia-inhouse/types'

import { ActionResult } from '@interfaces/actions/v1/admin/adminGetMeta'

export default class AdminGetMetaAction implements GrpcAppAction {
    readonly name = 'adminGetMeta'

    readonly sessionType = SessionType.None

    constructor(private readonly adminExposer: AdminExposer) {}

    async handler(): Promise<ActionResult> {
        return await this.adminExposer.getMeta()
    }
}
