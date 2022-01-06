.model small                                                          ; // reverse string using stack
.data
string db "HELLO"
.code
main proc far
.startup
lea si,string
mov cx,5

a:
push [si]
inc si
loop a
mov cx,5
mov ah,02h

b:
pop dx
int 21h
loop b
.exit
main endp
end main
