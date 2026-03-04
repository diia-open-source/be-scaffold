---
to:  <%= serviceName %>/src/actions/v1/getAddResult.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'
import { SessionType } from '@diia-inhouse/types'
import { ValidationSchema } from '@diia-inhouse/validators'

import { GetAddResultReq } from '@src/generated'

import AddService from '@services/add'

import { ActionResult, Context } from '@interfaces/actions/v1/getAddResult'

export default class GetAddResultAction implements GrpcAppAction<Context> {
    readonly name = 'getAddResult'

    readonly sessionType = SessionType.None

    readonly validationRules: ValidationSchema<GetAddResultReq> = {
        a: {type: 'number'},
        b: {type: 'number'}
    }

    constructor(private readonly addService: AddService) {}

    async handler(args: Context): Promise<ActionResult> {
        const { params: { a, b } } = args

        const result = this.addService.add(a, b)

        return { result }
    }
}
