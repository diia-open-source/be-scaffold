---
to: <%= generatorPath %>/prompt.ts
---
import {Answers} from '<%= generatorRelativeInterfacePath %>'

import { Prompt } from '../../../interfaces'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { name } = await prompter.prompt({
            type: 'input',
            name: 'name',
            message: "input name",
            required: true,
        })

        return { name }
    },
}
