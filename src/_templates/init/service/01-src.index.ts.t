---
to:  <%= serviceName %>/src/index.ts
---

import { initTracing } from '@diia-inhouse/diia-app'
import { utils } from '@diia-inhouse/utils'

const nodeTracerProvider = initTracing()

import 'module-alias/register'
import { bootstrap } from './bootstrap'

void bootstrap(utils.getServiceName(), nodeTracerProvider)
