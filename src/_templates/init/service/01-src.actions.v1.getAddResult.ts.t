---
to:  <%= serviceName %>/src/actions/v1/getAddResult.ts
---

import { GrpcAppAction } from '@diia-inhouse/diia-app'

import { ActionVersion, SessionType } from '@diia-inhouse/types'
import { ValidationSchema } from '@diia-inhouse/validators'

import { ActionResult, CustomActionArguments } from '@interfaces/actions/v1/getAddResult'

export default class GetAddResult implements GrpcAppAction {
    readonly sessionType = SessionType.None

    readonly actionVersion = ActionVersion.V1

    readonly name = 'getAddResult'

    readonly validationRules: ValidationSchema<CustomActionArguments['params']> = {
        a: {type: 'number'},
        b: {type: 'number'}
    }

    async handler(args: CustomActionArguments): Promise<ActionResult> {
        const { params: { a, b } } = args

        return { result: a + b }
    }
}
