---
unless_exists: true
to: <%= newSetupFilePath %>
---
import * as matchers from './matchers'

expect.extend(matchers)

