import fs from 'node:fs'
import path from 'node:path'

import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/add/generator'
import { promptBaseSelect, promptYesNoSelect } from '../../../prompt'

const NEW_GENERATOR_TYPE = 'new-type'

function getGeneratorTypes(): string[] {
    const generatorsPath = path.resolve(process.cwd(), 'src/_templates')

    const generators = fs
        .readdirSync(generatorsPath, { withFileTypes: true })
        .filter((entity) => entity.isDirectory())
        .map((directory) => directory.name)

    return [NEW_GENERATOR_TYPE, ...generators]
}

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const { generatorName } = await prompter.prompt({
            type: 'input',
            name: 'generatorName',
            message: "What's your new generator name?",
            required: true,
        })

        const generatorTypeAnswer = await promptBaseSelect({ message: "What's your new generator name?", choices: getGeneratorTypes() })

        let generatorFolder = generatorTypeAnswer

        if (generatorTypeAnswer === NEW_GENERATOR_TYPE) {
            const { newGeneratorType } = await prompter.prompt({
                type: 'input',
                name: 'newGeneratorType',
                message: "What's your new generator type?",
                required: true,
            })

            generatorFolder = newGeneratorType
        }

        const withScriptRunner = await promptYesNoSelect({ message: 'Do you need to execute scripts after generation?' })

        const generatorPath = path.resolve(process.cwd(), 'src/_templates', generatorFolder, generatorName)
        const generatorInterfacePath = path.join(process.cwd(), 'src/interfaces/_templates', generatorFolder, generatorName)
        const generatorRelativeInterfacePath = path.relative(generatorPath, generatorInterfacePath)

        const scriptRunnerPath = withScriptRunner ? path.resolve(generatorPath, '02-scriptRunner.ts.t') : ''

        return { generatorPath, generatorInterfacePath, generatorRelativeInterfacePath, scriptRunnerPath, generatorName }
    },
}
