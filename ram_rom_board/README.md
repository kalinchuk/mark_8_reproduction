# Mark-8 16K RAM/ROM Board

This RAM/ROM board for the Mark-8 minicomputer was designed by Len Bayles who, kindly, shared the Gerber file and documentation with me and helped me get familiar with it. Be sure to check out his website at [https://www.chronworks.com/](https://www.chronworks.com/).

This board will work with any reproduction Mark-8 minicomputer that uses a backplane with a 3.96mm pitch.

## Gerber

You can find the Gerber file under the "Gerber" directory. Be sure to credit Len Bayles if sharing publicly.

## Parts

The following parts list contains a suggested part number for each part but any comparable part will do.

Additionally, the board can be configured for RAM or ROM (or both). If using as RAM only, populate the SRAMs and leave the EPROMs out. If using as ROM only, populate the EPROMs and leave the SRAMs out. If using both RAM and ROM, populate both the EPROMs and the SRAMs.

| Part       | Spec        | Part #                   |
| ---------- | ----------- | ------------------------ |
| C1         | 47 uF, 25v, axial elec.  | [Cornell Dubilier Knowles #476TTA025M](https://www.digikey.com/en/products/detail/cornell-dubilier-knowles/476TTA025M/5412827) |
| C2-C14     | 0.1 uF ceramic    | [KEMET #C320C104K5R5TA](https://www.digikey.com/en/products/detail/kemet/C320C104K5R5TA/818040) |
| C15        | 22 uF, 25v, axial elec.  | [Cornell Dubilier Knowles #226BPA025M](https://www.digikey.com/en/products/detail/cornell-dubilier-knowles/226BPA025M/5411600) |
| D1-D4      | 1n914       | [onsemi #1N914](https://www.digikey.com/en/products/detail/onsemi/1N914/978749) |
| D5-D6      | 5mm LED     | [Kingbright #WP7113ID](https://www.digikey.com/en/products/detail/kingbright/WP7113ID/1747663) |
| J1         | 41-pos Molex (3x10-pos, 1x11-pos, 3.96mm) | [Molex #09-48-1104](https://www.digikey.com/en/products/detail/molex/0009481104/863329) & [Molex #09-48-1114](https://www.digikey.com/en/products/detail/molex/0009481114/863330) |
| J2, J4     | 8-pos Molex (3.96mm) | [Molex #09-48-1084](https://www.digikey.com/en/products/detail/molex/0009481084/863327) |
| J3         | 2-pos Molex (3.96mm) | [Molex #09-48-1024](https://www.digikey.com/en/products/detail/molex/0009481024/863321) |
| R1-R2, R4  | 1k 1/4w     | [Stackpole Electronics Inc #CF14JT1K00](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT1K00/1741314) |
| R3         | 4.7k 1/4w   | [Stackpole Electronics Inc #CF14JT4K70](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT4K70/1741428) |
| RN1-RN3    | 10k x 8     | [Bourns Inc. #4609M-101-103LF](https://www.digikey.com/en/products/detail/bourns-inc/4609M-101-103LF/3787785) |
| RN4        | 1k x 8      | [Bourns Inc. #4609M-101-102LF](https://www.digikey.com/en/products/detail/bourns-inc/4609M-101-102LF/3787784) |
| SW1-SW2    | DIP switch x 8 | [CTS Electrocomponents #195-8MST](https://www.digikey.com/en/products/detail/cts-electrocomponents/195-8MST/90523) |
| SW3        | Tactile switch | [TE Connectivity ALCOSWITCH Switches #1825910-6](https://www.digikey.com/en/products/detail/te-connectivity-alcoswitch-switches/1825910-6/1632536) |
| U1-U2      | 74LS244 | [Texas Instruments #SN74LS244N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS244N/277299) |
| U3         | 74LS00     | [Texas Instruments #SN74LS00N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS00N/277272) |
| U4, U20    | 74LS02     | [Texas Instruments #SN74LS02N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS02N/277273) |
| U5-U8      | 74LS85     | [Texas Instruments #SN74LS85N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS85N/563035) |
| U9-U10     | 2716 EPROM | [Major Brands #D2716](https://www.jameco.com/z/D2716-Major-Brands-IC-2716-EPROM-16K-Bit-450ns-NMOS-UV-Erasable-and-Electrically-Programmable-EPROM_40002.html) |
| U11-U18    | AM2167 SRAM  | [Advanced Micro Devices, Inc. #AM2167-45PC](https://specialtypartsinc.com/products/1-pc-am2167-45pc-amd-standard-sram-16kx1-40ns-nmos-pdip20) |
| U19        | 74LS30     | [Texas Instruments #SN74LS30N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS30N/377726) |
| U21-U22    | 74LS175    | [Texas Instruments #SN74LS175N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS175N/277294) |
| <td colspan=3>The following are optional but recommended: |
| 14 pin socket  | Quantity 4 | [CNC Tech #245-14-1-03](https://www.digikey.com/en/products/detail/cnc-tech/245-14-1-03/3441580) |
| 16 pin socket  | Quantity 6 | [CNC Tech #245-16-1-03](https://www.digikey.com/en/products/detail/cnc-tech/245-16-1-03/3441581) |
| 20 pin socket  | Quantity 10 | [CNC Tech #245-20-1-03](https://www.digikey.com/en/products/detail/cnc-tech/245-20-1-03/3441583) |
| 24 pin socket | Quantity 2 | [CNC Tech #245-24-1-06](https://www.digikey.com/en/products/detail/cnc-tech/245-24-1-06/3441585) |

## Parts Placement & Schematics

The PCB may not contain a silk screen with all the parts outlined. If that's the case for you, refer to the Parts Placement PDF. Additionally, the schematics are provided under the "Schematics" directory.
