---
to: <%= vitestTypesDeclarationPath %>
force: true
---

import 'vitest'
import { CustomMatchers } from '@diia-inhouse/test/vitest'

interface Matchers<R> {
    <%= tsConfigPath %>(): any
}

declare module 'vitest' {
    interface Assertion<T> extends CustomMatchers<T> {}
    interface AsymmetricMatchersContaining extends CustomMatchers {}
}
