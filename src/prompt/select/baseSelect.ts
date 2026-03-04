import { SelectParams } from '../../interfaces/prompt/select'

const { Select } = require('enquirer')

export async function promptBaseSelect(params: SelectParams): Promise<string> {
    const prompt = new Select(params)

    const answer = await prompt.run()

    return answer
}
