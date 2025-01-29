# Mark-8 Video Board

This video board for the Mark-8 minicomputer was designed by Len Bayles who, kindly, shared the Gerber file and documentation with me and helped me get familiar with it. Be sure to check out his website at [https://www.chronworks.com/](https://www.chronworks.com/).

This board will work with any reproduction Mark-8 minicomputer that uses a backplane with a 3.96mm pitch.

## Gerber

You can find the Gerber file under the [Gerber](Gerber) directory. Be sure to credit Len Bayles if sharing publicly.

## Parts

The following parts list contains a suggested part number for each part but any comparable part will do.

The 2716 EPROM is used as a character generator and needs to be programmed with [charGen.hex](Software/charGen.hex).

| Part       | Spec        | Quantity | Part #                   |
| ---------- | ----------- | ---------| ------------------------ |
| C1, C10    | 0.01 uF ceramic  | 2 | [Vishay Beyschlag #D103Z25Z5VF63L6R](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/D103Z25Z5VF63L6R/2832593) |
| C2         | 50 pF trimmer    | 1 | [Jameco ValuePro #CTC05-50](https://www.jameco.com/webapp/wcs/stores/servlet/ProductDisplay?catalogId=10001&langId=-1&storeId=10001&productId=136979) |
| C3         | 220 pF ceramic   | 1 | [Vishay Beyschlag #D221K20Y5PH63L6R](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/D221K20Y5PH63L6R/769380) |
| C4         | 4.7 uF, 25v, axial elec.  | 1 | [Vishay Beyschlag #MAL202128478E3](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/MAL202128478E3/5632105) |
| C5         | 1000 pF ceramic  | 1 | [Vishay Beyschlag #D102K25Y5PL63L6R](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/D102K25Y5PL63L6R/769395) |
| C6, C101-C106, C201-C206, C301-C306, C401-C406         | 0.1 uF ceramic   | 25 | [KEMET #C320C104K5R5TA](https://www.digikey.com/en/products/detail/kemet/C320C104K5R5TA/818040) |
| C7         | 100 uF, 25v, axial elec.  | 1 | [Vishay Beyschlag #MAL202137101E3](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/MAL202137101E3/262952) |
| C8         | 0.05 uF ceramic  | 1 | [Vishay Beyschlag/Draloric/BC Components #S503Z69Z5UL63L0R](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/S503Z69Z5UL63L0R/2832563) |
| C9         | 10 uF, 25v, radial elec.  | 1 | [Vishay Beyschlag #MAL214258109E3](https://www.digikey.com/en/products/detail/vishay-beyschlag-draloric-bc-components/MAL214258109E3/2691024) |
| J1         | 41-pos Molex (3.96mm) | 3x10-pos, 1x11-pos | [Molex #09-48-1104](https://www.digikey.com/en/products/detail/molex/0009481104/863329) & [Molex #09-48-1114](https://www.digikey.com/en/products/detail/molex/0009481114/863330) |
| J2         | RCA jack         | 1 | [Same Sky #RCJ-014](https://www.digikey.com/en/products/detail/same-sky-formerly-cui-devices/RCJ-014/408490) |
| L1         | 6.8 uH axial     | 1 | [Bourns Inc. #8250-682K-RC](https://www.digikey.com/en/products/detail/bourns-inc/8250-682K-RC/4697666) |
| PS1        | DC-DC CONVERTER +5V to +/-12V 2W | 1 | [CUI Inc. #PDM2-S5-D12-S](https://www.digikey.com/en/products/detail/cui-inc/PDM2-S5-D12-S/4009656) |
| Q1-Q2      | 2n2222     | 2 | [STMicroelectronics #2N2222](https://www.digikey.com/en/products/detail/stmicroelectronics/2N2222/654412) |
| R1-R2      | 330 1/4w   | 2 | [Stackpole Electronics Inc #CF14JT330R](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT330R/1741399) |
| R3         | 8.2k 1/4w  | 1 | [Stackpole Electronics Inc #CF14JT8K20](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT8K20/1741509) |
| R4, R6     | 50k pot    | 2 | [Bourns Inc. #PV36W503C01B00](https://www.digikey.com/en/products/detail/bourns-inc/PV36W503C01B00/666516) |
| R5, R15    | 22k 1/4w   | 2 | [Stackpole Electronics Inc #CF14JT22K0](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT22K0/1741350) |
| R7, R12-R13| 5.1k 1/4w  | 3 | [Stackpole Electronics Inc #CF14JT5K10](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT5K10/1741447) |
| R8, R101-R102 | 1k 1/4w | 3 | [Stackpole Electronics Inc #CF14JT1K00](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT1K00/1741314) |
| R9         | 2.2k 1/4w  | 1 | [Stackpole Electronics Inc #CF14JT2K20](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT2K20/1741321) |
| R10        | 56 1/4w    | 1 | [Stackpole Electronics Inc #CF14JT56R0](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT56R0/1741465) |
| R11        | 68 1/4w    | 1 | [Stackpole Electronics Inc #CF14JT68R0](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT68R0/1741487) |
| R14        | 3.9k 1/4w  | 1 | [Stackpole Electronics Inc #CF14JT3K90](https://www.digikey.com/en/products/detail/stackpole-electronics-inc/CF14JT3K90/1741386) |
| U1-U2, U16, U41 | 74LS04     | 4 | [Texas Instruments #SN7404N](https://www.digikey.com/en/products/detail/texas-instruments/SN7404N/555980) |
| U3         | 7490       | 1 | [onsemi #DM7490AN](https://www.digikey.com/en/products/detail/onsemi/DM7490AN/3144) |
| U4, U10    | 74LS00     | 2 | [Texas Instruments #SN74LS00N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS00N/277272) |
| U5         | MM5321 (sync gen)     | 1 | [National Semiconductor #MM5321N](https://www.ebay.com/itm/165651436117) |
| U6, U39    | 74LS10     | 2 | [onsemi #SN74LS10N](https://www.digikey.com/en/products/detail/rochester-electronics-llc/SN74LS10N/11520851) |
| U7-U9, U11-U13, U18-U20 | 74LS193 | 9 | [Texas Instruments #SN74LS193N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS193N/277295) |
| U14        | 2716 EPROM (char gen) | 1 | [Major Brands #D2716](https://www.jameco.com/z/D2716-Major-Brands-IC-2716-EPROM-16K-Bit-450ns-NMOS-UV-Erasable-and-Electrically-Programmable-EPROM_40002.html) |
| U15        | 74165      | 1 | [Texas Instruments #SN74LS165AN](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS165AN/563051) |
| U17        | 74LS30     | 1 | [Texas Instruments #SN74LS30N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS30N/377726) |
| U21        | 74LS32     | 1 | [Texas Instruments #SN74LS32N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS32N/277304) |
| U22        | 74LS138    | 1 | [Texas Instruments #SN74LS138N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS138N/277285) |
| U23        | 74LS244    | 1 | [Texas Instruments #SN74LS244N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS244N/277299) |
| U24-U26    | 74LS157    | 3 | [Texas Instruments #SN74LS157N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS157N/277291) |
| U27-U33    | 2102 SRAM  | 7 | [National Semiconductor #MM2102AN-4](https://www.jameco.com/z/MM2102AN-4-National-Semiconductor-IC-MM2102AN-4-NMOS-SRAM-1024-Bit-1024x1-250ns-DIP-16_2287991.html) |
| U34        | 74LS123    | 1 | [Texas Instruments #SN74LS123N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS123N/277282) |
| U35-U37    | 74LS85     | 3 | [Texas Instruments #SN74LS85N](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS85N/563035) |
| U38        | 74LS74     | 1 | [Texas Instruments #SN74LS74AN](https://www.digikey.com/en/products/detail/texas-instruments/SN74LS74AN/277314) |
| U40        | 555 timer  | 1 | [Texas Instruments #LM555CN/NOPB](https://www.digikey.com/en/products/detail/texas-instruments/LM555CN-NOPB/6575) |
| X1         | 14.31818 MHz | 1 | [Abracon LLC #AB-14.31818MHZ-B2](https://www.digikey.com/en/products/detail/abracon-llc/AB-14-31818MHZ-B2/675199) |
| The following are optional but recommended: |
| 8 pin socket  | 8-pin | 1 | [CNC Tech #243-08-1-03](https://www.digikey.com/en/products/detail/cnc-tech/243-08-1-03/3441568) |
| 14 pin socket  | 14-pin | 11 | [CNC Tech #245-14-1-03](https://www.digikey.com/en/products/detail/cnc-tech/245-14-1-03/3441580) |
| 16 pin socket  | 16-pin | 26 | [CNC Tech #245-16-1-03](https://www.digikey.com/en/products/detail/cnc-tech/245-16-1-03/3441581) |
| 20 pin socket  | 20-pin | 1 | [CNC Tech #245-20-1-03](https://www.digikey.com/en/products/detail/cnc-tech/245-20-1-03/3441583) |
| 24 pin socket  | 24-pin | 1 | [CNC Tech #245-24-1-06](https://www.digikey.com/en/products/detail/cnc-tech/245-24-1-06/3441585) |

## Parts Placement & Schematics

The PCB should contain the silk screen with the parts placement but, if it doesn't, refer to [Mark8_tvt_parts.pdf](Schematics/Mark8_tvt_parts.pdf) for the parts placement. Additionally, the schematics are provided under the "Schematics" directory.

## Configuration

Coming soon

## Bugs

The board contains a few bugs that need to be repaired before operation.

1) Cut trace of U19 pin 1 and tie it to ground.

<img width="400" src="https://github.com/user-attachments/assets/45491b7f-be58-4ba6-8a9d-6603f13241f5"/>

2) Cut trace between U22 pin 9 and CA. Run jumper between U22 option hole #3 and CA.

<img width="400" src="https://github.com/user-attachments/assets/6affb2aa-393c-4dbf-ac06-4f861a9c3656"/>

## Sample program

The following sample program will output characters on the screen at position 0,0.

```assembly
  ;
  ; tvt.asm
  ;
  ; Intel 8008 source code file.
  ;
  ; Copyright 2015 by Len Bayles
  ;

CHAR_OUT: equ 5
COL_OUT:  equ 6
ROW_OUT:  equ 7

  ; page 0

  cpu 8008

  org 000#000

main:
  lai 0x00
  out COL_OUT ; Put value on output port
  out ROW_OUT ; Put value on output port

  lai 0x48
  out CHAR_OUT  ; Put value on output port

  lai 0x69
  out CHAR_OUT  ; Put value on output port
  
  end
```
