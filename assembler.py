opcodes = {
    "add"  : "000",
    "sub"  : "001",
    "mult" : "010",
    "div"  : "011",
    "addi" : "100",
    "subi" : "101"
}

registers = {
    "r0" : "00",
    "r1" : "01",
    "r2" : "10",
    "r3" : "11"
}

with open("max.asm", "r") as file:
    for line in file.readlines():
        line = line.strip()
        op, reg, val = line.split(" ")
        reg = reg.split(",")[0]

        opval = opcodes[op]
        if opval[0] == "1":
            print(f"0b{opval}{registers[reg]}{int(val):02b}")

        else:
            print(f"0b{opval}{registers[reg]}{registers[val]}")

