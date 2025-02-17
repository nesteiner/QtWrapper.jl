# ChangeLog

## v0.1.1 2025-2-17

### Update

[utils/pub.jl](./src/utils/pub.jl)

重新设计了 pub 宏，考虑到一下情况

1. 带泛型的完整函数
2. 带泛型的简要函数
3. 不带泛型的完整函数
4. 不带泛型的简要函数
5. 结构体
