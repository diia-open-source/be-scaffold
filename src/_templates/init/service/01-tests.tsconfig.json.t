---
to:  <%= serviceName %>/tests/tsconfig.json
---

{
    "extends": "@diia-inhouse/configs/tsconfig",
    "compilerOptions": {
        "baseUrl": "../",
        "paths": {
            "@services/*": ["src/services/*"],
            "@interfaces/*": ["src/interfaces/*"],
            <%if (h.isOptionSelected(selectedOptions, 'database')) {%>
            "@models/*": ["src/models/*"],
            <%}%>
            "@dataMappers/*": ["src/dataMappers/*"],
            "@actions/*": ["src/actions/*"],
            "@src/*": ["src/*"],
            "@tests/*": ["tests/*"]
        },
        "noEmit": true
    },
    "include": ["./**/*"]
}
