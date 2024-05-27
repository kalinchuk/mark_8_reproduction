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
