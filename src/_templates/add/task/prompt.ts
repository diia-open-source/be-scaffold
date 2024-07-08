import path from 'node:path'

import { camelCase } from 'lodash'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/task'
import { YesNoAnswer } from '../../../interfaces/prompt/select'
import { promptYesNoSelect } from '../../../prompt'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { taskEnumKey } = await prompter.prompt({
            type: 'input',
            name: 'taskEnumKey',
            message: "What's your ServiceTask enum key?",
            required: true,
        })

        const isTaskWithValidation = await promptYesNoSelect({
            message: 'Do you need validation?',
            initial: YesNoAnswer.Yes,
        })

        const isDelayedTask = await promptYesNoSelect({
            message: 'Do you need delayed task?',
            initial: YesNoAnswer.Yes,
        })

        const fileName = `${camelCase(taskEnumKey)}.ts`
        const taskPath = path.resolve(process.cwd(), 'src/tasks', fileName)
        const taskInterfacePath = isTaskWithValidation ? path.resolve(process.cwd(), 'src/interfaces/tasks', fileName) : ''

        return { taskEnumKey, taskPath, isTaskWithValidation, taskInterfacePath, isDelayedTask }
    },
}
