---
to:  <%= serviceName %>/src/bootstrap.ts
---

import { Application, NodeTracerProvider, ServiceContext } from '@diia-inhouse/diia-app'

import configFactory from '#configs/config.js'
import { AppConfig } from '#configs/config.types.js'
import { loggerConfig } from '#configs/logger.js'
import deps from '#deps/index.js'
import { AppDeps } from '#deps/types.js'

export async function bootstrap(serviceName: string, nodeTracerProvider: NodeTracerProvider): Promise<void> {
    const app = new Application<ServiceContext<AppConfig, AppDeps>>(serviceName, nodeTracerProvider, loggerConfig)

    await app.setConfig(configFactory)
    await app.setDeps(deps)

    const appOperator = await app.initialize()

    await appOperator.start()
}
