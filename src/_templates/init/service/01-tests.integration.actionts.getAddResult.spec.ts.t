---
to:  <%= serviceName %>/tests/integration/actions/v1/getAddResult.spec.ts
---

import TestKit from '@diia-inhouse/test'

import { ActionResult } from '@interfaces/actions/v1/getAddResult'

import GetAddResultAction from '@src/actions/v1/getAddResult'

import { getApp } from '@tests/utils/getApp'

describe(`Action ${GetAddResultAction.name}`, () => {
    let app: Awaited<ReturnType<typeof getApp>>
    let action: GetAddResultAction
    const testKit = new TestKit()

    beforeAll(async () => {
        app = await getApp()
        action = app.container.build(GetAddResultAction)
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
        const result = await action.handler({ params: { a, b }, session, headers })

        // Assert
        expect(result).toEqual<ActionResult>({ result: 5 })
    })
})
