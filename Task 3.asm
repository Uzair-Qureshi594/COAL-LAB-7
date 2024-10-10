;Task - 3                               

;Initialize an array of integers, find the largest numbers in the array using stack.

.model small
.stack 100h
.data
    array db 5, 10, 3, 25, 8, 12 ; Array of integers
    arraySize db 6                ; Size of the array
    largest db 0                  ; Variable to store the largest number
    msg db 'Largest Number: ?$'    ; Message to display the largest number

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Initialize index and largest
    mov si, 0                ; Index for the array
    mov cl, arraySize        
    mov al, [array]          
    mov largest, al          

    ; Push all elements onto the stack
push_loop:
    mov al, [array + si]     ; Load the current element
    push ax                  ; Push onto stack
    inc si                   ; Increment index
    loop push_loop           ; Loop until all elements are pushed

    ; Find the largest number
find_largest:
    pop ax                   ; Pop the top element from the stack
    cmp al, largest          ; Compare with current largest
    jg update_largest        ; If AL > largest, update largest
    jmp check_next           ; Otherwise, check the next

update_largest:
    mov largest, al          ; Update largest with AL

check_next:
    dec cl                   ; Decrement the count
    jnz find_largest         ; Continue until all elements are processed

    ; Print the largest number
    lea dx, msg              ; Load address of message
    mov ah, 09h              ; Print string function
    int 21h

    ; Convert largest number to ASCII and print
    mov al, largest          ; Load the largest number
    call printNum            ; Print the largest number

    ; Exit program
    mov ah, 4Ch              
    int 21h
main endp

printNum proc
    ; Convert number in AL to ASCII for printing
    add al, '0'              ; Convert to ASCII
    mov ah, 02h              ; Function to print character
    int 21h
    ret
printNum endp

end main
                                             
                                             
                                             
                                             ;https://github.com/Saad123ali/ASM-Task.git