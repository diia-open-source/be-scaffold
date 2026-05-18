const CommonDevDeps = [
    '@diia-inhouse/configs',
    '@diia-inhouse/oxc-config',
    '@diia-inhouse/test',
    '@vitest/coverage-v8',
    '@vitest/ui',
    'lockfile-lint',
    'madge',
    'oxfmt',
    'oxlint',
    'oxlint-tsgolint',
    'rimraf',
    'semantic-release',
    'typescript',
    'vitest',
    'vitest-mock-extended',
] as const

const PackageDevDeps = [...CommonDevDeps, 'tsdown', 'vite-tsconfig-paths'] as const

const ServiceDevDeps = [
    ...CommonDevDeps,
    '@bufbuild/buf',
    '@diia-inhouse/genproto',
    '@diia-inhouse/scaffold',
    'ts-patch',
    'tsc-alias',
    'tsx',
] as const

export const packageDependencies = { devDeps: PackageDevDeps }

export const PackageDeps = [
    '@diia-inhouse/crypto',
    '@diia-inhouse/db',
    '@diia-inhouse/design-system',
    '@diia-inhouse/diia-app',
    '@diia-inhouse/diia-logger',
    '@diia-inhouse/diia-queue',
    '@diia-inhouse/diia-metrics',
    '@diia-inhouse/env',
    '@diia-inhouse/errors',
    '@diia-inhouse/healthcheck',
    '@diia-inhouse/redis',
    '@diia-inhouse/types',
    '@diia-inhouse/utils',
    '@diia-inhouse/validators',
    'migrate-mongo',
] as const

export type PackageDep = (typeof PackageDeps)[number]

export const serviceDependencies = {
    devDeps: ServiceDevDeps,
    deps: PackageDeps,
}
