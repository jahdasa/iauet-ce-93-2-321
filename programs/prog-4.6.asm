stksg segment stack
    db 32 dup("stack")
stksg ends

codesg segment para 'code'
    main proc far
        assume cs:codesg
        
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
        
        mov ah, 9h ;request display
        mov al, 3h ;heart to be display
        mov bh, 0  ;page num.
        mov bl, 0f0h ;attribute
        mov cx, 20 ;number of print
        int 10h
              
        mov ax, 4c00h
        int 21h
     main endp
codesg ends
     end main