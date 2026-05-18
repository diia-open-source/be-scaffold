---
to:  <%= serviceName %>/src/index.ts
---

import { initTracing } from '@diia-inhouse/diia-app'

import { utils } from '@diia-inhouse/utils'

const serviceName = utils.getServiceName()
const nodeTracerProvider = initTracing()

import { bootstrap } from './bootstrap.js'

void bootstrap(serviceName, nodeTracerProvider)
