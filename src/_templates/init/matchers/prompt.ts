import fs from 'fs'
import path from 'path'

import chalk from 'chalk'

import { Prompt } from '../../../interfaces'
import { Answers, ProjectJestType } from '../../../interfaces/_templates/init/matcher'
import { promptAutoComplete } from '../../../prompt'

const MATCHERS_FOLDER_NAME = 'matchers'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const testsPath = path.resolve(process.cwd(), 'tests')

        const existingMatchers = Object.values(ProjectJestType).filter((projectType) => {
            const matcherPath = path.resolve(testsPath, projectType, MATCHERS_FOLDER_NAME)

            return fs.existsSync(matcherPath)
        })

        if (existingMatchers.length) {
            console.log('\n')
            existingMatchers.forEach((projectJestType) => console.log(chalk.red.bold(`${projectJestType} matchers already exists!\r`)))
            throw new Error('Matchers are already initialized')
        }

        const { name } = await prompter.prompt({
            type: 'input',
            name: 'name',
            message: "\nWhat's your new matcher name?",
            required: true,
        })

        const projectFolder = await promptAutoComplete({
            name: 'projectFolder',
            message: 'Select jest-project where do you want use new matcher \r',
            choices: Object.values(ProjectJestType),
        })

        const matcherFolderPath = path.resolve(testsPath, projectFolder, MATCHERS_FOLDER_NAME)

        const rootMatcherPath = path.resolve(matcherFolderPath, 'index.ts')
        const isRootMatcherExists = fs.existsSync(rootMatcherPath)

        if (isRootMatcherExists) {
            console.log(chalk.red.bold(`${rootMatcherPath} already exists!\r`))

            throw new Error('You can use this scaffold only for matcher initialization')
        }

        const matcherPath = path.resolve(matcherFolderPath, `${name}.ts`)

        const jestTypesDeclarationPath = path.resolve(testsPath, 'jest.d.ts')
        const isJestTypesDeclarationExists = fs.existsSync(jestTypesDeclarationPath)

        let rootTsConfigPath = path.resolve(process.cwd(), 'tsconfig.json')
        let extendedTsConfig = ''

        if (isJestTypesDeclarationExists) {
            console.log(chalk.red.bold(`${jestTypesDeclarationPath} already exists!\r`))
            console.log(chalk.red.bold('This file will be override\r'))

            rootTsConfigPath = ''
        } else {
            if (!fs.existsSync(rootTsConfigPath)) {
                throw new Error('You can use this scaffold only inside ts-project')
            }

            // eslint-disable-next-line @typescript-eslint/no-var-requires
            const tsConfig = require(rootTsConfigPath)

            extendedTsConfig = { ...tsConfig, include: [...tsConfig.include, 'tests/jest.d.ts'] }
        }

        const setupFilePath = path.resolve(testsPath, projectFolder, 'setup.ts')
        const isSetupFileExists = fs.existsSync(setupFilePath)

        const [newSetupFilePath, overrideSetupFilePath] = isSetupFileExists ? [undefined, setupFilePath] : [setupFilePath, undefined]

        return {
            name,
            matcherPath,
            rootMatcherPath,
            jestTypesDeclarationPath,
            tsConfigPath: rootTsConfigPath,
            tsConfigContent: extendedTsConfig,
            newSetupFilePath,
            overrideSetupFilePath,
        }
    },
}
