;Task -1 

;Write Assembly program to initialize the string variable and implement stack to reverse 
;the string. Display both actual string and reversed string. 


.model small
.stack 100h
.data
    originalString db 'HELLO$', 0     
    reversedString db 6 dup('$')      
.code
main proc
    mov ax, @data        ; Initialize data segment
    mov ds, ax

    ; Print the original string
    mov ah, 09h         
    lea dx, originalString
    int 21h

    ; Reverse the string using the stack
    lea si, originalString 
    lea di, reversedString 
    mov cx, 5             

    ; Push each character of the original string onto the stack
reverse_loop:
    mov al, [si]          
    push ax               
    inc si                ; Move to the next character
    loop reverse_loop

    ; Pop characters from stack and store them in reversedString
    mov cx, 5             
pop_loop:
    pop ax                ; Pop character from stack
    mov [di], al          ; Store popped character in reversedString
    inc di                ; Move to next position in reversedString
    loop pop_loop

    ; Print a new line for better formatting
    mov ah, 02h
    mov dl, 0Ah
    int 21h

    ; Print the reversed string
    mov ah, 09h          
    lea dx, reversedString
    int 21h

    ; Exit program
    mov ah, 4Ch          
    int 21h
main endp
end main