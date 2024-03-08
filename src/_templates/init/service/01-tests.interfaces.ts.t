---
to:  <%= serviceName %>/tests/interfaces.ts
---

import { IdentifierService } from '@diia-inhouse/crypto'
import TestKit from '@diia-inhouse/test'

export interface TestDeps {
    testKit: TestKit
    identifier: IdentifierService
}
