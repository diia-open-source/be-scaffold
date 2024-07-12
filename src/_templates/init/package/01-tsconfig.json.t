---
to:  <%= packageName %>/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "outDir": "dist",
        "declaration": true,
        "declarationDir": "dist/types",
        "baseUrl": ".",
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        }
    },
    "include": ["src/**/*"],
    "exclude": ["node_modules", "tests"]
}
