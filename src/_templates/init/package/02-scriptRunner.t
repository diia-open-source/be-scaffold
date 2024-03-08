---
sh: "cd <%= packageName %> && npm install --save-dev <%= dependencies.devDeps %> && npm run lint-fix"
---

This file does not appear in the final package generation

You can think about this file like a post-generation script