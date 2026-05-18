---
to:  <%= packageName %>/package.json
---

{
    "name": "@diia-inhouse/<%= packageName %>",
    "version": "1.0.0",
    "type": "module",
    "description": "<%= description %>",
    "author": "diia-team",
    "main": "dist/index.js",
    "types": "dist/index.d.ts",
    "exports": {
        ".": {
            "types": "./dist/index.d.ts",
            "default": "./dist/index.js"
        },
        "./package.json": "./package.json"
    },
    "engines": {
        "node": ">=24"
    },
    "scripts": {
        "prebuild": "rimraf dist",
        "build": "tsdown",
        "prepare": "npm run build",
        "semantic-release": "semantic-release",
        "lint": "oxlint && oxfmt --check .",
        "lint-fix": "oxlint --fix && oxfmt .",
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
    "madge": {
        "tsConfig": "./tsconfig.json"
    }
}
