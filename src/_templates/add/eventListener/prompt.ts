import path from 'node:path'

import { camelCase } from 'lodash'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/eventListener'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { eventEnumKey } = await prompter.prompt({
            type: 'input',
            name: 'eventEnumKey',
            message: "What's your InternalEvent enum key?",
            required: true,
        })
        const fileBaseName = camelCase(eventEnumKey)
        const eventPath = path.resolve(process.cwd(), 'src/eventListeners', `${fileBaseName}.ts`)
        const eventInterfacePath = path.resolve(process.cwd(), 'src/eventListeners', `${fileBaseName}.types.ts`)

        return { eventEnumKey, eventPath, eventInterfacePath }
    },
}
