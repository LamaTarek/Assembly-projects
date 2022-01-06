model small                    //print hello wold with simplified directive
.data
x db "HELLO WORLD!","$"
.stack 64
.code
main proc far
.startup
lea dx,x
mov ah,09h
int 21h
.exit
main endp
end main
