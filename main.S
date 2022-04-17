@ Pour la gestion de la pile, nous utilisons le début des adresses mémoire
@ pour une question de simplicité. Il s'agit d'un pile ascendante.
@ Ce programme utilise strh et ldrh pour simuler le push et le pop

@ Initialisation de la pile a l'addresse 0
mov r5, #0
@ Stocke LR dans la pile
strh r6, [r5, #0]
@ Incrémente SP (post incrémentation)
add r5, #2
BL ADR_saut_1

@ programme terminé

.org 0x10
ADR_saut_1:
@ Stocke Link Register dans la pile (équivalent à push)
strh r6, [r5, #0]
@ Incrémente stack pointer (post-incrémentation)
add r5, #2
@ saut vers ADR_saut_2
BL ADR_saut_2
@ au retour décrémente le stack pointer (pré-décrémentation)
sub r5, #2
@ Charge la valeur su link register dans la pile
ldrh r6, [r5, #0]
@ charge l'adresse contenue dans le stack pointer dans le PC (équivalent à pop)
mov r7, r6

.org 0x20
ADR_saut_2:
strh r6, [r5, #0]
add r5, #2
BL ADR_saut_3
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 0x30
ADR_saut_3:
strh r6, [r5, #0]
add r5, #2
BL ADR_saut_4
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 0x40
ADR_saut_4:
strh r6, [r5, #0]
add r5, #2
BL ADR_saut_5
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 0x50
ADR_saut_5:
strh r6, [r5, #0]
add r5, #2
BL ADR_saut_6
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 0x60
ADR_saut_6:
strh r6, [r5, #0]
add r5, #2
BL ADR_saut_7
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 0x70
ADR_saut_7:
strh r6, [r5, #0]
add r5, #2
BL ADR_saut_8
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6

.org 0x80
ADR_saut_8:
sub r5, #2
ldrh r6, [r5, #0]
mov r7, r6


@@------------------------ Programme de test de l'alu---------------------
@mov r0, #2
@mov r1, #4
@
@@ test add with operand1 + operand2
@add r2, r1, r0 @ r2 = 6
@sub r2, r1, r0 @ r2 = 2
@
@@ test add with operand2 + operand1
@mov r0, #3
@add r2, r0, r1 @ r2 = 7
@mov r0, #4
@sub r2, r0, r1 @ r2 = 0
@
@@ test add/sub with imm value
@add r2, r1, #6 @ r2 = 10
@sub r2, r1, #2 @ r2 = 2
@
@@test add/sub with imm (short version)
@add r2, #6 @ r2 = 8
@sub r2, #3 @ r2 = 5
@
@@ test portes logiques
@mov r0, #5      @0101 
@mov r1, #10     @1010
@orr r0, r1      @1111 r0 = 15 
@eor r0, r1      @0101 r0 = 5
@and r0, r1      @0000 r0 = 0
@
@@test shifts
@mov r0, #1
@mov r1, #1
@mov r2, #2
@
@lsl r0, r1      @ r0 = 2
@lsl r0, r2      @ r0 = 8
@lsr r0, r1      @ r0 = 4
@asr r0, r1      @ r0 = 2
@ror r0, r2      @ r0 = 32768
@lsl r0, r1      @ r0 = 0