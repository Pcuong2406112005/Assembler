.model small
.stack 100h
.data
    a dw 150
    b dw 100      
    buffer db 5 dup(?)   
    newline db 13,10,'$' 
.code
main proc
    mov ax, @data
    mov ds, ax
  
    mov ax,a
    add ax,b
    call print_number 
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ax,a
    sub ax,b
    call print_number
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ax,a
    mul b
    call print_number
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ax,a
    mov dx,0
    div b
    call print_number

    mov ah, 4ch
    int 21h
main endp

print_number proc
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov cx,0
    lea si,buffer
    
next_digit:
    mov dx,0
    mov bx,10
    div bx ;ax=ax/bx,dx=ax%bx
    
    add dl,'0'
    mov [si],dl
    inc si
    inc cx
    
    cmp ax,0
    jne next_digit
    
    dec si
    
print_loop:
    mov dl,[si]
    mov ah,02h
    int 21h
    
    dec si
    loop print_loop
    
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp
