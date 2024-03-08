import { SelectParams } from '../../interfaces/prompt/select'

// eslint-disable-next-line @typescript-eslint/no-var-requires
const { Select } = require('enquirer')

export async function promptBaseSelect(params: SelectParams): Promise<string> {
    const prompt = new Select(params)

    const answer = await prompt.run()

    return answer
}
