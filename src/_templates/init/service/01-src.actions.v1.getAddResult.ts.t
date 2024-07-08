---
to:  <%= serviceName %>/src/actions/v1/getAddResult.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { ActionContext } from '@diia-inhouse/types'
import { ValidationSchema } from '@diia-inhouse/validators'

import { GetAddResultReq, GetAddResultRes } from '@src/generated'

export default class GetAddResultAction implements GrpcAppAction<ActionContext<GetAddResultReq>> {
    readonly name = 'getAddResult'

    readonly validationRules: ValidationSchema<GetAddResultReq> = {
        a: {type: 'number'},
        b: {type: 'number'}
    }

    async handler(args: ActionContext<GetAddResultReq>): Promise<GetAddResultRes> {
        const { params: { a, b } } = args

        return { result: a + b }
    }
}
