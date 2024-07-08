---
to:  <%= serviceName %>/tests/integration/actions/v1/getAddResult.spec.ts
---

import TestKit from '@diia-inhouse/test'

import GetAddResultAction from '@src/actions/v1/getAddResult'
import { GetAddResultRes } from '@src/generated'

import { getApp } from '@tests/utils/getApp'

describe(`Action ${GetAddResultAction.name}`, () => {
    let app: Awaited<ReturnType<typeof getApp>>
    let getAddResult: GetAddResultAction
    const testKit = new TestKit()

    beforeAll(async () => {
        app = await getApp()
        getAddResult = app.container.build(GetAddResultAction)
    })

    afterAll(async () => {
        await app.stop()
    })

    it('should return correct result', async () => {
        // Arrange
        const session = testKit.session.getUserSession()
        const headers = testKit.session.getHeaders()
        
        const a = 2;
        const b = 3;
        
        // Act
        const result = await getAddResult.handler({ params: { a, b }, session, headers })

        // Assert
        expect(result).toEqual<GetAddResultRes>({ result: 5 })
    })
})
