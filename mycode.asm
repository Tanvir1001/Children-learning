.model small
.stack 100h
.data
       
num1 db ?
num2 db ?
result db ?       

m0 db "             ***children math learning***$"
m1 db "for addition,type       :`1'$" 
m2 db "for subtraction,type    :`2'$"
m3 db "for multiplication,type :`3'$"

m5 db "enter 2 numbers for addition: $"
m6 db "enter 2 numbers for subtraction: $"
m7 db "enter 2 numbers for multiplication: $"
m8 db "enter 2 numbers for division: $" 
m9 db "choose an option : $" 
m10 db "the result is     : $"
m11 db "                  ***thank you***$" 
m12 db "please enter an valid option : $"
m16 db "for another calculation,type :`1'$"
m17 db "to exit,type :`2'$"
m18 db "invalid input. $"

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,m0
    mov ah,9
    int 21h 
    
    start:
    
    call nl
    call nl
    
    lea dx,m1
    mov ah,9
    int 21h
    
    call nl
    
    lea dx,m2
    mov ah,9
    int 21h
    
    call nl
    
    lea dx,m3
    mov ah,9
    int 21h
    
    
    call nl
    call nl
    
    lea dx,m9
    mov ah,9
    int 21h  
    
    calc:
    mov ah,1
    int 21h
    mov bl,al  
    
    call nl
    call nl
    
    
    cmp bl,'1'
    je addd
    
    cmp bl,'2'
    je subb
    
    cmp bl,'3'
    je mull
   
    
    lea dx,m12
    mov ah,9
    int 21h
    
    jmp calc
 
    
    addd:
    
    lea dx,m5
    mov ah,9
    int 21h 
    
    mov ah,1
    int 21h 
    mov num1,al
    ;mov bl,al
    
    mov ah,2
    mov dl,'+'
    int 21h
           
    mov ah,1       
    int 21h
    mov num2,al 
    ;mov cl,al
    
    add al,num1
    mov result,al
    mov ah,0
    
    ;add bl,cl
    
    aaa
    
    add ah,30h
    add al,30h
    mov bx,ax 
    
    ;mov bh,bl
    ;sub bl,48
    ;cmp bl,'9'
    ;jg i
    
    call nl
    call nl
    
    call dr 
    
 
    mov ah,2
    mov dl,bh
    int 21h 
    
    mov ah,2
    mov dl,bl
    int 21h
    
    
    call nl
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    
    mov bl,al
    cmp bl,'1'
    je start
    
    call nl
    call nl
    
    call tnx
    
    jmp exit
    
    subb:
    
    lea dx,m6
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,'-'
    int 21h
    
    mov ah,1
    int 21h 
    mov cl,al
    ;cmp bl,cl
    ;jl j 
    
    
    
    sub bl,cl
    ;cmp bl,'9'
    ;jg j 
    add bl,48
    
    call nl
    call nl
    call dr
    
    mov ah,2
    mov dl,bl
    int 21h
    
    
    call nl  
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    
    mov bl,al
    cmp bl,'1'
    je start
    
    call nl
    call nl
    
    call tnx
     
    jmp exit
    
    mull:
    lea dx,m7
    mov ah,9
    int 21h
    
    ;mov ax,0
    ;mov bx,0
    ;mov cx,0
    ;mov dx,0
    
    mov ah,1
    int 21h
    sub al,30h 
    mov num1,al
    ;mov cl,al
    ;mov ch,0
    
    mov ah,2
    mov dl,'*'
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov num2,al
    ;mov bl,al
    ;mov bh,0
    
    ;mov ax,cx 
    
    mul num1
    mov result,al
    aam
    add ah,30h
    add al,30h
    mov bx,ax
    ;mul bx
    ;mov cx,ax
    ;add cl,48
    ;cmp cl,'9'
    ;jg k 
    
    call nl
    call nl
    call dr
    
    ;mov ah,2
    ;mov dl,cl
    ;int 21h
    ;mov bl,cl
    mov ah,2
    mov dl,bh
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    
    call nl
    call nl
    
    lea dx,m16
    mov ah,9
    int 21h
    call nl
    lea dx,m17
    mov ah,9
    int 21h
    call nl
    lea dx,m9
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h 
    
    mov bl,al
    cmp bl,'1'
    je start
    
    call nl
    call nl
    
    call tnx
    
    jmp exit
    
   ;lebal start 
    
    nl:
    mov ah,2
    mov dl,13
    int 21h
    mov dl,10
    int 21h
    ret
    
    tnx:
    
    lea dx,m11
    mov ah,9
    int 21h
    ret 
    
    dr: 
    
    lea dx,m10
    mov ah,9
    int 21h
    
    ret 
    
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
