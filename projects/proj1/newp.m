comment(` Shana Slavin')
comment(`CPSC 2310')
comment(`Project 1')
comment(`Due September 28, 2018')
comment(`This program will convert binary numbers to decimal')

word(N, 111)
word(temp, 0)
word(latest, 0)
word(ten, 10)
word(two, 2)
word(power, 1)
word(decimal, 0)

label(start)
    load(N)
    store(temp)
    load(N)
    store(latest)

label(loop)

    load(temp)
    beq0(done)
    div(ten)
    store(temp)    comment(`obtaining new binary ')

    load(temp)
    mul(ten)
    sub(latest)
    bne0(adding)

    load(power)    comment(`incrementing power when there is no remainder ')
    mul(two)
    store(power)

    load(temp)
    store(latest)
    ba(loop)

label(adding)

    print(decimal)
    load(decimal)    comment(`adding to decimal ')
    add(power)
    store(decimal)

    load(power)    comment(`incrementing power ')
    mul(two)
    store(power)

    load(temp)
    store(latest)

    ba(loop)

label(done)

    print(decimal)
    halt

comment(`')
    end(start)
