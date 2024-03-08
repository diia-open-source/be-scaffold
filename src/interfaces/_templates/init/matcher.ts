export interface Answers {
    name: string
    matcherPath: string
    rootMatcherPath: string
    jestTypesDeclarationPath: string
    tsConfigContent: string
    tsConfigPath: string
    newSetupFilePath?: string
    overrideSetupFilePath?: string
}

export enum ProjectJestType {
    Integration = 'integration',
    Unit = 'unit',
}
