    org 07ae8h
stage1_entry:
    ld   a, 008h
    out  (070h), a        ; bank 0 (the only alias-free bank) + RAM in the 4000-67FF window (bit 3)
    ld   hl, empty_name    ; -> 0x00, tells TAPE_BUFFER_NAME "no name, load next file"
    call 0365fh              ; TAPE_LOAD_COMMON -- real ROM routine
    ; should never return here (real ROM jumps to the loaded program on
    ; success, or loops retrying the search on error/timeout)
    halt

empty_name: defb 0
