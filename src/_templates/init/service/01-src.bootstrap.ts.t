---
to:  <%= serviceName %>/src/bootstrap.ts
---

import { Application, NodeTracerProvider, ServiceContext } from '@diia-inhouse/diia-app'

import configFactory from '@src/configs/config'
import { loggerConfig } from '@src/configs/logger'
import deps from '@src/deps'

import { AppConfig } from '@interfaces/config'
import { AppDeps } from '@interfaces/deps'

export async function bootstrap(serviceName: string, nodeTracerProvider: NodeTracerProvider): Promise<void> {
    const app = new Application<ServiceContext<AppConfig, AppDeps>>(serviceName, nodeTracerProvider, loggerConfig)
    
    await app.setConfig(configFactory)
    await app.setDeps(deps)

    const appOperator = await app.initialize()

    await appOperator.start()
}
