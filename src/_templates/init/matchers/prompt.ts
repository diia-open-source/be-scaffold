import fs from 'node:fs'
import path from 'node:path'

import chalk from 'chalk'

import { Prompt } from '../../../interfaces'
import { Answers, ProjectTestType } from '../../../interfaces/_templates/init/matcher'
import { promptAutoComplete } from '../../../prompt'

const MATCHERS_FOLDER_NAME = 'matchers'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        const testsPath = path.resolve(process.cwd(), 'tests')

        const existingMatchers = Object.values(ProjectTestType).filter((projectType) => {
            const matcherPath = path.resolve(testsPath, projectType, MATCHERS_FOLDER_NAME)

            // eslint-disable-next-line security/detect-non-literal-fs-filename
            return fs.existsSync(matcherPath) // nosemgrep: eslint.detect-non-literal-fs-filename
        })

        if (existingMatchers.length > 0) {
            console.log('\n')
            for (const projectTestType of existingMatchers) {
                console.log(chalk.red.bold(`${projectTestType} matchers already exists!\r`))
            }

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
            message: 'Select vitest-project where do you want use new matcher \r',
            choices: Object.values(ProjectTestType),
        })

        const matcherFolderPath = path.resolve(testsPath, projectFolder, MATCHERS_FOLDER_NAME)

        const rootMatcherPath = path.resolve(matcherFolderPath, 'index.ts')

        // eslint-disable-next-line security/detect-non-literal-fs-filename
        const isRootMatcherExists = fs.existsSync(rootMatcherPath) // nosemgrep: eslint.detect-non-literal-fs-filename

        if (isRootMatcherExists) {
            console.log(chalk.red.bold(`${rootMatcherPath} already exists!\r`))

            throw new Error('You can use this scaffold only for matcher initialization')
        }

        const matcherPath = path.resolve(matcherFolderPath, `${name}.ts`)

        const vitestTypesDeclarationPath = path.resolve(testsPath, 'vitest.d.ts')
        // eslint-disable-next-line security/detect-non-literal-fs-filename
        const isVitestTypesDeclarationExists = fs.existsSync(vitestTypesDeclarationPath) // nosemgrep: eslint.detect-non-literal-fs-filename

        let rootTsConfigPath = path.resolve(process.cwd(), 'tsconfig.json')
        let extendedTsConfig = ''

        if (isVitestTypesDeclarationExists) {
            console.log(chalk.red.bold(`${vitestTypesDeclarationPath} already exists!\r`))
            console.log(chalk.red.bold('This file will be override\r'))

            rootTsConfigPath = ''
        } else {
            // eslint-disable-next-line security/detect-non-literal-fs-filename
            const isExist = fs.existsSync(rootTsConfigPath) // nosemgrep: eslint.detect-non-literal-fs-filename

            if (!isExist) {
                throw new Error('You can use this scaffold only inside ts-project')
            }

            // eslint-disable-next-line security/detect-non-literal-require
            const tsConfig = require(rootTsConfigPath) // nosemgrep: eslint.detect-non-literal-require

            extendedTsConfig = { ...tsConfig, include: [...tsConfig.include, 'tests/vitest.d.ts'] }
        }

        const setupFilePath = path.resolve(testsPath, projectFolder, 'setup.ts')
        // eslint-disable-next-line security/detect-non-literal-fs-filename
        const isSetupFileExists = fs.existsSync(setupFilePath) // nosemgrep: eslint.detect-non-literal-fs-filename

        const [newSetupFilePath, overrideSetupFilePath] = isSetupFileExists ? [undefined, setupFilePath] : [setupFilePath, undefined]

        return {
            name,
            matcherPath,
            rootMatcherPath,
            vitestTypesDeclarationPath,
            tsConfigPath: rootTsConfigPath,
            tsConfigContent: extendedTsConfig,
            newSetupFilePath,
            overrideSetupFilePath,
        }
    },
}
