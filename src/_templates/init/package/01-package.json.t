---
to:  <%= packageName %>/package.json
---

{
  "name": "@diia-inhouse/<%= packageName %>",
  "version": "1.0.0",
  "description": "<%= description %>",
  "author": "diia-team",
  "main": "dist/index.js",
  "types": "dist/types/index.d.ts",
  "engines": {
    "node": ">=22"
  },
  "scripts": {
    "build": "tsc",
    "prebuild": "rimraf dist",
    "prepare": "npm run build",
    "semantic-release": "semantic-release",
    "start": "npm run build && node dist/index.js",
    "lint": "eslint . && prettier --check .",
    "lint-fix": "eslint . --fix && prettier --write .",
    "test": "tsc --project tests/tsconfig.json --noEmit && vitest run",
    "test:watch": "vitest watch",
    "test:coverage": "vitest run --coverage",
    "find-circulars": "madge --circular --extensions ts ./",
    "lint:lockfile": "lockfile-lint --path package-lock.json --allowed-hosts registry.npmjs.org gitlab.diia.org.ua --validate-https"
  },
  "files": ["dist"],
  "keywords": [],
  "devDependencies": {},
  "commitlint": {
    "extends": "@diia-inhouse/configs/dist/commitlint"
  },
  "release": {
    "extends": "@diia-inhouse/configs/dist/semantic-release/package"
  },
  "prettier": "@diia-inhouse/eslint-config/prettier"
}
