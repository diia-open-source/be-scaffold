import <%= h.changeCase.pascal(name) %>Action from '<%= relateActionPathFromTest %>'

import { getApp } from '@tests/utils/getApp'

import { ActionResult } from '<%= relativeInterfacePath %>'

describe(`Action ${<%= h.changeCase.pascal(name) %>Action.name}`, () => {
    const app = getApp()
    const <%= name %>Action = app.container.build(<%= h.changeCase.pascal(name) %>Action)
    const testKit = app.container.resolve('testKit')

    beforeAll(async () => {
        await app.start()
    })

    afterAll(async () => {
        await app.stop()
    })

    it('should *ExpectedBehavior* when *StateUnderTest*', async () => {
        // Arrange
        const headers = testKit.session.getHeaders()
        const session = testKit.session.getUserSession()

        // Act
        const result = await <%= name %>Action.handler({session, headers, params: {}})

        // Assert
        expect(result).toEqual<ActionResult>({})
    })
})