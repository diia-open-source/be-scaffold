---
to:  <%= workerRoot %>/activities/activityExample.ts
---

export class ExampleActivities {
    constructor(
        private readonly config: AppConfig,
        private readonly logger: Logger,
    ) {}

    async exampleActivity(): Promise<void> {
        this.logger.info('Example activity loaded successfully')
    }
}
