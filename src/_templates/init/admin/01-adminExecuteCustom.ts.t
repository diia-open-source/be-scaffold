---
to:  <%= actionPath %>/adminExecuteCustom.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { SessionType } from '@diia-inhouse/types'
import { ValidationSchema } from '@diia-inhouse/validators'

import { AdminActions } from '@services/admin/actions.js'
import AdminService from '@services/admin/index.js'

import { ActionResult, Context } from '@interfaces/actions/v1/admin/adminExecuteCustom.js'

export default class AdminExecuteCustomAction implements GrpcAppAction<Context> {
    readonly name = 'adminExecuteCustom'

    readonly sessionType = SessionType.None

    readonly validationRules: ValidationSchema<Context['params']> = {
        event: { type: 'string', enum: Object.keys(AdminActions) },
        params: { type: 'string' },
    }

    constructor(private readonly adminService: AdminService) {}

    async handler(args: Context): Promise<ActionResult> {
        const {
            params: { event, params = '' },
        } = args


        return await this.adminService.executeCustom(event as ExtractEvents<typeof AdminActions>, params)
    }
}
