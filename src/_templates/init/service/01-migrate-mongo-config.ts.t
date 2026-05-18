---
to:  <%= serviceName %>/migrate-mongo-config.ts
---
import dotenvFlow from 'dotenv-flow'

import { MongoHelper } from '@diia-inhouse/db'

dotenvFlow.config({ silent: true })

export default MongoHelper.getMigrateMongoConfig()
