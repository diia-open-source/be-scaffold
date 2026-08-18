---
sh: "cd <%= serviceName %> && echo 'Installing dependencies and setting up environment, please wait...' && npm install <%= dependencies.deps %> --package-lock-only && npm install --save-dev <%= dependencies.devDeps %> --package-lock-only && rm -f package-lock.json && npm install && npm run genproto && npm run lint-fix && cp .env.example .env && cp .env.test .env.test.local && npm run build && npm test"
---

This file does not appear in the final package generation

You can think about this file like a post-generation script
