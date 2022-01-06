.model small                                        ;// print all characters from A to Z
.code
main proc far
.startup
mov dl,"A"
mov bl," "
mov cx,26
mov ah,02
a:
int 21h
inc dl
push dx
mov dl,bl
int 21h
pop dx
loop a
.exit
main endp
end main
