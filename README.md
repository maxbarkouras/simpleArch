# simpleArch

currently a single cycle design driven by 7-bit encoded instructions and allowing for immediate and reg based arithmatic

## supported instruction types:

***r-type***: *instr dest, src*

Operation will be performed between the two registers, where **dest := dest *{op}* src**\
Ex: *add r0, r1*, where r0 = r0 + r1

***i-type***: *instr dest, imm*

Operation will be performed between the dest register and immediate, where **dest := dest *{op}* imm**
