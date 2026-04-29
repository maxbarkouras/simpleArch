# assembler outputs machine code in format designed to be pasted into instruction memory file
import sys

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

def main():

    if(len(sys.argv) < 2):
        print("No input file argument passed! Please rerun with assembler.py {asm_file}")
        exit()

    with open(sys.argv[1], "r") as file:
        count=0
        for line in file.readlines():
            line = line.strip()
            if line.startswith(";") or line == "": continue

            op, reg, val = line.split(" ")
            reg = reg.split(",")[0]

            opval = opcodes[op]
            if opval[0] == "1":
                print(f"mem[{count}] = 7'b{opval}{registers[reg]}{int(val):02b};")
            else:
                print(f"mem[{count}] = 7'b{opval}{registers[reg]}{registers[val]};")

            count+=1


if __name__ == "__main__":
    main()