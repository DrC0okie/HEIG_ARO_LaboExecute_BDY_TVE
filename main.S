mov r5, #0 @ Initialisation de la pile a l'addresse 0
@ Stocke LR dans la mémoire
strh r6, [r5, #0]
@ Incrémente SP
add r5, #2
BL ADR_saut_1

@ programme terminé

.org 32
ADR_saut_1:
@ Stocke LR dans la mémoire
strh r6, [r5, #0]
@ Incrémente SP
add r5, #2
BL ADR_saut_2
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 64
ADR_saut_2:
@ Stocke LR dans la mémoire
strh r6, [r5, #0]
@ Incrémente SP
add r5, #2
BL ADR_saut_3
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 96
ADR_saut_3:
@ Stocke LR dans la mémoire
strh r6, [r5, #0]
@ Incrémente SP
add r5, #2
BL ADR_saut_4
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 128
ADR_saut_4:
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

@ mov r5, #0x0 @ Initialisation de la pile a l'addresse 0
@ @ Stocke LR dans la mémoire
@ strh r6, [r5, #0]
@ @ Incrémente SP
@ add r5, #2
@ BL ADR_saut_2
@ mov r1, #6

@ .org 0x30
@ ADR_saut_2:
@ mov r0, #2
@ sub r5, #2
@ ldrh r6, [r5, #0]
@ mov r7, r6
