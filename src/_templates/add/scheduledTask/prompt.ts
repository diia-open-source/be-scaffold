import path from 'node:path'

import { camelCase } from 'lodash'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/scheduledTask'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { taskEnumKey } = await prompter.prompt({
            type: 'input',
            name: 'taskEnumKey',
            message: "What's your ScheduledTask enum key?",
            required: true,
        })

        const scheduledTaskPath = path.resolve(process.cwd(), 'src/scheduledTasks', `${camelCase(taskEnumKey)}.ts`)

        return { taskEnumKey, scheduledTaskPath }
    },
}
