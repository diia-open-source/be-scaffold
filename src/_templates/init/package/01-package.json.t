---
to:  <%= packageName %>/package.json
---

{
  "name": "<%= packageName %>",
  "version": "1.0.0",
  "description": "<%= description %>",
  "author": "diia-team",
  "main": "dist/index.js",
  "types": "dist/types/index.d.ts",
  "engines": {
    "node": ">=18"
  },
  "scripts": {
    "build": "tsc",
    "prebuild": "rimraf dist",
    "prepare": "npm run build",
    "semantic-release": "semantic-release",
    "start": "npm run build && node dist/index.js",
    "lint": "eslint --ext .ts . && prettier --check .",
    "lint-fix": "eslint --ext .ts --fix && prettier --write .",
    "test": "jest",
    "test:unit": "npm run test --selectProjects unit"
  },
  "files": ["dist"],
  "keywords": [],
  "devDependencies": {},
  "jest": {
    "preset": "@diia-inhouse/configs/dist/jest"
  },
  "commitlint": {
    "extends": "@diia-inhouse/configs/dist/commitlint"
  },
  "eslintConfig": {
    "extends": "@diia-inhouse/eslint-config",
    "parserOptions": {
      "project": ["./tsconfig.json", "./tests/tsconfig.json"]
    }
  },
  "release": {
    "extends": "@diia-inhouse/configs/dist/semantic-release/package",
    "branches": ["main"]
  },
  "prettier": "@diia-inhouse/eslint-config/prettier"
}
