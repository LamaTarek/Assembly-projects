.model small                              // Even or odd
.data
msg db "Enter Number : ","$"
evn db 10,"Even","$"
od  db 10,"Odd","$"
.code
main proc far
.startup
lea dx,msg
mov ah,09h
int 21h

mov ah,01h
int 21h

mov bl,2
div bl

cmp ah,0
jne b

a:
lea dx,evn
mov ah,09h
int 21h
jmp stop

b:
lea dx,od
mov ah,09h
int 21h

stop:

.exit
main endp
end main
