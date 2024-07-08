import path from 'node:path'

import execa from 'execa'

export async function shExecutor(command: string): Promise<void> {
    const result = execa.commandSync(command, { shell: true, stdout: process.stdout, stderr: process.stderr })

    if (result.exitCode !== 0) {
        // eslint-disable-next-line no-console
        console.log(result)

        throw new Error(`${command} failed`)
    }
}

export function getSharedTemplate(templateName: string): string {
    const sharedTemplatesFolderName = '_sharedTemplates'

    return path.resolve(__dirname, sharedTemplatesFolderName, templateName)
}

export const helpers = {
    isOptionSelected(options: string[], expectedOption: string | string[]): boolean {
        const optionsToCheck = Array.isArray(expectedOption) ? expectedOption : [expectedOption]

        return optionsToCheck.some((option) => options.includes(option))
    },
}
