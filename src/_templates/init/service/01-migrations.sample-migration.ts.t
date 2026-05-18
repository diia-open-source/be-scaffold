---
to:  <%= serviceName %>/migrations/sample-migration.ts
---
import dotenvFlow from 'dotenv-flow'
import { Db } from 'mongodb'

dotenvFlow.config({ silent: true })

export async function up(_db: Db): Promise<void> {
    // const collectionName = ''
    // await _db.createCollection(collectionName)
}

export async function down(_db: Db): Promise<void> {
    // const collectionName = ''
    // await _db.dropCollection(collectionName)
}
