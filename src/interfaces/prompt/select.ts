export interface SelectParams {
    message: string
    choices: string[]
    name?: string
    initial?: string
}

export enum YesNoAnswer {
    Yes = 'yes',
    No = 'no',
}

export interface SelectYesNoParams {
    message: string
    initial?: YesNoAnswer
}
