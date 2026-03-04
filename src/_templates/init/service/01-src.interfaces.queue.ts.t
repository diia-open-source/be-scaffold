---
to: "<%= h.isOptionSelected(selectedDependencies, ['internal', 'external']) ? `${serviceName}/src/interfaces/queue.ts` : null %>"
---

export const InternalQueueNames = {
    Queue<%= h.changeCase.pascalCase(serviceName) %>: 'Queue<%= h.changeCase.pascalCase(serviceName) %>',
} as const

export const ScheduledTaskQueueNames = {
    ScheduledTasksQueue<%= h.changeCase.pascalCase(serviceName) %>: 'ScheduledTasksQueue<%= h.changeCase.pascalCase(serviceName) %>',
} as const

export const InternalTopics = {
    TopicScheduledTasks: 'TopicScheduledTasks'
} as const

export const ExternalTopics = {} as const

export const InternalEvents = {} as const

export const ExternalEvents = {} as const

export const ScheduledTaskEvents = {} as const
