import { clientCallOptions } from '@diia-inhouse/diia-app'

import { GrpcClient } from '@src/generated'

import TestKit from '@diia-inhouse/test'

import <%= h.changeCase.pascal(name) %>Action from '<%= relateActionPathFromTest %>'

import { getApp } from '@tests/utils/getApp'

import { ActionResult } from '<%= relativeInterfacePath %>'

describe(`Action ${<%= h.changeCase.pascal(name) %>Action.name}`, () => {
    let app: Awaited<ReturnType<typeof getApp>>
    let grpcClient: GrpcClient

    const testKit = new TestKit()

    beforeAll(async () => {
        app = await getApp()
        grpcClient = app.container.resolve('grpcClient')
    })

    it('should *ExpectedBehavior* when *StateUnderTest*', async () => {
        // Arrange
        const session = testKit.session.getUserSession()

        // Act
        const result = await grpcClient.<%= name %>(
            {},
            clientCallOptions({ session }),
        )

        // Assert
        expect(result).toEqual<ActionResult>({})
    })
})
