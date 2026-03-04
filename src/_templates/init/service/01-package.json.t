---
to:  <%= serviceName %>/package.json
---

{
    "name": "<%= serviceName %>",
    "version": "1.0.0",
    "description": "<%= description %>",
    "author": "diia-team",
    "main": "dist/index.js",
    "scripts": {
        "prepare": "ts-patch install -s",
        "build": "rimraf dist/ && mkdir dist && npm run genproto && tsc",
        "start": "node dist/index.js",
        "semantic-release": "semantic-release -e @diia-inhouse/configs/dist/semantic-release/service-stage --debug --ci",
        "semantic-release-prod": "semantic-release -e @diia-inhouse/configs/dist/semantic-release/service-prod --debug --ci",
        "lint": "eslint . && prettier --check . && buf format ./proto --diff --exit-code ",
        "lint-fix": "eslint . --fix && prettier --write . && buf format ./proto --write",
        "lint:lockfile": "lockfile-lint --path package-lock.json --allowed-hosts registry.npmjs.org gitlab.diia.org.ua --validate-https",
        "pretest": "npm run genproto -- --generateClient=true",
        "test": "tsc --project tests/tsconfig.json --noEmit && vitest run",
        "test:watch": "vitest watch",
        "test:coverage": "vitest run --coverage",
        <%if (h.isOptionSelected(selectedDependencies, 'database')) {%>
        "migrate-test": "NODE_ENV=test npm run migrate up",
        "migrate": "sh -c 'ts-node --project migrations/tsconfig.json node_modules/.bin/migrate-mongo $0 $1 -f migrate-mongo-config.ts'",
        "indexes:sync": "node -r module-alias/register ./node_modules/.bin/diia-db sync-indexes",
        <%}%>
        "find-circulars": "madge --circular --extensions ts ./",
        "scaffold": "scaffold",
        "genproto": "genproto --outputDir src/generated"
    },
    "keywords": [],
    "engines": {
        "node": ">=22"
    },
    "files": [
        "dist"
    ],
    "_moduleAliases": {
        "@services": "dist/services",
        "@interfaces": "dist/interfaces",
        "@actions": "dist/actions",
        "@src": "dist",
        "@tests": "tests"
    },
    "commitlint": {
        "extends": "@diia-inhouse/configs/dist/commitlint"
    },
    "prettier": "@diia-inhouse/eslint-config/prettier",
    "madge": {
        "tsConfig": "./tsconfig.json"
    },
    "overrides": {
        "protobufjs": "7.2.5"
    }
}
