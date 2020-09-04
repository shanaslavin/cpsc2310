comment(`  Shana Slavin   ')
comment(` CPSC 2311 Section 001  ')
comment(` Due: August 30, 2018  ')

comment(`  This program will implement this loop  ')
comment(`  sum = 0;  ')
comment(`    for(i = 1; i <= 10; i++){  ')
comment(`      sum = sum + i;  ')
comment(`    }  ')

word(sum, 0)
word(i, 1)
word(zero, 0)
word(one, 1)
word(ten, 10)

label(start)

   load(zero)  comment(`  sum = 0  ')
   store(sum)
   load(one)
   store(i)

label(loop)

   load(sum)
   add(i)
   store(sum)

   load(i)
   add(one)
   store(i)

   sub(ten)

   ble0(loop)

label(done)

   print(sum)
   halt

   end(start)
