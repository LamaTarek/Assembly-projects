.model small                                          ;// find the max number in the array
.data
array db 1,7,8,2,3
.code
main proc far
.startup
lea si,array
mov cx,5
mov dl,[si]
a:
cmp dl,[si]
jg b
mov dl,[si]
b:
inc si
loop a
add dl,30h
mov ah,02h
int 21h
.exit
main endp
end main
