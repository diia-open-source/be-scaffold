import { AutoCompleteParams } from '../interfaces/prompt/autocomplete'

const { AutoComplete } = require('enquirer')

export async function promptAutoComplete<T = string>(params: AutoCompleteParams): Promise<T> {
    const prompt = new AutoComplete(params)

    const answer = await prompt.run()

    return answer
}
