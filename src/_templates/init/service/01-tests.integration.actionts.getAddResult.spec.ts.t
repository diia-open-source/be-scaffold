---
to:  <%= serviceName %>/tests/integration/actions/v1/addAction.spec.ts
---

import GetAddResultAction from '@src/actions/v1/getAddResult'

import { getApp } from '@tests/utils/getApp'

describe(`Action ${GetAddResultAction.name}`, () => {
    const app = getApp()
    const getAddResult = app.container.build(GetAddResultAction)
    const testKit = app.container.resolve('testKit')

    beforeAll(async () => {
        await app.start()
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
        expect(result).toEqual({ result: 5 })
    })
})
