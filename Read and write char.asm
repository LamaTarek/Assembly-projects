codeS segment                      //Reading and writing character
    main proc far
    assume cs:codeS
    call read
    mov dl,al
    mov ah,02h
    int 21h  
    mov ah,4ch
    int 21h
    main endp
    read proc near
    mov ah,01h
    int 21h
    ret
    read endp
codeS ends
end main
