import chalk from 'chalk'

import { packageDependencies } from '../../../depsNames'
import { Prompt } from '../../../interfaces'
import { Answers } from '../../../interfaces/_templates/init/package'

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        console.log(
            chalk.red.bold('README!\n'),
            chalk.blue('After a files generation scaffold tries to run "npm install" and "prettier", please wait. \n'),
            chalk.blue('If you have some troubles with a new project, try to reinstall dependencies and run the prettier manually \n\n'),
        )

        const { packageName } = await prompter.prompt({
            type: 'input',
            name: 'packageName',
            message: "What's your new package name?",
            required: true,
        })

        const { description } = await prompter.prompt({
            type: 'input',
            name: 'description',
            message: "What's your new package description?",
            required: true,
        })

        const { codeowners } = await prompter.prompt({
            type: 'input',
            name: 'codeowners',
            message: 'List codeowners for this package (e.g. @user1, @user2)',
            required: true,
        })

        return { packageName, description, codeowners, dependencies: { devDeps: packageDependencies.devDeps.join(' ') } }
    },
}
