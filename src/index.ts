import path from 'path'

import { Logger, runner } from 'hygen'

import { helpers, shExecutor } from './utils'

const defaultTemplates = path.resolve(__dirname, './_templates')

async function main(): Promise<void> {
    runner(process.argv.slice(2), {
        logger: new Logger(console.log.bind(console)),
        createPrompter: () => require('enquirer'),
        exec: (action) => shExecutor(action),
        cwd: process.cwd(),
        templates: defaultTemplates,
        debug: !!process.env.DEBUG,
        helpers,
    })
}

main()
