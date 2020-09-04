comment(`  Shana Slavin ')
comment(`  CPSC 2311 Section 001 ')
comment(`  Due: September 6, 2018 ')


bipush(-40)

istore_1

label(loop)

iconst_1
invokevirtual(1)

iload_1

bipush(9)

imul

bipush(5)

idiv

bipush(32)

iadd

istore_2

iconst_2

invokevirtual(2)

iinc(1, 10)

iload_1

bipush(120)
isub

ifle(loop)

return
