# Mark-8 Minicomputer Reproduction

This repository contains schematics, PCBs, instructions and parts lists for the Mark-8 minicomputer reproduction build which can be found at [https://www.youtube.com/watch?v=wndWWRKyKPk](https://www.youtube.com/watch?v=wndWWRKyKPk). The instructions and parts for most of the boards can be found at [https://bytecollector.com/archive/mark_8/My_Mark-8_Info/Mark-8_Construction/RE_Mark-8_Const-NEW.pdf](https://bytecollector.com/archive/mark_8/My_Mark-8_Info/Mark-8_Construction/RE_Mark-8_Const-NEW.pdf)

## PCBs

Original Mark-8 PCBs are very rare. Therefore, if one has the desire to build a Mark-8, they need to use reproduction PCBs. I created reproduction PCBs from the layouts found in the construction manual and got a fabricater to fabricate a large quantity of them at a discount. If you're interested in a set, check out the [listing on www.kalinchuk.com](https://www.kalinchuk.com/product-page/mark-8-minicomputer-reproduction-pcb-set).

<img width="653" alt="Mark-8 Reproduction PCBs" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/3108aea6-a843-41b5-bd85-5ec23e7af506">

## Note on Parts

- Any 74XX IC can be substituted with a 54XX (military grade) or, potentially, with a 74LSXX (Low-power Schottky).
- The Molex connectors that I used are the following:
  * 11-pin: https://www.mouser.com/ProductDetail/Molex/09-48-1114?qs=cSZs%252ByTnFTTJe86rNzFWuA%3D%3D
  * 10-pin: https://www.mouser.com/ProductDetail/Molex/09-48-1104?qs=DcEdecHHM4iSJPtLNet8eg%3D%3D
  * 8-pin: https://www.lvelectronics.com/details/item?itemid=MOLEX%2009-52-3081#
  * 6-pin: https://www.mouser.com/ProductDetail/Molex/09-48-1064?qs=qDyi%252BDzW2VMso3J1Nf5Bpg%3D%3D
  * 5-pin: https://www.mouser.com/ProductDetail/Molex/09-48-1054?qs=naUSJSqnqcLTt2tOKFjpcA%3D%3D
  * 2-pin: https://www.mouser.com/ProductDetail/Molex/09-48-1024?qs=SeTnVz%252B%252BFGB4BpEsDXmhhw%3D%3D
  * 1-pin: TBD

## LED Register Display Board

The LED Register Display board is used for displaying the address and contents of memory and output ports. It consists of 32 LEDs (8 for the high address, 8 for the low address, 8 for the address data and 8 for the output data).

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1         | 100 uF      | Sprague TE1211           |
| C2-C4      | 0.1 uF      | ST/CO .1uf 25V ceramic disc |
| D1-D32     | 40mA LED    | Western Electric LED; Original used Monsanto MV-50 but are very rare |
| R1-R32     | 220 ohm; 1/4W | Any carbon composition resistor |
| IC1-IC6    | 7404        | 5404J                    |
| IC7-IC8    | 7475        | 7475J                    |
| IC9        | 7442        | 7442J                    |
| IC10       | 7402        | 7402J                    |
| P1         | 3.96mm 8-pin| Molex 09-52-3081         |
| 41-PIN     | 3.96mm 41-pin | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

### PCB

<img width="653" alt="Mark-8 LED Register Display Board" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/218e5b60-ef97-4a1a-9f07-0d153eddb60c">

## Output Ports Board

The output board is used for outputting data from the computer. It's a fairly simple board mostly consisting of ICs.

### Jumpers

There is one jumper in the middle of the board that needs to be installed. The additional jumpers will need to be installed according to the needs. For example, "A" can be jumpered with "1" to make CPU port 1 be output port A on the specific board. This allows for a maximum of 7 output ports with two output port boards.

<img width="637" alt="Output Ports Jumpers" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/b1264516-f829-439a-aa60-10cdefa195fb">

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1-C3      | 0.1 uF      | ST/CO .1uf 25V ceramic disc |
| IC1-IC8    | 7475        | 7475J                    |
| IC9-IC10   | 7404        | 7404J                    |
| IC11       | 7402        | 7402J                    |
| IC12       | 7442        | 7442J                    |
| P1-P4      | 3.96mm 8-pin| Molex 09-52-3081         |
| 41-PIN     | 3.96mm 41-pin | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

### Test Circuit

The test circuit was taken from the Mark-8 Construction Manual Experiments section.

<img width="653" alt="Output Ports Board Test Circuit" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/a17896ef-9d23-4db5-abee-6aef494098da">

The following code will output 10101010 to output port 1 (remember that output port 0 is on the LED register display).

```
LDAI    AA       ;006 252
OUT1             ;123
HLT              ;777
```

### PCB

<img width="653" alt="Output Ports Board" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/ce581249-5bf3-4046-9af8-67bfa918b6a1">

## Memory Board

The memory board accepts 32-1101 SRAM ICs but requires a minimum of 8 of them. Multiple memory boards can be installed into the Mark-8 computer and linked together.

### Bugs

Ensure that the 8 holes at the top of the board (going to the top connector) are not connected to GND with vias. Early versions of the reproduction PCBs will require those 8 holes to be drilled out.

### Jumpers

There is one jumper between IC33 and IC34. If this memory board is the first (and only) memory board to be installed, jumper the "0" position and the "A" positions. Additionally, select the correct memory block with the jumper positions above IC33. First memory board needs to jumper "0" to "A", "1" to "B", "2" to "C" and "3" to "D". If installing additional memory boards into the Mark-8, the jumpers would be different. Refer to page 6 of the Mark-8 construction manual for more details.

<img width="637" alt="Memory Board Jumpers" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/eeff1f10-34c1-4f55-a44b-d0f9137fd48d">

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1-C3      | 0.1 uF      | ST/CO .1uf 25V ceramic disc |
| IC1-IC8    | 1101A or 1101A1        | 1101A                    |
| IC9-IC32   | 1101A or 1101A1        | *Optional                    |
| IC33       | 7442        | 7442J                    |
| IC34       | 7400        | 5400J                    |
| *R1-R11, R20-R21       | 1k ohm; 1/4W        | Any carbon composition resistor                    |
| *R12-R19       | 10k ohm; 1/4W        | Any carbon composition resistor                    |
| P1         | 3.96mm 8-pin| Molex 09-52-3081         |
| P2         | 3.96mm 2-pin| Molex 09-48-1024         |
| 41-PIN     | 3.96mm 41-pin | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

* For the first memory board, install all resistors. If installing additional memory boards, some resistors are omitted. Refer to page 6 of the Mark-8 construction manual for more details.

### Test Program

The following code will output 10101010 to output port 0 (LED register display) to test the functionality of the memory board.

```
LDAI    AA       ;006 252
OUT0             ;121
HLT              ;777
```

### PCB

<img width="653" alt="Memory Board" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/bf342a89-f3fd-4f2b-a83a-9f2a5137b88b">

## Address Latch Board

The address latch board latches addresses specified by the end-user which are then relayed to the memory board.

### Bugs

In addition to the bugs specified on the official bugs sheet, IC8-IC11 pin 4 needs to be pulled up to +5v with a 1k ohm pull-resistor (ref: https://www.ti.com/lit/ds/symlink/sn54ls193-sp.pdf).

<img width="637" alt="Address Latch Board Pull-Up Resistors" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/db516021-4b47-4bd1-8d5d-e39164b04c47">

Early versions of the reproduction PCBs also have an additional bug - one of the vias is missing and needs to be drilled out and connected with a piece of wire.

<img width="637" alt="Address Latch Board Bug" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/95625366-b7b4-4156-bc19-e4bf766bb266">

### Jumpers

There are two jumpers that need to be installed. The larger jumper is not annotated on the parts layout sheet but the holes do exist for it.

<img width="637" alt="Address Latch Board Jumpers" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/a2617753-be4b-4d63-b4c7-da18277c3fba">

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1-C6      | *0.1 uF     | ST/CO .1uf 25V ceramic disc |
| C7         | 680 pF      | RMC 680pf 100V ceramic disc |
| IC1-IC2    | 74123       | 74123J                   |
| IC3-IC7    | 7400        | 5400J                    |
| IC8-IC11   | 74193       | 74193J                   |
| R1-R3      | 10k ohm; 1/4W        | Any carbon composition resistor                    |
| R4         | 22k ohm; 1/4W        | Any carbon composition resistor                    |
| R5-R16     | 1k ohm; 1/4W        | Any carbon composition resistor                    |
| P1         | 3.96mm 8-pin| Molex 09-52-3081         |
| P2         | 3.96mm 5-pin| Molex 09-48-1054         |
| P2         | 3.96mm 6-pin| Molex 09-48-1064         |
| 41-PIN     | 3.96mm 41-pin | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

* The original parts list calls for 0.01 uF but that may be a mistake so I decided to use 0.1 uF instead.

### PCB

<img width="653" alt="Address Latch Board" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/d2a27531-92a0-42c6-8141-6134c0a9a4db">
