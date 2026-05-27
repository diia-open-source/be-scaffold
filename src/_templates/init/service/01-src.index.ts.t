---
to:  <%= serviceName %>/src/index.ts
---

import { nodeTracerProvider } from '@diia-inhouse/diia-app/tracing/register'
import { utils } from '@diia-inhouse/utils'

import { bootstrap } from './bootstrap.js'

void bootstrap(utils.getServiceName(), nodeTracerProvider)
