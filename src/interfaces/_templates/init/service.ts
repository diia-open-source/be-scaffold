import { Dependencies } from '../../../interfaces'

export interface Answers {
    serviceName: string
    description: string
    codeowners: string
    dependencies: Dependencies
    selectedDependencies: ServiceDep[]
    selectedReadmePointValues: Map<ReadmePoint, string>
}

export const ServiceDeps = ['database', 'redis', 'external', 'internal'] as const

export type ServiceDep = (typeof ServiceDeps)[number]

export const ReadmePoints = ['figma', 'api', 'docs'] as const

export type ReadmePoint = (typeof ReadmePoints)[number]
