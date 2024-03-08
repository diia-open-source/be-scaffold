import { SelectYesNoParams } from '../../interfaces/prompt/select'

import { promptBaseSelect } from './baseSelect'

const YES = 'yes'
const NO = 'no'

export async function promptYesNoSelect(params: SelectYesNoParams): Promise<boolean> {
    const { message } = params

    const result = await promptBaseSelect({
        message,
        choices: [YES, NO],
        initial: YES,
    })

    return result === YES
}
