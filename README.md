# Mark-8 Minicomputer Reproduction

This repository contains schematics, PCBs, instructions and parts lists for the Mark-8 minicomputer reproduction build which can be found at [https://www.youtube.com/watch?v=wndWWRKyKPk](https://www.youtube.com/watch?v=wndWWRKyKPk). The instructions and parts for most of the boards can be found at [https://bytecollector.com/archive/mark_8/My_Mark-8_Info/Mark-8_Construction/RE_Mark-8_Const-NEW.pdf](https://bytecollector.com/archive/mark_8/My_Mark-8_Info/Mark-8_Construction/RE_Mark-8_Const-NEW.pdf)

You can find the transcript of the interview with Jon Titus [here](/jon_titus_interview.txt).

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

<img width="750" alt="Address Latch Board Pull-Up Resistors" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/db516021-4b47-4bd1-8d5d-e39164b04c47">

Early versions of the reproduction PCBs also have an additional bug - one of the vias is missing and needs to be drilled out and connected with a piece of wire.

<img height="400" alt="Address Latch Board Bug" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/95625366-b7b4-4156-bc19-e4bf766bb266">

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

## Input Multiplex Board

The input multiplex board controls all data flowing into the computer and data between memory and CPU.

### Bugs

In addition to the bugs specified on the official bugs sheet, older versions of this board had two fabrication issues.

The jumper on the right side is missing a hole. This is because the other side of the board does not have a pad. This can be fixed by drilling out a hole using a [#60 (1mm) drill bit](https://amzn.to/3Vpg0OW) and [chuck](https://amzn.to/3VcrNii). Alternatively, a jumper wire can be soldered directly onto the trace.

<img width="400" alt="Input Multiplex Board Bug 1" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/e66becf7-9a5b-4ff0-8597-1c15fe580064">

IC1 has one of the pins connected to a passing trace. This is a frabrication issue and can be fixed by cutting the connection with a utility knife or small grinder (carefully).

<img width="400" alt="Input Multiplex Board Bug 2" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/6bb94a66-c09a-4d28-9848-aba197156cb5">

### Jumpers

There are two official jumpers and one additional jumper which was noted on the bugs sheet.

<img width="637" alt="Input Multiplex Board Jumpers" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/79083165-95ac-4f37-a8ce-39694c08ee2c">

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1, C3-C4  | 0.1 uF      | ST/CO .1uf 25V ceramic disc |
| C2         | 100 uF      | Sprague TE1211           |
| IC1-IC2    | 8263 MUX    | N8263N - can be found on eBay                   |
| IC3        | 7400        | 7400J                    |
| IC4-IC5    | 8267 MUX    | N8267B - can be found on eBay. Do not use 8266                   |
| IC6        | 7402        | 7402J                    |
| IC7        | 7442        | 7442J                    |
| R1         | 1k ohm; 1/4W        | Any carbon composition resistor                    |
| P1-P4      | 3.96mm 8-pin| Molex 09-52-3081         |
| 41-PIN     | 3.96mm 41-pin | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

### PCB

<img width="653" alt="Input Multiplex Board" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/a0e78d41-a42a-4b5e-853e-70f034f47d2b">

## CPU Board

The CPU board contains the 8008 microprocessor and is the "brain" of the computer.

### Bugs

The bugs sheet on page 46 states that IC3 pin 4 can be connected to ground. Some boards may have experienced issues with the pin not being grounded.

### Jumpers

The board has two official jumpers as annotated on the parts layout sheet.

<img width="400" alt="CPU Board Jumpers" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/b1e379a0-a1d3-45f8-87de-cfc9e11c3b5d">


As mentioned in the Bugs section, I went ahead and connected IC3 pin 4 to ground by soldering it to the passing trace (since that trace is connected to ground).

<img width="400" alt="CPU Board Bug" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/0a64f483-0795-4540-8bb9-8c909d17dbe8">

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1         | 33 pF       | RMC 3000V 33pF 10% ceramic disc |
| C2-C6      | 0.1 uF      | ST/CO .1uf 25V ceramic disc |
| IC1, IC4, IC6-IC7, IC9, IC13, IC17, IC19    | 7400    | 5400J                   |
| IC2-IC3, IC14        | 7476        | 5476J                    |
| IC5, IC11, IC16, IC20, IC21    | 7404    | 5404J                   |
| IC8, IC12        | 7474        | 5474J                    |
| IC22-IC23, IC25        | 74L04        | 74L04                    |
| IC10, IC18        | 7410        | 7410J                    |
| IC15        | 7420        | 7420J                    |
| IC24        | Intel 8008        | Intel C8008                    |
| IC26        | 7442        | 7442J                    |
| R1-R2      | 220 ohm; 1/4W        | Any carbon composition resistor                    |
| R3         | 560 ohm; 1/4W        | Any carbon composition resistor                    |
| R4         | 1.8k ohm; 1/4W        | Any carbon composition resistor                    |
| R5-R8, R17 | 1k ohm; 1/4W        | Any carbon composition resistor                    |
| R9-R16     | 22k ohm; 1/4W        | Any carbon composition resistor                    |
| XTAL 1     | 4.0 MHz     | 4.0 MHz Crystal         |
| 41-PIN     | 3.96mm 41-pin | MOLEX 09-48-1104 (x3) MOLEX 09-48-1114 (x1) |

### PCB

<img width="653" alt="CPU Board" src="https://github.com/kalinchuk/mark_8_reproduction/assets/1035984/a69488ca-e2bf-4552-a274-17e0e67c3658">

## Backplane

The backplane is used for connecting all the boards together. The original Mark-8 did not have a backplane so all boards had to be manually connected with wires.

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| 41-PIN     | 3.96mm 41-pin      | 	11-position (TE Connectivity AMP Connectors 1-640383-1) & 10-position (TE Connectivity AMP Connectors 1-640383-0) |
| Power Connector      | BARRIER STRIP 3CIRC      | Amphenol Anytek YK3030323000G |

### PCB

<img width="653" alt="Backplane" src="https://github.com/user-attachments/assets/5c064c07-5b47-4b32-a689-907ecce2c2ed">

## Power Supply

The original Mark-8 minicomputer did not come with a power supply but did suggest a specific power supply of +5 volts (3 amps) and -9 volts (1.5 amps). The following is a linear power supply consistent with how power supplies in the 1970s were made.

You can purchase an unstuffed PCB at [www.kalinchuk.com](https://www.kalinchuk.com/product-page/mark-8-minicomputer-power-supply-pcb)

### Schematic & Gerber

You will find the V1 schematic and Gerber below.

<img width="653" alt="Power Supply Schematic" src="https://github.com/user-attachments/assets/418524bd-8cc9-440d-b7e3-2eba8d59ce9c">

You can also download a [high quality PDF](https://github.com/user-attachments/files/16600388/Schematic.pdf).

If you would like to fabricate the PCB yourself, the [V1 Gerber](https://github.com/user-attachments/files/16600408/GerberV1.zip) is available for download.

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| D1-D4      |	1N5408      | Digikey 641-1316-1-ND    |
| D5-D6      | 5mm	LED     | Any LED                  |
| C1-C2	     | 4,700 uF 35V    | Digikey P15166-ND        |
| C3-C4, C8-C9 | 	0.1 uF   | ST/CO .1uf 25V ceramic disc     |
| C5, C10    |	10 uF       | Illinois Capacitor 106RAR035A   |
| C6-C7      |	2,200 uF 35V    | Digikey 1189-2266-ND            |
| J1-J2	     | 3.96mm 3-pos | Digikey YK3030323000G-ND       |
| R1	        | 820 ohm     | Any carbon composition resistor |
| R2	        | 270 ohm     | Any carbon composition resistor |
| R3	        | 220 ohm     | Any carbon composition resistor |
| R4	        | 1.5k ohm    | Any carbon composition resistor |
| R5	        | 230 ohm     | Any carbon composition resistor |
| R6	        | 330 ohm     | Any carbon composition resistor |
| U1	        | LM338       | Digikey LM338T/NOPB-ND          |
| U2	        | LM337       | Digikey LM337TNS/NOPB-ND        |
| U1 Heat Sink	| 2.00°C/W or less  | Digikey 6400BG-ND               |
| U2 Heat Sink	| 10.00°C/W or less | Digikey 6400BG-ND               |

### Parts Layout

Download the [Parts Layout PDF](https://github.com/user-attachments/files/16593340/Parts.Layout.V1.pdf)

### Notes

It's important to use a correctly sized heat sink for each voltage regulator otherwise they will burn out. The 5 volt regulator (U1) needs a heat sink with thermal resistance of 2.00°C/W or less. The -9 volt regulator (U2) needs a heat sink with thermal resistance of 10.00°C/W or less.

### PCB

<img width="653" alt="Power Supply" src="https://github.com/user-attachments/assets/fc1e7b20-86c7-46aa-bc3c-103a5bbaf525">

## Front Panel

The front panel has 16 switches and an opening for the lights. You can find the parts used to build the front panel, below. You can also find the blank panel for sale at [www.kalinchuk.com](https://www.kalinchuk.com/product-page/mark-8-reproduction-front-panel).

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| SPDT Switch | x10        | [M2012TJW02-GA-1A](https://www.powell.com/powell/en/USD/Products/Electromechanical/Switches/p/M2012TJW02-GA-1A/NKK-Switches/000000001000260706)  |
| SPDT Momentary Switch | x6 | [M2015TJW01-GA-1A](https://www.digikey.com/en/products/detail/nkk-switches/M2015TJW01-GA-1A/1165800)       |
| Plexiglass | ~5" x 6" | 1/8" thick [amazon](https://www.amazon.com/gp/product/B0CLNH69B8) |
| 14 gauge wire | n/a | n/a |
| 20 guage wire | n/a | n/a |
| Shrink tubing | n/a | n/a |
| Crimp pins | 18-24 guage pin | [0002062103](https://www.digikey.com/en/products/detail/molex/0002062103/26253) |
| Aqua satin paint | n/a | n/a |

### Image

Inside the case:

<img width="653" alt="Inside the case" src="https://github.com/user-attachments/assets/3659abe1-7448-48f7-8559-47ac6eb660a4">

Front of the case:

<img width="653" alt="Front of the case" src="https://github.com/user-attachments/assets/537a942e-856d-4fb4-b1ca-a1d0d4f1c3c8">

## Case

The original Mark-8 did not come with a case nor did it specify a recommended case. The case we will be building is a close replica of the one shown on the front page of the July 1974 Radio Electronics magazine.

<img width="653" alt="July 1974 Radio Electronics Case" src="https://github.com/user-attachments/assets/9734195e-fda3-4947-a3d6-508fe39edfbf">

It's made out of 100% aluminum frame and panels. All panels are 1/16" thick. The aluminum frame members are 1" x 1". All this metal adds quite a bit of weight to the case but it's very solid.

### Drawings

Below, you will find the rough drawings that were drawn up before the CAD files were created.

*Vertical Member*

<img width="653" alt="Case Vertical Member" src="https://github.com/user-attachments/assets/027ea74c-7e87-48e8-9389-3c78f33cd15b">

[Full PDF](https://github.com/user-attachments/files/16801457/VerticalPiece.pdf)

*Horizontal Member*

<img width="653" alt="Case Horizontal Member" src="https://github.com/user-attachments/assets/6aa0d2ae-4cc6-4c2f-b1eb-ef23b52fe141">

There are two sizes of the horizontal member - 15-1/4" and 9"
[Full PDF](https://github.com/user-attachments/files/16801461/HorizontalPiece.pdf)

*Front Panel*

<img width="653" alt="Case Front Panel" src="https://github.com/user-attachments/assets/3102eb1a-5d27-45da-a2aa-e315c43f5f88">

[Full PDF](https://github.com/user-attachments/files/16801467/Scan2024-08-01_135943.pdf)

*Rear Panel*

<img width="653" alt="Case Rear Panel" src="https://github.com/user-attachments/assets/17a9b1f9-7046-4a0f-9761-0121535e5a2f">

The first version of the rear panel has a fan cut-out and also ports for the power plug and switch.
[Full PDF](https://github.com/user-attachments/files/16801468/Scan2024-08-04_144435.pdf)

### CAD Files

[Vertical Member IGES](case/3D_Vertical_Piece.iges)

[Horizontal Member 9" IGES](case/3D_Horizonal_Piece_9.iges)

[Horizontal Member 15-1/4" IGES](case/3D_Horizonal_Piece_15-1_4.iges)

[Front Panel IGES](case/Cutout_Sheet_Rev_1.iges)

[Rear Panel V1 IGES](case/2D_Sheetmetal_Fan_Grill.iges)

### Fabrication Notes

The vertical members are CNC machined aluminum. Four are required for the case. It contains four threads per piece so be sure to select "threads" when ordering from a CNC service (such as PCBWay).

The horizontal members are also CNC machined aluminum and contain threads (select "threads" when ordering). There are two sizes of the horizontal members - one is 15-1/4" long and the other is 9" long. The case requires four of each size.

The front panel is 1/16" thick aluminum sheet metal. I spray painted mine with aqua (satin) paint.

The rear panel is 1/16" thick aluminum sheet metal. Version 1 contains an opening for a fan, power plug and switch. Version 2 is also contains openings for serial ports.

When ordering, make sure to select "CNC" for vertical and horizontal pieces and "sheet metal" for all others.

The remaining sides of the enclosure are standard 1/16" thick aluminum sheets cut to size. I use OnlineMetals.com for this.
* Side pieces are 10.0"x8.75", 1/16" thick (2)
* Top piece is 17.25"x11.0", 1/16" thick (1)
* Bottom piece is also 17.25"x11.0" but 1/8" thick (1)

To assemble the case, 48 #10-24 x 3/8" screws will be required.

### Additional Notes

The Mark-8 will fit quite well into the case but, due to the size of the frame members, the front panel lights will not line up exactly with the opening of the front panel. I think the front panel design will be modified in the future so that the opening is moved slightly left.

<img width="653" alt="Case Front Panel Opening" src="https://github.com/user-attachments/assets/559f74b9-b434-4916-bbf8-920d83dd4208">

The power supply fights perfectly to the left of the Mark-8 computer. Additional pieces (i.e. power transformer, barrier strip, etc.) will fit in the remaining space. I also added a fan to the left of the power supply to cool it down since it gets quite hot.

<img width="653" alt="Case From Top" src="https://github.com/user-attachments/assets/6c3ebc5f-8360-46c7-b3bc-92562812d4dd">

### Parts List

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| Rubber Feet      |	Any size      | [Amazon](https://amzn.to/4cNOoIW)    |
| Barrier Strip    | 110-220V 3A Min - 2/3 position | [Amazon](https://amzn.to/3T9KWRE) |
| Power Transformer      | 3A Center Tap 12V-0-12V 24VAC     | [eBay](https://www.ebay.com/itm/124225528946)                 |
| Power Plug | Standard size | [DigiKey](https://www.digikey.com/en/products/detail/schurter-inc/6162-0159/2646985) |

### Final

<img width="653" alt="Case Final" src="https://github.com/user-attachments/assets/cc4a514d-23fa-4abd-8167-2021ac9c54b3">

## Original Case

The construction manual did not recommend a case for the Mark-8 minicomputer but the case that was used for the Mark-8 that was featured on the front cover of the Radio Electronics magazine was made by Bud Industries and had a part number of SB-2142. Those cases are still available for sale from various sources. The one I purchased was from https://www.testequity.com/product/10014392-SB-2142

### CAD Files

These CAD files are for the Bud Industries case. I have not tested them, personally, but the dimensions should be correct.

[Front Panel](case/Bud%20Industries%20Case/FrontPanel.iges)

[Rear Panel](case/Bud%20Industries%20Case/RearPanel.iges)
