const PackageDevDeps = [
    '@diia-inhouse/configs',
    '@diia-inhouse/eslint-config',
    '@diia-inhouse/test',
    '@diia-inhouse/genproto',
    '@vitest/coverage-v8',
    '@vitest/ui',
    'eslint',
    'lockfile-lint',
    'madge',
    'prettier',
    'rimraf',
    'semantic-release',
    'ts-node',
    'ts-patch',
    'typescript',
    'vite-tsconfig-paths',
    'vitest',
    'vitest-mock-extended',
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
    'module-alias',
] as const

export type PackageDep = (typeof PackageDeps)[number]

export const serviceDependencies = {
    devDeps: [...PackageDevDeps, '@diia-inhouse/scaffold', '@bufbuild/buf'],
    deps: PackageDeps,
}
