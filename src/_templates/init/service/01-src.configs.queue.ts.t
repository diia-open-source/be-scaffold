---
to: "<%= h.isOptionSelected(selectedDependencies, ['internal', 'external']) ? `${serviceName}/src/configs/queue.ts` : null %>"
---
import { ServiceRulesConfig, QueueConfigType } from '@diia-inhouse/diia-queue'

import {
    InternalQueueNames,
    InternalTopics,
    ScheduledTaskEvents,
    ScheduledTaskQueueNames,
} from '@interfaces/queue'

export default {
    portalEvents: [],
    queuesConfig: {
        [QueueConfigType.Internal]: {
            [InternalQueueNames.Queue<%= h.changeCase.pascalCase(serviceName) %>]: {
                topics: [],
            },
            [ScheduledTaskQueueNames.ScheduledTasksQueue<%= h.changeCase.pascalCase(serviceName) %>]: {
                topics: [InternalTopics.TopicScheduledTasks],
            },
        },
    },
    servicesConfig: {
        [QueueConfigType.Internal]: {
            subscribe: [
                ScheduledTaskQueueNames.ScheduledTasksQueue<%= h.changeCase.pascalCase(serviceName) %>,
                InternalQueueNames.Queue<%= h.changeCase.pascalCase(serviceName) %>
            ],
            publish: [],
        },
        [QueueConfigType.External]: {
            subscribe: [],
            publish: [],
        },
    },
    topicsConfig: {
        [QueueConfigType.Internal]: {
            [InternalTopics.TopicScheduledTasks]: {
                events: Object.values(ScheduledTaskEvents),
            },
        },
        [QueueConfigType.External]: {},
    },
} satisfies ServiceRulesConfig
