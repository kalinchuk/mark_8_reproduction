# Mark-8 Minicomputer Reproduction

This repository contains schematics, PCBs, instructions and parts lists for the Mark-8 minicomputer reproduction build which can be found at [https://www.youtube.com/watch?v=wndWWRKyKPk](https://www.youtube.com/watch?v=wndWWRKyKPk). The instructions and parts for most of the boards can be found at [https://bytecollector.com/archive/mark_8/My_Mark-8_Info/Mark-8_Construction/RE_Mark-8_Const-NEW.pdf](https://bytecollector.com/archive/mark_8/My_Mark-8_Info/Mark-8_Construction/RE_Mark-8_Const-NEW.pdf)

## PCBs

Original Mark-8 PCBs are very rare. Therefore, if one has the desire to build a Mark-8, they need to use reproduction PCBs. I created reproduction PCBs from the layouts found in the construction manual and got a fabricater to fabricate a large quantity of them at a discount. If you're interested in a set, check out the [listing on www.kalinchuk.com](https://www.kalinchuk.com/product-page/mark-8-minicomputer-reproduction-pcb-set).

[IMAGE]

## Note on Parts

* Any 74XX IC can be substituted with a 54XX (military grade) or, potentially, with a 74LSXX (Low-power Schottky).

## LED Register Display Board

The LED Register Display board is used for displaying the address and contents of memory and output ports. It consists of 32 LEDs (8 for the high address, 8 for the low address, 8 for the address data and 8 for the output data).

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1         | 100 uF      | Sprague TE1211           |
| C2-C4      | 0.1 uF      | ST/CO .1uf 25V ceramic disc |
| D1-D32     | 40mA LED    | Western Electric LED; Original used Monsanto MV-50 but are very rare |
| R1-R32     | 220 ohm; 1/4W | Any carbon composition resistor |
| IC1-IC6    | 7404        | 5404J; Any 7404 or 5404  |
| IC7-IC8    | 7475        | 7475J; Any 7475 or 5475  |
| IC9        | 7442        | 7442J; Any 7442 or 5442  |
| IC10       | 7402        | 7402J; Any 7402 or 5402  |
| 8 POS CONN | 3.96mm      | Molex 09-52-3081         |
| 41 POS CONN | 3.96mm      | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

### PCB

[IMAGE]