import chalk from 'chalk'

import { serviceDependencies } from '../../../depsNames'
import { Prompt } from '../../../interfaces'
import { Answers, ServiceDeps } from '../../../interfaces/_templates/init/service'
import { MultiSelectChoice } from '../../../interfaces/prompt/multiselect'
import { promptMultiSelect } from '../../../prompt/index'

const choices: MultiSelectChoice[] = Object.values(ServiceDeps).map((choice) => ({ name: choice }))

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        console.log(chalk.bold('After a files generation scaffold tries to run "npm install" and "prettier", please wait. \n'))

        const { serviceName } = await prompter.prompt({
            type: 'input',
            name: 'serviceName',
            message: "What's your new service name (e.g. criminal-cert-service)?",
            required: true,
        })

        const { description } = await prompter.prompt({
            type: 'input',
            name: 'description',
            message: "What's your new service description?",
            required: true,
        })

        const selectedOptions = await promptMultiSelect<ServiceDeps>({
            message: 'Which external dependencies do you want use with that service?',
            choices,
        })

        console.log(chalk.red.bold("Don't forget to add charts and envs to the infra repo manually\r"))

        const { devDeps, deps } = serviceDependencies

        return { serviceName, description, dependencies: { devDeps: devDeps.join(' '), deps: deps.join(' ') }, selectedOptions }
    },
}
