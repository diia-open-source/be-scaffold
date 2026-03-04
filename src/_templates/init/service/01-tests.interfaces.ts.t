---
to:  <%= serviceName %>/tests/interfaces.ts
---

import TestKit from '@diia-inhouse/test'

import { <%= h.changeCase.pascal(serviceName) %>Client } from '@src/generated'

export interface TestDeps {
    testKit: TestKit
    <%= h.changeCase.camel(serviceName) %>Client: <%= h.changeCase.pascal(serviceName) %>Client
}
