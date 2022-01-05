.model small
.data
;-----------------------------------Main Menu-----------------------------------------
msg1  db 13,10,"                         ***** Welcome to our store *****",13,10,"$"
msg2  db 13,10,10,"Please enter your choice ","$"
msg3  db 13,10,"                                  1.Dairy section","$"
msg4  db 13,10,"                                  2.Bakery section","$"
msg5  db 13,10,"                                  3.Produce section","$"
msg6  db 13,10,"                                  4.Meat section","$"
msg7  db 13,10,"                                  5.Canned Food section","$"
;-----------------------------------Dairy Section-----------------------------------------
msg8  db 13,10,"                         ***** Dairy section *****",13,10,"$"
msg9  db 13,10,"                                  1.Milk    10","$"
msg10 db 13,10,"                                  2.Yogurt  5","$"
msg11 db 13,10,"                                  3.Butter  30","$"
msg12 db 13,10,"                                  4.Cheese  25","$"
msg13 db 13,10,"                                  5.Cream   20","$"
;-----------------------------------Bakery Section-----------------------------------------
msg14 db 13,10,"                         ***** Bakery section *****",13,10,"$"
msg15 db 13,10,"                                  1.Cake     40","$"
msg16 db 13,10,"                                  2.Cookies  20","$"
msg17 db 13,10,"                                  3.Bread    10","$"
msg18 db 13,10,"                                  4.Pies     15","$"
msg19 db 13,10,"                                  5.Pastries 20","$"
;-----------------------------------Produce Section-----------------------------------------
msg20 db 13,10,"                         ***** Produce section *****",13,10,"$"
msg21 db 13,10,"                                  1.Apple      5","$"
msg22 db 13,10,"                                  2.Orange     5","$"
msg23 db 13,10,"                                  3.Strawberry 5","$"
msg24 db 13,10,"                                  4.cucumber   7","$"
msg25 db 13,10,"                                  5.Tomatoes   7","$"
;-----------------------------------Meat Section-----------------------------------------
msg26 db 13,10,"                         ***** Meat section *****",13,10,"$"
msg27 db 13,10,"                                  1.Chicken 50","$"
msg28 db 13,10,"                                  2.Beef    50","$"
msg29 db 13,10,"                                  3.Fish    30","$"
msg30 db 13,10,"                                  4.shrimp  60","$"
msg31 db 13,10,"                                  5.crab    60","$"
;-----------------------------------Canned Food Section-----------------------------------------
msg32 db 13,10,"                         ***** Canned Food section *****",13,10,"$"
msg33 db 13,10,"                                  1.Beans     20","$"
msg34 db 13,10,"                                  2.Pasta     15","$"
msg35 db 13,10,"                                  3.Sauce     10","$"
msg36 db 13,10,"                                  4.Olive oil 35","$"
msg37 db 13,10,"                                  5.salt      10","$"
;------------------------------------Prices-----------------------------------------------
dairy   dw 10,5,30,25,20
bakery  dw 40,20,10,15,20
produce dw 5,5,5,7,7
meat    dw 50,50,30,60,60
canned  dw 20,15,10,35,10
;------------------------------------instructions----------------------------------------
error    db 13,10,"Invalid input, please try again","$"
final    db 13,10,"1.Return to main menu",13,10,"2.Exit ","$"
quantity db 13,10,"Enter the quantity ","$"
total    db 13,10,"                         ***** Total Bill : ","$"
s        db " *****",13,10,"$"
bill     dw 0
ten      dw 10 
.stack
.code
main proc far
.startup
intro:
call print_main
call input
call checkError
cmp al,1
je d
cmp al,2
je b
cmp al,3
je p
cmp al,4
je m
cmp al,5
je c

d:
call dairySec
jmp f
b:
call bakerySec
jmp f
p:
call produceSec
jmp f
m:
call meatSec
jmp f
c:
call cannedSec
jmp f

f:
lea dx,final
call print
call input
sub al,48
cmp al,1
je intro
lea dx,total
call print

mov ax,bill 
mov cx,0
x:
mov dx,00
div ten
push dx
inc cx
cmp ax,0
jne x

y:
pop dx
mov ah,02
add dl,30h
int 21h
loop y


lea dx,s
call print
.exit
main endp
;------------------------------------proc------------------------------------------------
;Read input
input proc near
mov ah,01h  ; AL
int 21h
ret
input endp

;check that the input is in the range 1:5
checkError proc near
sub al,48
l1:
cmp al,1
jl l2
cmp al,5
jg l2
jmp correct

l2:
lea dx,error
call print
call input
jmp l1
correct:
ret
checkError endp

;print msg
print proc near
mov ah,09h
int 21h
ret
print endp

;print main menu
print_main proc near
lea dx,msg1
call print
lea dx,msg3
call print
lea dx,msg4
call print
lea dx,msg5
call print
lea dx,msg6
call print
lea dx,msg7
call print
lea dx,msg2
call print
ret
print_main endp

