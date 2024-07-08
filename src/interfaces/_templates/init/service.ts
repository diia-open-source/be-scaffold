import { Dependencies } from '../../../interfaces'

export interface Answers {
    serviceName: string
    description: string
    dependencies: Dependencies
    selectedOptions: string[]
}

export enum ServiceDeps {
    database = 'database',
    redis = 'redis',
    external = 'external',
    internal = 'internal',
}
