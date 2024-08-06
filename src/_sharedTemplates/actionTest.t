import TestKit from '@diia-inhouse/test'

import <%= h.changeCase.pascal(name) %>Action from '<%= relateActionPathFromTest %>'

import { getApp } from '@tests/utils/getApp'

import { ActionResult } from '<%= relativeInterfacePath %>'

describe(`Action ${<%= h.changeCase.pascal(name) %>Action.name}`, () => {
    let app: Awaited<ReturnType<typeof getApp>>

    let action: <%= h.changeCase.pascal(name) %>Action

    const testKit = new TestKit()

    beforeAll(async () => {
        app = await getApp()
        action = app.container.build(<%= h.changeCase.pascal(name) %>Action)
    })

    afterAll(async () => {
        await app.stop()
    })

    it('should *ExpectedBehavior* when *StateUnderTest*', async () => {
        // Arrange
        const headers = testKit.session.getHeaders()
        const session = testKit.session.getUserSession()

        // Act
        const result = await action.handler({session, headers, params: {}})

        // Assert
        expect(result).toEqual<ActionResult>({})
    })
})