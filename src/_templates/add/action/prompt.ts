import fs from 'node:fs'
import path from 'node:path'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/action'
import { promptAutoComplete, promptYesNoSelect } from '../../../prompt'

const ROOT_ACTION = '.'
const NEW_FOLDER = 'new-folder'

function getActionsFolder(versionFolder: string): string[] {
    const actionVersionFolderPath = path.resolve(process.cwd(), 'src/actions', versionFolder)

    const isActionVersionFolderExists = fs.existsSync(actionVersionFolderPath)

    if (!isActionVersionFolderExists) {
        fs.mkdirSync(actionVersionFolderPath, { recursive: true })

        return [ROOT_ACTION, NEW_FOLDER]
    }

    const actionFolders = fs
        .readdirSync(actionVersionFolderPath, { withFileTypes: true })
        .filter((entity) => entity.isDirectory())
        .map((directory) => directory.name)

    return [ROOT_ACTION, NEW_FOLDER, ...actionFolders]
}

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { name: actionName } = await prompter.prompt({
            type: 'input',
            name: 'name',
            message: "What's your new action name?",
            required: true,
        })
        const { version } = await prompter.prompt({
            type: 'input',
            name: 'version',
            message: "What's your new action version?",
            initial: 1,
            required: true,
            format: (value: string): string => `v${value}`,
        })

        const normalizedVersion = `v${version}`

        let actionFolder = await promptAutoComplete({
            name: 'actionFolder',
            message: `Pick folder where do you want create new action \n 
        ${ROOT_ACTION}          -> create new action in src/actions \n
        ${NEW_FOLDER} -> create new folder with your action in src/actions \n`,
            choices: getActionsFolder(normalizedVersion),
        })

        if (actionFolder === NEW_FOLDER) {
            const { newFolderName } = await prompter.prompt({
                type: 'input',
                name: 'newFolderName',
                message: 'Please, enter new folder name',
                required: true,
            })

            actionFolder = newFolderName === normalizedVersion ? newFolderName : path.join(normalizedVersion, newFolderName)
        }

        const newActionPath =
            actionFolder === ROOT_ACTION ? path.join(normalizedVersion, actionName) : path.join(normalizedVersion, actionFolder, actionName)

        const finalActionPath = path.resolve(process.cwd(), 'src/actions', `${newActionPath}.ts`)
        const finalInterfacePath = path.resolve(process.cwd(), 'src/interfaces/actions', `${newActionPath}.ts`)

        const relativeInterfacePath = path.join('@interfaces/actions', newActionPath)

        const testPath = path.resolve(process.cwd(), 'tests/integration/actions/', `${newActionPath}.spec.ts`)
        const relateActionPathFromTest = path.join('@src/actions', newActionPath)

        const isActionWithValidation = await promptYesNoSelect({
            message: 'Do you need validation?',
        })

        return {
            name: actionName,
            version,
            actionPath: finalActionPath,
            interfacePath: finalInterfacePath,
            relativeInterfacePath,
            isActionWithValidation,
            testPath,
            relateActionPathFromTest,
        }
    },
}
