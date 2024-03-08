---
sh: "cd <%= serviceName %> && npm install <%= dependencies.deps %> && npm install --save-dev <%= dependencies.devDeps %> && npm run lint-fix && cp .env.example .env && cp .env.test .env.test.local && npm run build && npm test"
---

This file does not appear in the final package generation

You can think about this file like a post-generation script
