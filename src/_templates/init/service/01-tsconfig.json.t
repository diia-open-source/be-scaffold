---
to:  <%= serviceName %>/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "outDir": "dist",
        "declarationDir": "dist/types",
        "baseUrl": ".",
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            <%if (h.isOptionSelected(selectedDependencies, 'database')) {%>
            "@models/*": ["src/models/*"],
            <%}%>
            "@dataMappers/*": ["src/dataMappers/*"],
            "@actions/*": ["src/actions/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        }
    },
    "include": ["src/**/*"]
}
