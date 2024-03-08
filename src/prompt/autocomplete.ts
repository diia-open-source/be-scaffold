import { AutoCompleteParams } from '../interfaces/prompt/autocomplete'

// eslint-disable-next-line @typescript-eslint/no-var-requires
const { AutoComplete } = require('enquirer')

export async function promptAutoComplete<T = string>(params: AutoCompleteParams): Promise<T> {
    const prompt = new AutoComplete(params)

    const answer = await prompt.run()

    return answer
}
