---
to:  <%= workerRoot %>/index.ts
---

import { Application, NodeTracerProvider, ServiceContext } from '@diia-inhouse/diia-app'

import { initWorker, instantiateActivities } from '@diia-inhouse/workflow/worker'

import { AppConfig } from '@interfaces/config.js'
import { AppDeps } from '@interfaces/deps.js'

import { workerActivities } from './activities/index.js'

export async function initTemporal(
    app: Application<ServiceContext<AppConfig, AppDeps>>,
    nodeTracerProvider: NodeTracerProvider,
): Promise<void> {
    const config = app.getConfig()
    const logger = app.container!.resolve('logger')
    const envService = app.container!.resolve('envService')

    const activities = instantiateActivities(app, workerActivities)
    const worker = await initWorker(
        config,
        { workflowsPath: import.meta.resolve('./workflows/index.js'), activities },
        envService,
        logger,
        nodeTracerProvider,
    )

    await worker.run()
}
