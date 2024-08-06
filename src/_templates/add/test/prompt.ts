import fs from 'node:fs'
import path from 'node:path'

import { Answers } from '../../../interfaces/_templates/add/test'
import { promptAutoComplete } from '../../../prompt/autocomplete'
import { getSharedTemplate } from '../../../utils'

async function walker(): Promise<string[]> {
    const acc: string[] = []
    const rootActionsFolderPath = path.resolve(process.cwd(), 'src/actions')

    const fn = async (currentFolderPath: string): Promise<void> => {
        const readdirResult = fs.readdirSync(currentFolderPath, { withFileTypes: true })

        for (const file of readdirResult.filter((entity) => entity.isFile())) {
            const from = path.resolve(process.cwd(), 'src')
            const currentFilePath = path.join(currentFolderPath, path.parse(file.name).name)

            const relativeFilePath = path.relative(from, currentFilePath)

            acc.push(relativeFilePath)
        }

        const folders = readdirResult.filter((entity) => entity.isDirectory()).map((folder) => path.join(currentFolderPath, folder.name))

        await Promise.all(folders.map((folder) => fn(folder)))
    }

    await fn(rootActionsFolderPath)

    return acc
}

export default {
    prompt: async (): Promise<Answers> => {
        const actionPath = await promptAutoComplete({
            name: 'action',
            message: 'Choose action folder',
            choices: await walker(),
        })

        const actionName = path.basename(actionPath)

        const testPath = path.join('tests', 'integration', `${actionPath}.spec.ts`)
        const relativeInterfacePathFromTest = path.join('@interfaces', actionPath)
        const relateActionPathFromTest = path.join('@src', actionPath)

        const result = {
            sharedTemplatePath: getSharedTemplate('actionTest.t'),

            testPath,
            name: actionName,
            relativeInterfacePath: relativeInterfacePathFromTest,
            relateActionPathFromTest,
        }

        return result
    },
}
