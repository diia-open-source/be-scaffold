import { MultiselectParams } from '../../interfaces/prompt/multiselect'

const { MultiSelect } = require('enquirer')

export async function promptMultiSelect<T extends string>(params: MultiselectParams): Promise<T[]> {
    const prompt = new MultiSelect({
        hint: '(Use <space> to select, <return> to submit)',
        ...params,
    })

    const answers = await prompt.run()

    return answers
}
