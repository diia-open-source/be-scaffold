---
to:  <%= adminServicePath %>/actions.ts
---
import { ActionAdapterInterface, z } from '@diia-inhouse/admin'

const adminUpdateEncryptedStorageSchema = z.object({
    params1: z.string(),
})

const testCustomAction: ActionAdapterInterface<
    'testCustomAction',
    z.infer<typeof adminUpdateEncryptedStorageSchema>
> = {
    event: 'testCustomAction',
    schema: adminUpdateEncryptedStorageSchema,
    permissions: [],
    meta: {
        title: 'Test Custom Action',
        description: 'Test custom action',
    },
}


export const AdminActions = [
    testCustomAction,
] as const
