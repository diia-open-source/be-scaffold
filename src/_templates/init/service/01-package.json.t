---
to:  <%= serviceName %>/package.json
---

{
    "name": "<%= serviceName.replace(/-service$/, '') %>",
    "version": "1.0.0",
    "type": "module",
    "description": "<%= description %>",
    "author": "diia-team",
    "main": "dist/index.js",
    "scripts": {
        "build": "rimraf dist && npm run genproto && tsc",
        "start": "node dist/index.js",
        "semantic-release": "semantic-release -e @diia-inhouse/configs/dist/semantic-release/service-stage --debug --ci",
        "semantic-release-prod": "semantic-release -e @diia-inhouse/configs/dist/semantic-release/service-prod --debug --ci",
        "lint": "oxlint && oxfmt --check . && diia-buf-lint",
        "lint-fix": "oxlint --fix && oxfmt . && diia-buf-lint --fix",
        "lint:lockfile": "lockfile-lint --path package-lock.json --allowed-hosts registry.npmjs.org gitlab.diia.org.ua --validate-https",
        "test": "npm run genproto && tsc --project tests/tsconfig.json --noEmit && vitest run",
        "test:watch": "vitest watch",
        "test:coverage": "vitest run --coverage",
        <%if (h.isOptionSelected(selectedDependencies, 'database')) {%>
        "migrate-test": "NODE_ENV=test npm run migrate up",
        "migrate": "npm run indexes:sync && sh -c 'tsx --tsconfig migrations/tsconfig.json node_modules/.bin/migrate-mongo $0 $1 -f migrate-mongo-config.ts'",
        "indexes:sync": "./node_modules/.bin/diia-db sync-indexes",
        <%}%>
        "find-circulars": "madge --circular --extensions ts ./",
        "scaffold": "scaffold",
        "genproto": "buf generate",
        "proto:breaking": "diia-buf-breaking"
    },
    "keywords": [],
    "engines": {
        "node": ">=24"
    },
    "files": [
        "dist"
    ],
    "imports": {
        "#*": "./dist/*"
    },
    "commitlint": {
        "extends": "@diia-inhouse/configs/dist/commitlint"
    },
    "madge": {
        "tsConfig": "./tsconfig.json"
    }
}
