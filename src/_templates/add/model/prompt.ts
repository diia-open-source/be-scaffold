import path from 'node:path'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/model'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { name } = await prompter.prompt({
            type: 'input',
            name: 'name',
            message: "What's your new model name?",
            required: true,
        })

        const modelPath = path.resolve(process.cwd(), 'src/models', `${name}.ts`)
        const interfacePath = path.resolve(process.cwd(), 'src/interfaces/models', `${name}.ts`)

        return { name, modelPath, interfacePath }
    },
}
