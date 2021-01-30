INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA

SIDE1 DB ?       
SIDE2 DB ?     
SIDE3 DB ?   
VAL1 DB ?
VAL2 DB ?                           

STR DB "Enter the sides of a triangle: ", 0 
                    
.CODE
 
MAIN PROC   
              
MOV AX, @DATA        
MOV DS, AX          

LEA SI, STR      
 
CALL PRINT_STRING 
  
PUTC 0AH             
PUTC 0DH     

CALL SCAN_NUM
        
MOV BH, CL
           
PUTC 0AH             
PUTC 0DH 

CALL SCAN_NUM
        
MOV BL, CL 
         
PUTC 0AH             
PUTC 0DH 
 
CALL SCAN_NUM
   
MOV CH, CL
      
PUTC 0AH        
PUTC 0DH  

CMP BH, BL
       
JGE STEP1 
            
STEP1:  
             
CMP BL, CH  
        
JGE STEP2       
         
CALL OPT3   
   
STEP2:           
CALL OPT2     
  
STEP4:                 
CMP BH,CH  
         
JGE STEP2:
               
CALL OPT3
       
STEP3:                 
CALL OPT1 
     
MOV AH, 4CH      
INT 21H         

MAIN ENDP       

OPT1 PROC         
    
MOV SIDE1, BH 
MUL BH          
     
MOV VAL1, AL     
MOV SIDE2, BL   
MUL BL             

MOV SIDE2, AL       
MOV SIDE3, CH    
MUL CH          

ADD SIDE2, AL         
CMP SIDE1, AL         

JGE PNT1              


CALL PTHIS                                                  

DB 13,10, 'It is not a right-angled triangle.',0      

JMP EXIT           

PNT1:     
     
CALL PTHIS                                                     

DB 13,10, 'It is a right-angled triangle.',0         

JMP EXIT   

OPT1 ENDP
  
OPT2 PROC                 
    
MOV SIDE1, BL      
MUL BL                

MOV VAL1, AL       
MOV SIDE2, BH   
MUL BH             

MOV VAL2, AL     
MOV SIDE3, CH     
MUL CH           

ADD VAL2, AL
CMP VAL1, AL
JGE PNT2           

CALL PTHIS            

DB 13,10, 'It is not a right-angled triangle.',0
JMP EXIT                                                   

PNT2:         
CALL PTHIS                                             

DB 13,10, 'It is a right-angled triangle.',0
JMP EXIT                                            
                                                         
                                                        
OPT2 ENDP

OPT3 PROC         
MOV SIDE1, CH     
MUL CH 

MOV VAL1, AL      
MOV SIDE2, BH     
MUL BH

MOV VAL2, AL     
MOV SIDE3, BL
    
MUL BL
ADD VAL2, AL
CMP VAL1, AL  

JGE PNT3     
CALL PTHIS

DB 13,10, 'It is not a right-angled triangle.',0

JMP EXIT        

PNT3:        
 
CALL PTHIS
DB 13,10, 'It is a right-angled triangle.',0

JMP EXIT
OPT3 ENDP

EXIT:                  




    
;-------DEFINE-----------

DEFINE_SCAN_NUM 
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PTHIS

END