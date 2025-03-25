	AREA RESET, CODE, READONLY
ENTRY
START

    MOV R0, #0          ; R0 = count of 0s
    MOV R1, #0          ; R1 = count of 1s
    LDR R2, =bits_id      ; Load the address of the input into R2
    LDR R2, [R2]        ; Load the last 5 digits of BITS ID in decimal into R2

LOOP
    CMP R2, #0          
    BEQ END             ; If number has fully processed then exit the loop

    ANDS R4, R2, #1     ; Extract LSB into R4
    ADDEQ R0, R0, #1    ; If LSB == 0, increment R0 (count of 0s)
    ADDNE R1, R1, #1    ; If LSB == 1, increment R1 (count of 1s)

    LSR R2, R2, #1      ; 1 bit Right shift R2 to process the next bit
    B LOOP              

END
    B END

bits_id DCD 01542         ; Last 5 digits of BITS ID
    END