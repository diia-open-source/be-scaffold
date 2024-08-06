---
to:  <%= serviceName %>/src/actions/v1/getAddResult.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { ValidationSchema } from '@diia-inhouse/validators'

import { ActionResult, Context } from '@interfaces/actions/v1/getAddResult'

export default class GetAddResultAction implements GrpcAppAction<Context> {
    readonly name = 'getAddResult'

    readonly validationRules: ValidationSchema<GetAddResultReq> = {
        a: {type: 'number'},
        b: {type: 'number'}
    }

    async handler(args: Context): Promise<ActionResult> {
        const { params: { a, b } } = args

        return { result: a + b }
    }
}
