.model small                               // Convert capital letters in the string into small (easy)
.data
string db "ASSEMBLY","$"
.code
main proc far
.startup
mov cx,8
lea si,string
a:
add [si],20h
inc si
loop a

mov dx,offset string
mov ah,09h
int 21h

.exit
main endp
end main
------------------------------------------------------------------------------------------------------------------------------------------------------
.model small                              ; // Convert capital letters in the string into small (hard)
.data
string db "ASSEMBLY","$"
.code
main proc far
.startup
mov cx,8
mov dl,00100000B
lea si,string
a:
or [si],dl                     ;xor if we want to convert from small into capital
inc si
loop a

mov dx,offset string
mov ah,09h
int 21h

.exit
main endp
end main
