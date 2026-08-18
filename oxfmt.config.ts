import config from '@diia-inhouse/oxc-config/oxfmt'

export default {
    ...config,
    ignorePatterns: [...(config.ignorePatterns ?? []), 'generation-result'],
}
