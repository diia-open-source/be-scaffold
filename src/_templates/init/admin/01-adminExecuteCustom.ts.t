---
to:  <%= actionPath %>/adminExecuteCustom.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { SessionType } from '@diia-inhouse/types'
import { ValidationSchema } from '@diia-inhouse/validators'

import AdminService from '@services/admin'

import { ActionResult, Context } from '@interfaces/actions/v1/admin/adminExecuteCustom'

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
