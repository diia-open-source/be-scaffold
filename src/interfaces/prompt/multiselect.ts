export interface MultiSelectChoice {
    name: string
    choices?: string[]
}

export interface MultiselectParams {
    message: string
    choices: MultiSelectChoice[]
}