;print Dairy Section
print_dairy proc near
lea dx,msg8
call print
lea dx,msg9
call print
lea dx,msg10
call print
lea dx,msg11
call print
lea dx,msg12
call print
lea dx,msg13
call print
ret
print_dairy endp 

;print Bakery Section
print_bakery proc near
lea dx,msg14
call print
lea dx,msg15
call print
lea dx,msg16
call print
lea dx,msg17
call print
lea dx,msg18
call print
lea dx,msg19
call print
ret
print_bakery endp 

;print produce Section
print_produce proc near
lea dx,msg20
call print
lea dx,msg21
call print
lea dx,msg22
call print
lea dx,msg23
call print
lea dx,msg24
call print
lea dx,msg25
call print
ret
print_produce endp

;print Meat Section
print_meat proc near
lea dx,msg26
call print
lea dx,msg27
call print
lea dx,msg28
call print
lea dx,msg29
call print
lea dx,msg30
call print
lea dx,msg31
call print
ret
print_meat endp

;print canned food Section
print_canned proc near
lea dx,msg32
call print
lea dx,msg33
call print
lea dx,msg34
call print
lea dx,msg35
call print
lea dx,msg36
call print
lea dx,msg37
call print
ret
print_canned endp
;meatSec
meatSec proc near
call print_meat
lea dx,msg2
call print
call input
call checkError
cmp al,1
je m1
cmp al,2
je m2
cmp al,3
je m3
cmp al,4
je m4
cmp al,5
je m5

m1:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[meat] 
m11:
add bill,bx
loop m11
jmp em

m2:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[meat+2] 
m22:
add bill,bx
loop m22
jmp em

m3:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[meat+4] 
m33:
add bill,bx
loop m33
jmp em

m4:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[meat+6] 
m44:
add bill,bx
loop m44
jmp em

m5:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[meat+8]  
m55:
add bill,bx
loop m55
jmp em

em: 
ret
meatSec endp

;produceSec
produceSec proc near
call print_produce
lea dx,msg2
call print
call input
call checkError
cmp al,1
je p1
cmp al,2
je p2
cmp al,3
je p3
cmp al,4
je p4
cmp al,5
je p5

p1:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[produce]
p11:
add bill,bx
loop p11
jmp ep

p2:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[produce+2]
p22:
add bill,bx
loop p22
jmp ep

p3:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[produce+4]
p33:
add bill,bx
loop p33
jmp ep

p4:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[produce+6]
p44:
add bill,bx
loop p44
jmp ep

p5:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[produce+8]
p55:
add bill,bx
loop p55
jmp ep

ep: 
ret
produceSec endp

;DairySec
dairySec proc near
call print_dairy
lea dx,msg2
call print
call input
call checkError
cmp al,1
je d1
cmp al,2
je d2
cmp al,3
je d3
cmp al,4
je d4
cmp al,5
je d5

d1:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[dairy] 
d11:
add bill,bx
loop d11
jmp ed

d2:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[dairy+2]
d22:
add bill,bx
loop d22
jmp ed

d3:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[dairy+4]
d33:
add bill,bx
loop d33
jmp ed

d4:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[dairy+6]
d44:
add bill,bx
loop d44
jmp ed

d5:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[dairy+8] 
d55:
add bill,bx
loop d55
jmp ed

ed:
ret
dairySec endp

;bakerySec
bakerySec proc near
call print_bakery
lea dx,msg2
call print
call input
call checkError
cmp al,1
je b1
cmp al,2
je b2
cmp al,3
je b3
cmp al,4
je b4
cmp al,5
je b5

b1:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[bakery]  
b11:
add bill,bx
loop b11
jmp eb

b2:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[bakery+2] 
b22:
add bill,bx
loop b22
jmp eb

b3:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[bakery+4] 
b33:
add bill,bx
loop b33
jmp eb

b4:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[bakery+6] 
b44:
add bill,bx
loop b44
jmp eb

b5:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[bakery+8]
b55:
add bill,bx
loop b55
jmp eb

eb: 
ret
bakerySec endp

;cannedSec
cannedSec proc near
call print_canned
lea dx,msg2
call print
call input
call checkError
cmp al,1
je c1
cmp al,2
je c2
cmp al,3
je c3
cmp al,4
je c4
cmp al,5
je c5

c1:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[canned]
c11:
add bill,bx
loop c11
jmp ec

c2:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[canned+2]
c22:
add bill,bx
loop c22
jmp ec

c3:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[canned+4]
c33:
add bill,bx
loop c33
jmp ec

c4:
lea dx,quantity
call print
call input
sub al,48
mov ah,0
mov cx,ax
mov bx,[canned+6]
c44:
add bill,bx
loop c44
jmp ec

c5:
lea dx,quantity
call print
call input 
sub al,48
mov ah,0
mov cx,ax
mov bx,[canned+8] 
c55:
add bill,bx
loop c55
jmp ec

ec: 
ret
cannedSec endp

end main
end main