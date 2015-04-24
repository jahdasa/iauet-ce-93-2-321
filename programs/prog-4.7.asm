stksg segment stack
    db 32 dup("stack")
stksg ends

datasg segment para 'data'
    msg1 db 'enter the student name:','$'
    msg2 db 'you entered this name:','$'
    
    strlist label byte ;start of parameter list
    max db 20
    len db ? 
    buffer db 20 dup(" ")
    dolar  db '$'
datasg ends 
 
codesg segment para 'code'
    main proc far
        assume ds:datasg, cs:codesg
        
        mov ax, datasg
        mov ds, ax
        
        mov ah, 6h ;clear screen
        mov al, 25
        mov ch, 0
        mov cl, 0
        mov dh, 24 ;row
        mov dl, 79 ;column
        mov bh, 7  ;attribute
        int 10h
        
        mov ah, 2h ;cursor move
        mov dh, 10 ;row
        mov dl, 30 ;column
        mov bh, 0 ;page number
        int 10h
        
        lea dx, msg1
        mov ah, 9h
        int 21h
        
        mov ah, 0ah
        lea dx, strlist
        int 21h
        
        mov ah,2h ;cursor move
        mov dh, 12;row
        mov dl, 30;column
        mov bh, 0 ;page number
        int 10h
        
        mov dx, offset msg2
        mov ah,9h
        int 21h
        
        lea dx, buffer ;print
        mov ah, 9
        int 21h
              
        mov ax, 4c00h
        int 21h
     main endp
codesg ends
     end main