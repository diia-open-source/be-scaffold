import path from 'node:path'

import { upperFirst } from 'lodash'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/view'

function getClassName(view: string): string {
    return [...view.split(path.sep).map((item) => upperFirst(item)), 'View'].join('')
}

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { view } = await prompter.prompt({
            type: 'input',
            name: 'view',
            message: "What's your view? (confirmation, banks/list, etc.)",
            required: true,
        })

        const viewPath = path.resolve(process.cwd(), 'src/views', view, 'view.ts')
        const interfacePath = path.resolve(process.cwd(), 'src/views', view, 'interface.ts')
        const indexPath = path.resolve(process.cwd(), 'src/views', view, 'index.ts')

        return {
            className: getClassName(view),
            viewPath,
            interfacePath,
            indexPath,
        }
    },
}
