.model small                                                  ; // count vowels in a string
.data
string db "fineiwilldoit"
vowels db "aeiou"
.code
main proc far
.startup
lea si,string
lea di,vowels

mov cx,13
mov bl,5
mov dl,0

a:
mov al,[si]
cmp al,[di]
jne b
inc dl
jmp c

b:
inc di
dec bl
jnz a

c:
inc si
lea di,vowels
mov bl,5
loop a

add dl,30h
mov ah,02h
int 21h
.exit
main endp
end main
