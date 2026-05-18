---
to:  <%= serviceName %>/src/bootstrap.ts
---

import { Application, NodeTracerProvider, ServiceContext } from '@diia-inhouse/diia-app'

import configFactory from '@src/configs/config.js'
import { loggerConfig } from '@src/configs/logger.js'
import deps from '@src/deps.js'

import { AppConfig } from '@interfaces/config.js'
import { AppDeps } from '@interfaces/deps.js'

export async function bootstrap(serviceName: string, nodeTracerProvider: NodeTracerProvider): Promise<void> {
    const app = new Application<ServiceContext<AppConfig, AppDeps>>(serviceName, nodeTracerProvider, loggerConfig)

    await app.setConfig(configFactory)
    await app.setDeps(deps)

    const appOperator = await app.initialize()

    await appOperator.start()
}
