---
to:  <%= packageName %>/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "outDir": "dist",
        "declaration": true,
        "declarationDir": "dist/types",
        "isolatedDeclarations": true,
        "strict": true,
        "paths": {
            "#*": ["./src/*"]
        },
        "rootDir": "./src"
    },
    "include": ["src/**/*"],
    "exclude": ["node_modules", "tests"]
}
