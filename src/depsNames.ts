const devDeps = [
    '@diia-inhouse/configs',
    '@diia-inhouse/eslint-config',
    '@diia-inhouse/test',
    '@diia-inhouse/genproto',
    '@diia-inhouse/test',
    '@types/jest',
    'eslint',
    'jest',
    'lockfile-lint',
    'madge',
    'prettier',
    'rimraf',
    'semantic-release@21.1.2',
    'ts-node',
    'ts-patch',
    'typescript',
]

export const packageDependencies = { devDeps }

export const serviceDependencies = {
    devDeps: [...devDeps, '@diia-inhouse/scaffold'],
    deps: [
        '@diia-inhouse/analytics',
        '@diia-inhouse/crypto',
        '@diia-inhouse/db',
        '@diia-inhouse/diia-app',
        '@diia-inhouse/diia-logger',
        '@diia-inhouse/diia-queue',
        '@diia-inhouse/diia-metrics',
        '@diia-inhouse/env',
        '@diia-inhouse/errors',
        '@diia-inhouse/healthcheck',
        '@diia-inhouse/http',
        '@diia-inhouse/redis',
        '@diia-inhouse/types',
        '@diia-inhouse/utils',
        '@diia-inhouse/validators',
        'migrate-mongo',
        'module-alias',
    ],
}
