.model small                                     ;// print numbers from 1 to 100
.stack 64
.data
num dw ?
ten dw 10
line db 13,10,"$"
.code
main proc far
.startup
mov num,0
mov cx,0
do:
mov ax,num

a:
mov dx,00
div ten
push dx
inc cx
cmp ax,0
jne a

b:
pop dx
call print
loop b

inc num
call newLine
cmp num,100
jbe do

.exit
main endp

print proc near
mov ah,02h
add dl,30h
int 21h
ret
print endp

newLine proc near
lea dx,line
mov ah,09h
int 21h
ret
newLine endp

end main
