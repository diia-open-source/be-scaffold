---
to:  <%= packageName %>/tests/unit/index.spec.ts
---

import { add } from '@src/index'

describe('Add', () => {
  it('should be return 3', () => {
    const result = add(1, 2)
    
    expect(result).toBe(3)
  })
})