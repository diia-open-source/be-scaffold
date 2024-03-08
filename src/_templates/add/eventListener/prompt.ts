import path from 'path'

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
        const fileName = `${camelCase(eventEnumKey)}.ts`
        const eventPath = path.resolve(process.cwd(), 'src/eventListeners', fileName)
        const eventInterfacePath = path.resolve(process.cwd(), 'src/interfaces/eventListeners', fileName)

        return { eventEnumKey, eventPath, eventInterfacePath }
    },
}
