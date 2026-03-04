import chalk from 'chalk'

import { PackageDep, serviceDependencies } from '../../../depsNames'
import { Prompt } from '../../../interfaces'
import { Answers, ReadmePoint, ReadmePoints, ServiceDep, ServiceDeps } from '../../../interfaces/_templates/init/service'
import { promptMultiSelect } from '../../../prompt/index'

const readmePointsDescriptionMap: Record<ReadmePoint, string> = {
    figma: 'Provide a link to the Figma doc',
    api: 'Provide a link to the API doc',
    docs: 'Provide a link to the docs',
}

const serviceDepsToPackageDeps: Record<ServiceDep, PackageDep[]> = {
    database: ['@diia-inhouse/db', 'migrate-mongo'],
    redis: ['@diia-inhouse/redis'],
    external: ['@diia-inhouse/diia-queue'],
    internal: ['@diia-inhouse/diia-queue'],
}

export default {
    prompt: async ({ prompter }: Prompt): Promise<Answers> => {
        console.log(chalk.bold('After a files generation scaffold tries to run "npm install" and "prettier", please wait. \n'))

        const { serviceName } = await prompter.prompt({
            type: 'input',
            name: 'serviceName',
            message: "What's your new service name (e.g. criminal-cert-service)?",
            required: true,
        })

        const selectedDependencies = await promptMultiSelect<ServiceDep>({
            message: 'Which external dependencies do you want use with that service?',
            choices: ServiceDeps.map((choice) => ({ name: choice })),
        })

        const { description } = await prompter.prompt({
            type: 'input',
            name: 'description',
            message: "What's your new service description?",
            required: true,
        })

        const { codeowners } = await prompter.prompt({
            type: 'input',
            name: 'codeowners',
            message: 'List codeowners for this service (e.g. @user1, @user2)',
            required: true,
        })

        const selectedReadmePoints = await promptMultiSelect<ReadmePoint>({
            message: 'Which points do you want to add to the README?',
            choices: ReadmePoints.map((choice) => ({ name: choice })),
        })

        const selectedReadmePointValues: Map<ReadmePoint, string> = new Map()

        for await (const point of selectedReadmePoints) {
            const { value } = await prompter.prompt({
                type: 'input',
                name: 'value',
                message: readmePointsDescriptionMap[point],
                required: true,
            })

            selectedReadmePointValues.set(point, value)
        }

        console.log(chalk.red.bold("Don't forget to add charts and envs to the infra repo manually\r"))

        const { devDeps, deps } = serviceDependencies
        const packageDepsToUse = deps.filter(
            (dep) =>
                !Object.values(serviceDepsToPackageDeps).flat().includes(dep) ||
                selectedDependencies.some((selectedDep) => serviceDepsToPackageDeps[selectedDep].includes(dep)),
        )

        return {
            serviceName,
            description,
            codeowners,
            dependencies: { devDeps: devDeps.join(' '), deps: packageDepsToUse.join(' ') },
            selectedDependencies,
            selectedReadmePointValues,
        }
    },
}
