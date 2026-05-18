---
unless_exists: true
to: <%= newSetupFilePath %>
---
import * as matchers from './matchers/index.js'

expect.extend(matchers)
