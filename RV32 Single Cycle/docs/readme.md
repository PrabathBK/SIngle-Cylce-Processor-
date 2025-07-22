## rv32core

### setup note

#### verilator

if you have make and verilator you can simulate the src-old version by

```sh
make vlold
make wavesold # to view the waves
```

#### vivado and zybo

zybo directory has the wip vivado project for the src-old implementation.
src-old will be converted to singlecycle non pipelined version.

new src is in src folder which is still wip

### goals

#### initial goals

- [ ] rv32ui v2.1
- [ ] 5 stage pipeline
- [ ] 2/4 way set associative cache

### todo

- [ ] optimize the vivado zybo pipeline to implement a blinky
- [ ] check the riscv toolchain
- [ ] finish the single cycle implementation of riscv cpu

### rv32i base instruction set v2.1 unprevileged core

32 32-bit registers, x0-x31, x0 is hardwired to 0, one additional unpredvileged
mode register, pc.

There is no dedicated stack pointer or subroutine return address link register
in the Base Integer ISA; the instruction encoding allows any x register to be
used for these purposes. However, the standard software calling convention uses
register x1 to hold the return address for a call, with register x5 available as
an alternate link register. The standard calling convention uses register x2 as
the stack pointer.

### verification

### references

https://lf-riscv.atlassian.net/wiki/spaces/HOME/pages/16154769/RISC-V+Technical+Specifications
