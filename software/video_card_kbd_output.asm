/***************************************************
* Author:    Artem Kalinchuk
* Created:   02.02.2025
*
* Clears the screen of the video card
* (designed by Len Bayles) and receives
* input from a keyboard that is then printed
* on the screen.
*
* DATA PORT: 5 (14)
* COLUMN PORT: 6 (15)
* ROW PORT: 7 (16)
***************************************************/

.target "8008"
* = $2000

INITIALIZE:
  LAI 0x00              
  OUT 14                
  OUT 15                
  CAL CLEAR             
  LCI 0x00              
  LDI 0x00              
  LAI 0x00              
  OUT 14                 
  OUT 15
  JMP LISTEN_KBD

CLEAR:
  CAL INITCLEAR         
  /* clear last two positions */
  LAI 0x20              
  OUT 13                
  OUT 13                
  RET                   

INITCLEAR:
  LBI 0xFF              
  LEI 0x01              
CLEARLOOP:
  LAI 0x20              
  OUT 13                
  DCB                   
  LAB                   
  CPI 0x00              
  JTZ DECREMENT         
  JMP CLEARLOOP         
DECREMENT:
  LAE                   
  CPI 0x00              
  RTZ                   
  LBI 0xFF              
  DCE                   
  JMP CLEARLOOP

LISTEN_KBD:
  INP 0                
  RAL                  
  JFC LISTEN_KBD       

  RAR                  
  NDI 0x7F             
  CAL PROCESS_CHAR     

LISTEN_KBD_LOW:
  INP 0                
  RAL                  
  JTC LISTEN_KBD_LOW   
  JMP LISTEN_KBD       

PROCESS_CHAR:
  CPI 0x0D             
  JTZ INC_ROW          
  CPI 0x7F             
  JTZ DELETE           
  CAL PRINT            
  RET                  

DELETE:
  CAL DEC_POS          
  NOP                  
  NOP                  
  NOP                  
  NOP                  
  NOP                  
  NOP                  
  NOP                  
  RET                  

DEC_POS:
  LAD                  
  CPI 0x00             
  JTZ DEC_ROW          
  DCD                  
  LAD                  
  OUT 14               
  RET                  

DEC_ROW:
  LDI 0x20             
  LAD                  
  OUT 14               
  LAC                  
  CPI 0x00             
  JTZ JUMP_TO_BOTTOM   
  DCC                  
  LAC                  
  OUT 15               
  RET                  

JUMP_TO_BOTTOM:
  LCI 0x10             
  LAC                  
  OUT 15               
  RET                  

PRINT:
  OUT 13               
  CAL INC_POS          
  RET                  

INC_POS:
  LAD                  
  CPI 0x20             
  JTZ INC_ROW          
  IND                  
  LAD                  
  OUT 14               
  RET                  

INC_ROW:      
  LDI 0x00             
  LAD                  
  OUT 14               
  INC                  
  LAC                  
  CPI 0x10             
  JTZ RESET_ROW        
  OUT 15               
  RET                  

RESET_ROW:      
  LCI 0x00             
  LAC                  
  OUT 15               
  RET                  
