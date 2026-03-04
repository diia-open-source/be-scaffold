import path from 'node:path'

import chalk from 'chalk'

import { Answers } from '../../../interfaces/_templates/init/temporal'

export default {
    prompt: async (): Promise<Answers> => {
        const workerRoot = path.resolve(process.cwd(), 'src/worker')

        console.log(chalk.red.bold('Do not forget to call initTemporal function in bootstrap.ts and add dependencies to deps.ts \n'))

        return { workerRoot }
    },
}
