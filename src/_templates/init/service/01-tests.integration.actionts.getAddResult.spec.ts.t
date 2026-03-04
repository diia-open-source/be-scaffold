---
to:  <%= serviceName %>/tests/integration/actions/v1/getAddResult.spec.ts
---

import { <%= h.changeCase.pascal(serviceName) %>Client } from '@src/generated'

import { ActionResult } from '@interfaces/actions/v1/getAddResult'

import GetAddResultAction from '@src/actions/v1/getAddResult'

import { getApp } from '@tests/utils/getApp'

describe(`Action ${GetAddResultAction.name}`, () => {
    let app: Awaited<ReturnType<typeof getApp>>
    let <%= h.changeCase.camel(serviceName) %>Client: <%= h.changeCase.pascal(serviceName) %>Client

    beforeAll(async () => {
        app = await getApp()
        <%= h.changeCase.camel(serviceName) %>Client = app.container.resolve('<%= h.changeCase.camel(serviceName) %>Client')
    })

    it('should return correct result', async () => {
        // Arrange
        const a = 2;
        const b = 3;
        
        // Act
        const result = await <%= h.changeCase.camel(serviceName) %>Client.getAddResult({ a, b })

        // Assert
        expect(result).toEqual<ActionResult>({ result: 5 })
    })
})
