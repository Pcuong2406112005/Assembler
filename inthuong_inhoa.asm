;nhap một chuỗi in thường,chuyển sang chuỗi in hoa
.model small
.stack 100h
.data
    welcome db 'Hello World','$'
    newline db 0ah,0dh,'$'
    x db 20,?,20 dup('$')
.code
    mov ax,@data
    mov ds,ax
main proc
    mov ah,09h
    lea dx,welcome
    int 21h
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    mov ah,0ah
    lea dx,x
    int 21h
    
    mov ah,09h
    lea dx,newline
    int 21h
    
    lea si,x+2
    mov cl,x+1
    mov ch,0
    
print_loop:
    sub [si],32
    mov dl,[si]
    mov ah,02h
    int 21h
    inc si
    loop print_loop    
    
    mov ah,4ch
    int 21h
main endp    
