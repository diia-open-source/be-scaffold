---
to:  <%= serviceName %>/tests/utils/getApp.ts
---

import { Application, GrpcClientFactory, ServiceContext, ServiceOperator, NodeTracerProvider, asFunction } from '@diia-inhouse/diia-app'

import config from '#configs/config.js'
import { AppConfig } from '#configs/config.types.js'
import { loggerConfig } from '#configs/logger.js'
import { AppDeps } from '#deps/types.js'
import { <%= h.changeCase.pascal(serviceName) %>Definition } from '#generated/index.js'

import { TestDeps } from '#tests/interfaces.js'
import deps from '#tests/utils/getDeps.js'

const modules = {
    actions: import.meta.glob('/src/actions/**/*.ts'),
    services: import.meta.glob('/src/services/**/*.ts'),
}

export async function getApp(): Promise<ServiceOperator<AppConfig, AppDeps & TestDeps>> {
    const app = new Application<ServiceContext<AppConfig, AppDeps & TestDeps>>('<%= h.changeCase.pascal(serviceName) %>', new NodeTracerProvider(), loggerConfig)

    await app.setConfig(config)
    await app.setDeps(deps)

    const dynamicDeps = await app.extractDependenciesFromModules(modules, 'src')
    const appOperator = await app.initialize(dynamicDeps)
    const { grpcService } = await appOperator.start()

    appOperator.container.register({
        <%= h.changeCase.camel(serviceName) %>Client: asFunction((grpcClientFactory: GrpcClientFactory) =>
            grpcClientFactory.createGrpcClient(<%= h.changeCase.pascal(serviceName) %>Definition, `localhost:${grpcService.serverPort}`),
        ).singleton(),
    })

    return appOperator
}
