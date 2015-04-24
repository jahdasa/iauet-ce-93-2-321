stksg segment stack
    db 32 dup("stack")
stksg ends

codesg segment para 'code'
    main proc far
        assume cs:codesg
        
        mov ah, 6h ;clear function
        mov al, 11 ;number of rows
        
        mov ch, 0 ;x_1
        mov cl, 0 ;y_1
        
        mov dh, 10 ; x_2
        mov dl, 30 ; y_2
        
        mov bh, 14h ; attribute
        int 10h
        
        mov ax, 4c00h
        int 21h
     main endp
codesg ends
     end main