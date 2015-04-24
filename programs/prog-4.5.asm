stksg segment stack
    db 32 dup("stack")
stksg ends

datasg segment para 'data'
       
       msg1 db 'please enter a character:', '$'
       msg2 db 'you typed this character:', '$'    
       help db ?
           
datasg ends

codesg segment para 'code'
    main proc far
        assume cs:codesg
        
        mov ax, datasg
        mov ds, ax
        
        mov ah, 2h ;cursor move
        mov dh, 10 ;row
        mov dl, 30 ;column
        mov bh, 0 ;page number
        int 10h
        
        mov  dx, offset msg1
        mov ah, 9
        int 21h
        
        mov ah, 1h
        int 21h
        mov help, al
        
        mov ah, 2h ;cursor move
        mov dh, 12 ;row
        mov dl, 30 ;column
        mov bh, 0 ;page number
        int 10h
        
        mov  dx, offset msg2
        mov ah, 9
        int 21h
        
        mov dl, help
        mov ah, 2h
        int 21h
              
        mov ax, 4c00h
        int 21h
     main endp
codesg ends
     end main