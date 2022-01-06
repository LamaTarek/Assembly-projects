.model small                                                ;// Enter and display number with two digits
.stack 64
.data
str1 db "Enter any number with two digits","$"
str2 db "You have entered","$"
newLine db 13,10,"$"
num1 db ?
num2 db ?
.code
main proc far
.startup
lea dx,str1
call printStr

lea dx,newLine
call printStr

call readChar
mov num1,al

call readChar
mov num2,al

lea dx,newLine
call printStr

lea dx,str2
call printStr

lea dx,newLine
call printStr

mov dl,num1
call printChar

mov dl,num2
call printChar

.exit
main endp
printStr proc near
mov ah,09h
int 21h
ret
printStr endp

printChar proc near
mov ah,02h
int 21h
ret
printChar endp

readChar proc near
mov ah,01h
int 21h
ret
readChar endp
end main
