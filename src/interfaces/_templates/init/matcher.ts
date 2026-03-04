export interface Answers {
    name: string
    matcherPath: string
    rootMatcherPath: string
    vitestTypesDeclarationPath: string
    tsConfigContent: string
    tsConfigPath: string
    newSetupFilePath?: string
    overrideSetupFilePath?: string
}

export enum ProjectTestType {
    Integration = 'integration',
    Unit = 'unit',
}
