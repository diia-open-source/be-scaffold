---
inject: true
to: <%= overrideSetupFilePath %>
---
import * as matchers from './matchers'

expect.extend(matchers)

