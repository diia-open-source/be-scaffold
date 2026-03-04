import diiaConfig from '@diia-inhouse/eslint-config'

/**  @type {import('eslint').Linter.Config}  */
export default [
    ...diiaConfig,
    {
        ignores: ['generation-result', 'dist', 'src/bin.ts', 'eslint.config.mjs'],
    },
    {
        files: ['**/*.ts'],
        rules: {
            'no-console': 'off',
        },
    },
]
