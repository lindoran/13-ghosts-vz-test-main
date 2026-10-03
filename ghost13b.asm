; z80dasm 1.1.6
; command line: z80dasm -a -l -u -t -g 0x5200 -s ghost13b.sym -o ghost13b_full.asm ghost13b.bin

	org	05200h

	ld bc,00020h		;5200	01 20 00 	.   . 
	ld bc,00400h		;5203	01 00 04 	. . . 
	ld b,008h		;5206	06 08 	. . 
	ld hl,03c00h		;5208	21 00 3c 	! . < 
	inc bc			;520b	03 	. 
	ld bc,00419h		;520c	01 19 04 	. . . 
	ld bc,00601h		;520f	01 01 06 	. . . 
	ld (bc),a			;5212	02 	. 
	nop			;5213	00 	. 
	nop			;5214	00 	. 
	ld a,b			;5215	78 	x 
	or b			;5216	b0 	. 
	ld (bc),a			;5217	02 	. 
	jr nz,l521ah		;5218	20 00 	  . 
l521ah:
	ld (bc),a			;521a	02 	. 
	ld (bc),a			;521b	02 	. 
	ld b,006h		;521c	06 06 	. . 
	ex af,af'			;521e	08 	. 
	ld hl,03600h		;521f	21 00 36 	! . 6 
	inc bc			;5222	03 	. 
	ld bc,00415h		;5223	01 15 04 	. . . 
	ld bc,00201h		;5226	01 01 02 	. . . 
	ld (bc),a			;5229	02 	. 
	nop			;522a	00 	. 
	nop			;522b	00 	. 
	dec bc			;522c	0b 	. 
	or a			;522d	b7 	. 
	inc bc			;522e	03 	. 
	jr nz,l5231h		;522f	20 00 	  . 
l5231h:
	ld bc,00700h		;5231	01 00 07 	. . . 
	add hl,bc			;5234	09 	. 
	dec b			;5235	05 	. 
	ld hl,03900h		;5236	21 00 39 	! . 9 
	inc bc			;5239	03 	. 
	ld bc,00419h		;523a	01 19 04 	. . . 
	ld bc,00301h		;523d	01 01 03 	. . . 
	dec b			;5240	05 	. 
	nop			;5241	00 	. 
	nop			;5242	00 	. 
	dec a			;5243	3d 	= 
	and h			;5244	a4 	. 
	inc b			;5245	04 	. 
	jr nz,l5248h		;5246	20 00 	  . 
l5248h:
	nop			;5248	00 	. 
	nop			;5249	00 	. 
	add hl,bc			;524a	09 	. 
	dec bc			;524b	0b 	. 
	inc b			;524c	04 	. 
	ld hl,03700h		;524d	21 00 37 	! . 7 
	inc bc			;5250	03 	. 
	ld bc,00419h		;5251	01 19 04 	. . . 
	ld bc,00601h		;5254	01 01 06 	. . . 
	ld b,000h		;5257	06 00 	. . 
	nop			;5259	00 	. 
	inc c			;525a	0c 	. 
	sbc a,a			;525b	9f 	. 
	dec b			;525c	05 	. 
	jr nz,l525fh		;525d	20 00 	  . 
l525fh:
	ld bc,00503h		;525f	01 03 05 	. . . 
	inc b			;5262	04 	. 
	ld a,(bc)			;5263	0a 	. 
	ld hl,03500h		;5264	21 00 35 	! . 5 
	inc b			;5267	04 	. 
	ld bc,00419h		;5268	01 19 04 	. . . 
	ld bc,00301h		;526b	01 01 03 	. . . 
	inc bc			;526e	03 	. 
	nop			;526f	00 	. 
	nop			;5270	00 	. 
	ld (hl),c			;5271	71 	q 
	or e			;5272	b3 	. 
	ld b,020h		;5273	06 20 	.   
	nop			;5275	00 	. 
	ld bc,00400h		;5276	01 00 04 	. . . 
	ld b,009h		;5279	06 09 	. . 
	ld hl,03c00h		;527b	21 00 3c 	! . < 
	inc bc			;527e	03 	. 
	ld bc,00415h		;527f	01 15 04 	. . . 
	ld bc,00601h		;5282	01 01 06 	. . . 
	inc b			;5285	04 	. 
	nop			;5286	00 	. 
	nop			;5287	00 	. 
	halt			;5288	76 	v 
	or h			;5289	b4 	. 
	rlca			;528a	07 	. 
	jr nz,l528dh		;528b	20 00 	  . 
l528dh:
	ld bc,00401h		;528d	01 01 04 	. . . 
	inc b			;5290	04 	. 
	add hl,bc			;5291	09 	. 
	ld hl,03a00h		;5292	21 00 3a 	! . : 
	inc bc			;5295	03 	. 
	ld bc,00415h		;5296	01 15 04 	. . . 
	ld bc,00401h		;5299	01 01 04 	. . . 
	inc b			;529c	04 	. 
	nop			;529d	00 	. 
	nop			;529e	00 	. 
	rst 30h			;529f	f7 	. 
	xor c			;52a0	a9 	. 
	ex af,af'			;52a1	08 	. 
	jr nz,l52a4h		;52a2	20 00 	  . 
l52a4h:
	ld bc,00903h		;52a4	01 03 09 	. . . 
	inc c			;52a7	0c 	. 
	ld (bc),a			;52a8	02 	. 
	ld hl,03100h		;52a9	21 00 31 	! . 1 
	ld (bc),a			;52ac	02 	. 
	ld bc,00415h		;52ad	01 15 04 	. . . 
	ld bc,00401h		;52b0	01 01 04 	. . . 
	dec b			;52b3	05 	. 
	nop			;52b4	00 	. 
	nop			;52b5	00 	. 
	sbc a,08eh		;52b6	de 8e 	. . 
	add hl,bc			;52b8	09 	. 
	jr nz,l52bbh		;52b9	20 00 	  . 
l52bbh:
	ld bc,00500h		;52bb	01 00 05 	. . . 
	rlca			;52be	07 	. 
	ex af,af'			;52bf	08 	. 
	ld hl,03b00h		;52c0	21 00 3b 	! . ; 
	inc bc			;52c3	03 	. 
	ld bc,00419h		;52c4	01 19 04 	. . . 
	ld bc,00601h		;52c7	01 01 06 	. . . 
	ld (bc),a			;52ca	02 	. 
	nop			;52cb	00 	. 
	nop			;52cc	00 	. 
	adc a,(hl)			;52cd	8e 	. 
	cp b			;52ce	b8 	. 
	ld a,(bc)			;52cf	0a 	. 
	jr nz,l52d2h		;52d0	20 00 	  . 
l52d2h:
	nop			;52d2	00 	. 
	nop			;52d3	00 	. 
	ex af,af'			;52d4	08 	. 
	add hl,bc			;52d5	09 	. 
	dec b			;52d6	05 	. 
	ld hl,03800h		;52d7	21 00 38 	! . 8 
	inc bc			;52da	03 	. 
	ld bc,00415h		;52db	01 15 04 	. . . 
	ld bc,00401h		;52de	01 01 04 	. . . 
	dec b			;52e1	05 	. 
	nop			;52e2	00 	. 
	nop			;52e3	00 	. 
	and a			;52e4	a7 	. 
	xor d			;52e5	aa 	. 
	dec bc			;52e6	0b 	. 
	jr nz,l52e9h		;52e7	20 00 	  . 
l52e9h:
	ld bc,00300h		;52e9	01 00 03 	. . . 
	inc bc			;52ec	03 	. 
	dec bc			;52ed	0b 	. 
	jr nz,l52f0h		;52ee	20 00 	  . 
l52f0h:
	inc a			;52f0	3c 	< 
	inc b			;52f1	04 	. 
	ld bc,00419h		;52f2	01 19 04 	. . . 
	ld bc,00101h		;52f5	01 01 01 	. . . 
	ld bc,00000h		;52f8	01 00 00 	. . . 
	ld hl,(00cb8h)		;52fb	2a b8 0c 	* . . 
	jr nz,l5300h		;52fe	20 00 	  . 
l5300h:
	ld bc,00806h		;5300	01 06 08 	. . . 
	dec c			;5303	0d 	. 
	ld (bc),a			;5304	02 	. 
	jr nz,l5307h		;5305	20 00 	  . 
l5307h:
	dec hl			;5307	2b 	+ 
	ld (bc),a			;5308	02 	. 
	ld bc,00415h		;5309	01 15 04 	. . . 
	ld bc,00401h		;530c	01 01 04 	. . . 
	ld bc,00000h		;530f	01 00 00 	. . . 
	ld (hl),l			;5312	75 	u 
	sbc a,e			;5313	9b 	. 
l5314h:
	inc d			;5314	14 	. 
	nop			;5315	00 	. 
	nop			;5316	00 	. 
	nop			;5317	00 	. 
	nop			;5318	00 	. 
	dec b			;5319	05 	. 
	inc bc			;531a	03 	. 
	nop			;531b	00 	. 
	ld hl,03b00h		;531c	21 00 3b 	! . ; 
	ld bc,00001h		;531f	01 01 00 	. . . 
	rlca			;5322	07 	. 
	ld bc,00301h		;5323	01 01 03 	. . . 
	inc bc			;5326	03 	. 
	nop			;5327	00 	. 
	nop			;5328	00 	. 
	xor b			;5329	a8 	. 
	cp h			;532a	bc 	. 
l532bh:
	dec d			;532b	15 	. 
	dec b			;532c	05 	. 
	nop			;532d	00 	. 
	ex af,af'			;532e	08 	. 
	inc b			;532f	04 	. 
	ld b,003h		;5330	06 03 	. . 
	nop			;5332	00 	. 
	djnz l5335h		;5333	10 00 	. . 
l5335h:
	ld (00103h),a		;5335	32 03 01 	2 . . 
	add a,d			;5338	82 	. 
	dec b			;5339	05 	. 
	ld bc,00101h		;533a	01 01 01 	. . . 
	ld bc,00000h		;533d	01 00 00 	. . . 
	ld l,c			;5340	69 	i 
	cp l			;5341	bd 	. 
	ld bc,01700h		;5342	01 00 17 	. . . 
	rra			;5345	1f 	. 
	ld bc,00203h		;5346	01 03 02 	. . . 
	ld bc,01d0fh		;5349	01 0f 1d 	. . . 
	nop			;534c	00 	. 
	ld a,(00101h)		;534d	3a 01 01 	: . . 
	djnz l5357h		;5350	10 05 	. . 
	dec bc			;5352	0b 	. 
	ld bc,00102h		;5353	01 02 01 	. . . 
	nop			;5356	00 	. 
l5357h:
	nop			;5357	00 	. 
	ld l,h			;5358	6c 	l 
	adc a,b			;5359	88 	. 
	ld a,(0021bh)		;535a	3a 1b 02 	: . . 
	cp 07eh		;535d	fe 7e 	. ~ 
	jr z,l5362h		;535f	28 01 	( . 
	nop			;5361	00 	. 
l5362h:
	call sub_5507h		;5362	cd 07 55 	. . U 
	ld hl,l634bh		;5365	21 4b 63 	! K c 
	ld de,06319h		;5368	11 19 63 	. . c 
	ld b,000h		;536b	06 00 	. . 
	call 04424h		;536d	cd 24 44 	. $ D 
	call z,04436h		;5370	cc 36 44 	. 6 D 
	call z,04428h		;5373	cc 28 44 	. ( D 
	jr z,l537dh		;5376	28 05 	( . 
	cp 018h		;5378	fe 18 	. . 
	jp nz,04409h		;537a	c2 09 44 	. . D 
l537dh:
	ld sp,0ffffh		;537d	31 ff ff 	1 . . 
	call sub_c744h		;5380	cd 44 c7 	. D . 
	call sub_6091h		;5383	cd 91 60 	. . ` 
	call sub_c71ah		;5386	cd 1a c7 	. . . 
	ld hl,l62e2h		;5389	21 e2 62 	! . b 
	call sub_6012h		;538c	cd 12 60 	. . ` 
l538fh:
	call sub_6040h		;538f	cd 40 60 	. @ ` 
	di			;5392	f3 	. 
	ld hl,l62d3h+2		;5393	21 d5 62 	! . b 
	call sub_6012h		;5396	cd 12 60 	. . ` 
	ld hl,lbeebh		;5399	21 eb be 	! . . 
	call sub_c793h		;539c	cd 93 c7 	. . . 
	ld hl,l61cfh		;539f	21 cf 61 	! . a 
	res 0,(hl)		;53a2	cb 86 	. . 
l53a4h:
	call sub_c71ah		;53a4	cd 1a c7 	. . . 
	ld hl,03120h		;53a7	21 20 31 	!   1 
	ld (l6205h+2),hl		;53aa	22 07 62 	" . b 
	ld a,r		;53ad	ed 5f 	. _ 
	and 003h		;53af	e6 03 	. . 
	inc a			;53b1	3c 	< 
	ld hl,l61c9h		;53b2	21 c9 61 	! . a 
	ld (hl),a			;53b5	77 	w 
	xor a			;53b6	af 	. 
	inc hl			;53b7	23 	# 
	ld (hl),a			;53b8	77 	w 
	inc hl			;53b9	23 	# 
	ld (hl),a			;53ba	77 	w 
	inc hl			;53bb	23 	# 
	ld (hl),a			;53bc	77 	w 
	ld a,007h		;53bd	3e 07 	> . 
	ld (l621eh),a		;53bf	32 1e 62 	2 . b 
	ld hl,06215h		;53c2	21 15 62 	! . b 
	ld de,061ddh		;53c5	11 dd 61 	. . a 
	ld bc,00008h		;53c8	01 08 00 	. . . 
	ldir		;53cb	ed b0 	. . 
	ld hl,l626fh		;53cd	21 6f 62 	! o b 
	ld de,l61ebh		;53d0	11 eb 61 	. . a 
	ld bc,00011h		;53d3	01 11 00 	. . . 
	ldir		;53d6	ed b0 	. . 
	call sub_6091h		;53d8	cd 91 60 	. . ` 
	ld hl,0d212h		;53db	21 12 d2 	! . . 
	ld de,0da12h		;53de	11 12 da 	. . . 
	ld bc,00400h		;53e1	01 00 04 	. . . 
	ldir		;53e4	ed b0 	. . 
	ld a,00ah		;53e6	3e 0a 	> . 
	ld (l61cdh),a		;53e8	32 cd 61 	2 . a 
	ld hl,l61cfh		;53eb	21 cf 61 	! . a 
	res 6,(hl)		;53ee	cb b6 	. . 
	res 5,(hl)		;53f0	cb ae 	. . 
	res 7,(hl)		;53f2	cb be 	. . 
	bit 0,(hl)		;53f4	cb 46 	. F 
	res 0,(hl)		;53f6	cb 86 	. . 
	jr nz,l5423h		;53f8	20 29 	  ) 
	call sub_603ah		;53fa	cd 3a 60 	. : ` 
	ld b,002h		;53fd	06 02 	. . 
	call sub_c9eeh		;53ff	cd ee c9 	. . . 
	jr z,l540bh		;5402	28 07 	( . 
	ld a,(03840h)		;5404	3a 40 38 	: @ 8 
	bit 1,a		;5407	cb 4f 	. O 
	jr z,l5423h		;5409	28 18 	( . 
l540bh:
	call sub_5ae1h		;540b	cd e1 5a 	. . Z 
	ld hl,0bfefh		;540e	21 ef bf 	! . . 
	call sub_c793h		;5411	cd 93 c7 	. . . 
	call sub_603ah		;5414	cd 3a 60 	. : ` 
	ld b,002h		;5417	06 02 	. . 
	call sub_c9eeh		;5419	cd ee c9 	. . . 
	jr nz,l5423h		;541c	20 05 	  . 
	ld hl,l61cfh		;541e	21 cf 61 	! . a 
	set 0,(hl)		;5421	cb c6 	. . 
l5423h:
	ld hl,l61cfh		;5423	21 cf 61 	! . a 
	res 5,(hl)		;5426	cb ae 	. . 
	res 3,(hl)		;5428	cb 9e 	. . 
	res 2,(hl)		;542a	cb 96 	. . 
	ld sp,0ffffh		;542c	31 ff ff 	1 . . 
	ld hl,l618ch		;542f	21 8c 61 	! . a 
	ld (0618ah),hl		;5432	22 8a 61 	" . a 
	xor a			;5435	af 	. 
	ld (l61ceh),a		;5436	32 ce 61 	2 . a 
	ld a,(l61cah)		;5439	3a ca 61 	: . a 
	and 007h		;543c	e6 07 	. . 
	cp 004h		;543e	fe 04 	. . 
	jr z,l544ah		;5440	28 08 	( . 
	cp 005h		;5442	fe 05 	. . 
	jr z,l544ah		;5444	28 04 	( . 
	xor a			;5446	af 	. 
	ld (l61cch),a		;5447	32 cc 61 	2 . a 
l544ah:
	ld hl,(0618ah)		;544a	2a 8a 61 	* . a 
	ld b,(hl)			;544d	46 	F 
	ld de,00017h		;544e	11 17 00 	. . . 
	ld hl,051e9h		;5451	21 e9 51 	! . Q 
l5454h:
	add hl,de			;5454	19 	. 
	djnz l5454h		;5455	10 fd 	. . 
	ld de,l60aah		;5457	11 aa 60 	. . ` 
	ld bc,0005ch		;545a	01 5c 00 	. \ . 
	ldir		;545d	ed b0 	. . 
	ld ix,l6107h		;545f	dd 21 07 61 	. ! . a 
	ld de,00017h		;5463	11 17 00 	. . . 
	ld b,003h		;5466	06 03 	. . 
l5468h:
	res 0,(ix+00eh)		;5468	dd cb 0e 86 	. . . . 
	add ix,de		;546c	dd 19 	. . 
	djnz l5468h		;546e	10 f8 	. . 
	ld ix,05343h		;5470	dd 21 43 53 	. ! C S 
	ld (ix+001h),015h		;5474	dd 36 01 15 	. 6 . . 
	ld (ix+002h),01eh		;5478	dd 36 02 1e 	. 6 . . 
l547ch:
	call sub_551bh		;547c	cd 1b 55 	. . U 
	ld ix,l60aah		;547f	dd 21 aa 60 	. ! . ` 
	call sub_5d62h		;5483	cd 62 5d 	. b ] 
	ld ix,l60aah		;5486	dd 21 aa 60 	. ! . ` 
	ld iy,l6107h		;548a	fd 21 07 61 	. ! . a 
	call sub_5c52h		;548e	cd 52 5c 	. R \ 
	call sub_56c2h		;5491	cd c2 56 	. . V 
	call sub_5598h		;5494	cd 98 55 	. . U 
	ld ix,l60aah		;5497	dd 21 aa 60 	. ! . ` 
	call sub_57ddh		;549b	cd dd 57 	. . W 
	ld de,00017h		;549e	11 17 00 	. . . 
	push de			;54a1	d5 	. 
	push de			;54a2	d5 	. 
	call sub_c814h		;54a3	cd 14 c8 	. . . 
	call sub_5f6eh		;54a6	cd 6e 5f 	. n _ 
	ld ix,05343h		;54a9	dd 21 43 53 	. ! C S 
	pop de			;54ad	d1 	. 
	call sub_c814h		;54ae	cd 14 c8 	. . . 
	call sub_5e27h		;54b1	cd 27 5e 	. ' ^ 
	ld ix,l6107h		;54b4	dd 21 07 61 	. ! . a 
	ld iy,05343h		;54b8	fd 21 43 53 	. ! C S 
	call sub_5db3h		;54bc	cd b3 5d 	. . ] 
	ld ix,l6107h		;54bf	dd 21 07 61 	. ! . a 
	pop de			;54c3	d1 	. 
	call sub_c814h		;54c4	cd 14 c8 	. . . 
	call sub_5c2dh		;54c7	cd 2d 5c 	. - \ 
	ld ix,l60aah		;54ca	dd 21 aa 60 	. ! . ` 
	push ix		;54ce	dd e5 	. . 
	call sub_5bf7h		;54d0	cd f7 5b 	. . [ 
	pop ix		;54d3	dd e1 	. . 
	call sub_5bd6h		;54d5	cd d6 5b 	. . [ 
	call sub_c9fdh		;54d8	cd fd c9 	. . . 
	jr z,l547ch		;54db	28 9f 	( . 
	ld hl,l61cfh		;54dd	21 cf 61 	! . a 
	bit 0,(hl)		;54e0	cb 46 	. F 
	jp nz,l53a4h		;54e2	c2 a4 53 	. . S 
	ld a,(03840h)		;54e5	3a 40 38 	: @ 8 
	cp 006h		;54e8	fe 06 	. . 
	jp z,l537dh		;54ea	ca 7d 53 	. } S 
	call sub_5507h		;54ed	cd 07 55 	. . U 
	cp 001h		;54f0	fe 01 	. . 
	jp nz,l547ch		;54f2	c2 7c 54 	. | T 
l54f5h:
	call sub_c9fdh		;54f5	cd fd c9 	. . . 
	jr nz,l54f5h		;54f8	20 fb 	  . 
l54fah:
	call sub_c9fdh		;54fa	cd fd c9 	. . . 
	jr z,l54fah		;54fd	28 fb 	( . 
l54ffh:
	call sub_c9fdh		;54ff	cd fd c9 	. . . 
	jr nz,l54ffh		;5502	20 fb 	  . 
	jp l547ch		;5504	c3 7c 54 	. | T 
sub_5507h:
	ld a,(03804h)		;5507	3a 04 38 	: . 8 
	cp 008h		;550a	fe 08 	. . 
	jr nz,l5512h		;550c	20 04 	  . 
	ld a,090h		;550e	3e 90 	> . 
	jr l5517h		;5510	18 05 	. . 
l5512h:
	cp 010h		;5512	fe 10 	. . 
	ret nz			;5514	c0 	. 
	ld a,0ffh		;5515	3e ff 	> . 
l5517h:
	ld (lc80bh),a		;5517	32 0b c8 	2 . . 
	ret			;551a	c9 	. 
sub_551bh:
	ld hl,(0618ah)		;551b	2a 8a 61 	* . a 
	ld de,l6194h		;551e	11 94 61 	. . a 
	or a			;5521	b7 	. 
	sbc hl,de		;5522	ed 52 	. R 
	jr c,l553eh		;5524	38 18 	8 . 
	ld hl,l61cfh		;5526	21 cf 61 	! . a 
	bit 4,(hl)		;5529	cb 66 	. f 
	set 4,(hl)		;552b	cb e6 	. . 
	jr z,l553eh		;552d	28 0f 	( . 
	res 4,(hl)		;552f	cb a6 	. . 
	ld hl,0ddd2h		;5531	21 d2 dd 	! . . 
	ld d,h			;5534	54 	T 
	ld e,l			;5535	5d 	] 
	inc de			;5536	13 	. 
	ld bc,0003fh		;5537	01 3f 00 	. ? . 
	ld (hl),020h		;553a	36 20 	6   
	jr l5571h		;553c	18 33 	. 3 
l553eh:
	ld hl,l61cfh		;553e	21 cf 61 	! . a 
	bit 0,(hl)		;5541	cb 46 	. F 
	jr z,l5550h		;5543	28 0b 	( . 
	ld hl,0625eh		;5545	21 5e 62 	! ^ b 
	ld de,l61ebh		;5548	11 eb 61 	. . a 
	ld bc,00011h		;554b	01 11 00 	. . . 
	ldir		;554e	ed b0 	. . 
l5550h:
	ld hl,(0618ah)		;5550	2a 8a 61 	* . a 
	ld a,(hl)			;5553	7e 	~ 
	cp 00bh		;5554	fe 0b 	. . 
	jr nc,l5568h		;5556	30 10 	0 . 
	ld l,020h		;5558	2e 20 	.   
	add a,033h		;555a	c6 33 	. 3 
	cp 03ah		;555c	fe 3a 	. : 
	jr c,l5564h		;555e	38 04 	8 . 
	sub 00ah		;5560	d6 0a 	. . 
	ld l,031h		;5562	2e 31 	. 1 
l5564h:
	ld h,a			;5564	67 	g 
	ld (06212h),hl		;5565	22 12 62 	" . b 
l5568h:
	ld hl,l61d5h		;5568	21 d5 61 	! . a 
	ld de,0ddd2h		;556b	11 d2 dd 	. . . 
	ld bc,00040h		;556e	01 40 00 	. @ . 
l5571h:
	ldir		;5571	ed b0 	. . 
	ld hl,0da12h		;5573	21 12 da 	! . . 
	push hl			;5576	e5 	. 
	ld de,03c00h		;5577	11 00 3c 	. . < 
	ld bc,00400h		;557a	01 00 04 	. . . 
	push bc			;557d	c5 	. 
	ldir		;557e	ed b0 	. . 
	ld hl,0d212h		;5580	21 12 d2 	! . . 
	pop bc			;5583	c1 	. 
	pop de			;5584	d1 	. 
	ldir		;5585	ed b0 	. . 
	ret			;5587	c9 	. 
sub_5588h:
	ld b,(ix-001h)		;5588	dd 46 ff 	. F . 
	ld de,00017h		;558b	11 17 00 	. . . 
l558eh:
	bit 0,(ix+00eh)		;558e	dd cb 0e 46 	. . . F 
	ret nz			;5592	c0 	. 
	add ix,de		;5593	dd 19 	. . 
	djnz l558eh		;5595	10 f7 	. . 
	ret			;5597	c9 	. 
sub_5598h:
	call sub_5bb6h		;5598	cd b6 5b 	. . [ 
	ret nz			;559b	c0 	. 
	ld hl,l61cfh		;559c	21 cf 61 	! . a 
	bit 7,(hl)		;559f	cb 7e 	. ~ 
	jr nz,l55bfh		;55a1	20 1c 	  . 
	ld hl,(0618ah)		;55a3	2a 8a 61 	* . a 
	ld de,l6194h		;55a6	11 94 61 	. . a 
	or a			;55a9	b7 	. 
	sbc hl,de		;55aa	ed 52 	. R 
	jr c,l55bfh		;55ac	38 11 	8 . 
	ld hl,l61cfh		;55ae	21 cf 61 	! . a 
	set 7,(hl)		;55b1	cb fe 	. . 
	ld hl,062c4h		;55b3	21 c4 62 	! . b 
	ld de,l61ebh		;55b6	11 eb 61 	. . a 
	ld bc,00011h		;55b9	01 11 00 	. . . 
	ldir		;55bc	ed b0 	. . 
	ret			;55be	c9 	. 
l55bfh:
	call sub_5588h		;55bf	cd 88 55 	. . U 
	ret nz			;55c2	c0 	. 
	ld hl,l61cah		;55c3	21 ca 61 	! . a 
	inc (hl)			;55c6	34 	4 
	ld a,(hl)			;55c7	7e 	~ 
	cp 020h		;55c8	fe 20 	.   
	jp z,l568bh		;55ca	ca 8b 56 	. . V 
	bit 0,a		;55cd	cb 47 	. G 
	ld hl,l61cfh		;55cf	21 cf 61 	! . a 
	res 6,(hl)		;55d2	cb b6 	. . 
	jr z,l55d8h		;55d4	28 02 	( . 
	set 6,(hl)		;55d6	cb f6 	. . 
l55d8h:
	and 007h		;55d8	e6 07 	. . 
	add a,a			;55da	87 	. 
	ld e,a			;55db	5f 	_ 
	add a,a			;55dc	87 	. 
	add a,e			;55dd	83 	. 
	ld e,a			;55de	5f 	_ 
	ld d,000h		;55df	16 00 	. . 
	ld hl,l622eh		;55e1	21 2e 62 	! . b 
	add hl,de			;55e4	19 	. 
	ld e,(hl)			;55e5	5e 	^ 
	inc hl			;55e6	23 	# 
	ld d,(hl)			;55e7	56 	V 
	inc hl			;55e8	23 	# 
	ld c,(hl)			;55e9	4e 	N 
	inc hl			;55ea	23 	# 
	ld b,(hl)			;55eb	46 	F 
	inc hl			;55ec	23 	# 
	ld a,(hl)			;55ed	7e 	~ 
	ld (l61cdh),a		;55ee	32 cd 61 	2 . a 
	ld (l61cch),a		;55f1	32 cc 61 	2 . a 
	push bc			;55f4	c5 	. 
	ex de,hl			;55f5	eb 	. 
	ld de,l55fbh		;55f6	11 fb 55 	. . U 
	push de			;55f9	d5 	. 
	jp (hl)			;55fa	e9 	. 
l55fbh:
	ld hl,l61cfh		;55fb	21 cf 61 	! . a 
	bit 7,(hl)		;55fe	cb 7e 	. ~ 
	pop hl			;5600	e1 	. 
	jr z,l5606h		;5601	28 03 	( . 
	ld hl,062c4h		;5603	21 c4 62 	! . b 
l5606h:
	ld de,l61ebh		;5606	11 eb 61 	. . a 
	ld bc,00011h		;5609	01 11 00 	. . . 
	ldir		;560c	ed b0 	. . 
	ld a,006h		;560e	3e 06 	> . 
	ld hl,l621eh		;5610	21 1e 62 	! . b 
	cp (hl)			;5613	be 	. 
	jr z,l5617h		;5614	28 01 	( . 
	dec (hl)			;5616	35 	5 
l5617h:
	ld hl,l6208h		;5617	21 08 62 	! . b 
	call sub_578ch		;561a	cd 8c 57 	. . W 
	call l553eh		;561d	cd 3e 55 	. > U 
	call l553eh		;5620	cd 3e 55 	. > U 
	ld hl,l61cfh		;5623	21 cf 61 	! . a 
	ld de,0c127h		;5626	11 27 c1 	. ' . 
	bit 6,(hl)		;5629	cb 76 	. v 
	jr nz,l5630h		;562b	20 03 	  . 
	ld de,0c30fh		;562d	11 0f c3 	. . . 
l5630h:
	bit 7,(hl)		;5630	cb 7e 	. ~ 
	push af			;5632	f5 	. 
	ex de,hl			;5633	eb 	. 
	jr z,l5639h		;5634	28 03 	( . 
	ld hl,0c251h		;5636	21 51 c2 	! Q . 
l5639h:
	call sub_c793h		;5639	cd 93 c7 	. . . 
	pop af			;563c	f1 	. 
	jp z,l5423h		;563d	ca 23 54 	. # T 
	ld hl,0c24bh		;5640	21 4b c2 	! K . 
	ld de,l6199h		;5643	11 99 61 	. . a 
	ld bc,00005h		;5646	01 05 00 	. . . 
	ldir		;5649	ed b0 	. . 
l564bh:
	ld hl,l61cfh		;564b	21 cf 61 	! . a 
	bit 6,(hl)		;564e	cb 76 	. v 
	ld a,008h		;5650	3e 08 	> . 
	push af			;5652	f5 	. 
	jr z,l5657h		;5653	28 02 	( . 
	neg		;5655	ed 44 	. D 
l5657h:
	ld l,a			;5657	6f 	o 
	call sub_c587h		;5658	cd 87 c5 	. . . 
	ld bc,006a4h		;565b	01 a4 06 	. . . 
	call z,00060h		;565e	cc 60 00 	. ` . 
	pop af			;5661	f1 	. 
	add a,a			;5662	87 	. 
	ld b,a			;5663	47 	G 
	ld de,(l621eh)		;5664	ed 5b 1e 62 	. [ . b 
	call sub_5780h		;5668	cd 80 57 	. . W 
	call l553eh		;566b	cd 3e 55 	. > U 
	ld hl,l6199h		;566e	21 99 61 	! . a 
	push hl			;5671	e5 	. 
	call sub_c793h		;5672	cd 93 c7 	. . . 
	pop hl			;5675	e1 	. 
	ld b,003h		;5676	06 03 	. . 
	inc hl			;5678	23 	# 
l5679h:
	inc hl			;5679	23 	# 
	dec (hl)			;567a	35 	5 
	dec (hl)			;567b	35 	5 
	djnz l5679h		;567c	10 fb 	. . 
	call sub_5bb6h		;567e	cd b6 5b 	. . [ 
	jr nz,l564bh		;5681	20 c8 	  . 
	ld hl,l61cfh		;5683	21 cf 61 	! . a 
	res 7,(hl)		;5686	cb be 	. . 
	jp l5423h		;5688	c3 23 54 	. # T 
l568bh:
	call sub_c71ah		;568b	cd 1a c7 	. . . 
	ld hl,l6312h		;568e	21 12 63 	! . c 
	call sub_6012h		;5691	cd 12 60 	. . ` 
	ld hl,0625eh		;5694	21 5e 62 	! ^ b 
	ld de,l61ebh		;5697	11 eb 61 	. . a 
	ld bc,00011h		;569a	01 11 00 	. . . 
	ldir		;569d	ed b0 	. . 
	ld a,02ah		;569f	3e 2a 	> * 
	ld (061ddh),a		;56a1	32 dd 61 	2 . a 
	ld hl,l61d5h		;56a4	21 d5 61 	! . a 
	ld de,03fc0h		;56a7	11 c0 3f 	. . ? 
	ld bc,00040h		;56aa	01 40 00 	. @ . 
	ldir		;56ad	ed b0 	. . 
	ld hl,0c415h		;56af	21 15 c4 	! . . 
	call sub_c793h		;56b2	cd 93 c7 	. . . 
l56b5h:
	call sub_c9fdh		;56b5	cd fd c9 	. . . 
	jr nz,l56b5h		;56b8	20 fb 	  . 
l56bah:
	call sub_c9fdh		;56ba	cd fd c9 	. . . 
	jr z,l56bah		;56bd	28 fb 	( . 
	jp l5a49h		;56bf	c3 49 5a 	. I Z 
sub_56c2h:
	push ix		;56c2	dd e5 	. . 
	ld b,(ix-001h)		;56c4	dd 46 ff 	. F . 
l56c7h:
	push bc			;56c7	c5 	. 
	bit 6,(ix+00eh)		;56c8	dd cb 0e 76 	. . . v 
	jr z,l56d5h		;56cc	28 07 	( . 
	bit 0,(ix+00eh)		;56ce	dd cb 0e 46 	. . . F 
	call z,sub_56e0h		;56d2	cc e0 56 	. . V 
l56d5h:
	pop bc			;56d5	c1 	. 
	ld de,00017h		;56d6	11 17 00 	. . . 
	add ix,de		;56d9	dd 19 	. . 
	djnz l56c7h		;56db	10 ea 	. . 
	pop ix		;56dd	dd e1 	. . 
	ret			;56df	c9 	. 
sub_56e0h:
	res 6,(ix+00eh)		;56e0	dd cb 0e b6 	. . . . 
	ld a,(ix+000h)		;56e4	dd 7e 00 	. ~ . 
	cp 015h		;56e7	fe 15 	. . 
	jp z,l579fh		;56e9	ca 9f 57 	. . W 
	cp 014h		;56ec	fe 14 	. . 
	jp nz,l5703h		;56ee	c2 03 57 	. . W 
	xor a			;56f1	af 	. 
	ld (ix+000h),a		;56f2	dd 77 00 	. w . 
	ld b,005h		;56f5	06 05 	. . 
l56f7h:
	ld de,(l621eh)		;56f7	ed 5b 1e 62 	. [ . b 
	ld a,e			;56fb	7b 	{ 
	or a			;56fc	b7 	. 
	jp z,sub_5780h		;56fd	ca 80 57 	. . W 
	dec de			;5700	1b 	. 
	jr sub_5780h		;5701	18 7d 	. } 
l5703h:
	ld hl,l61cfh		;5703	21 cf 61 	! . a 
	bit 7,(hl)		;5706	cb 7e 	. ~ 
	jp nz,l5779h		;5708	c2 79 57 	. y W 
	ld a,(ix+000h)		;570b	dd 7e 00 	. ~ . 
	add a,a			;570e	87 	. 
	bit 6,(hl)		;570f	cb 76 	. v 
	jr z,l5715h		;5711	28 02 	( . 
	neg		;5713	ed 44 	. D 
l5715h:
	push hl			;5715	e5 	. 
	ld l,a			;5716	6f 	o 
	call sub_c587h		;5717	cd 87 c5 	. . . 
	ld a,(l61cah)		;571a	3a ca 61 	: . a 
	and 007h		;571d	e6 07 	. . 
	cp 007h		;571f	fe 07 	. . 
	ld e,080h		;5721	1e 80 	. . 
	jr z,l5739h		;5723	28 14 	( . 
	cp 006h		;5725	fe 06 	. . 
	jr nz,l5745h		;5727	20 1c 	  . 
	ld hl,(l6220h)		;5729	2a 20 62 	*   b 
	ld a,(hl)			;572c	7e 	~ 
	inc hl			;572d	23 	# 
	or a			;572e	b7 	. 
	jr nz,l5735h		;572f	20 04 	  . 
	ld hl,l6220h+2		;5731	21 22 62 	! " b 
	ld a,(hl)			;5734	7e 	~ 
l5735h:
	ld (l6220h),hl		;5735	22 20 62 	"   b 
	ld e,a			;5738	5f 	_ 
l5739h:
	ld hl,0d212h		;5739	21 12 d2 	! . . 
	ld (hl),e			;573c	73 	s 
	ld de,0d213h		;573d	11 13 d2 	. . . 
	ld bc,003bfh		;5740	01 bf 03 	. . . 
	ldir		;5743	ed b0 	. . 
l5745h:
	pop hl			;5745	e1 	. 
	ld iy,l60aah		;5746	fd 21 aa 60 	. ! . ` 
	ld a,(iy+000h)		;574a	fd 7e 00 	. ~ . 
	cp 014h		;574d	fe 14 	. . 
	jp nz,l5779h		;574f	c2 79 57 	. y W 
	ld a,(ix+000h)		;5752	dd 7e 00 	. ~ . 
	add a,a			;5755	87 	. 
	bit 6,(hl)		;5756	cb 76 	. v 
	jr nz,l575ch		;5758	20 02 	  . 
	neg		;575a	ed 44 	. D 
l575ch:
	add a,(iy+002h)		;575c	fd 86 02 	. . . 
	ld (iy+002h),a		;575f	fd 77 02 	. w . 
	jr z,l5771h		;5762	28 0d 	( . 
	jp m,l5771h		;5764	fa 71 57 	. q W 
	cp (iy+00ah)		;5767	fd be 0a 	. . . 
	jr nc,l5771h		;576a	30 05 	0 . 
	call sub_5bb6h		;576c	cd b6 5b 	. . [ 
	jr nz,l5779h		;576f	20 08 	  . 
l5771h:
	res 0,(iy+00eh)		;5771	fd cb 0e 86 	. . . . 
	xor a			;5775	af 	. 
	ld (iy+000h),a		;5776	fd 77 00 	. w . 
l5779h:
	ld b,(ix+000h)		;5779	dd 46 00 	. F . 
	ld de,(l621eh)		;577c	ed 5b 1e 62 	. [ . b 
sub_5780h:
	ld hl,061ddh		;5780	21 dd 61 	! . a 
	add hl,de			;5783	19 	. 
l5784h:
	push hl			;5784	e5 	. 
	call sub_578ch		;5785	cd 8c 57 	. . W 
	pop hl			;5788	e1 	. 
	djnz l5784h		;5789	10 f9 	. . 
	ret			;578b	c9 	. 
sub_578ch:
	ld a,(hl)			;578c	7e 	~ 
	cp 020h		;578d	fe 20 	.   
	jr nz,l5793h		;578f	20 02 	  . 
	ld a,030h		;5791	3e 30 	> 0 
l5793h:
	inc a			;5793	3c 	< 
	cp 03ah		;5794	fe 3a 	. : 
	jr nz,l579ah		;5796	20 02 	  . 
	ld a,030h		;5798	3e 30 	> 0 
l579ah:
	ld (hl),a			;579a	77 	w 
	dec hl			;579b	2b 	+ 
	jr z,sub_578ch		;579c	28 ee 	( . 
	ret			;579e	c9 	. 
l579fh:
	ld iy,l60aah		;579f	fd 21 aa 60 	. ! . ` 
	ld b,003h		;57a3	06 03 	. . 
	ld de,00017h		;57a5	11 17 00 	. . . 
l57a8h:
	bit 0,(iy+00eh)		;57a8	fd cb 0e 46 	. . . F 
	jr z,l57b7h		;57ac	28 09 	( . 
	cp (iy+000h)		;57ae	fd be 00 	. . . 
	jr z,l57b7h		;57b1	28 04 	( . 
	set 6,(iy+00dh)		;57b3	fd cb 0d f6 	. . . . 
l57b7h:
	add iy,de		;57b7	fd 19 	. . 
	djnz l57a8h		;57b9	10 ed 	. . 
	ld de,(0618ah)		;57bb	ed 5b 8a 61 	. [ . a 
	ld hl,l618ch		;57bf	21 8c 61 	! . a 
	sbc hl,de		;57c2	ed 52 	. R 
	ret z			;57c4	c8 	. 
	dec de			;57c5	1b 	. 
	ld (0618ah),de		;57c6	ed 53 8a 61 	. S . a 
	ld b,001h		;57ca	06 01 	. . 
	jp l56f7h		;57cc	c3 f7 56 	. . V 
sub_57cfh:
	ld de,(0618ah)		;57cf	ed 5b 8a 61 	. [ . a 
	inc de			;57d3	13 	. 
	ld (0618ah),de		;57d4	ed 53 8a 61 	. S . a 
	xor a			;57d8	af 	. 
	ld (l61cbh),a		;57d9	32 cb 61 	2 . a 
	ret			;57dc	c9 	. 
sub_57ddh:
	ld hl,l61cfh		;57dd	21 cf 61 	! . a 
	bit 7,(hl)		;57e0	cb 7e 	. ~ 
	ret nz			;57e2	c0 	. 
	bit 2,(hl)		;57e3	cb 56 	. V 
	jr z,l57f8h		;57e5	28 11 	( . 
	res 2,(hl)		;57e7	cb 96 	. . 
	xor a			;57e9	af 	. 
	ld (l61cbh),a		;57ea	32 cb 61 	2 . a 
	bit 5,(hl)		;57ed	cb 6e 	. n 
	jp nz,l5962h		;57ef	c2 62 59 	. b Y 
	call sub_5bb6h		;57f2	cd b6 5b 	. . [ 
	call nz,sub_57cfh		;57f5	c4 cf 57 	. . W 
l57f8h:
	ld hl,l61cch		;57f8	21 cc 61 	! . a 
	ld a,(l61cdh)		;57fb	3a cd 61 	: . a 
	cp (hl)			;57fe	be 	. 
	call z,sub_5904h		;57ff	cc 04 59 	. . Y 
	push ix		;5802	dd e5 	. . 
	ld b,(ix-001h)		;5804	dd 46 ff 	. F . 
l5807h:
	push bc			;5807	c5 	. 
	bit 0,(ix+00eh)		;5808	dd cb 0e 46 	. . . F 
	call z,sub_581ah		;580c	cc 1a 58 	. . X 
	pop bc			;580f	c1 	. 
	ld de,00017h		;5810	11 17 00 	. . . 
	add ix,de		;5813	dd 19 	. . 
	djnz l5807h		;5815	10 f0 	. . 
	pop ix		;5817	dd e1 	. . 
	ret			;5819	c9 	. 
sub_581ah:
	call sub_58f3h		;581a	cd f3 58 	. . X 
	ld hl,(0618ah)		;581d	2a 8a 61 	* . a 
	ld b,004h		;5820	06 04 	. . 
l5822h:
	cp (hl)			;5822	be 	. 
	jr z,l5840h		;5823	28 1b 	( . 
	inc hl			;5825	23 	# 
	djnz l5822h		;5826	10 fa 	. . 
	ld de,00017h		;5828	11 17 00 	. . . 
	ld hl,(0618ah)		;582b	2a 8a 61 	* . a 
	dec hl			;582e	2b 	+ 
l582fh:
	inc hl			;582f	23 	# 
	ld a,(hl)			;5830	7e 	~ 
	ld iy,l60aah		;5831	fd 21 aa 60 	. ! . ` 
	ld b,004h		;5835	06 04 	. . 
l5837h:
	cp (iy+000h)		;5837	fd be 00 	. . . 
	jr z,l582fh		;583a	28 f3 	( . 
	add iy,de		;583c	fd 19 	. . 
	djnz l5837h		;583e	10 f7 	. . 
l5840h:
	ld a,(hl)			;5840	7e 	~ 
	or a			;5841	b7 	. 
	jp z,l59d3h		;5842	ca d3 59 	. . Y 
	ld b,a			;5845	47 	G 
	call sub_5bb6h		;5846	cd b6 5b 	. . [ 
	ret z			;5849	c8 	. 
	ld hl,051e9h		;584a	21 e9 51 	! . Q 
	ld de,00017h		;584d	11 17 00 	. . . 
l5850h:
	add hl,de			;5850	19 	. 
	djnz l5850h		;5851	10 fd 	. . 
	ld b,d			;5853	42 	B 
	ld c,e			;5854	4b 	K 
	push ix		;5855	dd e5 	. . 
	pop de			;5857	d1 	. 
	ldir		;5858	ed b0 	. . 
	ld hl,l61cah		;585a	21 ca 61 	! . a 
	ld a,(hl)			;585d	7e 	~ 
	add a,000h		;585e	c6 00 	. . 
	cp (ix+00bh)		;5860	dd be 0b 	. . . 
	ld a,001h		;5863	3e 01 	> . 
	jr nc,l586bh		;5865	30 04 	0 . 
	ld a,(ix+00bh)		;5867	dd 7e 0b 	. ~ . 
	sub (hl)			;586a	96 	. 
l586bh:
	ld (ix+00bh),a		;586b	dd 77 0b 	. w . 
	ld hl,(0618ah)		;586e	2a 8a 61 	* . a 
	ld a,(hl)			;5871	7e 	~ 
	cp (ix+000h)		;5872	dd be 00 	. . . 
	jr nz,l588eh		;5875	20 17 	  . 
	ld hl,l61cbh		;5877	21 cb 61 	! . a 
	ld a,(hl)			;587a	7e 	~ 
	srl a		;587b	cb 3f 	. ? 
	ld b,a			;587d	47 	G 
	add a,000h		;587e	c6 00 	. . 
	cp (ix+00bh)		;5880	dd be 0b 	. . . 
	ld a,001h		;5883	3e 01 	> . 
	jr nc,l588bh		;5885	30 04 	0 . 
	ld a,(ix+00bh)		;5887	dd 7e 0b 	. ~ . 
	sub b			;588a	90 	. 
l588bh:
	ld (ix+00bh),a		;588b	dd 77 0b 	. w . 
l588eh:
	call sub_59bbh		;588e	cd bb 59 	. . Y 
	ld h,a			;5891	67 	g 
	ld a,r		;5892	ed 5f 	. _ 
	ld l,a			;5894	6f 	o 
	ld a,(ix+008h)		;5895	dd 7e 08 	. ~ . 
	dec a			;5898	3d 	= 
	ld (ix+001h),a		;5899	dd 77 01 	. w . 
	ld a,(hl)			;589c	7e 	~ 
	and 00ch		;589d	e6 0c 	. . 
	cp 00ch		;589f	fe 0c 	. . 
	jr z,l588eh		;58a1	28 eb 	( . 
	ld b,a			;58a3	47 	G 
	or a			;58a4	b7 	. 
	jr nz,l58aeh		;58a5	20 07 	  . 
	ld a,(l61cah)		;58a7	3a ca 61 	: . a 
	cp 008h		;58aa	fe 08 	. . 
	jr nc,l588eh		;58ac	30 e0 	0 . 
l58aeh:
	ld a,(ix+00dh)		;58ae	dd 7e 0d 	. ~ . 
	and 0f0h		;58b1	e6 f0 	. . 
	or b			;58b3	b0 	. 
	or 001h		;58b4	f6 01 	. . 
	ld (ix+00dh),a		;58b6	dd 77 0d 	. w . 
	set 0,(ix+00eh)		;58b9	dd cb 0e c6 	. . . . 
	ld a,(l61cah)		;58bd	3a ca 61 	: . a 
	cp 010h		;58c0	fe 10 	. . 
	jr c,l58d2h		;58c2	38 0e 	8 . 
	cp 018h		;58c4	fe 18 	. . 
	jr nc,l58d2h		;58c6	30 0a 	0 . 
	ld a,(ix+00dh)		;58c8	dd 7e 0d 	. ~ . 
	and 0f0h		;58cb	e6 f0 	. . 
	or 001h		;58cd	f6 01 	. . 
	ld (ix+00dh),a		;58cf	dd 77 0d 	. w . 
l58d2h:
	ld a,(l61cah)		;58d2	3a ca 61 	: . a 
	cp 018h		;58d5	fe 18 	. . 
	jr c,l58e8h		;58d7	38 0f 	8 . 
	set 3,(ix+00eh)		;58d9	dd cb 0e de 	. . . . 
	sub 015h		;58dd	d6 15 	. . 
	rlca			;58df	07 	. 
	rlca			;58e0	07 	. 
	rlca			;58e1	07 	. 
	rlca			;58e2	07 	. 
	or 00fh		;58e3	f6 0f 	. . 
	ld (ix+00fh),a		;58e5	dd 77 0f 	. w . 
l58e8h:
	ld a,001h		;58e8	3e 01 	> . 
	cp (ix+00bh)		;58ea	dd be 0b 	. . . 
	ret nz			;58ed	c0 	. 
	set 6,(ix+00dh)		;58ee	dd cb 0d f6 	. . . . 
	ret			;58f2	c9 	. 
sub_58f3h:
	ld a,(ix+000h)		;58f3	dd 7e 00 	. ~ . 
	cp 014h		;58f6	fe 14 	. . 
	ret nz			;58f8	c0 	. 
	call sub_5bb6h		;58f9	cd b6 5b 	. . [ 
	call nz,sub_57cfh		;58fc	c4 cf 57 	. . W 
	xor a			;58ff	af 	. 
	ld (l61cch),a		;5900	32 cc 61 	2 . a 
	ret			;5903	c9 	. 
sub_5904h:
	bit 0,(ix+00eh)		;5904	dd cb 0e 46 	. . . F 
	ret nz			;5908	c0 	. 
	call sub_58f3h		;5909	cd f3 58 	. . X 
	ld de,(lc80ch)		;590c	ed 5b 0c c8 	. [ . . 
	ld iy,0619fh		;5910	fd 21 9f 61 	. ! . a 
	ld b,00eh		;5914	06 0e 	. . 
l5916h:
	ld l,(iy+000h)		;5916	fd 6e 00 	. n . 
	inc iy		;5919	fd 23 	. # 
	ld h,(iy+000h)		;591b	fd 66 00 	. f . 
	inc iy		;591e	fd 23 	. # 
	ld a,(iy+000h)		;5920	fd 7e 00 	. ~ . 
	inc iy		;5923	fd 23 	. # 
	push hl			;5925	e5 	. 
	or a			;5926	b7 	. 
	sbc hl,de		;5927	ed 52 	. R 
	pop hl			;5929	e1 	. 
	jr z,l592eh		;592a	28 02 	( . 
	jr nc,l5931h		;592c	30 03 	0 . 
l592eh:
	djnz l5916h		;592e	10 e6 	. . 
	ret			;5930	c9 	. 
l5931h:
	ex de,hl			;5931	eb 	. 
	push hl			;5932	e5 	. 
	ld iy,l5314h		;5933	fd 21 14 53 	. ! . S 
	ld c,(iy+00ah)		;5937	fd 4e 0a 	. N . 
	ld b,000h		;593a	06 00 	. . 
	add hl,bc			;593c	09 	. 
	or a			;593d	b7 	. 
	sbc hl,de		;593e	ed 52 	. R 
	pop hl			;5940	e1 	. 
	ex de,hl			;5941	eb 	. 
	ret c			;5942	d8 	. 
	exx			;5943	d9 	. 
	ld hl,l5314h		;5944	21 14 53 	! . S 
	push ix		;5947	dd e5 	. . 
	pop de			;5949	d1 	. 
	ld bc,00017h		;594a	01 17 00 	. . . 
	ldir		;594d	ed b0 	. . 
	exx			;594f	d9 	. 
	ld (ix+001h),a		;5950	dd 77 01 	. w . 
	sbc hl,de		;5953	ed 52 	. R 
	ld (ix+002h),l		;5955	dd 75 02 	. u . 
	pop hl			;5958	e1 	. 
	xor a			;5959	af 	. 
	ld (l61cch),a		;595a	32 cc 61 	2 . a 
	inc a			;595d	3c 	< 
	ld (l61c9h),a		;595e	32 c9 61 	2 . a 
	ret			;5961	c9 	. 
l5962h:
	res 5,(hl)		;5962	cb ae 	. . 
	res 3,(hl)		;5964	cb 9e 	. . 
	call sub_5bb6h		;5966	cd b6 5b 	. . [ 
	ret z			;5969	c8 	. 
	ld a,004h		;596a	3e 04 	> . 
	ld (l61c9h),a		;596c	32 c9 61 	2 . a 
	dec a			;596f	3d 	= 
	ld b,a			;5970	47 	G 
	push ix		;5971	dd e5 	. . 
l5973h:
	push bc			;5973	c5 	. 
	bit 0,(ix+00eh)		;5974	dd cb 0e 46 	. . . F 
	call z,sub_59a6h		;5978	cc a6 59 	. . Y 
	ld de,00017h		;597b	11 17 00 	. . . 
	add ix,de		;597e	dd 19 	. . 
	pop bc			;5980	c1 	. 
	djnz l5973h		;5981	10 f0 	. . 
	ld hl,l532bh		;5983	21 2b 53 	! + S 
	ld b,d			;5986	42 	B 
	ld c,e			;5987	4b 	K 
	push ix		;5988	dd e5 	. . 
	pop de			;598a	d1 	. 
	ldir		;598b	ed b0 	. . 
	call sub_59bbh		;598d	cd bb 59 	. . Y 
	ld a,(l61cah)		;5990	3a ca 61 	: . a 
	cp 005h		;5993	fe 05 	. . 
	jr c,l59a3h		;5995	38 0c 	8 . 
	ld (ix+00bh),002h		;5997	dd 36 0b 02 	. 6 . . 
	cp 008h		;599b	fe 08 	. . 
	jr c,l59a3h		;599d	38 04 	8 . 
	ld (ix+00bh),001h		;599f	dd 36 0b 01 	. 6 . . 
l59a3h:
	pop ix		;59a3	dd e1 	. . 
	ret			;59a5	c9 	. 
sub_59a6h:
	push ix		;59a6	dd e5 	. . 
	pop hl			;59a8	e1 	. 
	push hl			;59a9	e5 	. 
	ld bc,00017h		;59aa	01 17 00 	. . . 
	add ix,bc		;59ad	dd 09 	. . 
	ld d,h			;59af	54 	T 
	ld e,l			;59b0	5d 	] 
	add hl,bc			;59b1	09 	. 
	ldir		;59b2	ed b0 	. . 
	res 0,(ix+00eh)		;59b4	dd cb 0e 86 	. . . . 
	pop ix		;59b8	dd e1 	. . 
	ret			;59ba	c9 	. 
sub_59bbh:
	ld a,r		;59bb	ed 5f 	. _ 
	ld l,a			;59bd	6f 	o 
	ld h,(ix+000h)		;59be	dd 66 00 	. f . 
	ld a,r		;59c1	ed 5f 	. _ 
	add a,(hl)			;59c3	86 	. 
	and 03fh		;59c4	e6 3f 	. ? 
	cp 002h		;59c6	fe 02 	. . 
	jr c,sub_59bbh		;59c8	38 f1 	8 . 
	cp (ix+00ah)		;59ca	dd be 0a 	. . . 
	jr nc,sub_59bbh		;59cd	30 ec 	0 . 
	ld (ix+002h),a		;59cf	dd 77 02 	. w . 
	ret			;59d2	c9 	. 
l59d3h:
	call sub_c71ah		;59d3	cd 1a c7 	. . . 
	ld hl,l62e2h		;59d6	21 e2 62 	! . b 
	call sub_6012h		;59d9	cd 12 60 	. . ` 
	ld a,033h		;59dc	3e 33 	> 3 
	ld (l6213h),a		;59de	32 13 62 	2 . b 
	ld iy,0c0f7h		;59e1	fd 21 f7 c0 	. ! . . 
	ld b,008h		;59e5	06 08 	. . 
l59e7h:
	push bc			;59e7	c5 	. 
	push iy		;59e8	fd e5 	. . 
	push iy		;59ea	fd e5 	. . 
	ld hl,l6307h		;59ec	21 07 63 	! . c 
	call sub_6012h		;59ef	cd 12 60 	. . ` 
	pop hl			;59f2	e1 	. 
	call sub_c793h		;59f3	cd 93 c7 	. . . 
	ld hl,l6304h		;59f6	21 04 63 	! . c 
	call sub_6012h		;59f9	cd 12 60 	. . ` 
	pop iy		;59fc	fd e1 	. . 
	pop bc			;59fe	c1 	. 
	ld de,00006h		;59ff	11 06 00 	. . . 
	add iy,de		;5a02	fd 19 	. . 
	djnz l59e7h		;5a04	10 e1 	. . 
	ld hl,0bfc9h		;5a06	21 c9 bf 	! . . 
	call sub_c793h		;5a09	cd 93 c7 	. . . 
	ld hl,l630ch		;5a0c	21 0c 63 	! . c 
	call sub_c679h		;5a0f	cd 79 c6 	. y . 
	ld b,005h		;5a12	06 05 	. . 
l5a14h:
	push bc			;5a14	c5 	. 
	ld hl,l630ah		;5a15	21 0a 63 	! . c 
	call sub_c681h		;5a18	cd 81 c6 	. . . 
	ld hl,0d112h		;5a1b	21 12 d1 	! . . 
	ld de,0cd12h		;5a1e	11 12 cd 	. . . 
	ld bc,00080h		;5a21	01 80 00 	. . . 
	ldir		;5a24	ed b0 	. . 
l5a26h:
	call sub_5b6dh		;5a26	cd 6d 5b 	. m [ 
	ld bc,l8000h		;5a29	01 00 80 	. . . 
	call 00060h		;5a2c	cd 60 00 	. ` . 
	ld hl,l630ch		;5a2f	21 0c 63 	! . c 
	call sub_c679h		;5a32	cd 79 c6 	. y . 
	call sub_5b6dh		;5a35	cd 6d 5b 	. m [ 
	ld bc,l8000h		;5a38	01 00 80 	. . . 
	call 00060h		;5a3b	cd 60 00 	. ` . 
	pop bc			;5a3e	c1 	. 
	djnz l5a14h		;5a3f	10 d3 	. . 
	ld hl,l61cfh		;5a41	21 cf 61 	! . a 
l5a44h:
	bit 0,(hl)		;5a44	cb 46 	. F 
	jp nz,l538fh		;5a46	c2 8f 53 	. . S 
l5a49h:
	ld de,0635ah		;5a49	11 5a 63 	. Z c 
	ld b,00ah		;5a4c	06 0a 	. . 
l5a4eh:
	push bc			;5a4e	c5 	. 
	push de			;5a4f	d5 	. 
	ld hl,061ddh		;5a50	21 dd 61 	! . a 
	call sub_5babh		;5a53	cd ab 5b 	. . [ 
	pop de			;5a56	d1 	. 
	pop bc			;5a57	c1 	. 
	jr c,l5a64h		;5a58	38 0a 	8 . 
	ld hl,00018h		;5a5a	21 18 00 	! . . 
	add hl,de			;5a5d	19 	. 
	ex de,hl			;5a5e	eb 	. 
	djnz l5a4eh		;5a5f	10 ed 	. . 
	jp l538fh		;5a61	c3 8f 53 	. . S 
l5a64h:
	ld hl,0fff1h		;5a64	21 f1 ff 	! . . 
	add hl,de			;5a67	19 	. 
	push hl			;5a68	e5 	. 
	ld hl,l630eh		;5a69	21 0e 63 	! . c 
	call sub_c679h		;5a6c	cd 79 c6 	. y . 
	ld hl,0cc92h		;5a6f	21 92 cc 	! . . 
	ld d,h			;5a72	54 	T 
	ld e,l			;5a73	5d 	] 
	inc de			;5a74	13 	. 
	ld bc,00080h		;5a75	01 80 00 	. . . 
	ld (hl),c			;5a78	71 	q 
	ldir		;5a79	ed b0 	. . 
	ld hl,0ca12h		;5a7b	21 12 ca 	! . . 
	ld de,03c00h		;5a7e	11 00 3c 	. . < 
	ld bc,00400h		;5a81	01 00 04 	. . . 
	ldir		;5a84	ed b0 	. . 
	ld hl,0bfefh		;5a86	21 ef bf 	! . . 
	call sub_c793h		;5a89	cd 93 c7 	. . . 
	ld hl,l630eh		;5a8c	21 0e 63 	! . c 
	call sub_6012h		;5a8f	cd 12 60 	. . ` 
	call sub_5b2eh		;5a92	cd 2e 5b 	. . [ 
	pop de			;5a95	d1 	. 
	jp z,l538fh		;5a96	ca 8f 53 	. . S 
	push de			;5a99	d5 	. 
	ld hl,l6423h		;5a9a	21 23 64 	! # d 
	push hl			;5a9d	e5 	. 
	or a			;5a9e	b7 	. 
	sbc hl,de		;5a9f	ed 52 	. R 
	ld b,h			;5aa1	44 	D 
	ld c,l			;5aa2	4d 	M 
	pop de			;5aa3	d1 	. 
	jr z,l5aaeh		;5aa4	28 08 	( . 
	dec de			;5aa6	1b 	. 
	ld hl,00018h		;5aa7	21 18 00 	! . . 
	add hl,de			;5aaa	19 	. 
	ex de,hl			;5aab	eb 	. 
	lddr		;5aac	ed b8 	. . 
l5aaeh:
	pop de			;5aae	d1 	. 
	ld hl,03ee9h		;5aaf	21 e9 3e 	! . > 
	ld bc,0000fh		;5ab2	01 0f 00 	. . . 
	ldir		;5ab5	ed b0 	. . 
	ld hl,061ddh		;5ab7	21 dd 61 	! . a 
	ld bc,00009h		;5aba	01 09 00 	. . . 
	ldir		;5abd	ed b0 	. . 
	call sub_5ae1h		;5abf	cd e1 5a 	. . Z 
	ld hl,l634bh		;5ac2	21 4b 63 	! K c 
	ld de,06319h		;5ac5	11 19 63 	. . c 
	ld b,000h		;5ac8	06 00 	. . 
	call 04420h		;5aca	cd 20 44 	.   D 
	call z,04439h		;5acd	cc 39 44 	. 9 D 
	call z,04428h		;5ad0	cc 28 44 	. ( D 
	jp nz,04409h		;5ad3	c2 09 44 	. . D 
	call sub_603ah		;5ad6	cd 3a 60 	. : ` 
	ld b,003h		;5ad9	06 03 	. . 
	call sub_c9eeh		;5adb	cd ee c9 	. . . 
	jp l538fh		;5ade	c3 8f 53 	. . S 
sub_5ae1h:
	ld hl,(lc810h)		;5ae1	2a 10 c8 	* . . 
	push hl			;5ae4	e5 	. 
	ld hl,l6310h		;5ae5	21 10 63 	! . c 
	call sub_c679h		;5ae8	cd 79 c6 	. y . 
	ld hl,l634bh		;5aeb	21 4b 63 	! K c 
	ld de,0ccd5h		;5aee	11 d5 cc 	. . . 
	call sub_5b0ch		;5af1	cd 0c 5b 	. . [ 
	ld de,0ccf6h		;5af4	11 f6 cc 	. . . 
	call sub_5b0ch		;5af7	cd 0c 5b 	. . [ 
	ld hl,0ca12h		;5afa	21 12 ca 	! . . 
	ld de,03c00h		;5afd	11 00 3c 	. . < 
	ld bc,00400h		;5b00	01 00 04 	. . . 
	ldir		;5b03	ed b0 	. . 
	pop hl			;5b05	e1 	. 
	ld (lc810h),hl		;5b06	22 10 c8 	" . . 
	jp sub_c679h		;5b09	c3 79 c6 	. y . 
sub_5b0ch:
	ld b,005h		;5b0c	06 05 	. . 
l5b0eh:
	push bc			;5b0e	c5 	. 
	push de			;5b0f	d5 	. 
	ld bc,0000fh		;5b10	01 0f 00 	. . . 
	ldir		;5b13	ed b0 	. . 
	inc de			;5b15	13 	. 
	inc de			;5b16	13 	. 
	ld bc,00009h		;5b17	01 09 00 	. . . 
	ldir		;5b1a	ed b0 	. . 
	pop de			;5b1c	d1 	. 
	push hl			;5b1d	e5 	. 
	ld hl,00040h		;5b1e	21 40 00 	! @ . 
	add hl,de			;5b21	19 	. 
	ex de,hl			;5b22	eb 	. 
	pop hl			;5b23	e1 	. 
	pop bc			;5b24	c1 	. 
	djnz l5b0eh		;5b25	10 e7 	. . 
	ret			;5b27	c9 	. 
l5b28h:
	ld hl,l630eh		;5b28	21 0e 63 	! . c 
	call sub_6012h		;5b2b	cd 12 60 	. . ` 
sub_5b2eh:
	ld hl,03ee9h		;5b2e	21 e9 3e 	! . > 
l5b31h:
	ld (hl),08fh		;5b31	36 8f 	6 . 
	call sub_603ah		;5b33	cd 3a 60 	. : ` 
	ld b,00ah		;5b36	06 0a 	. . 
	call sub_c9eeh		;5b38	cd ee c9 	. . . 
	ret z			;5b3b	c8 	. 
	xor a			;5b3c	af 	. 
	ld de,04036h		;5b3d	11 36 40 	. 6 @ 
	ld b,007h		;5b40	06 07 	. . 
l5b42h:
	ld (de),a			;5b42	12 	. 
	inc de			;5b43	13 	. 
	djnz l5b42h		;5b44	10 fc 	. . 
	call 00049h		;5b46	cd 49 00 	. I . 
	cp 061h		;5b49	fe 61 	. a 
	jr c,l5b4fh		;5b4b	38 02 	8 . 
	res 5,a		;5b4d	cb af 	. . 
l5b4fh:
	cp 00dh		;5b4f	fe 0d 	. . 
	jr z,l5b69h		;5b51	28 16 	( . 
	cp 001h		;5b53	fe 01 	. . 
	jr z,l5b68h		;5b55	28 11 	( . 
	cp 020h		;5b57	fe 20 	.   
	jr c,l5b28h		;5b59	38 cd 	8 . 
	ld de,03ef8h		;5b5b	11 f8 3e 	. . > 
	push hl			;5b5e	e5 	. 
	sbc hl,de		;5b5f	ed 52 	. R 
	pop hl			;5b61	e1 	. 
	jr z,l5b31h		;5b62	28 cd 	( . 
	ld (hl),a			;5b64	77 	w 
	inc hl			;5b65	23 	# 
	jr l5b31h		;5b66	18 c9 	. . 
l5b68h:
	xor a			;5b68	af 	. 
l5b69h:
	ld (hl),020h		;5b69	36 20 	6   
	or a			;5b6b	b7 	. 
	ret			;5b6c	c9 	. 
sub_5b6dh:
	ld hl,l61d0h		;5b6d	21 d0 61 	! . a 
	ld de,0cd14h		;5b70	11 14 cd 	. . . 
	ld bc,00005h		;5b73	01 05 00 	. . . 
	ldir		;5b76	ed b0 	. . 
	ld hl,l61d5h+1		;5b78	21 d6 61 	! . a 
	ld bc,00006h		;5b7b	01 06 00 	. . . 
	ldir		;5b7e	ed b0 	. . 
	ld hl,061ddh		;5b80	21 dd 61 	! . a 
	ld de,0cd55h		;5b83	11 55 cd 	. U . 
	ld bc,00009h		;5b86	01 09 00 	. . . 
	push bc			;5b89	c5 	. 
	ldir		;5b8a	ed b0 	. . 
	ld hl,l620bh		;5b8c	21 0b 62 	! . b 
	ld de,0cd44h		;5b8f	11 44 cd 	. D . 
	pop bc			;5b92	c1 	. 
	push bc			;5b93	c5 	. 
	ldir		;5b94	ed b0 	. . 
	ld hl,06200h		;5b96	21 00 62 	! . b 
	ld de,0cd84h		;5b99	11 84 cd 	. . . 
	pop bc			;5b9c	c1 	. 
	ldir		;5b9d	ed b0 	. . 
	ld hl,0cd12h		;5b9f	21 12 cd 	! . . 
	ld de,03f00h		;5ba2	11 00 3f 	. . ? 
	ld bc,00100h		;5ba5	01 00 01 	. . . 
	ldir		;5ba8	ed b0 	. . 
	ret			;5baa	c9 	. 
sub_5babh:
	ld b,008h		;5bab	06 08 	. . 
l5badh:
	ld a,(de)			;5bad	1a 	. 
	cp (hl)			;5bae	be 	. 
	ret c			;5baf	d8 	. 
	ret nz			;5bb0	c0 	. 
	inc hl			;5bb1	23 	# 
	inc de			;5bb2	13 	. 
	djnz l5badh		;5bb3	10 f8 	. . 
	ret			;5bb5	c9 	. 
sub_5bb6h:
	ld hl,l61cfh		;5bb6	21 cf 61 	! . a 
	bit 6,(hl)		;5bb9	cb 76 	. v 
	jr nz,l5bcah		;5bbb	20 0d 	  . 
	ld hl,(lc812h)		;5bbd	2a 12 c8 	* . . 
	inc hl			;5bc0	23 	# 
	ld a,(hl)			;5bc1	7e 	~ 
	or a			;5bc2	b7 	. 
	ret nz			;5bc3	c0 	. 
	ld a,(lc80eh)		;5bc4	3a 0e c8 	: . . 
	cp 040h		;5bc7	fe 40 	. @ 
	ret			;5bc9	c9 	. 
l5bcah:
	ld hl,(lc810h)		;5bca	2a 10 c8 	* . . 
	dec hl			;5bcd	2b 	+ 
	ld a,(hl)			;5bce	7e 	~ 
	or a			;5bcf	b7 	. 
	ret nz			;5bd0	c0 	. 
	ld a,(lc80eh)		;5bd1	3a 0e c8 	: . . 
	or a			;5bd4	b7 	. 
	ret			;5bd5	c9 	. 
sub_5bd6h:
	ld b,(ix-001h)		;5bd6	dd 46 ff 	. F . 
	ld de,00017h		;5bd9	11 17 00 	. . . 
l5bdch:
	ld a,(ix+00eh)		;5bdc	dd 7e 0e 	. ~ . 
	and 043h		;5bdf	e6 43 	. C 
	cp 003h		;5be1	fe 03 	. . 
	jr nz,l5bf2h		;5be3	20 0d 	  . 
	ld a,(ix+013h)		;5be5	dd 7e 13 	. ~ . 
	cp 002h		;5be8	fe 02 	. . 
	jr nc,l5bf2h		;5bea	30 06 	0 . 
	ld hl,0c0f1h		;5bec	21 f1 c0 	! . . 
	jp sub_c793h		;5bef	c3 93 c7 	. . . 
l5bf2h:
	add ix,de		;5bf2	dd 19 	. . 
	djnz l5bdch		;5bf4	10 e6 	. . 
	ret			;5bf6	c9 	. 
sub_5bf7h:
	ld b,(ix-001h)		;5bf7	dd 46 ff 	. F . 
	ld de,00017h		;5bfa	11 17 00 	. . . 
l5bfdh:
	bit 7,(ix+00eh)		;5bfd	dd cb 0e 7e 	. . . ~ 
	jr nz,l5c08h		;5c01	20 05 	  . 
	add ix,de		;5c03	dd 19 	. . 
	djnz l5bfdh		;5c05	10 f6 	. . 
	ret			;5c07	c9 	. 
l5c08h:
	res 7,(ix+00eh)		;5c08	dd cb 0e be 	. . . . 
	ld b,07ch		;5c0c	06 7c 	. | 
	ld a,(lc80bh)		;5c0e	3a 0b c8 	: . . 
	ld (05c1ch),a		;5c11	32 1c 5c 	2 . \ 
	ld (05c2bh),a		;5c14	32 2b 5c 	2 + \ 
	ld a,001h		;5c17	3e 01 	> . 
l5c19h:
	xor 003h		;5c19	ee 03 	. . 
	out (080h),a		;5c1b	d3 80 	. . 
	push bc			;5c1d	c5 	. 
l5c1eh:
	djnz l5c1eh		;5c1e	10 fe 	. . 
l5c20h:
	djnz l5c20h		;5c20	10 fe 	. . 
l5c22h:
	djnz l5c22h		;5c22	10 fe 	. . 
	pop bc			;5c24	c1 	. 
	inc b			;5c25	04 	. 
	jp p,l5c19h		;5c26	f2 19 5c 	. . \ 
	xor a			;5c29	af 	. 
	out (080h),a		;5c2a	d3 80 	. . 
	ret			;5c2c	c9 	. 
sub_5c2dh:
	ld b,(ix-001h)		;5c2d	dd 46 ff 	. F . 
	ld de,00017h		;5c30	11 17 00 	. . . 
l5c33h:
	bit 0,(ix+00eh)		;5c33	dd cb 0e 46 	. . . F 
	jr z,l5c4dh		;5c37	28 14 	( . 
	ld a,(ix+013h)		;5c39	dd 7e 13 	. ~ . 
	cp 001h		;5c3c	fe 01 	. . 
	jr nz,l5c4dh		;5c3e	20 0d 	  . 
	ld a,(ix+012h)		;5c40	dd 7e 12 	. ~ . 
	cp 001h		;5c43	fe 01 	. . 
	jr nz,l5c4dh		;5c45	20 06 	  . 
	ld hl,lc0dbh		;5c47	21 db c0 	! . . 
	jp sub_c793h		;5c4a	c3 93 c7 	. . . 
l5c4dh:
	add ix,de		;5c4d	dd 19 	. . 
	djnz l5c33h		;5c4f	10 e2 	. . 
	ret			;5c51	c9 	. 
sub_5c52h:
	ld b,(iy-001h)		;5c52	fd 46 ff 	. F . 
l5c55h:
	push bc			;5c55	c5 	. 
	push iy		;5c56	fd e5 	. . 
	push ix		;5c58	dd e5 	. . 
	bit 0,(iy+00eh)		;5c5a	fd cb 0e 46 	. . . F 
	call nz,sub_5c76h		;5c5e	c4 76 5c 	. v \ 
	pop ix		;5c61	dd e1 	. . 
	pop iy		;5c63	fd e1 	. . 
	pop bc			;5c65	c1 	. 
	ld de,00017h		;5c66	11 17 00 	. . . 
	add iy,de		;5c69	fd 19 	. . 
	ld hl,l61cfh		;5c6b	21 cf 61 	! . a 
	bit 1,(hl)		;5c6e	cb 4e 	. N 
	res 1,(hl)		;5c70	cb 8e 	. . 
	ret nz			;5c72	c0 	. 
	djnz l5c55h		;5c73	10 e0 	. . 
	ret			;5c75	c9 	. 
sub_5c76h:
	ld e,(iy+015h)		;5c76	fd 5e 15 	. ^ . 
	ld d,(iy+016h)		;5c79	fd 56 16 	. V . 
	ld a,(de)			;5c7c	1a 	. 
	dec a			;5c7d	3d 	= 
	cp (iy+013h)		;5c7e	fd be 13 	. . . 
	ret nz			;5c81	c0 	. 
	ld a,(iy+012h)		;5c82	fd 7e 12 	. ~ . 
	cp 001h		;5c85	fe 01 	. . 
	ret nz			;5c87	c0 	. 
	ld b,(ix-001h)		;5c88	dd 46 ff 	. F . 
	ld c,b			;5c8b	48 	H 
	ld hl,0ffe9h		;5c8c	21 e9 ff 	! . . 
	ld de,00017h		;5c8f	11 17 00 	. . . 
l5c92h:
	add hl,de			;5c92	19 	. 
	djnz l5c92h		;5c93	10 fd 	. . 
	ex de,hl			;5c95	eb 	. 
	add ix,de		;5c96	dd 19 	. . 
	ld b,c			;5c98	41 	A 
	ld a,(iy+001h)		;5c99	fd 7e 01 	. ~ . 
	add a,(iy+003h)		;5c9c	fd 86 03 	. . . 
	ld h,a			;5c9f	67 	g 
	ld a,(iy+002h)		;5ca0	fd 7e 02 	. ~ . 
	add a,(iy+004h)		;5ca3	fd 86 04 	. . . 
	ld l,a			;5ca6	6f 	o 
l5ca7h:
	push hl			;5ca7	e5 	. 
	push bc			;5ca8	c5 	. 
	push ix		;5ca9	dd e5 	. . 
	bit 0,(ix+00eh)		;5cab	dd cb 0e 46 	. . . F 
	jp z,l5d0eh		;5caf	ca 0e 5d 	. . ] 
	bit 4,(ix+00eh)		;5cb2	dd cb 0e 66 	. . . f 
	jp nz,l5d0eh		;5cb6	c2 0e 5d 	. . ] 
	ld a,(l61cfh)		;5cb9	3a cf 61 	: . a 
	bit 1,a		;5cbc	cb 4f 	. O 
	jp nz,l5d0eh		;5cbe	c2 0e 5d 	. . ] 
	ld a,(ix+001h)		;5cc1	dd 7e 01 	. ~ . 
	add a,(ix+003h)		;5cc4	dd 86 03 	. . . 
	ld d,a			;5cc7	57 	W 
	ld a,h			;5cc8	7c 	| 
	cp d			;5cc9	ba 	. 
	jp c,l5d0eh		;5cca	da 0e 5d 	. . ] 
	ld a,d			;5ccd	7a 	z 
	add a,(ix+006h)		;5cce	dd 86 06 	. . . 
	ld d,a			;5cd1	57 	W 
	ld a,h			;5cd2	7c 	| 
	cp d			;5cd3	ba 	. 
	jp nc,l5d0eh		;5cd4	d2 0e 5d 	. . ] 
	ld a,(ix+002h)		;5cd7	dd 7e 02 	. ~ . 
	add a,(ix+004h)		;5cda	dd 86 04 	. . . 
	ld e,a			;5cdd	5f 	_ 
	ld a,l			;5cde	7d 	} 
	cp e			;5cdf	bb 	. 
	jp c,l5d0eh		;5ce0	da 0e 5d 	. . ] 
	ld a,e			;5ce3	7b 	{ 
	add a,(ix+005h)		;5ce4	dd 86 05 	. . . 
	ld e,a			;5ce7	5f 	_ 
	ld a,l			;5ce8	7d 	} 
	cp e			;5ce9	bb 	. 
	jp nc,l5d0eh		;5cea	d2 0e 5d 	. . ] 
	ld a,(l61cdh)		;5ced	3a cd 61 	: . a 
	ld hl,l61cch		;5cf0	21 cc 61 	! . a 
	cp (hl)			;5cf3	be 	. 
	jr z,l5cf7h		;5cf4	28 01 	( . 
	inc (hl)			;5cf6	34 	4 
l5cf7h:
	ld a,(ix+000h)		;5cf7	dd 7e 00 	. ~ . 
	ld hl,(0618ah)		;5cfa	2a 8a 61 	* . a 
	cp (hl)			;5cfd	be 	. 
	jr nz,l5d04h		;5cfe	20 04 	  . 
	ld hl,l61cbh		;5d00	21 cb 61 	! . a 
	inc (hl)			;5d03	34 	4 
l5d04h:
	ld hl,l61cfh		;5d04	21 cf 61 	! . a 
	res 3,(hl)		;5d07	cb 9e 	. . 
	set 1,(hl)		;5d09	cb ce 	. . 
	call sub_5d1ah		;5d0b	cd 1a 5d 	. . ] 
l5d0eh:
	pop ix		;5d0e	dd e1 	. . 
	pop bc			;5d10	c1 	. 
	pop hl			;5d11	e1 	. 
	ld de,0ffe9h		;5d12	11 e9 ff 	. . . 
	add ix,de		;5d15	dd 19 	. . 
	djnz l5ca7h		;5d17	10 8e 	. . 
	ret			;5d19	c9 	. 
sub_5d1ah:
	push ix		;5d1a	dd e5 	. . 
	pop de			;5d1c	d1 	. 
	inc de			;5d1d	13 	. 
	ld ix,l6163h		;5d1e	dd 21 63 61 	. ! c a 
	ld a,(iy+001h)		;5d22	fd 7e 01 	. ~ . 
	add a,(iy+003h)		;5d25	fd 86 03 	. . . 
	sub (ix+003h)		;5d28	dd 96 03 	. . . 
	ld (ix+001h),a		;5d2b	dd 77 01 	. w . 
	ld a,(iy+002h)		;5d2e	fd 7e 02 	. ~ . 
	add a,(iy+004h)		;5d31	fd 86 04 	. . . 
	sub (ix+004h)		;5d34	dd 96 04 	. . . 
	ld (ix+002h),a		;5d37	dd 77 02 	. w . 
	ld c,000h		;5d3a	0e 00 	. . 
	jr z,l5d4ah		;5d3c	28 0c 	( . 
	jp m,l5d47h		;5d3e	fa 47 5d 	. G ] 
	sub 01eh		;5d41	d6 1e 	. . 
	jr c,l5d4ah		;5d43	38 05 	8 . 
	jr l5d49h		;5d45	18 02 	. . 
l5d47h:
	neg		;5d47	ed 44 	. D 
l5d49h:
	ld c,a			;5d49	4f 	O 
l5d4ah:
	ld b,000h		;5d4a	06 00 	. . 
	ld hl,l617ah		;5d4c	21 7a 61 	! z a 
	add hl,bc			;5d4f	09 	. 
	ld a,(hl)			;5d50	7e 	~ 
	ld l,(ix+015h)		;5d51	dd 6e 15 	. n . 
	ld h,(ix+016h)		;5d54	dd 66 16 	. f . 
	ld (hl),a			;5d57	77 	w 
	push ix		;5d58	dd e5 	. . 
	pop hl			;5d5a	e1 	. 
	inc hl			;5d5b	23 	# 
	ld bc,00016h		;5d5c	01 16 00 	. . . 
	ldir		;5d5f	ed b0 	. . 
	ret			;5d61	c9 	. 
sub_5d62h:
	ld hl,l61cfh		;5d62	21 cf 61 	! . a 
	bit 7,(hl)		;5d65	cb 7e 	. ~ 
	ret z			;5d67	c8 	. 
	ld iy,l6314h		;5d68	fd 21 14 63 	. ! . c 
	ld b,(ix-001h)		;5d6c	dd 46 ff 	. F . 
l5d6fh:
	bit 0,(ix+00eh)		;5d6f	dd cb 0e 46 	. . . F 
	jr z,l5dabh		;5d73	28 36 	( 6 
	bit 6,(ix+00eh)		;5d75	dd cb 0e 76 	. . . v 
	ret nz			;5d79	c0 	. 
	ld a,(ix+006h)		;5d7a	dd 7e 06 	. ~ . 
	inc a			;5d7d	3c 	< 
	srl a		;5d7e	cb 3f 	. ? 
	add a,(ix+003h)		;5d80	dd 86 03 	. . . 
	add a,(ix+001h)		;5d83	dd 86 01 	. . . 
	sub (iy+003h)		;5d86	fd 96 03 	. . . 
	ld (iy+001h),a		;5d89	fd 77 01 	. w . 
	ld a,(ix+005h)		;5d8c	dd 7e 05 	. ~ . 
	inc a			;5d8f	3c 	< 
	srl a		;5d90	cb 3f 	. ? 
	add a,(ix+004h)		;5d92	dd 86 04 	. . . 
	add a,(ix+002h)		;5d95	dd 86 02 	. . . 
	sub (iy+004h)		;5d98	fd 96 04 	. . . 
	jp p,l5d9fh		;5d9b	f2 9f 5d 	. . ] 
	xor a			;5d9e	af 	. 
l5d9fh:
	cp 03bh		;5d9f	fe 3b 	. ; 
	jr c,l5da5h		;5da1	38 02 	8 . 
	ld a,03ah		;5da3	3e 3a 	> : 
l5da5h:
	ld (iy+002h),a		;5da5	fd 77 02 	. w . 
	jp sub_5d1ah		;5da8	c3 1a 5d 	. . ] 
l5dabh:
	ld de,00017h		;5dab	11 17 00 	. . . 
	add ix,de		;5dae	dd 19 	. . 
	djnz l5d6fh		;5db0	10 bd 	. . 
	ret			;5db2	c9 	. 
sub_5db3h:
	ld hl,l61cfh		;5db3	21 cf 61 	! . a 
	bit 1,(hl)		;5db6	cb 4e 	. N 
	res 1,(hl)		;5db8	cb 8e 	. . 
	jr nz,l5dcdh		;5dba	20 11 	  . 
	ld a,(03840h)		;5dbc	3a 40 38 	: @ 8 
	and 080h		;5dbf	e6 80 	. . 
	ld b,a			;5dc1	47 	G 
	ld a,0ffh		;5dc2	3e ff 	> . 
	cpl			;5dc4	2f 	/ 
	or b			;5dc5	b0 	. 
	and 090h		;5dc6	e6 90 	. . 
	jr nz,l5dcdh		;5dc8	20 03 	  . 
	xor a			;5dca	af 	. 
	jr l5dd3h		;5dcb	18 06 	. . 
l5dcdh:
	ld a,000h		;5dcd	3e 00 	> . 
	or a			;5dcf	b7 	. 
	jr z,l5dd7h		;5dd0	28 05 	( . 
	dec a			;5dd2	3d 	= 
l5dd3h:
	ld (l5dcdh+1),a		;5dd3	32 ce 5d 	2 . ] 
	ret			;5dd6	c9 	. 
l5dd7h:
	ld de,00017h		;5dd7	11 17 00 	. . . 
	push de			;5dda	d5 	. 
	ld b,(ix-001h)		;5ddb	dd 46 ff 	. F . 
	bit 0,(ix+00eh)		;5dde	dd cb 0e 46 	. . . F 
	jr nz,l5df5h		;5de2	20 11 	  . 
	push bc			;5de4	c5 	. 
	sbc hl,hl		;5de5	ed 62 	. b 
l5de7h:
	add hl,de			;5de7	19 	. 
	djnz l5de7h		;5de8	10 fd 	. . 
	ld b,h			;5dea	44 	D 
	ld c,l			;5deb	4d 	M 
	push ix		;5dec	dd e5 	. . 
	pop hl			;5dee	e1 	. 
	push hl			;5def	e5 	. 
	add hl,de			;5df0	19 	. 
	pop de			;5df1	d1 	. 
	ldir		;5df2	ed b0 	. . 
	pop bc			;5df4	c1 	. 
l5df5h:
	pop de			;5df5	d1 	. 
l5df6h:
	bit 0,(ix+00eh)		;5df6	dd cb 0e 46 	. . . F 
	jr z,l5e01h		;5dfa	28 05 	( . 
	add ix,de		;5dfc	dd 19 	. . 
	djnz l5df6h		;5dfe	10 f6 	. . 
	ret			;5e00	c9 	. 
l5e01h:
	ld a,004h		;5e01	3e 04 	> . 
	ld (l5dcdh+1),a		;5e03	32 ce 5d 	2 . ] 
	ld a,(iy+002h)		;5e06	fd 7e 02 	. ~ . 
	ld (ix+002h),a		;5e09	dd 77 02 	. w . 
	ld a,(iy+004h)		;5e0c	fd 7e 04 	. ~ . 
	ld (ix+004h),a		;5e0f	dd 77 04 	. w . 
	ld a,(iy+001h)		;5e12	fd 7e 01 	. ~ . 
	ld (ix+001h),a		;5e15	dd 77 01 	. w . 
	ld a,(iy+003h)		;5e18	fd 7e 03 	. ~ . 
	ld (ix+003h),a		;5e1b	dd 77 03 	. w . 
	ld (ix+00eh),017h		;5e1e	dd 36 0e 17 	. 6 . . 
	ld (ix+013h),000h		;5e22	dd 36 13 00 	. 6 . . 
	ret			;5e26	c9 	. 
sub_5e27h:
	ld hl,l61cfh		;5e27	21 cf 61 	! . a 
	bit 0,(hl)		;5e2a	cb 46 	. F 
	jp z,l5f27h		;5e2c	ca 27 5f 	. ' _ 
	ld a,(ix+00dh)		;5e2f	dd 7e 0d 	. ~ . 
	and 0f0h		;5e32	e6 f0 	. . 
	ld (ix+00dh),a		;5e34	dd 77 0d 	. w . 
	ld a,(l61c9h)		;5e37	3a c9 61 	: . a 
	ld b,a			;5e3a	47 	G 
	ld iy,sub_6091h+2		;5e3b	fd 21 93 60 	. ! . ` 
	ld de,00017h		;5e3f	11 17 00 	. . . 
l5e42h:
	add iy,de		;5e42	fd 19 	. . 
	djnz l5e42h		;5e44	10 fc 	. . 
	bit 0,(iy+00eh)		;5e46	fd cb 0e 46 	. . . F 
	jr z,l5e52h		;5e4a	28 06 	( . 
	bit 6,(iy+00eh)		;5e4c	fd cb 0e 76 	. . . v 
	jr z,l5e5dh		;5e50	28 0b 	( . 
l5e52h:
	inc a			;5e52	3c 	< 
	cp 005h		;5e53	fe 05 	. . 
	jr nz,l5e59h		;5e55	20 02 	  . 
	ld a,001h		;5e57	3e 01 	> . 
l5e59h:
	ld (l61c9h),a		;5e59	32 c9 61 	2 . a 
	ret			;5e5c	c9 	. 
l5e5dh:
	ld a,(iy+006h)		;5e5d	fd 7e 06 	. ~ . 
	inc a			;5e60	3c 	< 
	srl a		;5e61	cb 3f 	. ? 
	add a,(iy+001h)		;5e63	fd 86 01 	. . . 
	add a,(iy+003h)		;5e66	fd 86 03 	. . . 
	bit 0,(iy+00dh)		;5e69	fd cb 0d 46 	. . . F 
	jr z,l5e70h		;5e6d	28 01 	( . 
	dec a			;5e6f	3d 	= 
l5e70h:
	bit 1,(iy+00dh)		;5e70	fd cb 0d 4e 	. . . N 
	jr z,l5e77h		;5e74	28 01 	( . 
	inc a			;5e76	3c 	< 
l5e77h:
	ld b,a			;5e77	47 	G 
	ld a,(ix+006h)		;5e78	dd 7e 06 	. ~ . 
	inc a			;5e7b	3c 	< 
	srl a		;5e7c	cb 3f 	. ? 
	add a,(ix+001h)		;5e7e	dd 86 01 	. . . 
	add a,(ix+003h)		;5e81	dd 86 03 	. . . 
	cp b			;5e84	b8 	. 
	jr z,l5e93h		;5e85	28 0c 	( . 
	jr c,l5e8fh		;5e87	38 06 	8 . 
	set 0,(ix+00dh)		;5e89	dd cb 0d c6 	. . . . 
	jr l5e93h		;5e8d	18 04 	. . 
l5e8fh:
	set 1,(ix+00dh)		;5e8f	dd cb 0d ce 	. . . . 
l5e93h:
	ld a,(iy+005h)		;5e93	fd 7e 05 	. ~ . 
	inc a			;5e96	3c 	< 
	srl a		;5e97	cb 3f 	. ? 
	add a,(iy+002h)		;5e99	fd 86 02 	. . . 
	add a,(iy+004h)		;5e9c	fd 86 04 	. . . 
	ld b,a			;5e9f	47 	G 
	ld a,(ix+00bh)		;5ea0	dd 7e 0b 	. ~ . 
	bit 2,(iy+00dh)		;5ea3	fd cb 0d 56 	. . . V 
	jr z,l5eb4h		;5ea7	28 0b 	( . 
	dec b			;5ea9	05 	. 
	cp 003h		;5eaa	fe 03 	. . 
	jr nc,l5eb4h		;5eac	30 06 	0 . 
	dec b			;5eae	05 	. 
	cp 002h		;5eaf	fe 02 	. . 
	jr nc,l5eb4h		;5eb1	30 01 	0 . 
	dec b			;5eb3	05 	. 
l5eb4h:
	bit 3,(iy+00dh)		;5eb4	fd cb 0d 5e 	. . . ^ 
	jr z,l5ec6h		;5eb8	28 0c 	( . 
	inc b			;5eba	04 	. 
	inc b			;5ebb	04 	. 
	cp 003h		;5ebc	fe 03 	. . 
	jr nc,l5ec6h		;5ebe	30 06 	0 . 
	inc b			;5ec0	04 	. 
	cp 002h		;5ec1	fe 02 	. . 
	jr nc,l5ec6h		;5ec3	30 01 	0 . 
	inc b			;5ec5	04 	. 
l5ec6h:
	ld a,(ix+005h)		;5ec6	dd 7e 05 	. ~ . 
	inc a			;5ec9	3c 	< 
	srl a		;5eca	cb 3f 	. ? 
	add a,(ix+002h)		;5ecc	dd 86 02 	. . . 
	add a,(ix+004h)		;5ecf	dd 86 04 	. . . 
	cp b			;5ed2	b8 	. 
	jr z,l5ee1h		;5ed3	28 0c 	( . 
	jr c,l5eddh		;5ed5	38 06 	8 . 
	set 2,(ix+00dh)		;5ed7	dd cb 0d d6 	. . . . 
	jr l5f41h		;5edb	18 64 	. d 
l5eddh:
	set 3,(ix+00dh)		;5edd	dd cb 0d de 	. . . . 
l5ee1h:
	ld a,(ix+00dh)		;5ee1	dd 7e 0d 	. ~ . 
	and 00fh		;5ee4	e6 0f 	. . 
	jr nz,l5eeah		;5ee6	20 02 	  . 
	set 1,(hl)		;5ee8	cb ce 	. . 
l5eeah:
	ld a,(ix+001h)		;5eea	dd 7e 01 	. ~ . 
	add a,(ix+003h)		;5eed	dd 86 03 	. . . 
	ld h,a			;5ef0	67 	g 
	ld a,(ix+002h)		;5ef1	dd 7e 02 	. ~ . 
	add a,(ix+004h)		;5ef4	dd 86 04 	. . . 
	ld l,a			;5ef7	6f 	o 
	ld a,(iy+001h)		;5ef8	fd 7e 01 	. ~ . 
	add a,(iy+003h)		;5efb	fd 86 03 	. . . 
	ld d,a			;5efe	57 	W 
	ld a,h			;5eff	7c 	| 
	cp d			;5f00	ba 	. 
	jr c,l5f41h		;5f01	38 3e 	8 > 
	ld a,d			;5f03	7a 	z 
	add a,(iy+006h)		;5f04	fd 86 06 	. . . 
	ld d,a			;5f07	57 	W 
	ld a,h			;5f08	7c 	| 
	cp d			;5f09	ba 	. 
	jr nc,l5f41h		;5f0a	30 35 	0 5 
	ld a,(iy+002h)		;5f0c	fd 7e 02 	. ~ . 
	add a,(iy+004h)		;5f0f	fd 86 04 	. . . 
	ld e,a			;5f12	5f 	_ 
	ld a,l			;5f13	7d 	} 
	cp e			;5f14	bb 	. 
	jr c,l5f41h		;5f15	38 2a 	8 * 
	ld a,e			;5f17	7b 	{ 
	add a,(iy+005h)		;5f18	fd 86 05 	. . . 
	ld e,a			;5f1b	5f 	_ 
	ld a,l			;5f1c	7d 	} 
	cp e			;5f1d	bb 	. 
	jr nc,l5f41h		;5f1e	30 21 	0 ! 
	ld hl,l61cfh		;5f20	21 cf 61 	! . a 
	set 1,(hl)		;5f23	cb ce 	. . 
	jr l5f41h		;5f25	18 1a 	. . 
l5f27h:
	ld a,(03840h)		;5f27	3a 40 38 	: @ 8 
	srl a		;5f2a	cb 3f 	. ? 
	srl a		;5f2c	cb 3f 	. ? 
	srl a		;5f2e	cb 3f 	. ? 
	ld b,a			;5f30	47 	G 
	ld a,0ffh		;5f31	3e ff 	> . 
	cpl			;5f33	2f 	/ 
	and 00fh		;5f34	e6 0f 	. . 
	or b			;5f36	b0 	. 
	ld b,a			;5f37	47 	G 
	ld a,(ix+00dh)		;5f38	dd 7e 0d 	. ~ . 
	and 0f0h		;5f3b	e6 f0 	. . 
	or b			;5f3d	b0 	. 
	ld (ix+00dh),a		;5f3e	dd 77 0d 	. w . 
l5f41h:
	ld a,(ix+001h)		;5f41	dd 7e 01 	. ~ . 
	cp (ix+007h)		;5f44	dd be 07 	. . . 
	jr nz,l5f4fh		;5f47	20 06 	  . 
	res 0,(ix+00dh)		;5f49	dd cb 0d 86 	. . . . 
	jr l5f58h		;5f4d	18 09 	. . 
l5f4fh:
	cp (ix+008h)		;5f4f	dd be 08 	. . . 
	jr nz,l5f58h		;5f52	20 04 	  . 
	res 1,(ix+00dh)		;5f54	dd cb 0d 8e 	. . . . 
l5f58h:
	ld a,(ix+002h)		;5f58	dd 7e 02 	. ~ . 
	cp (ix+009h)		;5f5b	dd be 09 	. . . 
	jr nz,l5f65h		;5f5e	20 05 	  . 
	res 2,(ix+00dh)		;5f60	dd cb 0d 96 	. . . . 
	ret			;5f64	c9 	. 
l5f65h:
	cp (ix+00ah)		;5f65	dd be 0a 	. . . 
	ret nz			;5f68	c0 	. 
	res 3,(ix+00dh)		;5f69	dd cb 0d 9e 	. . . . 
	ret			;5f6d	c9 	. 
sub_5f6eh:
	ld b,(ix-001h)		;5f6e	dd 46 ff 	. F . 
	ld de,00017h		;5f71	11 17 00 	. . . 
	push ix		;5f74	dd e5 	. . 
l5f76h:
	bit 1,(ix+00eh)		;5f76	dd cb 0e 4e 	. . . N 
	jr nz,l5fc5h		;5f7a	20 49 	  I 
	ld a,(ix+001h)		;5f7c	dd 7e 01 	. ~ . 
	cp (ix+007h)		;5f7f	dd be 07 	. . . 
	jp nz,l5f93h		;5f82	c2 93 5f 	. . _ 
	res 0,(ix+00dh)		;5f85	dd cb 0d 86 	. . . . 
	bit 6,(ix+00dh)		;5f89	dd cb 0d 76 	. . . v 
	jr z,l5fcch		;5f8d	28 3d 	( = 
	set 1,(ix+00dh)		;5f8f	dd cb 0d ce 	. . . . 
l5f93h:
	cp (ix+008h)		;5f93	dd be 08 	. . . 
	jp nz,l5fa7h		;5f96	c2 a7 5f 	. . _ 
	res 1,(ix+00dh)		;5f99	dd cb 0d 8e 	. . . . 
	bit 7,(ix+00dh)		;5f9d	dd cb 0d 7e 	. . . ~ 
	jr z,l5fcch		;5fa1	28 29 	( ) 
	set 0,(ix+00dh)		;5fa3	dd cb 0d c6 	. . . . 
l5fa7h:
	ld a,(ix+002h)		;5fa7	dd 7e 02 	. ~ . 
	cp (ix+009h)		;5faa	dd be 09 	. . . 
	jp nz,l5fb8h		;5fad	c2 b8 5f 	. . _ 
	res 2,(ix+00dh)		;5fb0	dd cb 0d 96 	. . . . 
	set 3,(ix+00dh)		;5fb4	dd cb 0d de 	. . . . 
l5fb8h:
	cp (ix+00ah)		;5fb8	dd be 0a 	. . . 
	jr nz,l5fc5h		;5fbb	20 08 	  . 
	res 3,(ix+00dh)		;5fbd	dd cb 0d 9e 	. . . . 
	set 2,(ix+00dh)		;5fc1	dd cb 0d d6 	. . . . 
l5fc5h:
	add ix,de		;5fc5	dd 19 	. . 
	djnz l5f76h		;5fc7	10 ad 	. . 
	pop ix		;5fc9	dd e1 	. . 
	ret			;5fcb	c9 	. 
l5fcch:
	res 0,(ix+00eh)		;5fcc	dd cb 0e 86 	. . . . 
	ld hl,l61cfh		;5fd0	21 cf 61 	! . a 
	set 2,(hl)		;5fd3	cb d6 	. . 
	ld a,(l61ceh)		;5fd5	3a ce 61 	: . a 
	inc a			;5fd8	3c 	< 
	cp 004h		;5fd9	fe 04 	. . 
	jr nz,l5fe0h		;5fdb	20 03 	  . 
	set 5,(hl)		;5fdd	cb ee 	. . 
	xor a			;5fdf	af 	. 
l5fe0h:
	ld (l61ceh),a		;5fe0	32 ce 61 	2 . a 
	bit 3,(hl)		;5fe3	cb 5e 	. ^ 
	set 3,(hl)		;5fe5	cb de 	. . 
	jp z,l5fc5h		;5fe7	ca c5 5f 	. . _ 
	set 5,(hl)		;5fea	cb ee 	. . 
	xor a			;5fec	af 	. 
	ld (l61ceh),a		;5fed	32 ce 61 	2 . a 
	jp l5fc5h		;5ff0	c3 c5 5f 	. . _ 
l5ff3h:
	jr nz,l6000h		;5ff3	20 0b 	  . 
	ld hl,0c0d5h		;5ff5	21 d5 c0 	! . . 
	ld de,l6199h		;5ff8	11 99 61 	. . a 
	ld bc,00005h		;5ffb	01 05 00 	. . . 
	ldir		;5ffe	ed b0 	. . 
l6000h:
	ld hl,l6199h		;6000	21 99 61 	! . a 
	call sub_c793h		;6003	cd 93 c7 	. . . 
	ld hl,l619bh		;6006	21 9b 61 	! . a 
	ld b,003h		;6009	06 03 	. . 
l600bh:
	dec (hl)			;600b	35 	5 
	dec (hl)			;600c	35 	5 
	inc hl			;600d	23 	# 
	djnz l600bh		;600e	10 fb 	. . 
l6010h:
	pop hl			;6010	e1 	. 
	inc hl			;6011	23 	# 
sub_6012h:
	ld a,(hl)			;6012	7e 	~ 
	or a			;6013	b7 	. 
	ret z			;6014	c8 	. 
	push hl			;6015	e5 	. 
	jp p,l6024h		;6016	f2 24 60 	. $ ` 
	cp 0feh		;6019	fe fe 	. . 
	jr nc,l5ff3h		;601b	30 d6 	0 . 
	sla a		;601d	cb 27 	. ' 
	ld (06034h),a		;601f	32 34 60 	2 4 ` 
	jr l6010h		;6022	18 ec 	. . 
l6024h:
	call sub_c679h		;6024	cd 79 c6 	. y . 
	ld hl,0ca12h		;6027	21 12 ca 	! . . 
	ld de,03c00h		;602a	11 00 3c 	. . < 
	ld bc,00400h		;602d	01 00 04 	. . . 
	ldir		;6030	ed b0 	. . 
	ld bc,00001h		;6032	01 01 00 	. . . 
	call 00060h		;6035	cd 60 00 	. ` . 
	jr l6010h		;6038	18 d6 	. . 
sub_603ah:
	call sub_c9fdh		;603a	cd fd c9 	. . . 
	jr nz,sub_603ah		;603d	20 fb 	  . 
	ret			;603f	c9 	. 
sub_6040h:
	ld hl,l630ch		;6040	21 0c 63 	! . c 
	call sub_c679h		;6043	cd 79 c6 	. y . 
	ld hl,l62d3h+2		;6046	21 d5 62 	! . b 
	call sub_c681h		;6049	cd 81 c6 	. . . 
	ld hl,0c1f1h		;604c	21 f1 c1 	! . . 
	ld b,00fh		;604f	06 0f 	. . 
l6051h:
	push bc			;6051	c5 	. 
	push hl			;6052	e5 	. 
	exx			;6053	d9 	. 
	ld hl,0ce12h		;6054	21 12 ce 	! . . 
	ld de,0da12h		;6057	11 12 da 	. . . 
	ld bc,00400h		;605a	01 00 04 	. . . 
	ldir		;605d	ed b0 	. . 
	exx			;605f	d9 	. 
	ld hl,0da12h		;6060	21 12 da 	! . . 
	ld a,00fh		;6063	3e 0f 	> . 
	sub b			;6065	90 	. 
	jr z,l606fh		;6066	28 07 	( . 
	ld b,a			;6068	47 	G 
	ld de,00040h		;6069	11 40 00 	. @ . 
l606ch:
	add hl,de			;606c	19 	. 
	djnz l606ch		;606d	10 fd 	. . 
l606fh:
	ex de,hl			;606f	eb 	. 
	ld hl,0ca12h		;6070	21 12 ca 	! . . 
	ld bc,00400h		;6073	01 00 04 	. . . 
	ldir		;6076	ed b0 	. . 
	ld hl,0da12h		;6078	21 12 da 	! . . 
	ld de,03c00h		;607b	11 00 3c 	. . < 
	ld bc,00400h		;607e	01 00 04 	. . . 
	ldir		;6081	ed b0 	. . 
	pop hl			;6083	e1 	. 
	push hl			;6084	e5 	. 
	call sub_c793h		;6085	cd 93 c7 	. . . 
	pop hl			;6088	e1 	. 
	ld de,00006h		;6089	11 06 00 	. . . 
	add hl,de			;608c	19 	. 
	pop bc			;608d	c1 	. 
	djnz l6051h		;608e	10 c1 	. . 
	ret			;6090	c9 	. 
sub_6091h:
	ld hl,l62d7h		;6091	21 d7 62 	! . b 
	push hl			;6094	e5 	. 
	call sub_c679h		;6095	cd 79 c6 	. y . 
	pop hl			;6098	e1 	. 
	inc hl			;6099	23 	# 
	call sub_c681h		;609a	cd 81 c6 	. . . 
	or a			;609d	b7 	. 
	sbc hl,hl		;609e	ed 62 	. b 
	ld (lc80ch),hl		;60a0	22 0c c8 	" . . 
	ld (lc80eh),hl		;60a3	22 0e c8 	" . . 
	jp lc600h		;60a6	c3 00 c6 	. . . 
	inc b			;60a9	04 	. 
l60aah:
	nop			;60aa	00 	. 
	nop			;60ab	00 	. 
	nop			;60ac	00 	. 
	nop			;60ad	00 	. 
	nop			;60ae	00 	. 
	nop			;60af	00 	. 
	nop			;60b0	00 	. 
	nop			;60b1	00 	. 
	nop			;60b2	00 	. 
	nop			;60b3	00 	. 
	nop			;60b4	00 	. 
	nop			;60b5	00 	. 
	nop			;60b6	00 	. 
	nop			;60b7	00 	. 
	nop			;60b8	00 	. 
	nop			;60b9	00 	. 
	nop			;60ba	00 	. 
	nop			;60bb	00 	. 
	nop			;60bc	00 	. 
	nop			;60bd	00 	. 
	nop			;60be	00 	. 
	nop			;60bf	00 	. 
	nop			;60c0	00 	. 
	nop			;60c1	00 	. 
	nop			;60c2	00 	. 
	nop			;60c3	00 	. 
	nop			;60c4	00 	. 
	nop			;60c5	00 	. 
	nop			;60c6	00 	. 
	nop			;60c7	00 	. 
	nop			;60c8	00 	. 
	nop			;60c9	00 	. 
	nop			;60ca	00 	. 
	nop			;60cb	00 	. 
	nop			;60cc	00 	. 
	nop			;60cd	00 	. 
	nop			;60ce	00 	. 
	nop			;60cf	00 	. 
	nop			;60d0	00 	. 
	nop			;60d1	00 	. 
	nop			;60d2	00 	. 
	nop			;60d3	00 	. 
	nop			;60d4	00 	. 
	nop			;60d5	00 	. 
	nop			;60d6	00 	. 
	nop			;60d7	00 	. 
	nop			;60d8	00 	. 
	nop			;60d9	00 	. 
	nop			;60da	00 	. 
	nop			;60db	00 	. 
	nop			;60dc	00 	. 
	nop			;60dd	00 	. 
	nop			;60de	00 	. 
	nop			;60df	00 	. 
	nop			;60e0	00 	. 
	nop			;60e1	00 	. 
	nop			;60e2	00 	. 
	nop			;60e3	00 	. 
	nop			;60e4	00 	. 
	nop			;60e5	00 	. 
	nop			;60e6	00 	. 
	nop			;60e7	00 	. 
	nop			;60e8	00 	. 
	nop			;60e9	00 	. 
	nop			;60ea	00 	. 
	nop			;60eb	00 	. 
	nop			;60ec	00 	. 
	nop			;60ed	00 	. 
	nop			;60ee	00 	. 
	nop			;60ef	00 	. 
	nop			;60f0	00 	. 
	nop			;60f1	00 	. 
	nop			;60f2	00 	. 
	nop			;60f3	00 	. 
	nop			;60f4	00 	. 
	nop			;60f5	00 	. 
	nop			;60f6	00 	. 
	nop			;60f7	00 	. 
	nop			;60f8	00 	. 
	nop			;60f9	00 	. 
	nop			;60fa	00 	. 
	nop			;60fb	00 	. 
	nop			;60fc	00 	. 
	nop			;60fd	00 	. 
	nop			;60fe	00 	. 
	nop			;60ff	00 	. 
	nop			;6100	00 	. 
l6101h:
	nop			;6101	00 	. 
	nop			;6102	00 	. 
	nop			;6103	00 	. 
	nop			;6104	00 	. 
	nop			;6105	00 	. 
	inc bc			;6106	03 	. 
l6107h:
	nop			;6107	00 	. 
	nop			;6108	00 	. 
	nop			;6109	00 	. 
	ld bc,00102h		;610a	01 02 01 	. . . 
	ld bc,00000h		;610d	01 00 00 	. . . 
	inc e			;6110	1c 	. 
	ld a,(00101h)		;6111	3a 01 01 	: . . 
	nop			;6114	00 	. 
	nop			;6115	00 	. 
	nop			;6116	00 	. 
	nop			;6117	00 	. 
	ld (bc),a			;6118	02 	. 
	ld (bc),a			;6119	02 	. 
	nop			;611a	00 	. 
	nop			;611b	00 	. 
	sub l			;611c	95 	. 
	adc a,b			;611d	88 	. 
	nop			;611e	00 	. 
	nop			;611f	00 	. 
	nop			;6120	00 	. 
	ld bc,00102h		;6121	01 02 01 	. . . 
	ld bc,00000h		;6124	01 00 00 	. . . 
	inc e			;6127	1c 	. 
	ld a,(00101h)		;6128	3a 01 01 	: . . 
	nop			;612b	00 	. 
	nop			;612c	00 	. 
	nop			;612d	00 	. 
	nop			;612e	00 	. 
	ld (bc),a			;612f	02 	. 
	ld (bc),a			;6130	02 	. 
	nop			;6131	00 	. 
	nop			;6132	00 	. 
	sub l			;6133	95 	. 
	adc a,b			;6134	88 	. 
	nop			;6135	00 	. 
	nop			;6136	00 	. 
	nop			;6137	00 	. 
	ld bc,00102h		;6138	01 02 01 	. . . 
	ld bc,00000h		;613b	01 00 00 	. . . 
	inc e			;613e	1c 	. 
	ld a,(00101h)		;613f	3a 01 01 	: . . 
	nop			;6142	00 	. 
	nop			;6143	00 	. 
	nop			;6144	00 	. 
	nop			;6145	00 	. 
	ld (bc),a			;6146	02 	. 
	ld (bc),a			;6147	02 	. 
	nop			;6148	00 	. 
	nop			;6149	00 	. 
	sub l			;614a	95 	. 
	adc a,b			;614b	88 	. 
	nop			;614c	00 	. 
	nop			;614d	00 	. 
	nop			;614e	00 	. 
	ld bc,00102h		;614f	01 02 01 	. . . 
	ld bc,00000h		;6152	01 00 00 	. . . 
	inc e			;6155	1c 	. 
	ld a,(00101h)		;6156	3a 01 01 	: . . 
	nop			;6159	00 	. 
	nop			;615a	00 	. 
	nop			;615b	00 	. 
	nop			;615c	00 	. 
	ld (bc),a			;615d	02 	. 
	ld (bc),a			;615e	02 	. 
	nop			;615f	00 	. 
	nop			;6160	00 	. 
	sub l			;6161	95 	. 
	adc a,b			;6162	88 	. 
l6163h:
	nop			;6163	00 	. 
	nop			;6164	00 	. 
	nop			;6165	00 	. 
	dec b			;6166	05 	. 
	ld de,00101h		;6167	11 01 01 	. . . 
	nop			;616a	00 	. 
	nop			;616b	00 	. 
	jr nz,l61adh		;616c	20 3f 	  ? 
	ld bc,00001h		;616e	01 01 00 	. . . 
	rst 30h			;6171	f7 	. 
	nop			;6172	00 	. 
	nop			;6173	00 	. 
	ld bc,00002h		;6174	01 02 00 	. . . 
	nop			;6177	00 	. 
	ld h,b			;6178	60 	` 
	adc a,c			;6179	89 	. 
l617ah:
	ld a,(bc)			;617a	0a 	. 
	add hl,bc			;617b	09 	. 
	add hl,bc			;617c	09 	. 
	ex af,af'			;617d	08 	. 
	rlca			;617e	07 	. 
	rlca			;617f	07 	. 
	ld b,006h		;6180	06 06 	. . 
	dec b			;6182	05 	. 
	inc b			;6183	04 	. 
	inc b			;6184	04 	. 
	inc bc			;6185	03 	. 
	ld (bc),a			;6186	02 	. 
	ld (bc),a			;6187	02 	. 
	ld bc,00001h		;6188	01 01 00 	. . . 
	nop			;618b	00 	. 
l618ch:
	ld bc,00302h		;618c	01 02 03 	. . . 
	inc b			;618f	04 	. 
	dec b			;6190	05 	. 
	ld b,007h		;6191	06 07 	. . 
	ex af,af'			;6193	08 	. 
l6194h:
	add hl,bc			;6194	09 	. 
	ld a,(bc)			;6195	0a 	. 
	dec bc			;6196	0b 	. 
	inc c			;6197	0c 	. 
	nop			;6198	00 	. 
l6199h:
	nop			;6199	00 	. 
	nop			;619a	00 	. 
l619bh:
	nop			;619b	00 	. 
	nop			;619c	00 	. 
	nop			;619d	00 	. 
	ld bc,0002eh		;619e	01 2e 00 	. . . 
	rla			;61a1	17 	. 
	inc (hl)			;61a2	34 	4 
	nop			;61a3	00 	. 
	rla			;61a4	17 	. 
	adc a,a			;61a5	8f 	. 
	nop			;61a6	00 	. 
	add hl,de			;61a7	19 	. 
	xor c			;61a8	a9 	. 
	nop			;61a9	00 	. 
	add hl,de			;61aa	19 	. 
	rst 8			;61ab	cf 	. 
	nop			;61ac	00 	. 
l61adh:
	ld (de),a			;61ad	12 	. 
	jp (hl)			;61ae	e9 	. 
	nop			;61af	00 	. 
	ld (de),a			;61b0	12 	. 
	rra			;61b1	1f 	. 
	ld bc,00018h		;61b2	01 18 00 	. . . 
	nop			;61b5	00 	. 
	nop			;61b6	00 	. 
	or h			;61b7	b4 	. 
	ld bc,00018h		;61b8	01 18 00 	. . . 
	nop			;61bb	00 	. 
	nop			;61bc	00 	. 
	ex af,af'			;61bd	08 	. 
	ld (bc),a			;61be	02 	. 
	ld a,(de)			;61bf	1a 	. 
	ld a,(de)			;61c0	1a 	. 
	ld (bc),a			;61c1	02 	. 
	ld a,(de)			;61c2	1a 	. 
	ld l,002h		;61c3	2e 02 	. . 
	ld a,(de)			;61c5	1a 	. 
	ld a,(01a02h)		;61c6	3a 02 1a 	: . . 
l61c9h:
	nop			;61c9	00 	. 
l61cah:
	nop			;61ca	00 	. 
l61cbh:
	nop			;61cb	00 	. 
l61cch:
	nop			;61cc	00 	. 
l61cdh:
	nop			;61cd	00 	. 
l61ceh:
	nop			;61ce	00 	. 
l61cfh:
	nop			;61cf	00 	. 
l61d0h:
	ld b,(hl)			;61d0	46 	F 
	ld l,c			;61d1	69 	i 
	ld l,(hl)			;61d2	6e 	n 
	ld h,c			;61d3	61 	a 
	ld l,h			;61d4	6c 	l 
l61d5h:
	jr nz,l61f7h		;61d5	20 20 	    
	ld d,e			;61d7	53 	S 
	ld h,e			;61d8	63 	c 
	ld l,a			;61d9	6f 	o 
	ld (hl),d			;61da	72 	r 
	ld h,l			;61db	65 	e 
	ld a,(02020h)		;61dc	3a 20 20 	:     
	jr nz,l6201h		;61df	20 20 	    
	jr nz,l6203h		;61e1	20 20 	    
	jr nz,l6205h		;61e3	20 20 	    
	jr nc,$+34		;61e5	30 20 	0   
	jr nz,$+34		;61e7	20 20 	    
	jr nz,l620bh		;61e9	20 20 	    
l61ebh:
	jr nz,l620dh		;61eb	20 20 	    
	jr nz,l620fh		;61ed	20 20 	    
	jr nz,$+34		;61ef	20 20 	    
	jr nz,l6213h		;61f1	20 20 	    
	jr nz,$+34		;61f3	20 20 	    
	jr nz,$+34		;61f5	20 20 	    
l61f7h:
	jr nz,$+34		;61f7	20 20 	    
	jr nz,$+34		;61f9	20 20 	    
	jr nz,$+34		;61fb	20 20 	    
	jr nz,l621fh		;61fd	20 20 	    
	jr nz,l624dh		;61ff	20 4c 	  L 
l6201h:
	ld h,l			;6201	65 	e 
	halt			;6202	76 	v 
l6203h:
	ld h,l			;6203	65 	e 
	ld l,h			;6204	6c 	l 
l6205h:
	ld a,(02020h)		;6205	3a 20 20 	:     
l6208h:
	ld sp,02020h		;6208	31 20 20 	1     
l620bh:
	ld b,a			;620b	47 	G 
	ld l,b			;620c	68 	h 
l620dh:
	ld l,a			;620d	6f 	o 
	ld (hl),e			;620e	73 	s 
l620fh:
	ld (hl),h			;620f	74 	t 
	ld a,(02020h)		;6210	3a 20 20 	:     
l6213h:
	inc (hl)			;6213	34 	4 
	jr nz,l6236h		;6214	20 20 	    
	jr nz,l6238h		;6216	20 20 	    
	jr nz,l623ah		;6218	20 20 	    
	jr nz,l623ch		;621a	20 20 	    
	jr nz,l624eh		;621c	20 30 	  0 
l621eh:
	nop			;621e	00 	. 
l621fh:
	nop			;621f	00 	. 
l6220h:
	ld (l8162h),hl		;6220	22 62 81 	" b . 
	add a,e			;6223	83 	. 
	add a,l			;6224	85 	. 
	add a,(hl)			;6225	86 	. 
	adc a,a			;6226	8f 	. 
	sub l			;6227	95 	. 
	sub (hl)			;6228	96 	. 
	sub a			;6229	97 	. 
	sbc a,a			;622a	9f 	. 
	or e			;622b	b3 	. 
	cp a			;622c	bf 	. 
	nop			;622d	00 	. 
l622eh:
	ld a,(de)			;622e	1a 	. 
	rst 0			;622f	c7 	. 
	ld l,a			;6230	6f 	o 
	ld h,d			;6231	62 	b 
	ld a,(bc)			;6232	0a 	. 
	nop			;6233	00 	. 
	ld a,(de)			;6234	1a 	. 
	rst 0			;6235	c7 	. 
l6236h:
	ld l,a			;6236	6f 	o 
	ld h,d			;6237	62 	b 
l6238h:
	ex af,af'			;6238	08 	. 
	nop			;6239	00 	. 
l623ah:
	ex af,af'			;623a	08 	. 
	rst 0			;623b	c7 	. 
l623ch:
	add a,b			;623c	80 	. 
	ld h,d			;623d	62 	b 
	ld b,000h		;623e	06 00 	. . 
	ex af,af'			;6240	08 	. 
	rst 0			;6241	c7 	. 
	add a,b			;6242	80 	. 
	ld h,d			;6243	62 	b 
	inc bc			;6244	03 	. 
	nop			;6245	00 	. 
	dec d			;6246	15 	. 
	rst 0			;6247	c7 	. 
	sub c			;6248	91 	. 
	ld h,d			;6249	62 	b 
	ld bc,01500h		;624a	01 00 15 	. . . 
l624dh:
	rst 0			;624d	c7 	. 
l624eh:
	sub c			;624e	91 	. 
	ld h,d			;624f	62 	b 
	ld bc,0fb00h		;6250	01 00 fb 	. . . 
	add a,0a2h		;6253	c6 a2 	. . 
	ld h,d			;6255	62 	b 
	rst 38h			;6256	ff 	. 
	nop			;6257	00 	. 
	ei			;6258	fb 	. 
	add a,0b3h		;6259	c6 b3 	. . 
	ld h,d			;625b	62 	b 
	ld bc,02000h		;625c	01 00 20 	. .   
	jr nz,$+34		;625f	20 20 	    
	jr nz,l6294h		;6261	20 31 	  1 
	inc sp			;6263	33 	3 
	jr nz,l62adh		;6264	20 47 	  G 
	ld c,b			;6266	48 	H 
	ld c,a			;6267	4f 	O 
	ld d,e			;6268	53 	S 
	ld d,h			;6269	54 	T 
	ld d,e			;626a	53 	S 
	jr nz,l628dh		;626b	20 20 	    
	jr nz,l628fh		;626d	20 20 	    
l626fh:
	jr nz,l6291h		;626f	20 20 	    
	ld b,h			;6271	44 	D 
	ld h,l			;6272	65 	e 
	ld h,c			;6273	61 	a 
	ld h,h			;6274	64 	d 
	jr nz,l62e6h		;6275	20 6f 	  o 
	ld h,(hl)			;6277	66 	f 
	jr nz,l62c8h		;6278	20 4e 	  N 
	ld l,c			;627a	69 	i 
	ld h,a			;627b	67 	g 
	ld l,b			;627c	68 	h 
	ld (hl),h			;627d	74 	t 
	jr nz,l62a0h		;627e	20 20 	    
	jr nz,l62a2h		;6280	20 20 	    
	ld b,a			;6282	47 	G 
	ld l,a			;6283	6f 	o 
	ld l,a			;6284	6f 	o 
	ld h,h			;6285	64 	d 
	jr nz,$+79		;6286	20 4d 	  M 
	ld l,a			;6288	6f 	o 
	ld (hl),l			;6289	75 	u 
	ld (hl),d			;628a	72 	r 
	ld l,(hl)			;628b	6e 	n 
	ld l,c			;628c	69 	i 
l628dh:
	ld l,(hl)			;628d	6e 	n 
	ld h,a			;628e	67 	g 
l628fh:
	jr nz,l62b1h		;628f	20 20 	    
l6291h:
	ld d,h			;6291	54 	T 
	ld l,b			;6292	68 	h 
	ld h,l			;6293	65 	e 
l6294h:
	jr nz,l62e3h		;6294	20 4d 	  M 
	ld l,c			;6296	69 	i 
	ld h,h			;6297	64 	d 
	ld l,(hl)			;6298	6e 	n 
	ld l,c			;6299	69 	i 
	ld h,a			;629a	67 	g 
	ld l,b			;629b	68 	h 
	ld (hl),h			;629c	74 	t 
	jr nz,l62f1h		;629d	20 52 	  R 
	ld l,c			;629f	69 	i 
l62a0h:
	ld h,h			;62a0	64 	d 
	ld h,l			;62a1	65 	e 
l62a2h:
	jr nz,$+34		;62a2	20 20 	    
	ld d,h			;62a4	54 	T 
	ld l,b			;62a5	68 	h 
	ld h,l			;62a6	65 	e 
	jr nz,l62f7h		;62a7	20 4e 	  N 
	ld l,c			;62a9	69 	i 
	ld h,a			;62aa	67 	g 
	ld l,b			;62ab	68 	h 
	ld (hl),h			;62ac	74 	t 
l62adh:
	ld l,l			;62ad	6d 	m 
	ld h,c			;62ae	61 	a 
	ld (hl),d			;62af	72 	r 
	ld h,l			;62b0	65 	e 
l62b1h:
	jr nz,l62d3h		;62b1	20 20 	    
	jr nz,$+34		;62b3	20 20 	    
	jr nz,l62d7h		;62b5	20 20 	    
	ld b,h			;62b7	44 	D 
	ld h,l			;62b8	65 	e 
	ld h,c			;62b9	61 	a 
	ld h,h			;62ba	64 	d 
	jr nz,l6302h		;62bb	20 45 	  E 
	ld l,(hl)			;62bd	6e 	n 
	ld h,h			;62be	64 	d 
	jr nz,l62e1h		;62bf	20 20 	    
	jr nz,l62e3h		;62c1	20 20 	    
	jr nz,l62efh		;62c3	20 2a 	  * 
	ld hl,(04220h)		;62c5	2a 20 42 	*   B 
l62c8h:
	ld l,a			;62c8	6f 	o 
	ld l,(hl)			;62c9	6e 	n 
	ld (hl),l			;62ca	75 	u 
	ld (hl),e			;62cb	73 	s 
	jr nz,l6322h		;62cc	20 54 	  T 
	ld (hl),d			;62ce	72 	r 
	ld l,c			;62cf	69 	i 
	ld (hl),b			;62d0	70 	p 
	jr nz,l62fdh		;62d1	20 2a 	  * 
l62d3h:
	ld hl,(00120h)		;62d3	2a 20 01 	*   . 
	nop			;62d6	00 	. 
l62d7h:
	ld (bc),a			;62d7	02 	. 
	inc bc			;62d8	03 	. 
	inc b			;62d9	04 	. 
	dec b			;62da	05 	. 
	ld b,007h		;62db	06 07 	. . 
	ex af,af'			;62dd	08 	. 
	add hl,bc			;62de	09 	. 
	ld a,(bc)			;62df	0a 	. 
	dec bc			;62e0	0b 	. 
l62e1h:
	nop			;62e1	00 	. 
l62e2h:
	adc a,h			;62e2	8c 	. 
l62e3h:
	cp 00ch		;62e3	fe 0c 	. . 
	rst 38h			;62e5	ff 	. 
l62e6h:
	dec c			;62e6	0d 	. 
	rst 38h			;62e7	ff 	. 
	ld c,0ffh		;62e8	0e ff 	. . 
	rrca			;62ea	0f 	. 
	rst 38h			;62eb	ff 	. 
	djnz l62ffh		;62ec	10 11 	. . 
	ld (de),a			;62ee	12 	. 
l62efh:
	rst 38h			;62ef	ff 	. 
	inc de			;62f0	13 	. 
l62f1h:
	inc d			;62f1	14 	. 
	dec d			;62f2	15 	. 
	rst 38h			;62f3	ff 	. 
	ld d,0ffh		;62f4	16 ff 	. . 
	rla			;62f6	17 	. 
l62f7h:
	rst 38h			;62f7	ff 	. 
	jr $+1		;62f8	18 ff 	. . 
	add hl,de			;62fa	19 	. 
	rst 38h			;62fb	ff 	. 
	ld a,(de)			;62fc	1a 	. 
l62fdh:
	rst 38h			;62fd	ff 	. 
	dec de			;62fe	1b 	. 
l62ffh:
	rst 38h			;62ff	ff 	. 
	inc e			;6300	1c 	. 
	rst 38h			;6301	ff 	. 
l6302h:
	dec e			;6302	1d 	. 
	nop			;6303	00 	. 
l6304h:
	add a,b			;6304	80 	. 
	dec e			;6305	1d 	. 
	nop			;6306	00 	. 
l6307h:
	add a,b			;6307	80 	. 
	ld e,000h		;6308	1e 00 	. . 
l630ah:
	dec (hl)			;630a	35 	5 
	nop			;630b	00 	. 
l630ch:
	ld e,000h		;630c	1e 00 	. . 
l630eh:
	scf			;630e	37 	7 
	nop			;630f	00 	. 
l6310h:
	jr c,l6312h		;6310	38 00 	8 . 
l6312h:
	add hl,sp			;6312	39 	9 
	nop			;6313	00 	. 
l6314h:
	nop			;6314	00 	. 
	nop			;6315	00 	. 
	nop			;6316	00 	. 
	ld bc,04703h		;6317	01 03 47 	. . G 
	ld c,b			;631a	48 	H 
	ld c,a			;631b	4f 	O 
	ld d,e			;631c	53 	S 
	ld d,h			;631d	54 	T 
	ld d,e			;631e	53 	S 
	cpl			;631f	2f 	/ 
	ld c,b			;6320	48 	H 
	ld c,c			;6321	49 	I 
l6322h:
	ld d,e			;6322	53 	S 
	inc bc			;6323	03 	. 
	nop			;6324	00 	. 
	nop			;6325	00 	. 
	nop			;6326	00 	. 
	nop			;6327	00 	. 
	nop			;6328	00 	. 
	nop			;6329	00 	. 
	nop			;632a	00 	. 
	nop			;632b	00 	. 
	nop			;632c	00 	. 
	nop			;632d	00 	. 
	nop			;632e	00 	. 
	nop			;632f	00 	. 
	nop			;6330	00 	. 
	nop			;6331	00 	. 
	nop			;6332	00 	. 
	nop			;6333	00 	. 
	nop			;6334	00 	. 
	nop			;6335	00 	. 
	nop			;6336	00 	. 
	nop			;6337	00 	. 
	nop			;6338	00 	. 
	nop			;6339	00 	. 
	nop			;633a	00 	. 
	nop			;633b	00 	. 
	nop			;633c	00 	. 
	nop			;633d	00 	. 
	nop			;633e	00 	. 
	nop			;633f	00 	. 
	nop			;6340	00 	. 
	nop			;6341	00 	. 
	nop			;6342	00 	. 
	nop			;6343	00 	. 
	nop			;6344	00 	. 
	nop			;6345	00 	. 
	nop			;6346	00 	. 
	nop			;6347	00 	. 
	nop			;6348	00 	. 
	nop			;6349	00 	. 
	nop			;634a	00 	. 
l634bh:
	jr nz,l636dh		;634b	20 20 	    
	jr nz,l636fh		;634d	20 20 	    
	jr nz,l6371h		;634f	20 20 	    
	jr nz,l6373h		;6351	20 20 	    
	jr nz,l6375h		;6353	20 20 	    
	jr nz,l6377h		;6355	20 20 	    
	jr nz,l6379h		;6357	20 20 	    
	jr nz,l637bh		;6359	20 20 	    
	jr nz,l637dh		;635b	20 20 	    
	jr nz,l637fh		;635d	20 20 	    
	jr nz,l6381h		;635f	20 20 	    
	jr nz,l6383h		;6361	20 20 	    
	jr nz,l6385h		;6363	20 20 	    
	jr nz,l6387h		;6365	20 20 	    
	jr nz,l6389h		;6367	20 20 	    
	jr nz,l638bh		;6369	20 20 	    
	jr nz,l638dh		;636b	20 20 	    
l636dh:
	jr nz,l638fh		;636d	20 20 	    
l636fh:
	jr nz,l6391h		;636f	20 20 	    
l6371h:
	jr nz,l6393h		;6371	20 20 	    
l6373h:
	jr nz,l6395h		;6373	20 20 	    
l6375h:
	jr nz,l6397h		;6375	20 20 	    
l6377h:
	jr nz,l6399h		;6377	20 20 	    
l6379h:
	jr nz,l639bh		;6379	20 20 	    
l637bh:
	jr nz,l639dh		;637b	20 20 	    
l637dh:
	jr nz,l639fh		;637d	20 20 	    
l637fh:
	jr nz,l63a1h		;637f	20 20 	    
l6381h:
	jr nz,l63a3h		;6381	20 20 	    
l6383h:
	jr nz,l63a5h		;6383	20 20 	    
l6385h:
	jr nz,l63a7h		;6385	20 20 	    
l6387h:
	jr nz,l63a9h		;6387	20 20 	    
l6389h:
	jr nz,l63abh		;6389	20 20 	    
l638bh:
	jr nz,l63adh		;638b	20 20 	    
l638dh:
	jr nz,l63afh		;638d	20 20 	    
l638fh:
	jr nz,l63b1h		;638f	20 20 	    
l6391h:
	jr nz,l63b3h		;6391	20 20 	    
l6393h:
	jr nz,l63b5h		;6393	20 20 	    
l6395h:
	jr nz,l63b7h		;6395	20 20 	    
l6397h:
	jr nz,l63b9h		;6397	20 20 	    
l6399h:
	jr nz,l63bbh		;6399	20 20 	    
l639bh:
	jr nz,l63bdh		;639b	20 20 	    
l639dh:
	jr nz,l63bfh		;639d	20 20 	    
l639fh:
	jr nz,l63c1h		;639f	20 20 	    
l63a1h:
	jr nz,l63c3h		;63a1	20 20 	    
l63a3h:
	jr nz,l63c5h		;63a3	20 20 	    
l63a5h:
	jr nz,l63c7h		;63a5	20 20 	    
l63a7h:
	jr nz,l63c9h		;63a7	20 20 	    
l63a9h:
	jr nz,l63cbh		;63a9	20 20 	    
l63abh:
	jr nz,l63cdh		;63ab	20 20 	    
l63adh:
	jr nz,l63cfh		;63ad	20 20 	    
l63afh:
	jr nz,l63d1h		;63af	20 20 	    
l63b1h:
	jr nz,l63d3h		;63b1	20 20 	    
l63b3h:
	jr nz,l63d5h		;63b3	20 20 	    
l63b5h:
	jr nz,l63d7h		;63b5	20 20 	    
l63b7h:
	jr nz,l63d9h		;63b7	20 20 	    
l63b9h:
	jr nz,l63dbh		;63b9	20 20 	    
l63bbh:
	jr nz,l63ddh		;63bb	20 20 	    
l63bdh:
	jr nz,l63dfh		;63bd	20 20 	    
l63bfh:
	jr nz,l63e1h		;63bf	20 20 	    
l63c1h:
	jr nz,l63e3h		;63c1	20 20 	    
l63c3h:
	jr nz,l63e5h		;63c3	20 20 	    
l63c5h:
	jr nz,l63e7h		;63c5	20 20 	    
l63c7h:
	jr nz,l63e9h		;63c7	20 20 	    
l63c9h:
	jr nz,l63ebh		;63c9	20 20 	    
l63cbh:
	jr nz,l63edh		;63cb	20 20 	    
l63cdh:
	jr nz,l63efh		;63cd	20 20 	    
l63cfh:
	jr nz,l63f1h		;63cf	20 20 	    
l63d1h:
	jr nz,l63f3h		;63d1	20 20 	    
l63d3h:
	jr nz,l63f5h		;63d3	20 20 	    
l63d5h:
	jr nz,l63f7h		;63d5	20 20 	    
l63d7h:
	jr nz,l63f9h		;63d7	20 20 	    
l63d9h:
	jr nz,l63fbh		;63d9	20 20 	    
l63dbh:
	jr nz,l63fdh		;63db	20 20 	    
l63ddh:
	jr nz,l63ffh		;63dd	20 20 	    
l63dfh:
	jr nz,l6401h		;63df	20 20 	    
l63e1h:
	jr nz,l6403h		;63e1	20 20 	    
l63e3h:
	jr nz,l6405h		;63e3	20 20 	    
l63e5h:
	jr nz,l6407h		;63e5	20 20 	    
l63e7h:
	jr nz,l6409h		;63e7	20 20 	    
l63e9h:
	jr nz,l640bh		;63e9	20 20 	    
l63ebh:
	jr nz,l640dh		;63eb	20 20 	    
l63edh:
	jr nz,l640fh		;63ed	20 20 	    
l63efh:
	jr nz,l6411h		;63ef	20 20 	    
l63f1h:
	jr nz,l6413h		;63f1	20 20 	    
l63f3h:
	jr nz,l6415h		;63f3	20 20 	    
l63f5h:
	jr nz,l6417h		;63f5	20 20 	    
l63f7h:
	jr nz,l6419h		;63f7	20 20 	    
l63f9h:
	jr nz,l641bh		;63f9	20 20 	    
l63fbh:
	jr nz,l641dh		;63fb	20 20 	    
l63fdh:
	jr nz,l641fh		;63fd	20 20 	    
l63ffh:
	jr nz,l6421h		;63ff	20 20 	    
l6401h:
	jr nz,l6423h		;6401	20 20 	    
l6403h:
	jr nz,l6425h		;6403	20 20 	    
l6405h:
	jr nz,l6427h		;6405	20 20 	    
l6407h:
	jr nz,l6429h		;6407	20 20 	    
l6409h:
	jr nz,l642bh		;6409	20 20 	    
l640bh:
	jr nz,l642dh		;640b	20 20 	    
l640dh:
	jr nz,l642fh		;640d	20 20 	    
l640fh:
	jr nz,l6431h		;640f	20 20 	    
l6411h:
	jr nz,l6433h		;6411	20 20 	    
l6413h:
	jr nz,l6435h		;6413	20 20 	    
l6415h:
	jr nz,l6437h		;6415	20 20 	    
l6417h:
	jr nz,l6439h		;6417	20 20 	    
l6419h:
	jr nz,l643bh		;6419	20 20 	    
l641bh:
	jr nz,l643dh		;641b	20 20 	    
l641dh:
	jr nz,l643fh		;641d	20 20 	    
l641fh:
	jr nz,l6441h		;641f	20 20 	    
l6421h:
	jr nz,l6443h		;6421	20 20 	    
l6423h:
	jr nz,l6445h		;6423	20 20 	    
l6425h:
	jr nz,l6447h		;6425	20 20 	    
l6427h:
	jr nz,l6449h		;6427	20 20 	    
l6429h:
	jr nz,l644bh		;6429	20 20 	    
l642bh:
	jr nz,$+34		;642b	20 20 	    
l642dh:
	jr nz,l644fh		;642d	20 20 	    
l642fh:
	jr nz,l6451h		;642f	20 20 	    
l6431h:
	jr nz,l6453h		;6431	20 20 	    
l6433h:
	jr nz,l6455h		;6433	20 20 	    
l6435h:
	jr nz,l6457h		;6435	20 20 	    
l6437h:
	jr nz,$+34		;6437	20 20 	    
l6439h:
	jr nz,l645bh		;6439	20 20 	    
l643bh:
	nop			;643b	00 	. 
	nop			;643c	00 	. 
l643dh:
	nop			;643d	00 	. 
l643eh:
	nop			;643e	00 	. 
l643fh:
	nop			;643f	00 	. 
	nop			;6440	00 	. 
l6441h:
	nop			;6441	00 	. 
	nop			;6442	00 	. 
l6443h:
	nop			;6443	00 	. 
	nop			;6444	00 	. 
l6445h:
	nop			;6445	00 	. 
	nop			;6446	00 	. 
l6447h:
	nop			;6447	00 	. 
	nop			;6448	00 	. 
l6449h:
	nop			;6449	00 	. 
l644ah:
	nop			;644a	00 	. 
l644bh:
	inc b			;644b	04 	. 
	ld bc,00000h		;644c	01 00 00 	. . . 
l644fh:
	sbc a,l			;644f	9d 	. 
	cp b			;6450	b8 	. 
l6451h:
	nop			;6451	00 	. 
	and b			;6452	a0 	. 
l6453h:
	and b			;6453	a0 	. 
	adc a,h			;6454	8c 	. 
l6455h:
	sub b			;6455	90 	. 
	nop			;6456	00 	. 
l6457h:
	defb 0ddh,0aah,000h	;illegal sequence		;6457	dd aa 00 	. . . 
	ret po			;645a	e0 	. 
l645bh:
	add a,c			;645b	81 	. 
	nop			;645c	00 	. 
	jp po,001aah		;645d	e2 aa 01 	. . . 
	dec e			;6460	1d 	. 
	xor d			;6461	aa 	. 
	ld bc,l8321h		;6462	01 21 83 	. ! . 
	xor c			;6465	a9 	. 
	ld bc,0aa5dh		;6466	01 5d aa 	. ] . 
	ld bc,la460h		;6469	01 60 a4 	. ` . 
	ld bc,l9a62h		;646c	01 62 9a 	. b . 
	ld bc,l839dh		;646f	01 9d 83 	. . . 
	add a,c			;6472	81 	. 
	ld bc,083a1h		;6473	01 a1 83 	. . . 
	ld bc,la0d4h		;6476	01 d4 a0 	. . . 
	add a,(hl)			;6479	86 	. 
	add a,e			;647a	83 	. 
	add a,h			;647b	84 	. 
	xor d			;647c	aa 	. 
	ld bc,l95dah+1		;647d	01 db 95 	. . . 
	and b			;6480	a0 	. 
	add a,(hl)			;6481	86 	. 
	adc a,c			;6482	89 	. 
	sub b			;6483	90 	. 
	and b			;6484	a0 	. 
	add a,(hl)			;6485	86 	. 
	adc a,c			;6486	89 	. 
	sub b			;6487	90 	. 
	add a,e			;6488	83 	. 
	sub a			;6489	97 	. 
	add a,c			;648a	81 	. 
	sbc a,b			;648b	98 	. 
	add a,e			;648c	83 	. 
	and h			;648d	a4 	. 
	ld (bc),a			;648e	02 	. 
	inc d			;648f	14 	. 
	xor d			;6490	aa 	. 
	ld (bc),a			;6491	02 	. 
	jr l643eh		;6492	18 aa 	. . 
	ld (bc),a			;6494	02 	. 
	dec de			;6495	1b 	. 
	sub l			;6496	95 	. 
	xor d			;6497	aa 	. 
	ld (bc),a			;6498	02 	. 
	rra			;6499	1f 	. 
	sub l			;649a	95 	. 
	add a,d			;649b	82 	. 
	and h			;649c	a4 	. 
	ld (bc),a			;649d	02 	. 
	dec h			;649e	25 	% 
	sub l			;649f	95 	. 
	ld (bc),a			;64a0	02 	. 
	daa			;64a1	27 	' 
	adc a,c			;64a2	89 	. 
	sub b			;64a3	90 	. 
	ld (bc),a			;64a4	02 	. 
	ld d,h			;64a5	54 	T 
	xor d			;64a6	aa 	. 
	ld (bc),a			;64a7	02 	. 
	ld d,(hl)			;64a8	56 	V 
	add a,e			;64a9	83 	. 
	sub l			;64aa	95 	. 
	xor d			;64ab	aa 	. 
	add a,e			;64ac	83 	. 
	add a,e			;64ad	83 	. 
	sub l			;64ae	95 	. 
	xor d			;64af	aa 	. 
	ld (bc),a			;64b0	02 	. 
	ld e,a			;64b1	5f 	_ 
	sub l			;64b2	95 	. 
	and b			;64b3	a0 	. 
	ld (bc),a			;64b4	02 	. 
	ld h,d			;64b5	62 	b 
	add a,e			;64b6	83 	. 
	sub h			;64b7	94 	. 
	ld (bc),a			;64b8	02 	. 
	ld h,l			;64b9	65 	e 
	sub l			;64ba	95 	. 
	ld (bc),a			;64bb	02 	. 
	ld h,a			;64bc	67 	g 
	sub b			;64bd	90 	. 
	add a,d			;64be	82 	. 
	xor c			;64bf	a9 	. 
	ld (bc),a			;64c0	02 	. 
	sub l			;64c1	95 	. 
	adc a,c			;64c2	89 	. 
	adc a,h			;64c3	8c 	. 
	add a,c			;64c4	81 	. 
	adc a,d			;64c5	8a 	. 
	ld (bc),a			;64c6	02 	. 
	sbc a,e			;64c7	9b 	. 
	add a,l			;64c8	85 	. 
	ld (bc),a			;64c9	02 	. 
	sbc a,l			;64ca	9d 	. 
	adc a,c			;64cb	89 	. 
	add a,(hl)			;64cc	86 	. 
	ld (bc),a			;64cd	02 	. 
	and c			;64ce	a1 	. 
	adc a,c			;64cf	89 	. 
	add a,(hl)			;64d0	86 	. 
	ld (bc),a			;64d1	02 	. 
	and l			;64d2	a5 	. 
	add a,l			;64d3	85 	. 
	ld (bc),a			;64d4	02 	. 
	and a			;64d5	a7 	. 
	add a,d			;64d6	82 	. 
	adc a,h			;64d7	8c 	. 
	add a,c			;64d8	81 	. 
	inc bc			;64d9	03 	. 
	dec c			;64da	0d 	. 
	jr z,l6540h		;64db	28 63 	( c 
	add hl,hl			;64dd	29 	) 
	inc bc			;64de	03 	. 
	ld de,03931h		;64df	11 31 39 	. 1 9 
	jr c,l6517h		;64e2	38 33 	8 3 
	inc bc			;64e4	03 	. 
	ld d,042h		;64e5	16 42 	. B 
	ld (hl),d			;64e7	72 	r 
	ld a,c			;64e8	79 	y 
	ld h,c			;64e9	61 	a 
	ld l,(hl)			;64ea	6e 	n 
	inc bc			;64eb	03 	. 
	inc e			;64ec	1c 	. 
	ld b,l			;64ed	45 	E 
	ld h,a			;64ee	67 	g 
	ld h,a			;64ef	67 	g 
	ld h,l			;64f0	65 	e 
	ld (hl),d			;64f1	72 	r 
	ld (hl),e			;64f2	73 	s 
	inc bc			;64f3	03 	. 
	inc hl			;64f4	23 	# 
	ld h,c			;64f5	61 	a 
	ld l,(hl)			;64f6	6e 	n 
	ld h,h			;64f7	64 	d 
	inc bc			;64f8	03 	. 
	daa			;64f9	27 	' 
	ld c,h			;64fa	4c 	L 
	ld h,c			;64fb	61 	a 
	ld (hl),d			;64fc	72 	r 
	ld (hl),d			;64fd	72 	r 
	ld a,c			;64fe	79 	y 
	inc bc			;64ff	03 	. 
	dec l			;6500	2d 	- 
	ld d,b			;6501	50 	P 
	ld h,c			;6502	61 	a 
	ld a,c			;6503	79 	y 
	ld l,(hl)			;6504	6e 	n 
	ld h,l			;6505	65 	e 
	inc bc			;6506	03 	. 
	ld b,l			;6507	45 	E 
	ld c,l			;6508	4d 	M 
	ld (hl),l			;6509	75 	u 
	ld (hl),e			;650a	73 	s 
	ld l,c			;650b	69 	i 
	ld h,e			;650c	63 	c 
	inc bc			;650d	03 	. 
	ld c,e			;650e	4b 	K 
	ld h,c			;650f	61 	a 
	ld l,(hl)			;6510	6e 	n 
	ld h,h			;6511	64 	d 
	inc bc			;6512	03 	. 
	ld c,a			;6513	4f 	O 
	ld d,e			;6514	53 	S 
	ld l,a			;6515	6f 	o 
	ld (hl),l			;6516	75 	u 
l6517h:
	ld l,(hl)			;6517	6e 	n 
	ld h,h			;6518	64 	d 
	inc bc			;6519	03 	. 
	ld d,l			;651a	55 	U 
	ld b,l			;651b	45 	E 
	ld h,(hl)			;651c	66 	f 
	ld h,(hl)			;651d	66 	f 
	ld h,l			;651e	65 	e 
	ld h,e			;651f	63 	c 
	ld (hl),h			;6520	74 	t 
	ld (hl),e			;6521	73 	s 
	inc bc			;6522	03 	. 
	ld e,l			;6523	5d 	] 
	ld h,d			;6524	62 	b 
	ld a,c			;6525	79 	y 
	inc bc			;6526	03 	. 
	ld h,b			;6527	60 	` 
	ld b,(hl)			;6528	46 	F 
	ld b,c			;6529	41 	A 
	ld c,(hl)			;652a	4e 	N 
	ld b,(hl)			;652b	46 	F 
	ld b,c			;652c	41 	A 
	ld d,d			;652d	52 	R 
	ld b,l			;652e	45 	E 
	inc bc			;652f	03 	. 
	ld l,b			;6530	68 	h 
	jr z,l6596h		;6531	28 63 	( c 
	add hl,hl			;6533	29 	) 
	inc bc			;6534	03 	. 
	ld l,h			;6535	6c 	l 
	ld sp,03839h		;6536	31 39 38 	1 9 8 
	ld (l7103h),a		;6539	32 03 71 	2 . q 
l653ch:
	ld c,d			;653c	4a 	J 
	ld l,a			;653d	6f 	o 
	ld l,(hl)			;653e	6e 	n 
	inc bc			;653f	03 	. 
l6540h:
	ld (hl),l			;6540	75 	u 
	ld b,d			;6541	42 	B 
	ld l,a			;6542	6f 	o 
	ld l,e			;6543	6b 	k 
l6544h:
	ld h,l			;6544	65 	e 
	ld l,h			;6545	6c 	l 
	ld l,l			;6546	6d 	m 
	ld h,c			;6547	61 	a 
	ld l,(hl)			;6548	6e 	n 
	ld l,003h		;6549	2e 03 	. . 
	add a,e			;654b	83 	. 
	ld (03331h),hl		;654c	22 31 33 	" 1 3 
	inc bc			;654f	03 	. 
	add a,a			;6550	87 	. 
	ld b,a			;6551	47 	G 
	ld c,b			;6552	48 	H 
	ld c,a			;6553	4f 	O 
	ld d,e			;6554	53 	S 
	ld d,h			;6555	54 	T 
	ld d,e			;6556	53 	S 
	ld (l8f03h),hl		;6557	22 03 8f 	" . . 
	ld h,c			;655a	61 	a 
	ld l,(hl)			;655b	6e 	n 
	ld h,h			;655c	64 	d 
	inc bc			;655d	03 	. 
	sub e			;655e	93 	. 
	ld (04146h),hl		;655f	22 46 41 	" F A 
	ld c,(hl)			;6562	4e 	N 
	ld b,(hl)			;6563	46 	F 
	ld b,c			;6564	41 	A 
	ld d,d			;6565	52 	R 
	ld b,l			;6566	45 	E 
	ld (l9d03h),hl		;6567	22 03 9d 	" . . 
	ld h,c			;656a	61 	a 
	ld (hl),d			;656b	72 	r 
	ld h,l			;656c	65 	e 
	inc bc			;656d	03 	. 
	and c			;656e	a1 	. 
	ld d,h			;656f	54 	T 
	ld (hl),d			;6570	72 	r 
	ld h,c			;6571	61 	a 
l6572h:
	ld h,h			;6572	64 	d 
	ld h,l			;6573	65 	e 
	ld l,l			;6574	6d 	m 
	ld h,c			;6575	61 	a 
	ld (hl),d			;6576	72 	r 
	ld l,e			;6577	6b 	k 
	ld (hl),e			;6578	73 	s 
	inc bc			;6579	03 	. 
	xor h			;657a	ac 	. 
	ld l,a			;657b	6f 	o 
	ld h,(hl)			;657c	66 	f 
	inc bc			;657d	03 	. 
	xor a			;657e	af 	. 
	ld d,e			;657f	53 	S 
	ld l,a			;6580	6f 	o 
	ld h,(hl)			;6581	66 	f 
	ld (hl),h			;6582	74 	t 
	ld (hl),a			;6583	77 	w 
	ld h,c			;6584	61 	a 
	ld (hl),d			;6585	72 	r 
	ld h,l			;6586	65 	e 
	inc bc			;6587	03 	. 
	cp b			;6588	b8 	. 
	ld b,c			;6589	41 	A 
	ld h,(hl)			;658a	66 	f 
	ld h,(hl)			;658b	66 	f 
	ld h,c			;658c	61 	a 
	ld l,c			;658d	69 	i 
	ld (hl),d			;658e	72 	r 
	ld l,003h		;658f	2e 03 	. . 
	rst 0			;6591	c7 	. 
	ld c,h			;6592	4c 	L 
	ld l,c			;6593	69 	i 
	ld h,e			;6594	63 	c 
	ld h,l			;6595	65 	e 
l6596h:
	ld l,(hl)			;6596	6e 	n 
	ld (hl),e			;6597	73 	s 
	ld h,l			;6598	65 	e 
	ld h,h			;6599	64 	d 
	inc bc			;659a	03 	. 
	ret nc			;659b	d0 	. 
	ld (hl),h			;659c	74 	t 
	ld l,a			;659d	6f 	o 
	inc bc			;659e	03 	. 
	out (054h),a		;659f	d3 54 	. T 
	ld h,c			;65a1	61 	a 
	ld l,(hl)			;65a2	6e 	n 
	ld h,h			;65a3	64 	d 
	ld a,c			;65a4	79 	y 
	inc bc			;65a5	03 	. 
	exx			;65a6	d9 	. 
	ld b,e			;65a7	43 	C 
	ld l,a			;65a8	6f 	o 
	ld (hl),d			;65a9	72 	r 
	ld (hl),b			;65aa	70 	p 
	ld l,a			;65ab	6f 	o 
	ld (hl),d			;65ac	72 	r 
	ld h,c			;65ad	61 	a 
	ld (hl),h			;65ae	74 	t 
	ld l,c			;65af	69 	i 
	ld l,a			;65b0	6f 	o 
	ld l,(hl)			;65b1	6e 	n 
	inc bc			;65b2	03 	. 
	push hl			;65b3	e5 	. 
	dec l			;65b4	2d 	- 
	inc bc			;65b5	03 	. 
	rst 20h			;65b6	e7 	. 
	ld b,c			;65b7	41 	A 
	ld l,h			;65b8	6c 	l 
	ld l,h			;65b9	6c 	l 
	inc bc			;65ba	03 	. 
	ex de,hl			;65bb	eb 	. 
	ld (hl),d			;65bc	72 	r 
	ld l,c			;65bd	69 	i 
	ld h,a			;65be	67 	g 
	ld l,b			;65bf	68 	h 
	ld (hl),h			;65c0	74 	t 
	ld (hl),e			;65c1	73 	s 
	inc bc			;65c2	03 	. 
	jp p,l6572h		;65c3	f2 72 65 	. r e 
	ld (hl),e			;65c6	73 	s 
	ld h,l			;65c7	65 	e 
	ld (hl),d			;65c8	72 	r 
	halt			;65c9	76 	v 
	ld h,l			;65ca	65 	e 
	ld h,h			;65cb	64 	d 
	ld l,004h		;65cc	2e 04 	. . 
	ld (bc),a			;65ce	02 	. 
	nop			;65cf	00 	. 
	nop			;65d0	00 	. 
	inc c			;65d1	0c 	. 
	and b			;65d2	a0 	. 
	xor h			;65d3	ac 	. 
	ld a,(bc)			;65d4	0a 	. 
	ld (bc),a			;65d5	02 	. 
	adc a,h			;65d6	8c 	. 
	sbc a,h			;65d7	9c 	. 
	adc a,h			;65d8	8c 	. 
	sbc a,h			;65d9	9c 	. 
	adc a,h			;65da	8c 	. 
	xor h			;65db	ac 	. 
	adc a,h			;65dc	8c 	. 
	adc a,h			;65dd	8c 	. 
	sbc a,h			;65de	9c 	. 
	adc a,h			;65df	8c 	. 
	sbc a,h			;65e0	9c 	. 
	xor h			;65e1	ac 	. 
	ld a,(bc)			;65e2	0a 	. 
	ld (bc),a			;65e3	02 	. 
	and h			;65e4	a4 	. 
	nop			;65e5	00 	. 
	ld c,h			;65e6	4c 	L 
	add a,d			;65e7	82 	. 
	sub a			;65e8	97 	. 
	add a,e			;65e9	83 	. 
	ld a,(bc)			;65ea	0a 	. 
	rrca			;65eb	0f 	. 
	sub a			;65ec	97 	. 
	nop			;65ed	00 	. 
	adc a,l			;65ee	8d 	. 
	adc a,e			;65ef	8b 	. 
	sub e			;65f0	93 	. 
	add a,e			;65f1	83 	. 
	ld a,(bc)			;65f2	0a 	. 
	inc b			;65f3	04 	. 
	or e			;65f4	b3 	. 
	ld a,(bc)			;65f5	0a 	. 
	ld (bc),a			;65f6	02 	. 
	sub e			;65f7	93 	. 
	add a,e			;65f8	83 	. 
	ld a,(bc)			;65f9	0a 	. 
	inc b			;65fa	04 	. 
	sbc a,e			;65fb	9b 	. 
	add a,c			;65fc	81 	. 
	nop			;65fd	00 	. 
	push bc			;65fe	c5 	. 
	adc a,h			;65ff	8c 	. 
	cp h			;6600	bc 	. 
	ld a,(bc)			;6601	0a 	. 
	rlca			;6602	07 	. 
	or (hl)			;6603	b6 	. 
	and h			;6604	a4 	. 
	nop			;6605	00 	. 
	pop de			;6606	d1 	. 
	or b			;6607	b0 	. 
	or b			;6608	b0 	. 
	cp d			;6609	ba 	. 
	cp b			;660a	b8 	. 
	cp h			;660b	bc 	. 
	cp h			;660c	bc 	. 
	cp d			;660d	ba 	. 
	or b			;660e	b0 	. 
	or b			;660f	b0 	. 
	sub b			;6610	90 	. 
	and b			;6611	a0 	. 
	and (hl)			;6612	a6 	. 
	cp h			;6613	bc 	. 
	ld a,(bc)			;6614	0a 	. 
	rlca			;6615	07 	. 
	sbc a,h			;6616	9c 	. 
	add a,h			;6617	84 	. 
	nop			;6618	00 	. 
	jp pe,la397h		;6619	ea 97 a3 	. . . 
	or e			;661c	b3 	. 
	sub e			;661d	93 	. 
	add a,e			;661e	83 	. 
	or e			;661f	b3 	. 
	or e			;6620	b3 	. 
	sub e			;6621	93 	. 
	and e			;6622	a3 	. 
	or e			;6623	b3 	. 
	sub e			;6624	93 	. 
	add a,e			;6625	83 	. 
	and e			;6626	a3 	. 
	or e			;6627	b3 	. 
	add a,e			;6628	83 	. 
	and e			;6629	a3 	. 
	or e			;662a	b3 	. 
	or e			;662b	b3 	. 
	add a,e			;662c	83 	. 
	sub l			;662d	95 	. 
	ld bc,laa06h		;662e	01 06 aa 	. . . 
	ld bc,l9c08h		;6631	01 08 9c 	. . . 
	adc a,h			;6634	8c 	. 
	ld a,(bc)			;6635	0a 	. 
	ld (bc),a			;6636	02 	. 
	xor h			;6637	ac 	. 
	ld bc,l8910h		;6638	01 10 89 	. . . 
	sub l			;663b	95 	. 
	ld bc,lb013h		;663c	01 13 b0 	. . . 
	adc a,h			;663f	8c 	. 
	ld a,(bc)			;6640	0a 	. 
	ld (bc),a			;6641	02 	. 
	and h			;6642	a4 	. 
	sub b			;6643	90 	. 
	ld bc,l9d1ah		;6644	01 1a 9d 	. . . 
	add a,c			;6647	81 	. 
	ld bc,la81eh		;6648	01 1e a8 	. . . 
	adc a,h			;664b	8c 	. 
	ld a,(bc)			;664c	0a 	. 
	inc bc			;664d	03 	. 
	sub h			;664e	94 	. 
	xor d			;664f	aa 	. 
	ld bc,l952ah		;6650	01 2a 95 	. * . 
	xor d			;6653	aa 	. 
	ld bc,laa2dh		;6654	01 2d aa 	. - . 
	ld bc,l9d2fh		;6657	01 2f 9d 	. / . 
	add a,h			;665a	84 	. 
	add a,c			;665b	81 	. 
	xor d			;665c	aa 	. 
	adc a,h			;665d	8c 	. 
	add a,(hl)			;665e	86 	. 
	ld bc,l9536h		;665f	01 36 95 	. 6 . 
	ld bc,l9538h		;6662	01 38 95 	. 8 . 
	add a,d			;6665	82 	. 
	xor d			;6666	aa 	. 
	add a,d			;6667	82 	. 
	ld bc,l953dh		;6668	01 3d 95 	. = . 
	ld bc,laa46h		;666b	01 46 aa 	. F . 
	ld bc,l9548h		;666e	01 48 95 	. H . 
	ld bc,la84ah		;6671	01 4a a8 	. J . 
	adc a,(hl)			;6674	8e 	. 
	adc a,a			;6675	8f 	. 
	xor (hl)			;6676	ae 	. 
	and e			;6677	a3 	. 
	cp a			;6678	bf 	. 
	sub e			;6679	93 	. 
	sub l			;667a	95 	. 
	sub (hl)			;667b	96 	. 
	ld bc,lbc55h		;667c	01 55 bc 	. U . 
	sub h			;667f	94 	. 
	ld bc,08258h		;6680	01 58 82 	. X . 
	sub h			;6683	94 	. 
	sub a			;6684	97 	. 
	cp e			;6685	bb 	. 
	or a			;6686	b7 	. 
	xor e			;6687	ab 	. 
	xor d			;6688	aa 	. 
	ld bc,l9563h		;6689	01 63 95 	. c . 
	xor d			;668c	aa 	. 
	ld bc,l956ah		;668d	01 6a 95 	. j . 
	adc a,d			;6690	8a 	. 
	adc a,h			;6691	8c 	. 
	add a,(hl)			;6692	86 	. 
	ld bc,l8d6fh		;6693	01 6f 8d 	. o . 
	adc a,h			;6696	8c 	. 
	add a,l			;6697	85 	. 
	adc a,d			;6698	8a 	. 
	ld bc,l8976h		;6699	01 76 89 	. v . 
	adc a,h			;669c	8c 	. 
	add a,c			;669d	81 	. 
	ld bc,l8e7ah		;669e	01 7a 8e 	. z . 
	add a,h			;66a1	84 	. 
	ld bc,l957dh		;66a2	01 7d 95 	. } . 
	ld bc,laa86h		;66a5	01 86 aa 	. . . 
	ld bc,l9588h		;66a8	01 88 95 	. . . 
	ld bc,laa8ah		;66ab	01 8a aa 	. . . 
	ld bc,l8a8dh		;66ae	01 8d 8a 	. . . 
	sbc a,h			;66b1	9c 	. 
	adc a,a			;66b2	8f 	. 
	adc a,h			;66b3	8c 	. 
	sub l			;66b4	95 	. 
	add a,d			;66b5	82 	. 
	adc a,h			;66b6	8c 	. 
	or b			;66b7	b0 	. 
	ld a,(bc)			;66b8	0a 	. 
	ld (bc),a			;66b9	02 	. 
	sbc a,b			;66ba	98 	. 
	add a,(hl)			;66bb	86 	. 
	ld bc,l9d9ah		;66bc	01 9a 9d 	. . . 
	adc a,(hl)			;66bf	8e 	. 
	adc a,l			;66c0	8d 	. 
	adc a,(hl)			;66c1	8e 	. 
	xor d			;66c2	aa 	. 
	ld bc,l95a3h		;66c3	01 a3 95 	. . . 
	xor d			;66c6	aa 	. 
	ld bc,083aah		;66c7	01 aa 83 	. . . 
	add a,e			;66ca	83 	. 
	cp a			;66cb	bf 	. 
	and e			;66cc	a3 	. 
	or e			;66cd	b3 	. 
	ld a,(bc)			;66ce	0a 	. 
	ld a,(bc)			;66cf	0a 	. 
	sub e			;66d0	93 	. 
	cp a			;66d1	bf 	. 
	add a,e			;66d2	83 	. 
	add a,e			;66d3	83 	. 
	add a,c			;66d4	81 	. 
	ld bc,laac6h		;66d5	01 c6 aa 	. . . 
	ld bc,l95c8h		;66d8	01 c8 95 	. . . 
	ld bc,l8acah		;66db	01 ca 8a 	. . . 
	xor h			;66de	ac 	. 
	adc a,h			;66df	8c 	. 
	sbc a,h			;66e0	9c 	. 
	add a,a			;66e1	87 	. 
	xor e			;66e2	ab 	. 
	adc a,b			;66e3	88 	. 
	or l			;66e4	b5 	. 
	adc a,h			;66e5	8c 	. 
	ld a,(bc)			;66e6	0a 	. 
	ld b,0a4h		;66e7	06 a4 	. . 
	sbc a,l			;66e9	9d 	. 
	ld bc,labdch		;66ea	01 dc ab 	. . . 
	add a,c			;66ed	81 	. 
	xor d			;66ee	aa 	. 
	ld bc,l95e3h		;66ef	01 e3 95 	. . . 
	xor d			;66f2	aa 	. 
	ld bc,0bfech		;66f3	01 ec bf 	. . . 
	xor d			;66f6	aa 	. 
	ld bc,lbff3h		;66f7	01 f3 bf 	. . . 
	ld bc,l95f9h		;66fa	01 f9 95 	. . . 
	cp a			;66fd	bf 	. 
	ld (bc),a			;66fe	02 	. 
	ld b,0aah		;66ff	06 aa 	. . 
	ld (bc),a			;6701	02 	. 
	ex af,af'			;6702	08 	. 
	add a,e			;6703	83 	. 
	add a,e			;6704	83 	. 
	and e			;6705	a3 	. 
	cp d			;6706	ba 	. 
	or b			;6707	b0 	. 
	or l			;6708	b5 	. 
	ld (bc),a			;6709	02 	. 
	rrca			;670a	0f 	. 
	sbc a,b			;670b	98 	. 
	add a,e			;670c	83 	. 
	and b			;670d	a0 	. 
	sbc a,b			;670e	98 	. 
	add a,(hl)			;670f	86 	. 
	add a,e			;6710	83 	. 
	ld a,(bc)			;6711	0a 	. 
	inc bc			;6712	03 	. 
	adc a,h			;6713	8c 	. 
	or b			;6714	b0 	. 
	and d			;6715	a2 	. 
	adc a,c			;6716	89 	. 
	sub d			;6717	92 	. 
	ld (bc),a			;6718	02 	. 
	ld e,082h		;6719	1e 82 	. . 
	sub e			;671b	93 	. 
	add a,e			;671c	83 	. 
	ld a,(bc)			;671d	0a 	. 
	ld (bc),a			;671e	02 	. 
	add a,c			;671f	81 	. 
	xor d			;6720	aa 	. 
	ld (bc),a			;6721	02 	. 
	inc l			;6722	2c 	, 
	cp a			;6723	bf 	. 
	xor d			;6724	aa 	. 
	ld (bc),a			;6725	02 	. 
	inc sp			;6726	33 	3 
	cp a			;6727	bf 	. 
	ld (bc),a			;6728	02 	. 
	add hl,sp			;6729	39 	9 
	sub l			;672a	95 	. 
	cp a			;672b	bf 	. 
	ld (bc),a			;672c	02 	. 
	ld b,(hl)			;672d	46 	F 
	xor d			;672e	aa 	. 
	ld (bc),a			;672f	02 	. 
	ld c,b			;6730	48 	H 
	or b			;6731	b0 	. 
	or b			;6732	b0 	. 
	xor d			;6733	aa 	. 
	ld (bc),a			;6734	02 	. 
	ld c,l			;6735	4d 	M 
	xor d			;6736	aa 	. 
	cp (hl)			;6737	be 	. 
	ld (bc),a			;6738	02 	. 
	ld d,b			;6739	50 	P 
	xor b			;673a	a8 	. 
	sub l			;673b	95 	. 
	ld (bc),a			;673c	02 	. 
	ld d,h			;673d	54 	T 
	sub (hl)			;673e	96 	. 
	add a,e			;673f	83 	. 
	add a,e			;6740	83 	. 
	sub h			;6741	94 	. 
	add a,e			;6742	83 	. 
	add a,e			;6743	83 	. 
	sub a			;6744	97 	. 
	ld (bc),a			;6745	02 	. 
	ld e,h			;6746	5c 	\ 
	xor d			;6747	aa 	. 
	or h			;6748	b4 	. 
	xor d			;6749	aa 	. 
	xor e			;674a	ab 	. 
	and b			;674b	a0 	. 
	or b			;674c	b0 	. 
	or b			;674d	b0 	. 
	sub b			;674e	90 	. 
	xor d			;674f	aa 	. 
	ld (bc),a			;6750	02 	. 
	ld l,e			;6751	6b 	k 
	or b			;6752	b0 	. 
	cp a			;6753	bf 	. 
	xor d			;6754	aa 	. 
	ld (bc),a			;6755	02 	. 
	ld (hl),e			;6756	73 	s 
	cp a			;6757	bf 	. 
	ld (bc),a			;6758	02 	. 
	ld a,c			;6759	79 	y 
	sub l			;675a	95 	. 
	cp a			;675b	bf 	. 
	or b			;675c	b0 	. 
	ld (bc),a			;675d	02 	. 
	add a,(hl)			;675e	86 	. 
	xor d			;675f	aa 	. 
	ld (bc),a			;6760	02 	. 
	adc a,b			;6761	88 	. 
	cp a			;6762	bf 	. 
	ld (bc),a			;6763	02 	. 
	adc a,d			;6764	8a 	. 
	add a,d			;6765	82 	. 
	add a,e			;6766	83 	. 
	add a,e			;6767	83 	. 
	xor e			;6768	ab 	. 
	add a,d			;6769	82 	. 
	and h			;676a	a4 	. 
	ld (bc),a			;676b	02 	. 
	sub c			;676c	91 	. 
	adc a,c			;676d	89 	. 
	and h			;676e	a4 	. 
	sub b			;676f	90 	. 
	add a,d			;6770	82 	. 
	add a,e			;6771	83 	. 
	add a,e			;6772	83 	. 
	ld (bc),a			;6773	02 	. 
	sbc a,b			;6774	98 	. 
	or e			;6775	b3 	. 
	adc a,a			;6776	8f 	. 
	adc a,e			;6777	8b 	. 
	and b			;6778	a0 	. 
	add a,(hl)			;6779	86 	. 
	xor d			;677a	aa 	. 
	add a,d			;677b	82 	. 
	sub a			;677c	97 	. 
	ld (bc),a			;677d	02 	. 
	and d			;677e	a2 	. 
	xor d			;677f	aa 	. 
	sub l			;6780	95 	. 
	xor d			;6781	aa 	. 
	ld (bc),a			;6782	02 	. 
	xor e			;6783	ab 	. 
	add a,d			;6784	82 	. 
	cp a			;6785	bf 	. 
	add a,d			;6786	82 	. 
	add a,e			;6787	83 	. 
	ld a,(bc)			;6788	0a 	. 
	ld a,(bc)			;6789	0a 	. 
	add a,c			;678a	81 	. 
	cp a			;678b	bf 	. 
	add a,c			;678c	81 	. 
	ld (bc),a			;678d	02 	. 
	push bc			;678e	c5 	. 
	or b			;678f	b0 	. 
	sub a			;6790	97 	. 
	or e			;6791	b3 	. 
	ld a,(bc)			;6792	0a 	. 
	dec b			;6793	05 	. 
	xor e			;6794	ab 	. 
	xor d			;6795	aa 	. 
	or h			;6796	b4 	. 
	xor c			;6797	a9 	. 
l6798h:
	sub h			;6798	94 	. 
	or b			;6799	b0 	. 
	or d			;679a	b2 	. 
	or e			;679b	b3 	. 
	sub e			;679c	93 	. 
	or e			;679d	b3 	. 
	or e			;679e	b3 	. 
	or b			;679f	b0 	. 
	sub b			;67a0	90 	. 
l67a1h:
	cp h			;67a1	bc 	. 
	and c			;67a2	a1 	. 
	cp (hl)			;67a3	be 	. 
	xor d			;67a4	aa 	. 
	and e			;67a5	a3 	. 
	or e			;67a6	b3 	. 
	ld a,(bc)			;67a7	0a 	. 
	inc b			;67a8	04 	. 
	sub e			;67a9	93 	. 
	or l			;67aa	b5 	. 
	sub b			;67ab	90 	. 
	ld (bc),a			;67ac	02 	. 
	call pe,002bfh		;67ad	ec bf 02 	. . . 
	xor 097h		;67b0	ee 97 	. . 
	add a,e			;67b2	83 	. 
	or e			;67b3	b3 	. 
	add a,e			;67b4	83 	. 
	or e			;67b5	b3 	. 
	add a,e			;67b6	83 	. 
	or e			;67b7	b3 	. 
	add a,e			;67b8	83 	. 
	or e			;67b9	b3 	. 
	add a,e			;67ba	83 	. 
	xor e			;67bb	ab 	. 
	ld (bc),a			;67bc	02 	. 
	jp m,003bfh		;67bd	fa bf 03 	. . . 
	dec b			;67c0	05 	. 
	sub l			;67c1	95 	. 
	inc bc			;67c2	03 	. 
	rlca			;67c3	07 	. 
	sub l			;67c4	95 	. 
	inc bc			;67c5	03 	. 
	add hl,bc			;67c6	09 	. 
	add a,l			;67c7	85 	. 
	sbc a,h			;67c8	9c 	. 
	ld a,(bc)			;67c9	0a 	. 
	add hl,bc			;67ca	09 	. 
	sub h			;67cb	94 	. 
	xor (hl)			;67cc	ae 	. 
	add a,h			;67cd	84 	. 
	sbc a,h			;67ce	9c 	. 
	ld a,(bc)			;67cf	0a 	. 
	add hl,bc			;67d0	09 	. 
	sub h			;67d1	94 	. 
	add a,l			;67d2	85 	. 
	inc bc			;67d3	03 	. 
	inc h			;67d4	24 	$ 
	sub l			;67d5	95 	. 
	inc bc			;67d6	03 	. 
	ld h,095h		;67d7	26 95 	& . 
	inc bc			;67d9	03 	. 
	inc l			;67da	2c 	, 
	cp a			;67db	bf 	. 
	inc bc			;67dc	03 	. 
	ld l,095h		;67dd	2e 95 	. . 
	inc bc			;67df	03 	. 
	jr nc,l67a1h		;67e0	30 bf 	0 . 
	inc bc			;67e2	03 	. 
	ld (003bfh),a		;67e3	32 bf 03 	2 . . 
	inc (hl)			;67e6	34 	4 
	cp a			;67e7	bf 	. 
	inc bc			;67e8	03 	. 
	ld (hl),0bfh		;67e9	36 bf 	6 . 
	inc bc			;67eb	03 	. 
	jr c,l6798h		;67ec	38 aa 	8 . 
	inc bc			;67ee	03 	. 
l67efh:
	ld a,(003bfh)		;67ef	3a bf 03 	: . . 
	ld b,l			;67f2	45 	E 
	xor e			;67f3	ab 	. 
	add a,e			;67f4	83 	. 
	add a,e			;67f5	83 	. 
	and e			;67f6	a3 	. 
	add a,c			;67f7	81 	. 
	sub l			;67f8	95 	. 
	ld a,(bc)			;67f9	0a 	. 
	ld a,(bc)			;67fa	0a 	. 
	xor d			;67fb	aa 	. 
	inc bc			;67fc	03 	. 
	ld d,a			;67fd	57 	W 
	sub l			;67fe	95 	. 
	ld a,(bc)			;67ff	0a 	. 
	ld a,(bc)			;6800	0a 	. 
	and e			;6801	a3 	. 
	add a,e			;6802	83 	. 
	add a,e			;6803	83 	. 
	xor e			;6804	ab 	. 
	add a,c			;6805	81 	. 
	inc bc			;6806	03 	. 
	ld l,h			;6807	6c 	l 
	cp a			;6808	bf 	. 
	inc bc			;6809	03 	. 
	ld l,(hl)			;680a	6e 	n 
	adc a,l			;680b	8d 	. 
	adc a,h			;680c	8c 	. 
	ld a,(bc)			;680d	0a 	. 
	ex af,af'			;680e	08 	. 
	adc a,(hl)			;680f	8e 	. 
	inc bc			;6810	03 	. 
	ld a,d			;6811	7a 	z 
	cp a			;6812	bf 	. 
	inc bc			;6813	03 	. 
	add a,(hl)			;6814	86 	. 
	adc a,c			;6815	89 	. 
	or b			;6816	b0 	. 
	or b			;6817	b0 	. 
	sub b			;6818	90 	. 
	sub l			;6819	95 	. 
	ld a,(bc)			;681a	0a 	. 
	ld a,(bc)			;681b	0a 	. 
	sbc a,(hl)			;681c	9e 	. 
	sub h			;681d	94 	. 
	sub l			;681e	95 	. 
	ld a,(bc)			;681f	0a 	. 
	ld a,(bc)			;6820	0a 	. 
	or b			;6821	b0 	. 
	or b			;6822	b0 	. 
	sbc a,b			;6823	98 	. 
	add a,c			;6824	81 	. 
	inc bc			;6825	03 	. 
	xor b			;6826	a8 	. 
	cp a			;6827	bf 	. 
	or a			;6828	b7 	. 
	or e			;6829	b3 	. 
	ld a,(bc)			;682a	0a 	. 
	inc b			;682b	04 	. 
	cp a			;682c	bf 	. 
	or a			;682d	b7 	. 
	or e			;682e	b3 	. 
	ld a,(bc)			;682f	0a 	. 
	inc b			;6830	04 	. 
	cp a			;6831	bf 	. 
	or a			;6832	b7 	. 
	or e			;6833	b3 	. 
	ld a,(bc)			;6834	0a 	. 
	inc b			;6835	04 	. 
	cp a			;6836	bf 	. 
	or l			;6837	b5 	. 
	or b			;6838	b0 	. 
	inc b			;6839	04 	. 
	inc bc			;683a	03 	. 
	nop			;683b	00 	. 
	nop			;683c	00 	. 
	djnz l67efh		;683d	10 b0 	. . 
	ld a,(bc)			;683f	0a 	. 
	dec e			;6840	1d 	. 
	sub b			;6841	90 	. 
	nop			;6842	00 	. 
	ld d,b			;6843	50 	P 
	adc a,d			;6844	8a 	. 
	xor h			;6845	ac 	. 
	adc a,h			;6846	8c 	. 
	ld a,(bc)			;6847	0a 	. 
	add hl,de			;6848	19 	. 
	xor h			;6849	ac 	. 
	adc a,(hl)			;684a	8e 	. 
	nop			;684b	00 	. 
	sub c			;684c	91 	. 
	xor d			;684d	aa 	. 
	nop			;684e	00 	. 
	sub e			;684f	93 	. 
	xor b			;6850	a8 	. 
	add a,e			;6851	83 	. 
	adc a,c			;6852	89 	. 
	nop			;6853	00 	. 
	sub a			;6854	97 	. 
	or a			;6855	b7 	. 
	sub e			;6856	93 	. 
	add a,l			;6857	85 	. 
	xor d			;6858	aa 	. 
	and h			;6859	a4 	. 
	xor d			;685a	aa 	. 
	nop			;685b	00 	. 
	sbc a,(hl)			;685c	9e 	. 
	or a			;685d	b7 	. 
	sub e			;685e	93 	. 
	add a,l			;685f	85 	. 
	xor d			;6860	aa 	. 
	or e			;6861	b3 	. 
	sbc a,c			;6862	99 	. 
	nop			;6863	00 	. 
	and l			;6864	a5 	. 
	or (hl)			;6865	b6 	. 
	or e			;6866	b3 	. 
	sub h			;6867	94 	. 
	xor d			;6868	aa 	. 
	nop			;6869	00 	. 
	xor h			;686a	ac 	. 
	xor d			;686b	aa 	. 
	nop			;686c	00 	. 
	pop de			;686d	d1 	. 
	xor d			;686e	aa 	. 
	nop			;686f	00 	. 
	out (08ah),a		;6870	d3 8a 	. . 
	or b			;6872	b0 	. 
	sbc a,e			;6873	9b 	. 
sub_6874h:
	nop			;6874	00 	. 
	rst 10h			;6875	d7 	. 
	or l			;6876	b5 	. 
	or b			;6877	b0 	. 
	sub h			;6878	94 	. 
	xor d			;6879	aa 	. 
	nop			;687a	00 	. 
	call c,000abh		;687b	dc ab 00 	. . . 
	sbc a,0b5h		;687e	de b5 	. . 
	or b			;6880	b0 	. 
	sub h			;6881	94 	. 
	xor d			;6882	aa 	. 
	add a,d			;6883	82 	. 
	and h			;6884	a4 	. 
	nop			;6885	00 	. 
	push hl			;6886	e5 	. 
	sub l			;6887	95 	. 
	nop			;6888	00 	. 
	rst 20h			;6889	e7 	. 
	sub l			;688a	95 	. 
	xor d			;688b	aa 	. 
	or b			;688c	b0 	. 
	cp b			;688d	b8 	. 
	nop			;688e	00 	. 
	call pe,001aah		;688f	ec aa 01 	. . . 
	ld de,001aah		;6892	11 aa 01 	. . . 
	rla			;6895	17 	. 
	sbc a,b			;6896	98 	. 
	adc a,h			;6897	8c 	. 
	sub b			;6898	90 	. 
	xor b			;6899	a8 	. 
	xor h			;689a	ac 	. 
	xor h			;689b	ac 	. 
	ld bc,l981eh		;689c	01 1e 98 	. . . 
	adc a,h			;689f	8c 	. 
	sub b			;68a0	90 	. 
	xor b			;68a1	a8 	. 
	adc a,h			;68a2	8c 	. 
	and h			;68a3	a4 	. 
	ld bc,l9c25h		;68a4	01 25 9c 	. % . 
	adc a,h			;68a7	8c 	. 
	sub h			;68a8	94 	. 
	ld bc,0aa2ch		;68a9	01 2c aa 	. , . 
l68ach:
	ld bc,laa51h		;68ac	01 51 aa 	. Q . 
	ld bc,l9257h		;68af	01 57 92 	. W . 
	adc a,c			;68b2	89 	. 
	sub b			;68b3	90 	. 
	ld bc,laa5bh		;68b4	01 5b aa 	. [ . 
	ld bc,l955eh		;68b7	01 5e 95 	. ^ . 
	ld bc,l9560h		;68ba	01 60 95 	. ` . 
	xor d			;68bd	aa 	. 
	adc a,e			;68be	8b 	. 
	sub c			;68bf	91 	. 
	ld bc,l9765h		;68c0	01 65 97 	. e . 
	add a,c			;68c3	81 	. 
	sub b			;68c4	90 	. 
	ld bc,laa6ch		;68c5	01 6c aa 	. l . 
	ld bc,laa91h		;68c8	01 91 aa 	. . . 
	or b			;68cb	b0 	. 
	ld a,(bc)			;68cc	0a 	. 
	inc b			;68cd	04 	. 
	or d			;68ce	b2 	. 
	or e			;68cf	b3 	. 
	or b			;68d0	b0 	. 
	or b			;68d1	b0 	. 
	or e			;68d2	b3 	. 
	or c			;68d3	b1 	. 
	or b			;68d4	b0 	. 
	or d			;68d5	b2 	. 
	or e			;68d6	b3 	. 
	or b			;68d7	b0 	. 
	or d			;68d8	b2 	. 
	or b			;68d9	b0 	. 
	or d			;68da	b2 	. 
	or b			;68db	b0 	. 
	or e			;68dc	b3 	. 
	or e			;68dd	b3 	. 
	or c			;68de	b1 	. 
	or b			;68df	b0 	. 
	ld a,(bc)			;68e0	0a 	. 
	inc bc			;68e1	03 	. 
	cp d			;68e2	ba 	. 
	ld bc,0aad1h		;68e3	01 d1 aa 	. . . 
	sub a			;68e6	97 	. 
	or e			;68e7	b3 	. 
	ld a,(bc)			;68e8	0a 	. 
	inc b			;68e9	04 	. 
	xor e			;68ea	ab 	. 
	sub a			;68eb	97 	. 
	add a,e			;68ec	83 	. 
	or e			;68ed	b3 	. 
	ld a,(bc)			;68ee	0a 	. 
	rlca			;68ef	07 	. 
	sub e			;68f0	93 	. 
	add a,e			;68f1	83 	. 
	cp a			;68f2	bf 	. 
	and e			;68f3	a3 	. 
	or e			;68f4	b3 	. 
	ld a,(bc)			;68f5	0a 	. 
	inc bc			;68f6	03 	. 
	sub e			;68f7	93 	. 
	cp a			;68f8	bf 	. 
	ld (bc),a			;68f9	02 	. 
	ld de,l95aah		;68fa	11 aa 95 	. . . 
	sub l			;68fd	95 	. 
	xor d			;68fe	aa 	. 
	ld (bc),a			;68ff	02 	. 
	ld d,095h		;6900	16 95 	. . 
	xor d			;6902	aa 	. 
	xor d			;6903	aa 	. 
	sub l			;6904	95 	. 
	ld (bc),a			;6905	02 	. 
	dec de			;6906	1b 	. 
	adc a,l			;6907	8d 	. 
	adc a,h			;6908	8c 	. 
	ld a,(bc)			;6909	0a 	. 
	ld (bc),a			;690a	02 	. 
	adc a,l			;690b	8d 	. 
	adc a,h			;690c	8c 	. 
	ld a,(bc)			;690d	0a 	. 
	ld (bc),a			;690e	02 	. 
	add a,l			;690f	85 	. 
	ld (bc),a			;6910	02 	. 
	dec h			;6911	25 	% 
	cp a			;6912	bf 	. 
	xor d			;6913	aa 	. 
	ld (bc),a			;6914	02 	. 
	jr z,l68ach		;6915	28 95 	( . 
	xor d			;6917	aa 	. 
	ld (bc),a			;6918	02 	. 
	dec hl			;6919	2b 	+ 
	sub l			;691a	95 	. 
	cp a			;691b	bf 	. 
	ld (bc),a			;691c	02 	. 
	ld d,c			;691d	51 	Q 
	xor d			;691e	aa 	. 
	sub l			;691f	95 	. 
	sbc a,l			;6920	9d 	. 
	xor (hl)			;6921	ae 	. 
	adc a,h			;6922	8c 	. 
	sbc a,l			;6923	9d 	. 
	xor (hl)			;6924	ae 	. 
	xor d			;6925	aa 	. 
	sub l			;6926	95 	. 
	xor d			;6927	aa 	. 
	add a,e			;6928	83 	. 
	or e			;6929	b3 	. 
	ld a,(bc)			;692a	0a 	. 
	ld (bc),a			;692b	02 	. 
	and e			;692c	a3 	. 
	or e			;692d	b3 	. 
	or e			;692e	b3 	. 
	sub e			;692f	93 	. 
	xor e			;6930	ab 	. 
	ld (bc),a			;6931	02 	. 
	ld h,l			;6932	65 	e 
	cp a			;6933	bf 	. 
	xor d			;6934	aa 	. 
	adc a,h			;6935	8c 	. 
	sbc a,l			;6936	9d 	. 
	xor (hl)			;6937	ae 	. 
	adc a,h			;6938	8c 	. 
	sub l			;6939	95 	. 
	cp a			;693a	bf 	. 
	ld (bc),a			;693b	02 	. 
	sub c			;693c	91 	. 
	xor d			;693d	aa 	. 
	sub l			;693e	95 	. 
	sub l			;693f	95 	. 
	xor d			;6940	aa 	. 
	ld (bc),a			;6941	02 	. 
	sub (hl)			;6942	96 	. 
	sub l			;6943	95 	. 
	xor d			;6944	aa 	. 
	xor d			;6945	aa 	. 
	sub l			;6946	95 	. 
	xor d			;6947	aa 	. 
	ld (bc),a			;6948	02 	. 
	sbc a,h			;6949	9c 	. 
	sub l			;694a	95 	. 
	ld (bc),a			;694b	02 	. 
	sbc a,(hl)			;694c	9e 	. 
	xor d			;694d	aa 	. 
	xor d			;694e	aa 	. 
	ld (bc),a			;694f	02 	. 
	and d			;6950	a2 	. 
	sub l			;6951	95 	. 
	xor d			;6952	aa 	. 
	ld (bc),a			;6953	02 	. 
	and l			;6954	a5 	. 
	cp a			;6955	bf 	. 
	xor d			;6956	aa 	. 
	ld (bc),a			;6957	02 	. 
	xor b			;6958	a8 	. 
	sub l			;6959	95 	. 
	xor d			;695a	aa 	. 
	ld (bc),a			;695b	02 	. 
	xor e			;695c	ab 	. 
	sub l			;695d	95 	. 
	cp a			;695e	bf 	. 
	ld (bc),a			;695f	02 	. 
	pop de			;6960	d1 	. 
	xor d			;6961	aa 	. 
	sub l			;6962	95 	. 
	and e			;6963	a3 	. 
	or e			;6964	b3 	. 
	ld a,(bc)			;6965	0a 	. 
	ld (bc),a			;6966	02 	. 
	sub e			;6967	93 	. 
	xor d			;6968	aa 	. 
	sub l			;6969	95 	. 
	xor d			;696a	aa 	. 
	and b			;696b	a0 	. 
	sub e			;696c	93 	. 
	or e			;696d	b3 	. 
	or e			;696e	b3 	. 
	or d			;696f	b2 	. 
	or e			;6970	b3 	. 
	sub e			;6971	93 	. 
	add a,c			;6972	81 	. 
	xor d			;6973	aa 	. 
	ld (bc),a			;6974	02 	. 
	push hl			;6975	e5 	. 
	cp a			;6976	bf 	. 
	add a,d			;6977	82 	. 
	or e			;6978	b3 	. 
	ld a,(bc)			;6979	0a 	. 
	inc bc			;697a	03 	. 
	add a,c			;697b	81 	. 
	cp a			;697c	bf 	. 
	inc bc			;697d	03 	. 
	ld de,l95aah		;697e	11 aa 95 	. . . 
	xor d			;6981	aa 	. 
	inc bc			;6982	03 	. 
	dec d			;6983	15 	. 
	cp h			;6984	bc 	. 
	inc bc			;6985	03 	. 
	rla			;6986	17 	. 
	sub l			;6987	95 	. 
	xor d			;6988	aa 	. 
	sub l			;6989	95 	. 
	xor d			;698a	aa 	. 
	inc bc			;698b	03 	. 
	inc e			;698c	1c 	. 
	or b			;698d	b0 	. 
	or e			;698e	b3 	. 
	or e			;698f	b3 	. 
	and e			;6990	a3 	. 
	or e			;6991	b3 	. 
	or c			;6992	b1 	. 
	sub b			;6993	90 	. 
	xor d			;6994	aa 	. 
	inc bc			;6995	03 	. 
	dec h			;6996	25 	% 
	cp a			;6997	bf 	. 
	inc bc			;6998	03 	. 
	daa			;6999	27 	' 
	sub l			;699a	95 	. 
	xor b			;699b	a8 	. 
	sub h			;699c	94 	. 
	xor d			;699d	aa 	. 
	inc bc			;699e	03 	. 
	inc l			;699f	2c 	, 
	cp a			;69a0	bf 	. 
	inc bc			;69a1	03 	. 
	ld d,c			;69a2	51 	Q 
	xor d			;69a3	aa 	. 
	sub l			;69a4	95 	. 
	xor d			;69a5	aa 	. 
	inc bc			;69a6	03 	. 
	ld d,l			;69a7	55 	U 
	cp a			;69a8	bf 	. 
	inc bc			;69a9	03 	. 
	ld d,a			;69aa	57 	W 
	sub l			;69ab	95 	. 
	xor d			;69ac	aa 	. 
	sub l			;69ad	95 	. 
	xor d			;69ae	aa 	. 
	inc bc			;69af	03 	. 
	ld e,h			;69b0	5c 	\ 
	sub l			;69b1	95 	. 
	inc bc			;69b2	03 	. 
	ld e,(hl)			;69b3	5e 	^ 
	xor d			;69b4	aa 	. 
	xor d			;69b5	aa 	. 
	inc bc			;69b6	03 	. 
	ld h,d			;69b7	62 	b 
	sub l			;69b8	95 	. 
	xor d			;69b9	aa 	. 
	inc bc			;69ba	03 	. 
	ld h,l			;69bb	65 	e 
	cp a			;69bc	bf 	. 
	inc bc			;69bd	03 	. 
	ld h,a			;69be	67 	g 
	sub l			;69bf	95 	. 
	xor d			;69c0	aa 	. 
	sub l			;69c1	95 	. 
	xor d			;69c2	aa 	. 
	inc bc			;69c3	03 	. 
	ld l,h			;69c4	6c 	l 
	cp a			;69c5	bf 	. 
	inc bc			;69c6	03 	. 
	add a,b			;69c7	80 	. 
	or b			;69c8	b0 	. 
	ld a,(bc)			;69c9	0a 	. 
	rrca			;69ca	0f 	. 
	sub b			;69cb	90 	. 
	cp d			;69cc	ba 	. 
	or l			;69cd	b5 	. 
	xor d			;69ce	aa 	. 
	or b			;69cf	b0 	. 
	or e			;69d0	b3 	. 
	or b			;69d1	b0 	. 
	sub l			;69d2	95 	. 
	cp d			;69d3	ba 	. 
	or l			;69d4	b5 	. 
	xor d			;69d5	aa 	. 
	or b			;69d6	b0 	. 
	or e			;69d7	b3 	. 
	ld a,(bc)			;69d8	0a 	. 
	ld (bc),a			;69d9	02 	. 
	or d			;69da	b2 	. 
	or e			;69db	b3 	. 
	or e			;69dc	b3 	. 
	or c			;69dd	b1 	. 
	cp d			;69de	ba 	. 
	and b			;69df	a0 	. 
	cp a			;69e0	bf 	. 
	sub b			;69e1	90 	. 
	or l			;69e2	b5 	. 
	or d			;69e3	b2 	. 
	or c			;69e4	b1 	. 
	cp d			;69e5	ba 	. 
	and b			;69e6	a0 	. 
	cp a			;69e7	bf 	. 
	sub b			;69e8	90 	. 
	or b			;69e9	b0 	. 
	ld a,(bc)			;69ea	0a 	. 
	ld de,00404h		;69eb	11 04 04 	. . . 
	nop			;69ee	00 	. 
	nop			;69ef	00 	. 
	ld c,0abh		;69f0	0e ab 	. . 
	add a,e			;69f2	83 	. 
	ld a,(bc)			;69f3	0a 	. 
	ld b,0a3h		;69f4	06 a3 	. . 
	add a,e			;69f6	83 	. 
	and e			;69f7	a3 	. 
	add a,e			;69f8	83 	. 
	and e			;69f9	a3 	. 
	or e			;69fa	b3 	. 
	add a,e			;69fb	83 	. 
	and e			;69fc	a3 	. 
	or e			;69fd	b3 	. 
	or e			;69fe	b3 	. 
	add a,e			;69ff	83 	. 
	or e			;6a00	b3 	. 
	or e			;6a01	b3 	. 
	sub e			;6a02	93 	. 
	and e			;6a03	a3 	. 
	add a,e			;6a04	83 	. 
	ld a,(bc)			;6a05	0a 	. 
	ex af,af'			;6a06	08 	. 
	xor e			;6a07	ab 	. 
	add a,c			;6a08	81 	. 
	nop			;6a09	00 	. 
	ld c,(hl)			;6a0a	4e 	N 
	xor d			;6a0b	aa 	. 
	nop			;6a0c	00 	. 
	ld d,(hl)			;6a0d	56 	V 
	xor d			;6a0e	aa 	. 
	adc a,h			;6a0f	8c 	. 
	xor (hl)			;6a10	ae 	. 
	nop			;6a11	00 	. 
	ld e,d			;6a12	5a 	Z 
	sub l			;6a13	95 	. 
	nop			;6a14	00 	. 
	ld e,h			;6a15	5c 	\ 
	sub l			;6a16	95 	. 
	add a,d			;6a17	82 	. 
	xor d			;6a18	aa 	. 
	add a,d			;6a19	82 	. 
	nop			;6a1a	00 	. 
	ld h,c			;6a1b	61 	a 
	sbc a,l			;6a1c	9d 	. 
	add a,h			;6a1d	84 	. 
	sub c			;6a1e	91 	. 
	xor d			;6a1f	aa 	. 
	nop			;6a20	00 	. 
	ld h,(hl)			;6a21	66 	f 
	and b			;6a22	a0 	. 
	nop			;6a23	00 	. 
	ld l,(hl)			;6a24	6e 	n 
	xor d			;6a25	aa 	. 
	nop			;6a26	00 	. 
	adc a,(hl)			;6a27	8e 	. 
	xor d			;6a28	aa 	. 
	nop			;6a29	00 	. 
	sub c			;6a2a	91 	. 
	and b			;6a2b	a0 	. 
	or b			;6a2c	b0 	. 
	ld a,(bc)			;6a2d	0a 	. 
	inc bc			;6a2e	03 	. 
	sub d			;6a2f	92 	. 
	nop			;6a30	00 	. 
	sbc a,b			;6a31	98 	. 
	and d			;6a32	a2 	. 
	or b			;6a33	b0 	. 
	or d			;6a34	b2 	. 
	or e			;6a35	b3 	. 
	or b			;6a36	b0 	. 
	sub b			;6a37	90 	. 
	add a,e			;6a38	83 	. 
	add a,c			;6a39	81 	. 
	or b			;6a3a	b0 	. 
	or e			;6a3b	b3 	. 
	or e			;6a3c	b3 	. 
	or c			;6a3d	b1 	. 
	or d			;6a3e	b2 	. 
	add a,e			;6a3f	83 	. 
	add a,e			;6a40	83 	. 
	or b			;6a41	b0 	. 
	ld a,(bc)			;6a42	0a 	. 
	inc b			;6a43	04 	. 
	nop			;6a44	00 	. 
	xor (hl)			;6a45	ae 	. 
	xor d			;6a46	aa 	. 
	nop			;6a47	00 	. 
	adc a,0aah		;6a48	ce aa 	. . 
	nop			;6a4a	00 	. 
	pop de			;6a4b	d1 	. 
	xor d			;6a4c	aa 	. 
	add a,c			;6a4d	81 	. 
	xor e			;6a4e	ab 	. 
	sub a			;6a4f	97 	. 
	add a,d			;6a50	82 	. 
	sub l			;6a51	95 	. 
	nop			;6a52	00 	. 
	ret c			;6a53	d8 	. 
	xor d			;6a54	aa 	. 
	add a,c			;6a55	81 	. 
	xor e			;6a56	ab 	. 
	sub a			;6a57	97 	. 
	add a,d			;6a58	82 	. 
	sub l			;6a59	95 	. 
	nop			;6a5a	00 	. 
	ret po			;6a5b	e0 	. 
	sub a			;6a5c	97 	. 
	add a,d			;6a5d	82 	. 
	cp a			;6a5e	bf 	. 
	add a,c			;6a5f	81 	. 
	xor e			;6a60	ab 	. 
	nop			;6a61	00 	. 
	rst 20h			;6a62	e7 	. 
	sub a			;6a63	97 	. 
	add a,d			;6a64	82 	. 
	cp a			;6a65	bf 	. 
	add a,c			;6a66	81 	. 
	xor e			;6a67	ab 	. 
	nop			;6a68	00 	. 
	xor 0aah		;6a69	ee aa 	. . 
	ld bc,laa0eh		;6a6b	01 0e aa 	. . . 
	ld bc,l8a11h		;6a6e	01 11 8a 	. . . 
	adc a,l			;6a71	8d 	. 
	adc a,a			;6a72	8f 	. 
	adc a,a			;6a73	8f 	. 
	adc a,(hl)			;6a74	8e 	. 
	add a,l			;6a75	85 	. 
	ld bc,l8a18h		;6a76	01 18 8a 	. . . 
	adc a,l			;6a79	8d 	. 
	adc a,a			;6a7a	8f 	. 
	adc a,a			;6a7b	8f 	. 
	adc a,(hl)			;6a7c	8e 	. 
	add a,l			;6a7d	85 	. 
	ld bc,l8f20h		;6a7e	01 20 8f 	.   . 
	adc a,(hl)			;6a81	8e 	. 
	adc a,a			;6a82	8f 	. 
	adc a,l			;6a83	8d 	. 
	adc a,a			;6a84	8f 	. 
	ld bc,08f27h		;6a85	01 27 8f 	. ' . 
	adc a,(hl)			;6a88	8e 	. 
	adc a,a			;6a89	8f 	. 
	adc a,l			;6a8a	8d 	. 
	adc a,a			;6a8b	8f 	. 
	ld bc,laa2eh		;6a8c	01 2e aa 	. . . 
	ld bc,0aa4ch		;6a8f	01 4c aa 	. L . 
	sub a			;6a92	97 	. 
	ld a,(bc)			;6a93	0a 	. 
	ex af,af'			;6a94	08 	. 
	cp a			;6a95	bf 	. 
	xor e			;6a96	ab 	. 
	ld a,(bc)			;6a97	0a 	. 
	rrca			;6a98	0f 	. 
	sub a			;6a99	97 	. 
	ld a,(bc)			;6a9a	0a 	. 
	ex af,af'			;6a9b	08 	. 
	cp a			;6a9c	bf 	. 
	ld bc,laa8ch		;6a9d	01 8c aa 	. . . 
	sbc a,l			;6aa0	9d 	. 
	adc a,l			;6aa1	8d 	. 
	ld a,(bc)			;6aa2	0a 	. 
	rlca			;6aa3	07 	. 
	cp a			;6aa4	bf 	. 
	adc a,(hl)			;6aa5	8e 	. 
	ld a,(bc)			;6aa6	0a 	. 
	ld c,0aeh		;6aa7	0e ae 	. . 
	sbc a,l			;6aa9	9d 	. 
	adc a,l			;6aaa	8d 	. 
	ld a,(bc)			;6aab	0a 	. 
	rlca			;6aac	07 	. 
	cp a			;6aad	bf 	. 
	ld bc,labcch		;6aae	01 cc ab 	. . . 
	cp a			;6ab1	bf 	. 
	sbc a,a			;6ab2	9f 	. 
	adc a,a			;6ab3	8f 	. 
	ld a,(bc)			;6ab4	0a 	. 
	dec b			;6ab5	05 	. 
	cp a			;6ab6	bf 	. 
	ld a,(bc)			;6ab7	0a 	. 
	ld (bc),a			;6ab8	02 	. 
	adc a,a			;6ab9	8f 	. 
	ld a,(bc)			;6aba	0a 	. 
	inc c			;6abb	0c 	. 
	xor a			;6abc	af 	. 
	cp a			;6abd	bf 	. 
	cp a			;6abe	bf 	. 
	sbc a,a			;6abf	9f 	. 
	adc a,a			;6ac0	8f 	. 
	ld a,(bc)			;6ac1	0a 	. 
	dec b			;6ac2	05 	. 
	cp a			;6ac3	bf 	. 
	cp a			;6ac4	bf 	. 
	add a,c			;6ac5	81 	. 
	ld (bc),a			;6ac6	02 	. 
	inc c			;6ac7	0c 	. 
	xor d			;6ac8	aa 	. 
	sub a			;6ac9	97 	. 
	or b			;6aca	b0 	. 
	ld a,(bc)			;6acb	0a 	. 
	ld b,092h		;6acc	06 92 	. . 
	cp a			;6ace	bf 	. 
	add a,c			;6acf	81 	. 
	and b			;6ad0	a0 	. 
	sub a			;6ad1	97 	. 
	add a,e			;6ad2	83 	. 
	ld a,(bc)			;6ad3	0a 	. 
	inc bc			;6ad4	03 	. 
	sub l			;6ad5	95 	. 
	sub a			;6ad6	97 	. 
	add a,e			;6ad7	83 	. 
	ld a,(bc)			;6ad8	0a 	. 
	inc bc			;6ad9	03 	. 
	or l			;6ada	b5 	. 
	ld (bc),a			;6adb	02 	. 
	ld h,0abh		;6adc	26 ab 	& . 
	sub a			;6ade	97 	. 
	or b			;6adf	b0 	. 
	ld a,(bc)			;6ae0	0a 	. 
	ld b,092h		;6ae1	06 92 	. . 
	cp a			;6ae3	bf 	. 
	ld (bc),a			;6ae4	02 	. 
	ld c,h			;6ae5	4c 	L 
	xor d			;6ae6	aa 	. 
	sub l			;6ae7	95 	. 
	xor d			;6ae8	aa 	. 
	ld (bc),a			;6ae9	02 	. 
	ld d,c			;6aea	51 	Q 
	xor d			;6aeb	aa 	. 
	ld (bc),a			;6aec	02 	. 
	ld d,h			;6aed	54 	T 
	xor d			;6aee	aa 	. 
	ld (bc),a			;6aef	02 	. 
	ld d,(hl)			;6af0	56 	V 
	cp a			;6af1	bf 	. 
	ld (bc),a			;6af2	02 	. 
	ld e,c			;6af3	59 	Y 
	sub l			;6af4	95 	. 
	xor d			;6af5	aa 	. 
	add a,e			;6af6	83 	. 
	add a,e			;6af7	83 	. 
	sub l			;6af8	95 	. 
	ld a,(bc)			;6af9	0a 	. 
	ld (bc),a			;6afa	02 	. 
	sub a			;6afb	97 	. 
	add a,e			;6afc	83 	. 
	xor e			;6afd	ab 	. 
	ld (bc),a			;6afe	02 	. 
	ld h,h			;6aff	64 	d 
	sub l			;6b00	95 	. 
	ld (bc),a			;6b01	02 	. 
	ld h,(hl)			;6b02	66 	f 
	xor d			;6b03	aa 	. 
	sub l			;6b04	95 	. 
	xor d			;6b05	aa 	. 
	ld (bc),a			;6b06	02 	. 
	ld l,e			;6b07	6b 	k 
	xor d			;6b08	aa 	. 
	ld (bc),a			;6b09	02 	. 
	ld l,(hl)			;6b0a	6e 	n 
	xor d			;6b0b	aa 	. 
	ld (bc),a			;6b0c	02 	. 
	ld (hl),b			;6b0d	70 	p 
	cp a			;6b0e	bf 	. 
	ld (bc),a			;6b0f	02 	. 
	adc a,h			;6b10	8c 	. 
	xor d			;6b11	aa 	. 
	sub l			;6b12	95 	. 
	xor d			;6b13	aa 	. 
	ld (bc),a			;6b14	02 	. 
	sub c			;6b15	91 	. 
	xor d			;6b16	aa 	. 
	ld (bc),a			;6b17	02 	. 
	sub h			;6b18	94 	. 
	xor d			;6b19	aa 	. 
	ld (bc),a			;6b1a	02 	. 
	sub (hl)			;6b1b	96 	. 
	cp a			;6b1c	bf 	. 
	ld (bc),a			;6b1d	02 	. 
	sbc a,c			;6b1e	99 	. 
	sub l			;6b1f	95 	. 
	add a,d			;6b20	82 	. 
	add a,e			;6b21	83 	. 
	and e			;6b22	a3 	. 
	sub c			;6b23	91 	. 
	sub l			;6b24	95 	. 
	sub l			;6b25	95 	. 
	or e			;6b26	b3 	. 
	add a,e			;6b27	83 	. 
	add a,e			;6b28	83 	. 
	ld (bc),a			;6b29	02 	. 
	and h			;6b2a	a4 	. 
	sub l			;6b2b	95 	. 
	ld (bc),a			;6b2c	02 	. 
	and (hl)			;6b2d	a6 	. 
	xor d			;6b2e	aa 	. 
	sub l			;6b2f	95 	. 
	xor d			;6b30	aa 	. 
	ld (bc),a			;6b31	02 	. 
	xor e			;6b32	ab 	. 
	xor d			;6b33	aa 	. 
	ld (bc),a			;6b34	02 	. 
	xor (hl)			;6b35	ae 	. 
	xor d			;6b36	aa 	. 
	ld (bc),a			;6b37	02 	. 
	or b			;6b38	b0 	. 
	cp a			;6b39	bf 	. 
	ld (bc),a			;6b3a	02 	. 
	call z,l95aah		;6b3b	cc aa 95 	. . . 
	xor d			;6b3e	aa 	. 
	ld (bc),a			;6b3f	02 	. 
	pop de			;6b40	d1 	. 
	xor d			;6b41	aa 	. 
	ld (bc),a			;6b42	02 	. 
	call nc,002aah		;6b43	d4 aa 02 	. . . 
	sub 0bfh		;6b46	d6 bf 	. . 
	ld (bc),a			;6b48	02 	. 
	exx			;6b49	d9 	. 
	sub l			;6b4a	95 	. 
	ld (bc),a			;6b4b	02 	. 
	call c,0858ah		;6b4c	dc 8a 85 	. . . 
	sub l			;6b4f	95 	. 
	sub l			;6b50	95 	. 
	adc a,a			;6b51	8f 	. 
	ld (bc),a			;6b52	02 	. 
	call po,00295h		;6b53	e4 95 02 	. . . 
	and 0aah		;6b56	e6 aa 	. . 
	sub l			;6b58	95 	. 
	xor d			;6b59	aa 	. 
	ld (bc),a			;6b5a	02 	. 
	ex de,hl			;6b5b	eb 	. 
	xor d			;6b5c	aa 	. 
	ld (bc),a			;6b5d	02 	. 
	xor 0aah		;6b5e	ee aa 	. . 
	ld (bc),a			;6b60	02 	. 
	ret p			;6b61	f0 	. 
	cp a			;6b62	bf 	. 
	inc bc			;6b63	03 	. 
	inc c			;6b64	0c 	. 
	xor d			;6b65	aa 	. 
	sub l			;6b66	95 	. 
	add a,e			;6b67	83 	. 
	ld a,(bc)			;6b68	0a 	. 
	ld b,081h		;6b69	06 81 	. . 
	cp a			;6b6b	bf 	. 
	inc bc			;6b6c	03 	. 
	add hl,de			;6b6d	19 	. 
	sub l			;6b6e	95 	. 
	adc a,d			;6b6f	8a 	. 
	add a,l			;6b70	85 	. 
	adc a,d			;6b71	8a 	. 
	add a,l			;6b72	85 	. 
	sub l			;6b73	95 	. 
	sub l			;6b74	95 	. 
	adc a,a			;6b75	8f 	. 
	inc bc			;6b76	03 	. 
	ld (0038fh),hl		;6b77	22 8f 03 	" . . 
	inc h			;6b7a	24 	$ 
	sub l			;6b7b	95 	. 
	inc bc			;6b7c	03 	. 
	ld h,0aah		;6b7d	26 aa 	& . 
	sub l			;6b7f	95 	. 
	add a,e			;6b80	83 	. 
	ld a,(bc)			;6b81	0a 	. 
	ld b,081h		;6b82	06 81 	. . 
	cp a			;6b84	bf 	. 
	inc bc			;6b85	03 	. 
	ld c,h			;6b86	4c 	L 
	xor d			;6b87	aa 	. 
	sbc a,l			;6b88	9d 	. 
	xor h			;6b89	ac 	. 
	ld a,(bc)			;6b8a	0a 	. 
	ld b,08ch		;6b8b	06 8c 	. . 
	cp a			;6b8d	bf 	. 
	inc bc			;6b8e	03 	. 
	ld e,c			;6b8f	59 	Y 
	sub l			;6b90	95 	. 
	adc a,d			;6b91	8a 	. 
	add a,l			;6b92	85 	. 
	adc a,d			;6b93	8a 	. 
	add a,l			;6b94	85 	. 
	sub l			;6b95	95 	. 
	sub l			;6b96	95 	. 
	adc a,a			;6b97	8f 	. 
	inc bc			;6b98	03 	. 
	ld h,d			;6b99	62 	b 
	adc a,a			;6b9a	8f 	. 
	inc bc			;6b9b	03 	. 
	ld h,h			;6b9c	64 	d 
	sub l			;6b9d	95 	. 
	inc bc			;6b9e	03 	. 
	ld h,(hl)			;6b9f	66 	f 
	xor d			;6ba0	aa 	. 
	sbc a,l			;6ba1	9d 	. 
	xor h			;6ba2	ac 	. 
	ld a,(bc)			;6ba3	0a 	. 
	ld b,08ch		;6ba4	06 8c 	. . 
	cp a			;6ba6	bf 	. 
	xor d			;6ba7	aa 	. 
	sbc a,l			;6ba8	9d 	. 
	adc a,h			;6ba9	8c 	. 
	ld a,(bc)			;6baa	0a 	. 
	ld b,0bfh		;6bab	06 bf 	. . 
	adc a,h			;6bad	8c 	. 
	ld a,(bc)			;6bae	0a 	. 
	inc b			;6baf	04 	. 
	or b			;6bb0	b0 	. 
	ld a,(bc)			;6bb1	0a 	. 
	dec bc			;6bb2	0b 	. 
	xor d			;6bb3	aa 	. 
	or a			;6bb4	b7 	. 
	cp d			;6bb5	ba 	. 
	ld a,(bc)			;6bb6	0a 	. 
	ld b,0b2h		;6bb7	06 b2 	. . 
	cp a			;6bb9	bf 	. 
	inc bc			;6bba	03 	. 
	sbc a,b			;6bbb	98 	. 
	add a,d			;6bbc	82 	. 
	or l			;6bbd	b5 	. 
	or b			;6bbe	b0 	. 
	ld a,(bc)			;6bbf	0a 	. 
	inc bc			;6bc0	03 	. 
	sub l			;6bc1	95 	. 
	or l			;6bc2	b5 	. 
	or b			;6bc3	b0 	. 
	ld a,(bc)			;6bc4	0a 	. 
	inc bc			;6bc5	03 	. 
	sub a			;6bc6	97 	. 
	inc bc			;6bc7	03 	. 
	and (hl)			;6bc8	a6 	. 
	xor d			;6bc9	aa 	. 
	or a			;6bca	b7 	. 
	cp d			;6bcb	ba 	. 
	ld a,(bc)			;6bcc	0a 	. 
	ld b,0b2h		;6bcd	06 b2 	. . 
	cp a			;6bcf	bf 	. 
	xor d			;6bd0	aa 	. 
	or a			;6bd1	b7 	. 
	or e			;6bd2	b3 	. 
	ld a,(bc)			;6bd3	0a 	. 
	ld b,0bfh		;6bd4	06 bf 	. . 
	or e			;6bd6	b3 	. 
	ld a,(bc)			;6bd7	0a 	. 
	inc b			;6bd8	04 	. 
	inc b			;6bd9	04 	. 
	dec b			;6bda	05 	. 
	nop			;6bdb	00 	. 
	nop			;6bdc	00 	. 
	ld c,0ach		;6bdd	0e ac 	. . 
	adc a,h			;6bdf	8c 	. 
	ld a,(bc)			;6be0	0a 	. 
	ld e,0ach		;6be1	1e ac 	. . 
	add a,h			;6be3	84 	. 
	nop			;6be4	00 	. 
	ld c,(hl)			;6be5	4e 	N 
	xor d			;6be6	aa 	. 
	nop			;6be7	00 	. 
	ld d,h			;6be8	54 	T 
	adc a,b			;6be9	88 	. 
	or e			;6bea	b3 	. 
	sub e			;6beb	93 	. 
	nop			;6bec	00 	. 
	ld e,b			;6bed	58 	X 
	or (hl)			;6bee	b6 	. 
	or e			;6bef	b3 	. 
	sub h			;6bf0	94 	. 
	xor d			;6bf1	aa 	. 
	nop			;6bf2	00 	. 
	ld e,a			;6bf3	5f 	_ 
	sub (hl)			;6bf4	96 	. 
	add a,e			;6bf5	83 	. 
	sub h			;6bf6	94 	. 
	xor b			;6bf7	a8 	. 
	add a,e			;6bf8	83 	. 
	xor c			;6bf9	a9 	. 
	nop			;6bfa	00 	. 
	ld h,(hl)			;6bfb	66 	f 
	sbc a,l			;6bfc	9d 	. 
	sub b			;6bfd	90 	. 
	sub l			;6bfe	95 	. 
	nop			;6bff	00 	. 
	ld l,(hl)			;6c00	6e 	n 
l6c01h:
	xor d			;6c01	aa 	. 
	nop			;6c02	00 	. 
	adc a,(hl)			;6c03	8e 	. 
	xor d			;6c04	aa 	. 
	nop			;6c05	00 	. 
	sub h			;6c06	94 	. 
	adc a,b			;6c07	88 	. 
	adc a,h			;6c08	8c 	. 
	add a,(hl)			;6c09	86 	. 
	nop			;6c0a	00 	. 
	sbc a,b			;6c0b	98 	. 
	adc a,l			;6c0c	8d 	. 
	adc a,b			;6c0d	88 	. 
	add a,l			;6c0e	85 	. 
	adc a,d			;6c0f	8a 	. 
	adc a,h			;6c10	8c 	. 
	adc a,(hl)			;6c11	8e 	. 
	nop			;6c12	00 	. 
	sbc a,a			;6c13	9f 	. 
	adc a,c			;6c14	89 	. 
	adc a,h			;6c15	8c 	. 
	add a,c			;6c16	81 	. 
	add a,d			;6c17	82 	. 
	adc a,h			;6c18	8c 	. 
	add a,(hl)			;6c19	86 	. 
	nop			;6c1a	00 	. 
	and (hl)			;6c1b	a6 	. 
	add a,l			;6c1c	85 	. 
	add a,d			;6c1d	82 	. 
	add a,l			;6c1e	85 	. 
	nop			;6c1f	00 	. 
	xor (hl)			;6c20	ae 	. 
	xor d			;6c21	aa 	. 
	nop			;6c22	00 	. 
	adc a,0aah		;6c23	ce aa 	. . 
	nop			;6c25	00 	. 
	jp nc,083aah		;6c26	d2 aa 83 	. . . 
	add a,e			;6c29	83 	. 
	sub a			;6c2a	97 	. 
	add a,e			;6c2b	83 	. 
	xor e			;6c2c	ab 	. 
	add a,e			;6c2d	83 	. 
	add a,e			;6c2e	83 	. 
	sub l			;6c2f	95 	. 
	nop			;6c30	00 	. 
	ex (sp),hl			;6c31	e3 	. 
	sub a			;6c32	97 	. 
	add a,e			;6c33	83 	. 
	xor e			;6c34	ab 	. 
	add a,e			;6c35	83 	. 
	add a,e			;6c36	83 	. 
	sub a			;6c37	97 	. 
	add a,e			;6c38	83 	. 
	xor e			;6c39	ab 	. 
	nop			;6c3a	00 	. 
	xor 0aah		;6c3b	ee aa 	. . 
	ld bc,laa0eh		;6c3d	01 0e aa 	. . . 
	ld bc,laa12h		;6c40	01 12 aa 	. . . 
	or e			;6c43	b3 	. 
	or e			;6c44	b3 	. 
	or a			;6c45	b7 	. 
	or e			;6c46	b3 	. 
	cp e			;6c47	bb 	. 
	or e			;6c48	b3 	. 
	or e			;6c49	b3 	. 
	sub l			;6c4a	95 	. 
	ld bc,lb723h		;6c4b	01 23 b7 	. # . 
	or e			;6c4e	b3 	. 
	cp e			;6c4f	bb 	. 
	or e			;6c50	b3 	. 
	or e			;6c51	b3 	. 
	or a			;6c52	b7 	. 
	or e			;6c53	b3 	. 
	cp e			;6c54	bb 	. 
	ld bc,laa2eh		;6c55	01 2e aa 	. . . 
	ld bc,la84ch		;6c58	01 4c a8 	. L . 
	sbc a,h			;6c5b	9c 	. 
	sbc a,(hl)			;6c5c	9e 	. 
	sbc a,h			;6c5d	9c 	. 
	ld a,(bc)			;6c5e	0a 	. 
	ld b,0bch		;6c5f	06 bc 	. . 
	xor h			;6c61	ac 	. 
	ld a,(bc)			;6c62	0a 	. 
	rrca			;6c63	0f 	. 
	sbc a,h			;6c64	9c 	. 
	ld a,(bc)			;6c65	0a 	. 
	ld b,09eh		;6c66	06 9e 	. . 
	sbc a,h			;6c68	9c 	. 
	cp h			;6c69	bc 	. 
	ld bc,laa8ch		;6c6a	01 8c aa 	. . . 
	or l			;6c6d	b5 	. 
	ld a,(bc)			;6c6e	0a 	. 
	ex af,af'			;6c6f	08 	. 
	cp a			;6c70	bf 	. 
	cp d			;6c71	ba 	. 
	ld a,(bc)			;6c72	0a 	. 
	rrca			;6c73	0f 	. 
	or l			;6c74	b5 	. 
	ld a,(bc)			;6c75	0a 	. 
	ex af,af'			;6c76	08 	. 
	cp a			;6c77	bf 	. 
	ld bc,laecch		;6c78	01 cc ae 	. . . 
	cp l			;6c7b	bd 	. 
	cp h			;6c7c	bc 	. 
	ld a,(bc)			;6c7d	0a 	. 
	rlca			;6c7e	07 	. 
	cp a			;6c7f	bf 	. 
	cp h			;6c80	bc 	. 
	ld a,(bc)			;6c81	0a 	. 
	ld c,0beh		;6c82	0e be 	. . 
	cp l			;6c84	bd 	. 
	cp h			;6c85	bc 	. 
	ld a,(bc)			;6c86	0a 	. 
	rlca			;6c87	07 	. 
	cp a			;6c88	bf 	. 
	add a,h			;6c89	84 	. 
	ld (bc),a			;6c8a	02 	. 
	inc c			;6c8b	0c 	. 
	xor d			;6c8c	aa 	. 
	sbc a,a			;6c8d	9f 	. 
	and c			;6c8e	a1 	. 
	or b			;6c8f	b0 	. 
	ld a,(bc)			;6c90	0a 	. 
	dec b			;6c91	05 	. 
	adc a,e			;6c92	8b 	. 
	cp a			;6c93	bf 	. 
	add a,a			;6c94	87 	. 
	ld (bc),a			;6c95	02 	. 
	add hl,de			;6c96	19 	. 
	xor d			;6c97	aa 	. 
	ld (bc),a			;6c98	02 	. 
	inc hl			;6c99	23 	# 
	xor d			;6c9a	aa 	. 
	ld (bc),a			;6c9b	02 	. 
	dec h			;6c9c	25 	% 
	add a,d			;6c9d	82 	. 
	xor a			;6c9e	af 	. 
	sbc a,a			;6c9f	9f 	. 
	and c			;6ca0	a1 	. 
	or b			;6ca1	b0 	. 
	ld a,(bc)			;6ca2	0a 	. 
	dec b			;6ca3	05 	. 
	adc a,e			;6ca4	8b 	. 
	cp a			;6ca5	bf 	. 
	ld (bc),a			;6ca6	02 	. 
	ld c,h			;6ca7	4c 	L 
	xor d			;6ca8	aa 	. 
	sub l			;6ca9	95 	. 
	xor d			;6caa	aa 	. 
	ld (bc),a			;6cab	02 	. 
	ld d,c			;6cac	51 	Q 
	xor d			;6cad	aa 	. 
	ld (bc),a			;6cae	02 	. 
	ld d,h			;6caf	54 	T 
	xor d			;6cb0	aa 	. 
	ld (bc),a			;6cb1	02 	. 
	ld d,(hl)			;6cb2	56 	V 
	cp a			;6cb3	bf 	. 
	ld (bc),a			;6cb4	02 	. 
	ld e,c			;6cb5	59 	Y 
	xor d			;6cb6	aa 	. 
	ld (bc),a			;6cb7	02 	. 
	ld h,e			;6cb8	63 	c 
	xor d			;6cb9	aa 	. 
	ld (bc),a			;6cba	02 	. 
	ld h,(hl)			;6cbb	66 	f 
	xor d			;6cbc	aa 	. 
	sub l			;6cbd	95 	. 
	xor d			;6cbe	aa 	. 
	ld (bc),a			;6cbf	02 	. 
	ld l,e			;6cc0	6b 	k 
	xor d			;6cc1	aa 	. 
	ld (bc),a			;6cc2	02 	. 
	ld l,(hl)			;6cc3	6e 	n 
	xor d			;6cc4	aa 	. 
	ld (bc),a			;6cc5	02 	. 
	ld (hl),b			;6cc6	70 	p 
	cp a			;6cc7	bf 	. 
	ld (bc),a			;6cc8	02 	. 
	adc a,h			;6cc9	8c 	. 
	xor d			;6cca	aa 	. 
	sub l			;6ccb	95 	. 
	xor d			;6ccc	aa 	. 
	ld (bc),a			;6ccd	02 	. 
	sub c			;6cce	91 	. 
	xor d			;6ccf	aa 	. 
	ld (bc),a			;6cd0	02 	. 
	sub h			;6cd1	94 	. 
	xor d			;6cd2	aa 	. 
	ld (bc),a			;6cd3	02 	. 
	sub (hl)			;6cd4	96 	. 
	cp a			;6cd5	bf 	. 
	ld (bc),a			;6cd6	02 	. 
	sbc a,c			;6cd7	99 	. 
	xor d			;6cd8	aa 	. 
	and b			;6cd9	a0 	. 
	adc a,h			;6cda	8c 	. 
	ld a,(bc)			;6cdb	0a 	. 
	ld (bc),a			;6cdc	02 	. 
	sub b			;6cdd	90 	. 
	sbc a,b			;6cde	98 	. 
	adc a,h			;6cdf	8c 	. 
	adc a,h			;6ce0	8c 	. 
	and h			;6ce1	a4 	. 
	xor d			;6ce2	aa 	. 
	ld (bc),a			;6ce3	02 	. 
	and (hl)			;6ce4	a6 	. 
	xor d			;6ce5	aa 	. 
	sub l			;6ce6	95 	. 
	xor d			;6ce7	aa 	. 
	ld (bc),a			;6ce8	02 	. 
	xor e			;6ce9	ab 	. 
	xor d			;6cea	aa 	. 
	ld (bc),a			;6ceb	02 	. 
	xor (hl)			;6cec	ae 	. 
	xor d			;6ced	aa 	. 
	ld (bc),a			;6cee	02 	. 
	or b			;6cef	b0 	. 
	cp a			;6cf0	bf 	. 
	ld (bc),a			;6cf1	02 	. 
	call z,l95aah		;6cf2	cc aa 95 	. . . 
	xor d			;6cf5	aa 	. 
	adc a,h			;6cf6	8c 	. 
	adc a,h			;6cf7	8c 	. 
	xor (hl)			;6cf8	ae 	. 
	adc a,h			;6cf9	8c 	. 
	adc a,h			;6cfa	8c 	. 
	xor (hl)			;6cfb	ae 	. 
	ld (bc),a			;6cfc	02 	. 
	sub 0bfh		;6cfd	d6 bf 	. . 
	ld (bc),a			;6cff	02 	. 
	exx			;6d00	d9 	. 
	xor d			;6d01	aa 	. 
l6d02h:
	xor (hl)			;6d02	ae 	. 
	xor d			;6d03	aa 	. 
	add a,e			;6d04	83 	. 
	sub l			;6d05	95 	. 
	ld a,(bc)			;6d06	0a 	. 
	ld (bc),a			;6d07	02 	. 
	sub a			;6d08	97 	. 
	xor e			;6d09	ab 	. 
	xor d			;6d0a	aa 	. 
	xor (hl)			;6d0b	ae 	. 
	ld (bc),a			;6d0c	02 	. 
	and 0aah		;6d0d	e6 aa 	. . 
	sub l			;6d0f	95 	. 
	xor d			;6d10	aa 	. 
	adc a,h			;6d11	8c 	. 
	adc a,h			;6d12	8c 	. 
	xor (hl)			;6d13	ae 	. 
	adc a,h			;6d14	8c 	. 
	adc a,h			;6d15	8c 	. 
	xor (hl)			;6d16	ae 	. 
	ld (bc),a			;6d17	02 	. 
	ret p			;6d18	f0 	. 
	cp a			;6d19	bf 	. 
	inc bc			;6d1a	03 	. 
	inc c			;6d1b	0c 	. 
	xor d			;6d1c	aa 	. 
	sub l			;6d1d	95 	. 
	xor d			;6d1e	aa 	. 
	inc bc			;6d1f	03 	. 
	ld de,003aah		;6d20	11 aa 03 	. . . 
	inc d			;6d23	14 	. 
	xor d			;6d24	aa 	. 
	inc bc			;6d25	03 	. 
	ld d,0bfh		;6d26	16 bf 	. . 
	inc bc			;6d28	03 	. 
	add hl,de			;6d29	19 	. 
	xor d			;6d2a	aa 	. 
	ld a,(bc)			;6d2b	0a 	. 
	ld (bc),a			;6d2c	02 	. 
	or b			;6d2d	b0 	. 
	sub l			;6d2e	95 	. 
	ld a,(bc)			;6d2f	0a 	. 
	ld (bc),a			;6d30	02 	. 
	or l			;6d31	b5 	. 
	cp d			;6d32	ba 	. 
	xor d			;6d33	aa 	. 
	xor d			;6d34	aa 	. 
	inc bc			;6d35	03 	. 
	ld h,0aah		;6d36	26 aa 	& . 
	sub l			;6d38	95 	. 
	xor d			;6d39	aa 	. 
	inc bc			;6d3a	03 	. 
	dec hl			;6d3b	2b 	+ 
	xor d			;6d3c	aa 	. 
	inc bc			;6d3d	03 	. 
	ld l,0aah		;6d3e	2e aa 	. . 
	inc bc			;6d40	03 	. 
	jr nc,l6d02h		;6d41	30 bf 	0 . 
	inc bc			;6d43	03 	. 
	ld b,b			;6d44	40 	@ 
	adc a,h			;6d45	8c 	. 
	adc a,h			;6d46	8c 	. 
	xor (hl)			;6d47	ae 	. 
	sbc a,l			;6d48	9d 	. 
	adc a,h			;6d49	8c 	. 
	ld a,(bc)			;6d4a	0a 	. 
	ld b,0bfh		;6d4b	06 bf 	. . 
	xor d			;6d4d	aa 	. 
	sub l			;6d4e	95 	. 
	xor d			;6d4f	aa 	. 
	adc a,h			;6d50	8c 	. 
	adc a,h			;6d51	8c 	. 
	xor (hl)			;6d52	ae 	. 
	adc a,h			;6d53	8c 	. 
	adc a,h			;6d54	8c 	. 
	xor (hl)			;6d55	ae 	. 
	inc bc			;6d56	03 	. 
	ld d,(hl)			;6d57	56 	V 
	cp a			;6d58	bf 	. 
	inc bc			;6d59	03 	. 
	ld e,c			;6d5a	59 	Y 
	xor d			;6d5b	aa 	. 
	adc a,(hl)			;6d5c	8e 	. 
	adc a,h			;6d5d	8c 	. 
	ld a,(bc)			;6d5e	0a 	. 
	ld (bc),a			;6d5f	02 	. 
	add a,l			;6d60	85 	. 
	adc a,l			;6d61	8d 	. 
	adc a,h			;6d62	8c 	. 
	adc a,h			;6d63	8c 	. 
	adc a,(hl)			;6d64	8e 	. 
	xor (hl)			;6d65	ae 	. 
	inc bc			;6d66	03 	. 
	ld h,(hl)			;6d67	66 	f 
	xor d			;6d68	aa 	. 
	sub l			;6d69	95 	. 
	xor d			;6d6a	aa 	. 
	adc a,h			;6d6b	8c 	. 
	adc a,h			;6d6c	8c 	. 
	xor (hl)			;6d6d	ae 	. 
	adc a,h			;6d6e	8c 	. 
	adc a,h			;6d6f	8c 	. 
	xor (hl)			;6d70	ae 	. 
	inc bc			;6d71	03 	. 
	ld (hl),b			;6d72	70 	p 
	cp a			;6d73	bf 	. 
	inc bc			;6d74	03 	. 
	add a,b			;6d75	80 	. 
	or e			;6d76	b3 	. 
	or e			;6d77	b3 	. 
	cp e			;6d78	bb 	. 
	or a			;6d79	b7 	. 
	or e			;6d7a	b3 	. 
	ld a,(bc)			;6d7b	0a 	. 
	ld b,0bfh		;6d7c	06 bf 	. . 
	xor d			;6d7e	aa 	. 
	sub l			;6d7f	95 	. 
	or d			;6d80	b2 	. 
	or e			;6d81	b3 	. 
	ld a,(bc)			;6d82	0a 	. 
	dec b			;6d83	05 	. 
	sub b			;6d84	90 	. 
	cp a			;6d85	bf 	. 
	and b			;6d86	a0 	. 
	or b			;6d87	b0 	. 
	cp d			;6d88	ba 	. 
	inc bc			;6d89	03 	. 
	and e			;6d8a	a3 	. 
	xor d			;6d8b	aa 	. 
	or b			;6d8c	b0 	. 
	or b			;6d8d	b0 	. 
	xor d			;6d8e	aa 	. 
	sub l			;6d8f	95 	. 
	or d			;6d90	b2 	. 
	or e			;6d91	b3 	. 
	ld a,(bc)			;6d92	0a 	. 
	dec b			;6d93	05 	. 
	sub b			;6d94	90 	. 
	cp a			;6d95	bf 	. 
	and b			;6d96	a0 	. 
	or b			;6d97	b0 	. 
	ld a,(bc)			;6d98	0a 	. 
	dec c			;6d99	0d 	. 
	inc b			;6d9a	04 	. 
	ld b,000h		;6d9b	06 00 	. . 
	ld bc,l9c0fh		;6d9d	01 0f 9c 	. . . 
	adc a,h			;6da0	8c 	. 
	ld a,(bc)			;6da1	0a 	. 
	dec d			;6da2	15 	. 
	xor h			;6da3	ac 	. 
	ld bc,l954fh		;6da4	01 4f 95 	. O . 
	ld bc,la856h		;6da7	01 56 a8 	. V . 
	ld bc,l9858h		;6daa	01 58 98 	. X . 
	adc a,h			;6dad	8c 	. 
	sub b			;6dae	90 	. 
	ld bc,lac5ch		;6daf	01 5c ac 	. \ . 
	add a,h			;6db2	84 	. 
	xor b			;6db3	a8 	. 
	ld bc,laa66h		;6db4	01 66 aa 	. f . 
	ld bc,l958fh		;6db7	01 8f 95 	. . . 
	ld bc,la094h		;6dba	01 94 a0 	. . . 
	ld bc,laa96h		;6dbd	01 96 aa 	. . . 
	ld bc,l9798h		;6dc0	01 98 97 	. . . 
	add a,e			;6dc3	83 	. 
	sub l			;6dc4	95 	. 
	ld bc,laa9ch		;6dc5	01 9c aa 	. . . 
	ld bc,laa9eh		;6dc8	01 9e aa 	. . . 
	ld bc,la0a0h		;6dcb	01 a0 a0 	. . . 
	ld bc,laaa6h		;6dce	01 a6 aa 	. . . 
	ld bc,l95cfh		;6dd1	01 cf 95 	. . . 
	ld bc,083d5h		;6dd4	01 d5 83 	. . . 
	add a,c			;6dd7	81 	. 
	ld bc,l81d8h		;6dd8	01 d8 81 	. . . 
	ld bc,l81dah		;6ddb	01 da 81 	. . . 
	ld bc,l83dch		;6dde	01 dc 83 	. . . 
	and c			;6de1	a1 	. 
	or d			;6de2	b2 	. 
	or e			;6de3	b3 	. 
	or e			;6de4	b3 	. 
	or b			;6de5	b0 	. 
	ld a,(bc)			;6de6	0a 	. 
	inc bc			;6de7	03 	. 
	ld bc,laae6h		;6de8	01 e6 aa 	. . . 
	ld (bc),a			;6deb	02 	. 
	rrca			;6dec	0f 	. 
	sub l			;6ded	95 	. 
	and b			;6dee	a0 	. 
	or b			;6def	b0 	. 
	or a			;6df0	b7 	. 
	or e			;6df1	b3 	. 
	add a,e			;6df2	83 	. 
	ld a,(bc)			;6df3	0a 	. 
	ld b,095h		;6df4	06 95 	. . 
	ld (bc),a			;6df6	02 	. 
	dec e			;6df7	1d 	. 
	xor d			;6df8	aa 	. 
	sub l			;6df9	95 	. 
	ld a,(bc)			;6dfa	0a 	. 
	dec b			;6dfb	05 	. 
	cp a			;6dfc	bf 	. 
	ld (bc),a			;6dfd	02 	. 
	ld h,0aah		;6dfe	26 aa 	& . 
	ld (bc),a			;6e00	02 	. 
	ld c,a			;6e01	4f 	O 
	sub l			;6e02	95 	. 
	ld (bc),a			;6e03	02 	. 
	ld d,d			;6e04	52 	R 
	sub l			;6e05	95 	. 
	xor b			;6e06	a8 	. 
	xor h			;6e07	ac 	. 
	ld a,(bc)			;6e08	0a 	. 
	dec b			;6e09	05 	. 
	ld (bc),a			;6e0a	02 	. 
	ld e,e			;6e0b	5b 	[ 
	sub l			;6e0c	95 	. 
	ld (bc),a			;6e0d	02 	. 
	ld e,l			;6e0e	5d 	] 
	xor d			;6e0f	aa 	. 
	sub l			;6e10	95 	. 
	ld a,(bc)			;6e11	0a 	. 
	dec b			;6e12	05 	. 
	cp a			;6e13	bf 	. 
	ld (bc),a			;6e14	02 	. 
	ld h,(hl)			;6e15	66 	f 
	xor d			;6e16	aa 	. 
	ld (bc),a			;6e17	02 	. 
	adc a,a			;6e18	8f 	. 
	sub l			;6e19	95 	. 
	ld (bc),a			;6e1a	02 	. 
	sub d			;6e1b	92 	. 
	sub l			;6e1c	95 	. 
	xor d			;6e1d	aa 	. 
	ld a,(bc)			;6e1e	0a 	. 
	ld b,002h		;6e1f	06 02 	. . 
	sbc a,e			;6e21	9b 	. 
	sub l			;6e22	95 	. 
	ld (bc),a			;6e23	02 	. 
	sbc a,l			;6e24	9d 	. 
	xor d			;6e25	aa 	. 
	sub l			;6e26	95 	. 
	ld a,(bc)			;6e27	0a 	. 
	dec b			;6e28	05 	. 
	cp a			;6e29	bf 	. 
	ld (bc),a			;6e2a	02 	. 
	and (hl)			;6e2b	a6 	. 
	xor d			;6e2c	aa 	. 
	ld (bc),a			;6e2d	02 	. 
	rst 8			;6e2e	cf 	. 
	sub l			;6e2f	95 	. 
	ld (bc),a			;6e30	02 	. 
	jp nc,l8295h		;6e31	d2 95 82 	. . . 
	add a,e			;6e34	83 	. 
	ld a,(bc)			;6e35	0a 	. 
	inc b			;6e36	04 	. 
	or e			;6e37	b3 	. 
	sub b			;6e38	90 	. 
	sub l			;6e39	95 	. 
	ld (bc),a			;6e3a	02 	. 
	defb 0ddh,082h,083h	;illegal sequence		;6e3b	dd 82 83 	. . . 
	ld a,(bc)			;6e3e	0a 	. 
	ld b,002h		;6e3f	06 02 	. . 
	and 0aah		;6e41	e6 aa 	. . 
	inc bc			;6e43	03 	. 
	rrca			;6e44	0f 	. 
	sub l			;6e45	95 	. 
	inc bc			;6e46	03 	. 
	ld (de),a			;6e47	12 	. 
	sub l			;6e48	95 	. 
	inc bc			;6e49	03 	. 
	add hl,de			;6e4a	19 	. 
	adc a,l			;6e4b	8d 	. 
	add a,l			;6e4c	85 	. 
	sub l			;6e4d	95 	. 
	inc bc			;6e4e	03 	. 
	ld h,0aah		;6e4f	26 aa 	& . 
	xor b			;6e51	a8 	. 
	cp h			;6e52	bc 	. 
	and b			;6e53	a0 	. 
	ld a,(bc)			;6e54	0a 	. 
	ld d,003h		;6e55	16 03 	. . 
	ld c,a			;6e57	4f 	O 
	sub l			;6e58	95 	. 
	inc bc			;6e59	03 	. 
	ld d,d			;6e5a	52 	R 
	sub l			;6e5b	95 	. 
	inc bc			;6e5c	03 	. 
	ld e,e			;6e5d	5b 	[ 
	sub l			;6e5e	95 	. 
	inc bc			;6e5f	03 	. 
	ld h,(hl)			;6e60	66 	f 
	xor d			;6e61	aa 	. 
	xor d			;6e62	aa 	. 
	cp a			;6e63	bf 	. 
	cp e			;6e64	bb 	. 
	ld a,(bc)			;6e65	0a 	. 
	ld d,0b0h		;6e66	16 b0 	. . 
	ld a,(bc)			;6e68	0a 	. 
	dec c			;6e69	0d 	. 
	sub b			;6e6a	90 	. 
	or l			;6e6b	b5 	. 
	or d			;6e6c	b2 	. 
	sub e			;6e6d	93 	. 
	or a			;6e6e	b7 	. 
	or e			;6e6f	b3 	. 
	or b			;6e70	b0 	. 
	ld a,(bc)			;6e71	0a 	. 
	ld b,095h		;6e72	06 95 	. . 
	or b			;6e74	b0 	. 
	ld a,(bc)			;6e75	0a 	. 
	add hl,bc			;6e76	09 	. 
	cp d			;6e77	ba 	. 
	xor d			;6e78	aa 	. 
	cp a			;6e79	bf 	. 
	xor (hl)			;6e7a	ae 	. 
	ld a,(bc)			;6e7b	0a 	. 
	ld d,004h		;6e7c	16 04 	. . 
	rlca			;6e7e	07 	. 
	nop			;6e7f	00 	. 
	nop			;6e80	00 	. 
	ld a,(de)			;6e81	1a 	. 
	adc a,b			;6e82	88 	. 
	xor (hl)			;6e83	ae 	. 
	sbc a,l			;6e84	9d 	. 
	add a,h			;6e85	84 	. 
	nop			;6e86	00 	. 
	ld d,h			;6e87	54 	T 
	and b			;6e88	a0 	. 
	or b			;6e89	b0 	. 
	ld a,(bc)			;6e8a	0a 	. 
	ld (bc),a			;6e8b	02 	. 
	adc a,h			;6e8c	8c 	. 
	ld a,(bc)			;6e8d	0a 	. 
	ld (bc),a			;6e8e	02 	. 
	adc a,(hl)			;6e8f	8e 	. 
	adc a,l			;6e90	8d 	. 
	adc a,h			;6e91	8c 	. 
	ld a,(bc)			;6e92	0a 	. 
	ld (bc),a			;6e93	02 	. 
	or b			;6e94	b0 	. 
	ld a,(bc)			;6e95	0a 	. 
	ld (bc),a			;6e96	02 	. 
	sub b			;6e97	90 	. 
	nop			;6e98	00 	. 
	adc a,l			;6e99	8d 	. 
	and b			;6e9a	a0 	. 
	or b			;6e9b	b0 	. 
	or b			;6e9c	b0 	. 
	cp d			;6e9d	ba 	. 
	add a,e			;6e9e	83 	. 
	or e			;6e9f	b3 	. 
	or e			;6ea0	b3 	. 
	sub c			;6ea1	91 	. 
	xor b			;6ea2	a8 	. 
	sub h			;6ea3	94 	. 
	cp h			;6ea4	bc 	. 
	nop			;6ea5	00 	. 
	sbc a,c			;6ea6	99 	. 
	or a			;6ea7	b7 	. 
	sub e			;6ea8	93 	. 
	add a,l			;6ea9	85 	. 
	adc a,d			;6eaa	8a 	. 
	xor e			;6eab	ab 	. 
	adc a,e			;6eac	8b 	. 
	nop			;6ead	00 	. 
	and b			;6eae	a0 	. 
	sbc a,h			;6eaf	9c 	. 
	adc a,h			;6eb0	8c 	. 
	sub h			;6eb1	94 	. 
	and d			;6eb2	a2 	. 
	or e			;6eb3	b3 	. 
	or e			;6eb4	b3 	. 
	add a,e			;6eb5	83 	. 
	or l			;6eb6	b5 	. 
	or b			;6eb7	b0 	. 
	or b			;6eb8	b0 	. 
	sub b			;6eb9	90 	. 
	nop			;6eba	00 	. 
	res 4,b		;6ebb	cb a0 	. . 
	or b			;6ebd	b0 	. 
	cp d			;6ebe	ba 	. 
	xor b			;6ebf	a8 	. 
	adc a,h			;6ec0	8c 	. 
	xor h			;6ec1	ac 	. 
	nop			;6ec2	00 	. 
	jp nc,l849dh		;6ec3	d2 9d 84 	. . . 
	sub c			;6ec6	91 	. 
	xor d			;6ec7	aa 	. 
	sub d			;6ec8	92 	. 
	cp d			;6ec9	ba 	. 
	nop			;6eca	00 	. 
	exx			;6ecb	d9 	. 
	adc a,l			;6ecc	8d 	. 
	adc a,h			;6ecd	8c 	. 
	add a,l			;6ece	85 	. 
	nop			;6ecf	00 	. 
	adc a,(ix-07ch)		;6ed0	dd 8e 84 	. . . 
	nop			;6ed3	00 	. 
	ret po			;6ed4	e0 	. 
	or a			;6ed5	b7 	. 
	or c			;6ed6	b1 	. 
	sub h			;6ed7	94 	. 
	xor d			;6ed8	aa 	. 
	adc a,h			;6ed9	8c 	. 
	and (hl)			;6eda	a6 	. 
	nop			;6edb	00 	. 
	rst 20h			;6edc	e7 	. 
	sub h			;6edd	94 	. 
	nop			;6ede	00 	. 
	jp (hl)			;6edf	e9 	. 
	sub h			;6ee0	94 	. 
	or l			;6ee1	b5 	. 
	or b			;6ee2	b0 	. 
	sub b			;6ee3	90 	. 
	ld bc,la80ah		;6ee4	01 0a a8 	. . . 
	xor (hl)			;6ee7	ae 	. 
	ld a,(bc)			;6ee8	0a 	. 
	ld (bc),a			;6ee9	02 	. 
	xor d			;6eea	aa 	. 
	or b			;6eeb	b0 	. 
	cp b			;6eec	b8 	. 
	ld bc,lb312h		;6eed	01 12 b3 	. . . 
	or e			;6ef0	b3 	. 
	or c			;6ef1	b1 	. 
	sbc a,b			;6ef2	98 	. 
	adc a,h			;6ef3	8c 	. 
	ld a,(bc)			;6ef4	0a 	. 
	ld (bc),a			;6ef5	02 	. 
	add a,e			;6ef6	83 	. 
	ld a,(bc)			;6ef7	0a 	. 
	dec b			;6ef8	05 	. 
	adc a,h			;6ef9	8c 	. 
	ld a,(bc)			;6efa	0a 	. 
	ld (bc),a			;6efb	02 	. 
	and h			;6efc	a4 	. 
	or d			;6efd	b2 	. 
	or c			;6efe	b1 	. 
	or d			;6eff	b2 	. 
	ld bc,la327h		;6f00	01 27 a3 	. ' . 
	or a			;6f03	b7 	. 
	add a,c			;6f04	81 	. 
	sbc a,l			;6f05	9d 	. 
	ld a,(bc)			;6f06	0a 	. 
	ld (bc),a			;6f07	02 	. 
	sub h			;6f08	94 	. 
	ld bc,l8c45h		;6f09	01 45 8c 	. E . 
	cp a			;6f0c	bf 	. 
	adc a,h			;6f0d	8c 	. 
	ld bc,laa49h		;6f0e	01 49 aa 	. I . 
	cp e			;6f11	bb 	. 
	ld a,(bc)			;6f12	0a 	. 
	inc bc			;6f13	03 	. 
	adc a,h			;6f14	8c 	. 
	ld a,(bc)			;6f15	0a 	. 
	ld (bc),a			;6f16	02 	. 
	adc a,(hl)			;6f17	8e 	. 
	ld bc,l9461h		;6f18	01 61 94 	. a . 
	and b			;6f1b	a0 	. 
	ld bc,l8d66h		;6f1c	01 66 8d 	. f . 
	adc a,h			;6f1f	8c 	. 
	ld a,(bc)			;6f20	0a 	. 
	ld (bc),a			;6f21	02 	. 
	or a			;6f22	b7 	. 
	ld a,(bc)			;6f23	0a 	. 
	inc bc			;6f24	03 	. 
	sub l			;6f25	95 	. 
	ld bc,08c70h		;6f26	01 70 8c 	. p . 
	cp a			;6f29	bf 	. 
	adc a,h			;6f2a	8c 	. 
	ld bc,laa83h		;6f2b	01 83 aa 	. . . 
	cp a			;6f2e	bf 	. 
	ld a,(bc)			;6f2f	0a 	. 
	dec b			;6f30	05 	. 
	cp d			;6f31	ba 	. 
	add a,(hl)			;6f32	86 	. 
	ld bc,lb08eh		;6f33	01 8e b0 	. . . 
	cp h			;6f36	bc 	. 
	cp h			;6f37	bc 	. 
	cp a			;6f38	bf 	. 
	ld a,(bc)			;6f39	0a 	. 
	ex af,af'			;6f3a	08 	. 
	cp l			;6f3b	bd 	. 
	cp h			;6f3c	bc 	. 
	or h			;6f3d	b4 	. 
	sub b			;6f3e	90 	. 
	ld bc,l95a1h		;6f3f	01 a1 95 	. . . 
	xor d			;6f42	aa 	. 
	ld bc,l95a4h		;6f43	01 a4 95 	. . . 
	xor b			;6f46	a8 	. 
	ld bc,l90a7h		;6f47	01 a7 90 	. . . 
	ld bc,l89ach		;6f4a	01 ac 89 	. . . 
	and l			;6f4d	a5 	. 
	cp a			;6f4e	bf 	. 
	ld a,(bc)			;6f4f	0a 	. 
	dec b			;6f50	05 	. 
	sub l			;6f51	95 	. 
	ld bc,l88bdh		;6f52	01 bd 88 	. . . 
	sbc a,l			;6f55	9d 	. 
	ld bc,0aac3h		;6f56	01 c3 aa 	. . . 
	cp a			;6f59	bf 	. 
	ld a,(bc)			;6f5a	0a 	. 
	inc b			;6f5b	04 	. 
	or l			;6f5c	b5 	. 
	cp (hl)			;6f5d	be 	. 
	ld bc,laacdh		;6f5e	01 cd aa 	. . . 
	sub l			;6f61	95 	. 
	ld bc,lbfddh		;6f62	01 dd bf 	. . . 
	ld bc,l95e1h		;6f65	01 e1 95 	. . . 
	xor d			;6f68	aa 	. 
	ld bc,l95e4h		;6f69	01 e4 95 	. . . 
	xor d			;6f6c	aa 	. 
	ld bc,l95e7h		;6f6d	01 e7 95 	. . . 
	xor d			;6f70	aa 	. 
	ld bc,l94eah		;6f71	01 ea 94 	. . . 
	and b			;6f74	a0 	. 
	ld bc,laaeeh		;6f75	01 ee aa 	. . . 
	cp a			;6f78	bf 	. 
	ld a,(bc)			;6f79	0a 	. 
	inc b			;6f7a	04 	. 
	sub l			;6f7b	95 	. 
	ld bc,l88fah		;6f7c	01 fa 88 	. . . 
	sbc a,l			;6f7f	9d 	. 
	ld bc,l81feh		;6f80	01 fe 81 	. . . 
	ld (bc),a			;6f83	02 	. 
	inc b			;6f84	04 	. 
	xor d			;6f85	aa 	. 
	cp a			;6f86	bf 	. 
	ld a,(bc)			;6f87	0a 	. 
	ld (bc),a			;6f88	02 	. 
	or l			;6f89	b5 	. 
	cp a			;6f8a	bf 	. 
	cp a			;6f8b	bf 	. 
	ld (bc),a			;6f8c	02 	. 
	dec c			;6f8d	0d 	. 
	xor d			;6f8e	aa 	. 
	sub l			;6f8f	95 	. 
	ld (bc),a			;6f90	02 	. 
	ld d,0a0h		;6f91	16 a0 	. . 
	or b			;6f93	b0 	. 
	ld a,(bc)			;6f94	0a 	. 
	ld (bc),a			;6f95	02 	. 
	ld (bc),a			;6f96	02 	. 
	dec e			;6f97	1d 	. 
	cp a			;6f98	bf 	. 
	ld (bc),a			;6f99	02 	. 
	ld hl,lbab5h		;6f9a	21 b5 ba 	! . . 
	or b			;6f9d	b0 	. 
	or l			;6f9e	b5 	. 
	cp d			;6f9f	ba 	. 
	or b			;6fa0	b0 	. 
	or l			;6fa1	b5 	. 
	cp d			;6fa2	ba 	. 
	or b			;6fa3	b0 	. 
	or l			;6fa4	b5 	. 
	cp d			;6fa5	ba 	. 
	or b			;6fa6	b0 	. 
	or l			;6fa7	b5 	. 
	cp b			;6fa8	b8 	. 
	cp d			;6fa9	ba 	. 
	cp a			;6faa	bf 	. 
	ld a,(bc)			;6fab	0a 	. 
	ld (bc),a			;6fac	02 	. 
	sub l			;6fad	95 	. 
	ld (bc),a			;6fae	02 	. 
	scf			;6faf	37 	7 
	and b			;6fb0	a0 	. 
	cp h			;6fb1	bc 	. 
	sub b			;6fb2	90 	. 
	or b			;6fb3	b0 	. 
	or c			;6fb4	b1 	. 
	sub a			;6fb5	97 	. 
	add a,e			;6fb6	83 	. 
	or l			;6fb7	b5 	. 
	or b			;6fb8	b0 	. 
	ld (bc),a			;6fb9	02 	. 
	ld b,h			;6fba	44 	D 
	xor d			;6fbb	aa 	. 
	cp a			;6fbc	bf 	. 
	ld a,(bc)			;6fbd	0a 	. 
	ld (bc),a			;6fbe	02 	. 
	sub a			;6fbf	97 	. 
	cp a			;6fc0	bf 	. 
	cp a			;6fc1	bf 	. 
	ld (bc),a			;6fc2	02 	. 
	ld c,(hl)			;6fc3	4e 	N 
	cp c			;6fc4	b9 	. 
	or h			;6fc5	b4 	. 
	xor b			;6fc6	a8 	. 
	adc a,h			;6fc7	8c 	. 
	ld a,(bc)			;6fc8	0a 	. 
	inc b			;6fc9	04 	. 
	adc a,(hl)			;6fca	8e 	. 
	adc a,h			;6fcb	8c 	. 
	adc a,h			;6fcc	8c 	. 
	adc a,(hl)			;6fcd	8e 	. 
	xor h			;6fce	ac 	. 
	and b			;6fcf	a0 	. 
	cp h			;6fd0	bc 	. 
	sub c			;6fd1	91 	. 
	ld (bc),a			;6fd2	02 	. 
	ld h,c			;6fd3	61 	a 
	sub a			;6fd4	97 	. 
	xor e			;6fd5	ab 	. 
	add a,e			;6fd6	83 	. 
	sub a			;6fd7	97 	. 
	xor e			;6fd8	ab 	. 
	add a,e			;6fd9	83 	. 
	sub a			;6fda	97 	. 
	xor e			;6fdb	ab 	. 
	add a,e			;6fdc	83 	. 
	sub a			;6fdd	97 	. 
	xor e			;6fde	ab 	. 
	add a,e			;6fdf	83 	. 
	sub a			;6fe0	97 	. 
	xor e			;6fe1	ab 	. 
	xor e			;6fe2	ab 	. 
	cp a			;6fe3	bf 	. 
	ld a,(bc)			;6fe4	0a 	. 
	ld (bc),a			;6fe5	02 	. 
	sub l			;6fe6	95 	. 
	ld (bc),a			;6fe7	02 	. 
	ld a,b			;6fe8	78 	x 
	adc a,a			;6fe9	8f 	. 
	ld (bc),a			;6fea	02 	. 
	ld a,d			;6feb	7a 	z 
	adc a,l			;6fec	8d 	. 
	adc a,h			;6fed	8c 	. 
	sub h			;6fee	94 	. 
	ld (bc),a			;6fef	02 	. 
	ld a,(hl)			;6ff0	7e 	~ 
	sbc a,h			;6ff1	9c 	. 
	adc a,h			;6ff2	8c 	. 
	ld (bc),a			;6ff3	02 	. 
	add a,h			;6ff4	84 	. 
	xor d			;6ff5	aa 	. 
	cp a			;6ff6	bf 	. 
	ld a,(bc)			;6ff7	0a 	. 
	ld (bc),a			;6ff8	02 	. 
	sub l			;6ff9	95 	. 
	cp a			;6ffa	bf 	. 
	cp a			;6ffb	bf 	. 
	ld (bc),a			;6ffc	02 	. 
	adc a,l			;6ffd	8d 	. 
	add a,d			;6ffe	82 	. 
	xor l			;6fff	ad 	. 
	sbc a,(hl)			;7000	9e 	. 
	xor e			;7001	ab 	. 
	ld (bc),a			;7002	02 	. 
	sub d			;7003	92 	. 
	sbc a,h			;7004	9c 	. 
	ld a,(bc)			;7005	0a 	. 
l7006h:
	ld (bc),a			;7006	02 	. 
	sbc a,(hl)			;7007	9e 	. 
	sbc a,l			;7008	9d 	. 
	sbc a,h			;7009	9c 	. 
	sbc a,h			;700a	9c 	. 
	sub h			;700b	94 	. 
	xor d			;700c	aa 	. 
	adc a,e			;700d	8b 	. 
	cp h			;700e	bc 	. 
	add a,a			;700f	87 	. 
	ld (bc),a			;7010	02 	. 
	and b			;7011	a0 	. 
	adc a,d			;7012	8a 	. 
	sub l			;7013	95 	. 
	xor d			;7014	aa 	. 
	ld (bc),a			;7015	02 	. 
	and h			;7016	a4 	. 
	sub l			;7017	95 	. 
	xor d			;7018	aa 	. 
	ld (bc),a			;7019	02 	. 
	and a			;701a	a7 	. 
	sub l			;701b	95 	. 
	xor d			;701c	aa 	. 
	ld (bc),a			;701d	02 	. 
	xor d			;701e	aa 	. 
	sub l			;701f	95 	. 
	xor d			;7020	aa 	. 
	ld (bc),a			;7021	02 	. 
	xor l			;7022	ad 	. 
	sub l			;7023	95 	. 
	xor d			;7024	aa 	. 
	xor d			;7025	aa 	. 
	cp a			;7026	bf 	. 
	ld a,(bc)			;7027	0a 	. 
	ld (bc),a			;7028	02 	. 
	sub l			;7029	95 	. 
	ld (bc),a			;702a	02 	. 
	or l			;702b	b5 	. 
	adc a,b			;702c	88 	. 
	xor (hl)			;702d	ae 	. 
	sbc a,l			;702e	9d 	. 
	add a,h			;702f	84 	. 
	sub (hl)			;7030	96 	. 
	add a,e			;7031	83 	. 
	sub h			;7032	94 	. 
	sub l			;7033	95 	. 
	ld (bc),a			;7034	02 	. 
	cp (hl)			;7035	be 	. 
	sub l			;7036	95 	. 
	ld (bc),a			;7037	02 	. 
	call nz,0bfaah		;7038	c4 aa bf 	. . . 
	ld a,(bc)			;703b	0a 	. 
	ld (bc),a			;703c	02 	. 
	sbc a,l			;703d	9d 	. 
	cp a			;703e	bf 	. 
	cp a			;703f	bf 	. 
	ld (bc),a			;7040	02 	. 
	call z,sub_8c8ch		;7041	cc 8c 8c 	. . . 
	xor h			;7044	ac 	. 
	ld (bc),a			;7045	02 	. 
	ret nc			;7046	d0 	. 
	xor d			;7047	aa 	. 
	ld (bc),a			;7048	02 	. 
	jp nc,00a95h		;7049	d2 95 0a 	. . . 
	rlca			;704c	07 	. 
	xor d			;704d	aa 	. 
	ld (bc),a			;704e	02 	. 
	call c,08ca8h		;704f	dc a8 8c 	. . . 
	adc a,h			;7052	8c 	. 
	add a,h			;7053	84 	. 
	ld (bc),a			;7054	02 	. 
	pop hl			;7055	e1 	. 
	sbc a,l			;7056	9d 	. 
	xor (hl)			;7057	ae 	. 
	adc a,h			;7058	8c 	. 
	sbc a,l			;7059	9d 	. 
	xor (hl)			;705a	ae 	. 
	adc a,h			;705b	8c 	. 
	sbc a,l			;705c	9d 	. 
	xor (hl)			;705d	ae 	. 
	adc a,h			;705e	8c 	. 
	sbc a,l			;705f	9d 	. 
	xor (hl)			;7060	ae 	. 
	adc a,h			;7061	8c 	. 
	sbc a,l			;7062	9d 	. 
	xor (hl)			;7063	ae 	. 
	xor d			;7064	aa 	. 
	cp a			;7065	bf 	. 
	ld a,(bc)			;7066	0a 	. 
	ld (bc),a			;7067	02 	. 
	sub l			;7068	95 	. 
	xor (hl)			;7069	ae 	. 
	add a,h			;706a	84 	. 
	xor d			;706b	aa 	. 
	sub l			;706c	95 	. 
	ld (bc),a			;706d	02 	. 
	ld sp,hl			;706e	f9 	. 
	add a,l			;706f	85 	. 
	sbc a,b			;7070	98 	. 
	adc a,l			;7071	8d 	. 
	adc a,l			;7072	8d 	. 
	sub b			;7073	90 	. 
	add a,c			;7074	81 	. 
	inc bc			;7075	03 	. 
	nop			;7076	00 	. 
	and b			;7077	a0 	. 
	and b			;7078	a0 	. 
	xor b			;7079	a8 	. 
	cp h			;707a	bc 	. 
	xor d			;707b	aa 	. 
	cp a			;707c	bf 	. 
	ld a,(bc)			;707d	0a 	. 
	ld (bc),a			;707e	02 	. 
	sub l			;707f	95 	. 
	cp a			;7080	bf 	. 
	cp a			;7081	bf 	. 
	inc bc			;7082	03 	. 
	inc c			;7083	0c 	. 
	xor d			;7084	aa 	. 
	cp a			;7085	bf 	. 
	adc a,d			;7086	8a 	. 
	xor h			;7087	ac 	. 
	adc a,(hl)			;7088	8e 	. 
	adc a,h			;7089	8c 	. 
	sub l			;708a	95 	. 
	ld a,(bc)			;708b	0a 	. 
	ld b,09dh		;708c	06 9d 	. . 
	adc a,(hl)			;708e	8e 	. 
	xor h			;708f	ac 	. 
	adc a,(hl)			;7090	8e 	. 
	xor d			;7091	aa 	. 
	cp a			;7092	bf 	. 
	inc bc			;7093	03 	. 
	ld hl,laa95h		;7094	21 95 aa 	! . . 
	inc bc			;7097	03 	. 
	inc h			;7098	24 	$ 
	sub l			;7099	95 	. 
	xor d			;709a	aa 	. 
	inc bc			;709b	03 	. 
	daa			;709c	27 	' 
	sub l			;709d	95 	. 
	xor d			;709e	aa 	. 
	inc bc			;709f	03 	. 
	ld hl,(laa95h)		;70a0	2a 95 aa 	* . . 
	inc bc			;70a3	03 	. 
	dec l			;70a4	2d 	- 
	sub l			;70a5	95 	. 
	xor d			;70a6	aa 	. 
	xor d			;70a7	aa 	. 
	cp a			;70a8	bf 	. 
	ld a,(bc)			;70a9	0a 	. 
	ld (bc),a			;70aa	02 	. 
	sub l			;70ab	95 	. 
	add a,d			;70ac	82 	. 
	cp b			;70ad	b8 	. 
	or e			;70ae	b3 	. 
	or e			;70af	b3 	. 
	or h			;70b0	b4 	. 
	inc bc			;70b1	03 	. 
	ld a,(00395h)		;70b2	3a 95 03 	: . . 
	dec a			;70b5	3d 	= 
	sub l			;70b6	95 	. 
	inc bc			;70b7	03 	. 
	ccf			;70b8	3f 	? 
	xor (hl)			;70b9	ae 	. 
	cp e			;70ba	bb 	. 
	ld a,(bc)			;70bb	0a 	. 
	ld (bc),a			;70bc	02 	. 
	cp a			;70bd	bf 	. 
	xor d			;70be	aa 	. 
	cp a			;70bf	bf 	. 
	ld a,(bc)			;70c0	0a 	. 
	ld (bc),a			;70c1	02 	. 
	sub l			;70c2	95 	. 
	cp a			;70c3	bf 	. 
	cp a			;70c4	bf 	. 
	adc a,b			;70c5	88 	. 
	xor (hl)			;70c6	ae 	. 
	cp a			;70c7	bf 	. 
	xor (hl)			;70c8	ae 	. 
	cp d			;70c9	ba 	. 
	or b			;70ca	b0 	. 
	or b			;70cb	b0 	. 
	or l			;70cc	b5 	. 
	ld a,(bc)			;70cd	0a 	. 
	rlca			;70ce	07 	. 
	or b			;70cf	b0 	. 
	cp d			;70d0	ba 	. 
	cp d			;70d1	ba 	. 
	xor (hl)			;70d2	ae 	. 
	cp a			;70d3	bf 	. 
	adc a,h			;70d4	8c 	. 
	inc bc			;70d5	03 	. 
	ld h,c			;70d6	61 	a 
	sub l			;70d7	95 	. 
	xor d			;70d8	aa 	. 
	inc bc			;70d9	03 	. 
l70dah:
	ld h,h			;70da	64 	d 
	sub l			;70db	95 	. 
	xor d			;70dc	aa 	. 
	inc bc			;70dd	03 	. 
	ld h,a			;70de	67 	g 
	sub l			;70df	95 	. 
	xor d			;70e0	aa 	. 
	inc bc			;70e1	03 	. 
	ld l,d			;70e2	6a 	j 
	sub l			;70e3	95 	. 
	xor d			;70e4	aa 	. 
	inc bc			;70e5	03 	. 
	ld l,l			;70e6	6d 	m 
	sub l			;70e7	95 	. 
	xor d			;70e8	aa 	. 
	xor d			;70e9	aa 	. 
	cp a			;70ea	bf 	. 
	ld a,(bc)			;70eb	0a 	. 
	ld (bc),a			;70ec	02 	. 
	sub l			;70ed	95 	. 
	inc bc			;70ee	03 	. 
	ld (hl),l			;70ef	75 	u 
	sub l			;70f0	95 	. 
	inc bc			;70f1	03 	. 
	ld a,b			;70f2	78 	x 
	xor d			;70f3	aa 	. 
	inc bc			;70f4	03 	. 
	ld a,d			;70f5	7a 	z 
	or c			;70f6	b1 	. 
	cp h			;70f7	bc 	. 
	or b			;70f8	b0 	. 
	add a,c			;70f9	81 	. 
	xor b			;70fa	a8 	. 
	adc a,(hl)			;70fb	8e 	. 
	xor (hl)			;70fc	ae 	. 
	ld a,(bc)			;70fd	0a 	. 
	ld (bc),a			;70fe	02 	. 
	cp a			;70ff	bf 	. 
	xor d			;7100	aa 	. 
	cp a			;7101	bf 	. 
	ld a,(bc)			;7102	0a 	. 
l7103h:
	ld (bc),a			;7103	02 	. 
	sbc a,a			;7104	9f 	. 
	cp a			;7105	bf 	. 
	cp a			;7106	bf 	. 
	inc bc			;7107	03 	. 
	adc a,h			;7108	8c 	. 
	xor d			;7109	aa 	. 
	cp a			;710a	bf 	. 
	inc bc			;710b	03 	. 
	sbc a,l			;710c	9d 	. 
	xor d			;710d	aa 	. 
	cp a			;710e	bf 	. 
	inc bc			;710f	03 	. 
	and c			;7110	a1 	. 
	sbc a,a			;7111	9f 	. 
	xor a			;7112	af 	. 
	adc a,a			;7113	8f 	. 
	sbc a,a			;7114	9f 	. 
	xor a			;7115	af 	. 
	adc a,a			;7116	8f 	. 
	sbc a,a			;7117	9f 	. 
	xor a			;7118	af 	. 
	adc a,a			;7119	8f 	. 
	sbc a,a			;711a	9f 	. 
	xor a			;711b	af 	. 
	adc a,a			;711c	8f 	. 
	sbc a,a			;711d	9f 	. 
	xor a			;711e	af 	. 
	xor a			;711f	af 	. 
	cp a			;7120	bf 	. 
	ld a,(bc)			;7121	0a 	. 
	ld (bc),a			;7122	02 	. 
	sub l			;7123	95 	. 
	and b			;7124	a0 	. 
	or l			;7125	b5 	. 
	or b			;7126	b0 	. 
	or b			;7127	b0 	. 
	cp d			;7128	ba 	. 
	sub b			;7129	90 	. 
	inc bc			;712a	03 	. 
	cp e			;712b	bb 	. 
	cp a			;712c	bf 	. 
	inc bc			;712d	03 	. 
	cp (hl)			;712e	be 	. 
	xor d			;712f	aa 	. 
	inc b			;7130	04 	. 
	ex af,af'			;7131	08 	. 
	nop			;7132	00 	. 
	nop			;7133	00 	. 
	ld de,09d88h		;7134	11 88 9d 	. . . 
	nop			;7137	00 	. 
	jr z,l70dah		;7138	28 a0 	( . 
	sub b			;713a	90 	. 
	nop			;713b	00 	. 
	ld c,c			;713c	49 	I 
	sub b			;713d	90 	. 
	nop			;713e	00 	. 
	ld c,e			;713f	4b 	K 
	xor (hl)			;7140	ae 	. 
	add a,h			;7141	84 	. 
	cp b			;7142	b8 	. 
	sub b			;7143	90 	. 
	sub (hl)			;7144	96 	. 
	add a,e			;7145	83 	. 
	sub h			;7146	94 	. 
	add a,c			;7147	81 	. 
	sub (hl)			;7148	96 	. 
	add a,e			;7149	83 	. 
	sub h			;714a	94 	. 
	adc a,b			;714b	88 	. 
	cp a			;714c	bf 	. 
	add a,h			;714d	84 	. 
	nop			;714e	00 	. 
	ld e,e			;714f	5b 	[ 
	xor (hl)			;7150	ae 	. 
	sbc a,l			;7151	9d 	. 
	nop			;7152	00 	. 
	ld h,a			;7153	67 	g 
	add a,d			;7154	82 	. 
	xor e			;7155	ab 	. 
	sub a			;7156	97 	. 
	add a,c			;7157	81 	. 
	nop			;7158	00 	. 
	add a,(hl)			;7159	86 	. 
	cp b			;715a	b8 	. 
	or h			;715b	b4 	. 
	add a,d			;715c	82 	. 
	sub a			;715d	97 	. 
	nop			;715e	00 	. 
	adc a,e			;715f	8b 	. 
	cp (hl)			;7160	be 	. 
	sub h			;7161	94 	. 
	adc a,d			;7162	8a 	. 
	nop			;7163	00 	. 
	adc a,a			;7164	8f 	. 
	add a,l			;7165	85 	. 
	sbc a,h			;7166	9c 	. 
	xor l			;7167	ad 	. 
	nop			;7168	00 	. 
	sub e			;7169	93 	. 
	add a,l			;716a	85 	. 
	nop			;716b	00 	. 
	sub l			;716c	95 	. 
	cp c			;716d	b9 	. 
	sub b			;716e	90 	. 
	add a,e			;716f	83 	. 
	sbc a,h			;7170	9c 	. 
	xor h			;7171	ac 	. 
	xor b			;7172	a8 	. 
	adc a,(hl)			;7173	8e 	. 
	adc a,l			;7174	8d 	. 
	sub h			;7175	94 	. 
	nop			;7176	00 	. 
	sbc a,a			;7177	9f 	. 
	xor (hl)			;7178	ae 	. 
	add a,h			;7179	84 	. 
	nop			;717a	00 	. 
	and a			;717b	a7 	. 
	sbc a,b			;717c	98 	. 
	and e			;717d	a3 	. 
	sub e			;717e	93 	. 
	and h			;717f	a4 	. 
	nop			;7180	00 	. 
	call nz,sub_b0a0h		;7181	c4 a0 b0 	. . . 
	xor d			;7184	aa 	. 
	sub l			;7185	95 	. 
	xor d			;7186	aa 	. 
	cp a			;7187	bf 	. 
	nop			;7188	00 	. 
	res 0,e		;7189	cb 83 	. . 
	or c			;718b	b1 	. 
	sub a			;718c	97 	. 
	xor e			;718d	ab 	. 
	or b			;718e	b0 	. 
	add a,c			;718f	81 	. 
	add a,d			;7190	82 	. 
	sub (hl)			;7191	96 	. 
	add a,e			;7192	83 	. 
	sub h			;7193	94 	. 
	adc a,d			;7194	8a 	. 
	xor d			;7195	aa 	. 
	or e			;7196	b3 	. 
	sub c			;7197	91 	. 
	and d			;7198	a2 	. 
	or e			;7199	b3 	. 
	sub l			;719a	95 	. 
	nop			;719b	00 	. 
	sub ixl		;719c	dd 95 	. . 
	nop			;719e	00 	. 
	rst 18h			;719f	df 	. 
	cp (hl)			;71a0	be 	. 
	sub h			;71a1	94 	. 
	nop			;71a2	00 	. 
	jp po,l84aeh		;71a3	e2 ae 84 	. . . 
	nop			;71a6	00 	. 
	and 0aah		;71a7	e6 aa 	. . 
	xor b			;71a9	a8 	. 
	add a,a			;71aa	87 	. 
	adc a,e			;71ab	8b 	. 
	sub h			;71ac	94 	. 
	sub l			;71ad	95 	. 
	nop			;71ae	00 	. 
	xor 09ch		;71af	ee 9c 	. . 
	xor h			;71b1	ac 	. 
	ld bc,la001h		;71b2	01 01 a0 	. . . 
	sub b			;71b5	90 	. 
	ld bc,l9504h		;71b6	01 04 95 	. . . 
	ld bc,l9506h		;71b9	01 06 95 	. . . 
	and b			;71bc	a0 	. 
	or d			;71bd	b2 	. 
	or e			;71be	b3 	. 
	ld bc,l8d0ch		;71bf	01 0c 8d 	. . . 
	sub h			;71c2	94 	. 
	xor b			;71c3	a8 	. 
	adc a,(hl)			;71c4	8e 	. 
	sbc a,b			;71c5	98 	. 
	add a,e			;71c6	83 	. 
	add a,e			;71c7	83 	. 
	and h			;71c8	a4 	. 
	add a,l			;71c9	85 	. 
	ld bc,l9816h		;71ca	01 16 98 	. . . 
	adc a,h			;71cd	8c 	. 
	adc a,l			;71ce	8d 	. 
	sbc a,d			;71cf	9a 	. 
	and b			;71d0	a0 	. 
	cp h			;71d1	bc 	. 
	sub b			;71d2	90 	. 
	add a,l			;71d3	85 	. 
	ld bc,0bf1fh		;71d4	01 1f bf 	. . . 
	sub l			;71d7	95 	. 
	and b			;71d8	a0 	. 
	or d			;71d9	b2 	. 
	sub b			;71da	90 	. 
	ld bc,laa26h		;71db	01 26 aa 	. & . 
	xor d			;71de	aa 	. 
	sub l			;71df	95 	. 
	xor d			;71e0	aa 	. 
	sub l			;71e1	95 	. 
	sub l			;71e2	95 	. 
	ld bc,lb72dh		;71e3	01 2d b7 	. - . 
	sub c			;71e6	91 	. 
	and d			;71e7	a2 	. 
	cp e			;71e8	bb 	. 
	ld bc,lb036h		;71e9	01 36 b0 	. 6 . 
	ld bc,lab41h		;71ec	01 41 ab 	. A . 
	sub a			;71ef	97 	. 
	ld bc,l9045h		;71f0	01 45 90 	. E . 
	xor b			;71f3	a8 	. 
	add a,c			;71f4	81 	. 
	ld bc,la94ah		;71f5	01 4a a9 	. J . 
	ld bc,l954dh		;71f8	01 4d 95 	. M . 
	xor d			;71fb	aa 	. 
	ld bc,08550h		;71fc	01 50 85 	. P . 
	ld bc,l9c52h		;71ff	01 52 9c 	. R . 
	adc a,(hl)			;7202	8e 	. 
	sub h			;7203	94 	. 
	xor d			;7204	aa 	. 
	ld bc,laa59h		;7205	01 59 aa 	. Y . 
	ld bc,0bf5bh		;7208	01 5b bf 	. [ . 
	ld bc,lae5dh		;720b	01 5d ae 	. ] . 
	sbc a,l			;720e	9d 	. 
	ld bc,la860h		;720f	01 60 a8 	. ` . 
	add a,c			;7212	81 	. 
	ld bc,l8263h		;7213	01 63 82 	. c . 
	sub h			;7216	94 	. 
	ld bc,laa66h		;7217	01 66 aa 	. f . 
	xor d			;721a	aa 	. 
	sub l			;721b	95 	. 
	xor d			;721c	aa 	. 
	sub l			;721d	95 	. 
	sub l			;721e	95 	. 
	ld bc,l956eh		;721f	01 6e 95 	. n . 
	xor d			;7222	aa 	. 
	ld bc,lb074h		;7223	01 74 b0 	. t . 
	or d			;7226	b2 	. 
	cp a			;7227	bf 	. 
	or c			;7228	b1 	. 
	or b			;7229	b0 	. 
	ld bc,lb880h		;722a	01 80 b8 	. . . 
	sbc a,h			;722d	9c 	. 
	cp h			;722e	bc 	. 
	sub b			;722f	90 	. 
	add a,d			;7230	82 	. 
	sub a			;7231	97 	. 
	xor d			;7232	aa 	. 
	ld bc,la088h		;7233	01 88 a0 	. . . 
	add a,(hl)			;7236	86 	. 
	add a,e			;7237	83 	. 
	adc a,c			;7238	89 	. 
	sub b			;7239	90 	. 
	add a,c			;723a	81 	. 
	add a,d			;723b	82 	. 
l723ch:
	ld bc,lb790h		;723c	01 90 b7 	. . . 
	or e			;723f	b3 	. 
	sub c			;7240	91 	. 
	ld bc,lb394h		;7241	01 94 b3 	. . . 
l7244h:
	or e			;7244	b3 	. 
	sub l			;7245	95 	. 
	ld bc,laa99h		;7246	01 99 aa 	. . . 
	ld bc,0839bh		;7249	01 9b 83 	. . . 
	ld bc,laa9dh		;724c	01 9d aa 	. . . 
	sub l			;724f	95 	. 
	ld bc,laaa0h		;7250	01 a0 aa 	. . . 
	ld bc,lb0a3h		;7253	01 a3 b0 	. . . 
	or l			;7256	b5 	. 
	sbc a,h			;7257	9c 	. 
	adc a,(hl)			;7258	8e 	. 
	adc a,(hl)			;7259	8e 	. 
	adc a,l			;725a	8d 	. 
	adc a,(hl)			;725b	8e 	. 
	adc a,l			;725c	8d 	. 
	adc a,l			;725d	8d 	. 
	xor h			;725e	ac 	. 
	or b			;725f	b0 	. 
	or l			;7260	b5 	. 
	xor d			;7261	aa 	. 
	ld bc,lb8b2h		;7262	01 b2 b8 	. . . 
	cp a			;7265	bf 	. 
	cp a			;7266	bf 	. 
	or e			;7267	b3 	. 
	ld bc,lb3b7h		;7268	01 b7 b3 	. . . 
	cp a			;726b	bf 	. 
	cp a			;726c	bf 	. 
	or h			;726d	b4 	. 
	ld bc,lbdc0h		;726e	01 c0 bd 	. . . 
	sub h			;7271	94 	. 
	cp h			;7272	bc 	. 
	sub l			;7273	95 	. 
	xor d			;7274	aa 	. 
	cp a			;7275	bf 	. 
	ld bc,laac8h		;7276	01 c8 aa 	. . . 
	ld bc,l95cch		;7279	01 cc 95 	. . . 
	ld bc,l95d2h		;727c	01 d2 95 	. . . 
	ld bc,l95d4h		;727f	01 d4 95 	. . . 
	ld bc,l8cd7h		;7282	01 d7 8c 	. . . 
	cp a			;7285	bf 	. 
	adc a,h			;7286	8c 	. 
	ld bc,0b8dch		;7287	01 dc b8 	. . . 
	or e			;728a	b3 	. 
	or e			;728b	b3 	. 
	or h			;728c	b4 	. 
	ld bc,l95e3h		;728d	01 e3 95 	. . . 
	and b			;7290	a0 	. 
	sub b			;7291	90 	. 
	ld bc,laaeeh		;7292	01 ee aa 	. . . 
	ld bc,l83f1h		;7295	01 f1 83 	. . . 
	cp a			;7298	bf 	. 
	sbc a,a			;7299	9f 	. 
	adc a,a			;729a	8f 	. 
	adc a,a			;729b	8f 	. 
	adc a,h			;729c	8c 	. 
	adc a,a			;729d	8f 	. 
	adc a,a			;729e	8f 	. 
	xor a			;729f	af 	. 
	cp a			;72a0	bf 	. 
	add a,e			;72a1	83 	. 
	ld bc,l9cfdh		;72a2	01 fd 9c 	. . . 
	sub h			;72a5	94 	. 
	ld (bc),a			;72a6	02 	. 
	nop			;72a7	00 	. 
	sub e			;72a8	93 	. 
	add a,c			;72a9	81 	. 
	or e			;72aa	b3 	. 
	or c			;72ab	b1 	. 
	or d			;72ac	b2 	. 
	add a,e			;72ad	83 	. 
	or b			;72ae	b0 	. 
	cp h			;72af	bc 	. 
	or d			;72b0	b2 	. 
	ld (bc),a			;72b1	02 	. 
	dec bc			;72b2	0b 	. 
	or b			;72b3	b0 	. 
	or c			;72b4	b1 	. 
	cp a			;72b5	bf 	. 
	cp a			;72b6	bf 	. 
	or b			;72b7	b0 	. 
	or b			;72b8	b0 	. 
	ld (bc),a			;72b9	02 	. 
	ld (de),a			;72ba	12 	. 
	sub l			;72bb	95 	. 
	ld (bc),a			;72bc	02 	. 
	inc d			;72bd	14 	. 
	sub l			;72be	95 	. 
	ld (bc),a			;72bf	02 	. 
	ld d,097h		;72c0	16 97 	. . 
	add a,e			;72c2	83 	. 
	ld a,(bc)			;72c3	0a 	. 
	ld (bc),a			;72c4	02 	. 
	xor e			;72c5	ab 	. 
	ld (bc),a			;72c6	02 	. 
	inc e			;72c7	1c 	. 
	sub l			;72c8	95 	. 
	ld (bc),a			;72c9	02 	. 
	rra			;72ca	1f 	. 
	cp d			;72cb	ba 	. 
	or b			;72cc	b0 	. 
	or b			;72cd	b0 	. 
	ld (bc),a			;72ce	02 	. 
	inc h			;72cf	24 	$ 
	xor e			;72d0	ab 	. 
	sub a			;72d1	97 	. 
	ld (bc),a			;72d2	02 	. 
	add hl,hl			;72d3	29 	) 
	sbc a,h			;72d4	9c 	. 
	adc a,h			;72d5	8c 	. 
	sub h			;72d6	94 	. 
	ld (bc),a			;72d7	02 	. 
	ld l,0a0h		;72d8	2e a0 	. . 
	cp h			;72da	bc 	. 
	sub b			;72db	90 	. 
	ld (bc),a			;72dc	02 	. 
	ld (09dbfh),a		;72dd	32 bf 9d 	2 . . 
	ld a,(bc)			;72e0	0a 	. 
	ld (bc),a			;72e1	02 	. 
	cp a			;72e2	bf 	. 
	xor (hl)			;72e3	ae 	. 
	ld a,(bc)			;72e4	0a 	. 
	ld (bc),a			;72e5	02 	. 
	cp a			;72e6	bf 	. 
	ld (bc),a			;72e7	02 	. 
	inc a			;72e8	3c 	< 
	or a			;72e9	b7 	. 
	sub c			;72ea	91 	. 
	or e			;72eb	b3 	. 
	sub l			;72ec	95 	. 
	add a,l			;72ed	85 	. 
	sbc a,h			;72ee	9c 	. 
	add a,l			;72ef	85 	. 
	ld (bc),a			;72f0	02 	. 
	ld b,h			;72f1	44 	D 
	adc a,d			;72f2	8a 	. 
	xor h			;72f3	ac 	. 
	and b			;72f4	a0 	. 
	cp a			;72f5	bf 	. 
	sub b			;72f6	90 	. 
	ld (bc),a			;72f7	02 	. 
	ld c,e			;72f8	4b 	K 
	add a,e			;72f9	83 	. 
	add a,e			;72fa	83 	. 
	cp a			;72fb	bf 	. 
	cp a			;72fc	bf 	. 
	add a,e			;72fd	83 	. 
	add a,e			;72fe	83 	. 
	and b			;72ff	a0 	. 
	sub c			;7300	91 	. 
	ld (bc),a			;7301	02 	. 
	ld d,h			;7302	54 	T 
	add a,c			;7303	81 	. 
	ld (bc),a			;7304	02 	. 
	ld d,(hl)			;7305	56 	V 
	and c			;7306	a1 	. 
	cp b			;7307	b8 	. 
	or h			;7308	b4 	. 
	sub b			;7309	90 	. 
	add a,d			;730a	82 	. 
	ld (bc),a			;730b	02 	. 
	ld e,h			;730c	5c 	\ 
	sub l			;730d	95 	. 
	ld (bc),a			;730e	02 	. 
	ld e,(hl)			;730f	5e 	^ 
	sub (hl)			;7310	96 	. 
	ld (bc),a			;7311	02 	. 
	ld h,d			;7312	62 	b 
	xor c			;7313	a9 	. 
	and b			;7314	a0 	. 
	cp d			;7315	ba 	. 
	or l			;7316	b5 	. 
	sub b			;7317	90 	. 
	or a			;7318	b7 	. 
	or e			;7319	b3 	. 
	sub c			;731a	91 	. 
	ld (bc),a			;731b	02 	. 
	ld l,e			;731c	6b 	k 
	or e			;731d	b3 	. 
	or e			;731e	b3 	. 
	sub l			;731f	95 	. 
	ld (bc),a			;7320	02 	. 
	ld l,a			;7321	6f 	o 
	cp a			;7322	bf 	. 
	ld (bc),a			;7323	02 	. 
	ld (hl),d			;7324	72 	r 
	cp a			;7325	bf 	. 
	sub a			;7326	97 	. 
	ld a,(bc)			;7327	0a 	. 
	ld (bc),a			;7328	02 	. 
	cp a			;7329	bf 	. 
	xor e			;732a	ab 	. 
	ld a,(bc)			;732b	0a 	. 
	ld (bc),a			;732c	02 	. 
	cp a			;732d	bf 	. 
	ld (bc),a			;732e	02 	. 
	ld a,l			;732f	7d 	} 
	sub l			;7330	95 	. 
	sub l			;7331	95 	. 
	ld (bc),a			;7332	02 	. 
	add a,c			;7333	81 	. 
	sub l			;7334	95 	. 
	ld (bc),a			;7335	02 	. 
	add a,l			;7336	85 	. 
	xor d			;7337	aa 	. 
	xor d			;7338	aa 	. 
	cp a			;7339	bf 	. 
	sub l			;733a	95 	. 
	ld (bc),a			;733b	02 	. 
	adc a,l			;733c	8d 	. 
	cp a			;733d	bf 	. 
	cp a			;733e	bf 	. 
	ld (bc),a			;733f	02 	. 
	sub b			;7340	90 	. 
	add a,d			;7341	82 	. 
	xor e			;7342	ab 	. 
	sub a			;7343	97 	. 
	add a,c			;7344	81 	. 
	ld (bc),a			;7345	02 	. 
	sub a			;7346	97 	. 
	xor d			;7347	aa 	. 
	sub l			;7348	95 	. 
	ld (bc),a			;7349	02 	. 
	sbc a,e			;734a	9b 	. 
	sbc a,b			;734b	98 	. 
	adc a,l			;734c	8d 	. 
	adc a,h			;734d	8c 	. 
	adc a,l			;734e	8d 	. 
	and h			;734f	a4 	. 
	ld (bc),a			;7350	02 	. 
	and d			;7351	a2 	. 
	xor d			;7352	aa 	. 
	xor d			;7353	aa 	. 
	ld (bc),a			;7354	02 	. 
	and (hl)			;7355	a6 	. 
	sub l			;7356	95 	. 
	ld (bc),a			;7357	02 	. 
	xor c			;7358	a9 	. 
	sub l			;7359	95 	. 
	ld (bc),a			;735a	02 	. 
	xor e			;735b	ab 	. 
l735ch:
	sub l			;735c	95 	. 
	ld (bc),a			;735d	02 	. 
	xor a			;735e	af 	. 
	add a,e			;735f	83 	. 
	ld (bc),a			;7360	02 	. 
	or d			;7361	b2 	. 
	cp a			;7362	bf 	. 
	sub a			;7363	97 	. 
	add a,a			;7364	87 	. 
	add a,a			;7365	87 	. 
	adc a,a			;7366	8f 	. 
	adc a,e			;7367	8b 	. 
	adc a,e			;7368	8b 	. 
	xor e			;7369	ab 	. 
	cp a			;736a	bf 	. 
	ld (bc),a			;736b	02 	. 
	cp l			;736c	bd 	. 
	add a,c			;736d	81 	. 
	add a,c			;736e	81 	. 
	ld (bc),a			;736f	02 	. 
	pop bc			;7370	c1 	. 
	add a,l			;7371	85 	. 
	ld (bc),a			;7372	02 	. 
	push bc			;7373	c5 	. 
	adc a,d			;7374	8a 	. 
	add a,d			;7375	82 	. 
	add a,e			;7376	83 	. 
	add a,c			;7377	81 	. 
	and b			;7378	a0 	. 
	adc a,h			;7379	8c 	. 
	ld a,(bc)			;737a	0a 	. 
	dec bc			;737b	0b 	. 
	sub b			;737c	90 	. 
	adc a,(hl)			;737d	8e 	. 
	adc a,l			;737e	8d 	. 
	ld (bc),a			;737f	02 	. 
	jp c,00296h		;7380	da 96 02 	. . . 
	ret po			;7383	e0 	. 
	xor c			;7384	a9 	. 
	adc a,b			;7385	88 	. 
	adc a,(hl)			;7386	8e 	. 
	add a,d			;7387	82 	. 
	ld (bc),a			;7388	02 	. 
	and 081h		;7389	e6 81 	. . 
	ld (bc),a			;738b	02 	. 
	jp (hl)			;738c	e9 	. 
	add a,l			;738d	85 	. 
	ld (bc),a			;738e	02 	. 
	ex de,hl			;738f	eb 	. 
	add a,l			;7390	85 	. 
	ld (bc),a			;7391	02 	. 
	rst 28h			;7392	ef 	. 
	xor b			;7393	a8 	. 
	sub a			;7394	97 	. 
	add a,e			;7395	83 	. 
	ld a,(bc)			;7396	0a 	. 
	ld a,(bc)			;7397	0a 	. 
	xor e			;7398	ab 	. 
	sub h			;7399	94 	. 
	inc bc			;739a	03 	. 
	nop			;739b	00 	. 
	sbc a,l			;739c	9d 	. 
	inc bc			;739d	03 	. 
	ld (bc),a			;739e	02 	. 
	and b			;739f	a0 	. 
	or b			;73a0	b0 	. 
	cp a			;73a1	bf 	. 
	cp a			;73a2	bf 	. 
	or b			;73a3	b0 	. 
	sub b			;73a4	90 	. 
	inc bc			;73a5	03 	. 
	add hl,bc			;73a6	09 	. 
	cp d			;73a7	ba 	. 
	or b			;73a8	b0 	. 
	ld a,(bc)			;73a9	0a 	. 
	dec bc			;73aa	0b 	. 
	or l			;73ab	b5 	. 
	inc bc			;73ac	03 	. 
	ld a,(de)			;73ad	1a 	. 
	sub l			;73ae	95 	. 
	inc bc			;73af	03 	. 
	jr nz,l735ch		;73b0	20 aa 	  . 
	adc a,b			;73b2	88 	. 
	xor (hl)			;73b3	ae 	. 
	sbc a,l			;73b4	9d 	. 
	add a,h			;73b5	84 	. 
	or b			;73b6	b0 	. 
	or b			;73b7	b0 	. 
	cp a			;73b8	bf 	. 
	cp a			;73b9	bf 	. 
	or b			;73ba	b0 	. 
	or b			;73bb	b0 	. 
	inc bc			;73bc	03 	. 
	ld l,08fh		;73bd	2e 8f 	. . 
	ld a,(bc)			;73bf	0a 	. 
	djnz l73c5h		;73c0	10 03 	. . 
	ld b,b			;73c2	40 	@ 
	adc a,l			;73c3	8d 	. 
	sub h			;73c4	94 	. 
l73c5h:
	add a,d			;73c5	82 	. 
	add a,e			;73c6	83 	. 
	cp a			;73c7	bf 	. 
	cp a			;73c8	bf 	. 
	add a,e			;73c9	83 	. 
	add a,c			;73ca	81 	. 
	inc bc			;73cb	03 	. 
	ld c,c			;73cc	49 	I 
	sub l			;73cd	95 	. 
	inc bc			;73ce	03 	. 
	ld d,(hl)			;73cf	56 	V 
	xor d			;73d0	aa 	. 
	inc bc			;73d1	03 	. 
	ld e,d			;73d2	5a 	Z 
	sub l			;73d3	95 	. 
	inc bc			;73d4	03 	. 
	ld h,b			;73d5	60 	` 
	xor d			;73d6	aa 	. 
	xor b			;73d7	a8 	. 
	adc a,(hl)			;73d8	8e 	. 
	adc a,l			;73d9	8d 	. 
	sub h			;73da	94 	. 
	add a,e			;73db	83 	. 
	add a,e			;73dc	83 	. 
	cp a			;73dd	bf 	. 
	cp a			;73de	bf 	. 
	add a,e			;73df	83 	. 
	add a,e			;73e0	83 	. 
	and b			;73e1	a0 	. 
	cp b			;73e2	b8 	. 
	or h			;73e3	b4 	. 
	sub b			;73e4	90 	. 
	inc bc			;73e5	03 	. 
	ld (hl),b			;73e6	70 	p 
	sbc a,b			;73e7	98 	. 
	adc a,h			;73e8	8c 	. 
	ld a,(bc)			;73e9	0a 	. 
	inc c			;73ea	0c 	. 
	and h			;73eb	a4 	. 
	inc bc			;73ec	03 	. 
	add a,c			;73ed	81 	. 
	sub l			;73ee	95 	. 
	inc bc			;73ef	03 	. 
	add a,h			;73f0	84 	. 
	cp a			;73f1	bf 	. 
	cp a			;73f2	bf 	. 
	inc bc			;73f3	03 	. 
	adc a,b			;73f4	88 	. 
	xor b			;73f5	a8 	. 
	cp l			;73f6	bd 	. 
	cp h			;73f7	bc 	. 
	ld a,(bc)			;73f8	0a 	. 
	dec bc			;73f9	0b 	. 
	cp (hl)			;73fa	be 	. 
	sub h			;73fb	94 	. 
	inc bc			;73fc	03 	. 
	sbc a,d			;73fd	9a 	. 
	add a,e			;73fe	83 	. 
	ld a,(bc)			;73ff	0a 	. 
	ld b,0aah		;7400	06 aa 	. . 
l7402h:
	inc bc			;7402	03 	. 
	and h			;7403	a4 	. 
	sub l			;7404	95 	. 
	inc bc			;7405	03 	. 
	and a			;7406	a7 	. 
	cp a			;7407	bf 	. 
	cp a			;7408	bf 	. 
	inc bc			;7409	03 	. 
	xor h			;740a	ac 	. 
	xor d			;740b	aa 	. 
	sub l			;740c	95 	. 
	inc bc			;740d	03 	. 
	xor a			;740e	af 	. 
	xor d			;740f	aa 	. 
	or b			;7410	b0 	. 
	ld a,(bc)			;7411	0a 	. 
	ld c,095h		;7412	0e 95 	. . 
	inc b			;7414	04 	. 
	add hl,bc			;7415	09 	. 
	nop			;7416	00 	. 
	nop			;7417	00 	. 
	dec (hl)			;7418	35 	5 
	or b			;7419	b0 	. 
	or b			;741a	b0 	. 
	cp h			;741b	bc 	. 
	cp h			;741c	bc 	. 
	adc a,h			;741d	8c 	. 
	nop			;741e	00 	. 
	ld (hl),c			;741f	71 	q 
	and b			;7420	a0 	. 
	cp b			;7421	b8 	. 
	cp (hl)			;7422	be 	. 
	cp a			;7423	bf 	. 
	cp a			;7424	bf 	. 
	sbc a,a			;7425	9f 	. 
	add a,e			;7426	83 	. 
	nop			;7427	00 	. 
	or b			;7428	b0 	. 
	and b			;7429	a0 	. 
	cp a			;742a	bf 	. 
	ld a,(bc)			;742b	0a 	. 
	inc bc			;742c	03 	. 
	sbc a,a			;742d	9f 	. 
	nop			;742e	00 	. 
	ret p			;742f	f0 	. 
	adc a,d			;7430	8a 	. 
	cp a			;7431	bf 	. 
	ld a,(bc)			;7432	0a 	. 
	inc bc			;7433	03 	. 
	or l			;7434	b5 	. 
	ld bc,la006h		;7435	01 06 a0 	. . . 
	sub b			;7438	90 	. 
	ld bc,l8b31h		;7439	01 31 8b 	. 1 . 
	xor a			;743c	af 	. 
	cp a			;743d	bf 	. 
	ld a,(bc)			;743e	0a 	. 
	ld (bc),a			;743f	02 	. 
l7440h:
	or h			;7440	b4 	. 
	ld bc,la040h		;7441	01 40 a0 	. @ . 
	cp h			;7444	bc 	. 
	sub b			;7445	90 	. 
	ld bc,lab46h		;7446	01 46 ab 	. F . 
	sub a			;7449	97 	. 
	ld bc,l8849h		;744a	01 49 88 	. I . 
	sbc a,l			;744d	9d 	. 
	ld bc,la04dh		;744e	01 4d a0 	. M . 
	or h			;7451	b4 	. 
	ld bc,la057h		;7452	01 57 a0 	. W . 
	ld bc,l8273h		;7455	01 73 82 	. s . 
	add a,e			;7458	83 	. 
	adc a,a			;7459	8f 	. 
	adc a,a			;745a	8f 	. 
	cp a			;745b	bf 	. 
	cp h			;745c	bc 	. 
	or b			;745d	b0 	. 
	ld bc,lbf81h		;745e	01 81 bf 	. . . 
	ld bc,la083h		;7461	01 83 a0 	. . . 
	cp h			;7464	bc 	. 
	sub b			;7465	90 	. 
	adc a,d			;7466	8a 	. 
	add a,l			;7467	85 	. 
	cp b			;7468	b8 	. 
	or h			;7469	b4 	. 
	add a,c			;746a	81 	. 
	sbc a,b			;746b	98 	. 
	adc a,l			;746c	8d 	. 
	sub b			;746d	90 	. 
	add a,l			;746e	85 	. 
	sbc a,b			;746f	98 	. 
	adc a,h			;7470	8c 	. 
	sub b			;7471	90 	. 
	and b			;7472	a0 	. 
	ld bc,lb894h		;7473	01 94 b8 	. . . 
	sub b			;7476	90 	. 
	ld bc,lab97h		;7477	01 97 ab 	. . . 
	add a,c			;747a	81 	. 
	ld bc,la09ah		;747b	01 9a a0 	. . . 
	cp h			;747e	bc 	. 
	sub b			;747f	90 	. 
	ld bc,lb8c0h		;7480	01 c0 b8 	. . . 
	sub b			;7483	90 	. 
	ld bc,lb0c3h		;7484	01 c3 b0 	. . . 
	cp a			;7487	bf 	. 
	or b			;7488	b0 	. 
	and b			;7489	a0 	. 
	or b			;748a	b0 	. 
	sbc a,d			;748b	9a 	. 
	add a,l			;748c	85 	. 
	and b			;748d	a0 	. 
	or l			;748e	b5 	. 
	ld bc,l85cdh		;748f	01 cd 85 	. . . 
	and b			;7492	a0 	. 
	or l			;7493	b5 	. 
	sub b			;7494	90 	. 
	sub l			;7495	95 	. 
	xor e			;7496	ab 	. 
	add a,c			;7497	81 	. 
	cp d			;7498	ba 	. 
	sub b			;7499	90 	. 
	ld bc,lb2d7h		;749a	01 d7 b2 	. . . 
	ld bc,lbfdbh		;749d	01 db bf 	. . . 
	ld bc,lb8dfh		;74a0	01 df b8 	. . . 
	sub b			;74a3	90 	. 
	ld (bc),a			;74a4	02 	. 
	nop			;74a5	00 	. 
	cp d			;74a6	ba 	. 
	sub b			;74a7	90 	. 
	ld (bc),a			;74a8	02 	. 
	inc bc			;74a9	03 	. 
	sub l			;74aa	95 	. 
	ld (bc),a			;74ab	02 	. 
	dec b			;74ac	05 	. 
	sbc a,(hl)			;74ad	9e 	. 
	adc a,(hl)			;74ae	8e 	. 
	ld (bc),a			;74af	02 	. 
	ex af,af'			;74b0	08 	. 
	adc a,l			;74b1	8d 	. 
	xor h			;74b2	ac 	. 
	adc a,d			;74b3	8a 	. 
	adc a,d			;74b4	8a 	. 
	and b			;74b5	a0 	. 
	or h			;74b6	b4 	. 
	adc a,d			;74b7	8a 	. 
	ld (bc),a			;74b8	02 	. 
	djnz l7440h		;74b9	10 85 	. . 
	xor b			;74bb	a8 	. 
	adc a,h			;74bc	8c 	. 
	sub h			;74bd	94 	. 
	adc a,a			;74be	8f 	. 
	add a,l			;74bf	85 	. 
	add a,d			;74c0	82 	. 
	cp a			;74c1	bf 	. 
	add a,c			;74c2	81 	. 
	and b			;74c3	a0 	. 
	cp h			;74c4	bc 	. 
	sub b			;74c5	90 	. 
	and b			;74c6	a0 	. 
	adc a,h			;74c7	8c 	. 
	and h			;74c8	a4 	. 
	adc a,d			;74c9	8a 	. 
	and b			;74ca	a0 	. 
	adc a,h			;74cb	8c 	. 
	and h			;74cc	a4 	. 
	ld (bc),a			;74cd	02 	. 
	inc h			;74ce	24 	$ 
	sub b			;74cf	90 	. 
	and b			;74d0	a0 	. 
	or h			;74d1	b4 	. 
	ld (bc),a			;74d2	02 	. 
	ld b,b			;74d3	40 	@ 
	adc a,a			;74d4	8f 	. 
	add a,l			;74d5	85 	. 
	ld (bc),a			;74d6	02 	. 
	ld b,e			;74d7	43 	C 
	sub l			;74d8	95 	. 
	and b			;74d9	a0 	. 
	sub e			;74da	93 	. 
	xor e			;74db	ab 	. 
	and b			;74dc	a0 	. 
	or a			;74dd	b7 	. 
	or e			;74de	b3 	. 
	ld (bc),a			;74df	02 	. 
	ld c,h			;74e0	4c 	L 
	sub l			;74e1	95 	. 
	sbc a,b			;74e2	98 	. 
	adc a,l			;74e3	8d 	. 
	and h			;74e4	a4 	. 
	xor d			;74e5	aa 	. 
	or e			;74e6	b3 	. 
	ld (bc),a			;74e7	02 	. 
	ld d,e			;74e8	53 	S 
	or e			;74e9	b3 	. 
	sub l			;74ea	95 	. 
	ld (bc),a			;74eb	02 	. 
	ld d,a			;74ec	57 	W 
	add a,e			;74ed	83 	. 
	or b			;74ee	b0 	. 
	or b			;74ef	b0 	. 
	adc a,a			;74f0	8f 	. 
	ld (bc),a			;74f1	02 	. 
	ld e,h			;74f2	5c 	\ 
	xor d			;74f3	aa 	. 
	ld (bc),a			;74f4	02 	. 
	ld e,(hl)			;74f5	5e 	^ 
	xor d			;74f6	aa 	. 
	ld (bc),a			;74f7	02 	. 
	ld h,b			;74f8	60 	` 
	cp d			;74f9	ba 	. 
	or b			;74fa	b0 	. 
	xor d			;74fb	aa 	. 
	add a,d			;74fc	82 	. 
	sub a			;74fd	97 	. 
	and b			;74fe	a0 	. 
	or l			;74ff	b5 	. 
	ld (bc),a			;7500	02 	. 
	ld l,b			;7501	68 	h 
	xor (hl)			;7502	ae 	. 
	add a,h			;7503	84 	. 
	and b			;7504	a0 	. 
	sub b			;7505	90 	. 
	ld (bc),a			;7506	02 	. 
	add a,c			;7507	81 	. 
	and b			;7508	a0 	. 
	cp h			;7509	bc 	. 
	sub b			;750a	90 	. 
	xor e			;750b	ab 	. 
	sub a			;750c	97 	. 
	xor b			;750d	a8 	. 
	add a,c			;750e	81 	. 
	ld (bc),a			;750f	02 	. 
	adc a,d			;7510	8a 	. 
	xor c			;7511	a9 	. 
	ld (bc),a			;7512	02 	. 
	adc a,h			;7513	8c 	. 
	cp d			;7514	ba 	. 
	or b			;7515	b0 	. 
	sub b			;7516	90 	. 
	ld (bc),a			;7517	02 	. 
	sub b			;7518	90 	. 
	sub l			;7519	95 	. 
	xor d			;751a	aa 	. 
	ld (bc),a			;751b	02 	. 
	sub e			;751c	93 	. 
	sub l			;751d	95 	. 
	and b			;751e	a0 	. 
	or h			;751f	b4 	. 
	xor b			;7520	a8 	. 
	adc a,h			;7521	8c 	. 
	add a,l			;7522	85 	. 
	adc a,d			;7523	8a 	. 
	adc a,h			;7524	8c 	. 
	sub h			;7525	94 	. 
	ld (bc),a			;7526	02 	. 
	sbc a,l			;7527	9d 	. 
	and b			;7528	a0 	. 
	adc a,h			;7529	8c 	. 
	and h			;752a	a4 	. 
	add a,l			;752b	85 	. 
	adc a,d			;752c	8a 	. 
	ld (bc),a			;752d	02 	. 
	and e			;752e	a3 	. 
	sbc a,h			;752f	9c 	. 
	xor h			;7530	ac 	. 
	adc a,d			;7531	8a 	. 
	adc a,a			;7532	8f 	. 
	ld (bc),a			;7533	02 	. 
	xor b			;7534	a8 	. 
	cp (hl)			;7535	be 	. 
	sub h			;7536	94 	. 
	xor e			;7537	ab 	. 
	sub a			;7538	97 	. 
	ld (bc),a			;7539	02 	. 
	xor a			;753a	af 	. 
	sub b			;753b	90 	. 
	ld (bc),a			;753c	02 	. 
	ret nz			;753d	c0 	. 
	cp h			;753e	bc 	. 
	sub h			;753f	94 	. 
	sub e			;7540	93 	. 
	sub b			;7541	90 	. 
	sub d			;7542	92 	. 
	sub c			;7543	91 	. 
	sub d			;7544	92 	. 
	sub b			;7545	90 	. 
	sub b			;7546	90 	. 
	cp h			;7547	bc 	. 
	sub h			;7548	94 	. 
	sub b			;7549	90 	. 
	add a,l			;754a	85 	. 
	ld (bc),a			;754b	02 	. 
	adc a,095h		;754c	ce 95 	. . 
	and b			;754e	a0 	. 
	or l			;754f	b5 	. 
	adc a,d			;7550	8a 	. 
	ld (bc),a			;7551	02 	. 
	out (085h),a		;7552	d3 85 	. . 
	ld (bc),a			;7554	02 	. 
	push de			;7555	d5 	. 
	add a,l			;7556	85 	. 
	or d			;7557	b2 	. 
	add a,e			;7558	83 	. 
	sub l			;7559	95 	. 
	cp d			;755a	ba 	. 
	or e			;755b	b3 	. 
	sub c			;755c	91 	. 
	ld (bc),a			;755d	02 	. 
	defb 0ddh,0aah,0a0h	;illegal sequence		;755e	dd aa a0 	. . . 
	adc a,(hl)			;7561	8e 	. 
	adc a,h			;7562	8c 	. 
	sub b			;7563	90 	. 
	or a			;7564	b7 	. 
	sub c			;7565	91 	. 
	and d			;7566	a2 	. 
	cp e			;7567	bb 	. 
	ld (bc),a			;7568	02 	. 
	ret pe			;7569	e8 	. 
	adc a,a			;756a	8f 	. 
	add a,l			;756b	85 	. 
	add a,d			;756c	82 	. 
	xor c			;756d	a9 	. 
	add a,e			;756e	83 	. 
	xor c			;756f	a9 	. 
	add a,d			;7570	82 	. 
	add a,a			;7571	87 	. 
	ld (bc),a			;7572	02 	. 
	jp p,003a0h		;7573	f2 a0 03 	. . . 
	nop			;7576	00 	. 
	cp a			;7577	bf 	. 
	or a			;7578	b7 	. 
	ld a,(bc)			;7579	0a 	. 
	rlca			;757a	07 	. 
	cp a			;757b	bf 	. 
	or a			;757c	b7 	. 
	sbc a,l			;757d	9d 	. 
	or l			;757e	b5 	. 
	sub h			;757f	94 	. 
	sub c			;7580	91 	. 
	add a,l			;7581	85 	. 
	inc bc			;7582	03 	. 
	ld de,l8885h		;7583	11 85 88 	. . . 
	sbc a,l			;7586	9d 	. 
	inc bc			;7587	03 	. 
	dec d			;7588	15 	. 
	add a,d			;7589	82 	. 
	cp a			;758a	bf 	. 
	add a,c			;758b	81 	. 
	sub (hl)			;758c	96 	. 
	inc bc			;758d	03 	. 
	dec de			;758e	1b 	. 
	add a,d			;758f	82 	. 
	sub h			;7590	94 	. 
	and b			;7591	a0 	. 
	or l			;7592	b5 	. 
	or b			;7593	b0 	. 
	inc bc			;7594	03 	. 
	ld hl,003aah		;7595	21 aa 03 	! . . 
	inc hl			;7598	23 	# 
	sub l			;7599	95 	. 
	xor d			;759a	aa 	. 
	inc bc			;759b	03 	. 
	daa			;759c	27 	' 
	sbc a,b			;759d	98 	. 
	add a,e			;759e	83 	. 
	add a,e			;759f	83 	. 
	adc a,c			;75a0	89 	. 
	sub d			;75a1	92 	. 
	inc bc			;75a2	03 	. 
	dec l			;75a3	2d 	- 
	add a,d			;75a4	82 	. 
	inc bc			;75a5	03 	. 
	cpl			;75a6	2f 	/ 
	xor (hl)			;75a7	ae 	. 
	sbc a,l			;75a8	9d 	. 
	inc bc			;75a9	03 	. 
	ld (l81abh),a		;75aa	32 ab 81 	2 . . 
	inc bc			;75ad	03 	. 
	ld b,b			;75ae	40 	@ 
	cp a			;75af	bf 	. 
	sbc a,l			;75b0	9d 	. 
	ld a,(bc)			;75b1	0a 	. 
	rlca			;75b2	07 	. 
	cp a			;75b3	bf 	. 
	sbc a,l			;75b4	9d 	. 
	or a			;75b5	b7 	. 
	sbc a,l			;75b6	9d 	. 
	or a			;75b7	b7 	. 
	sbc a,l			;75b8	9d 	. 
	or l			;75b9	b5 	. 
	cp h			;75ba	bc 	. 
	cp b			;75bb	b8 	. 
	ld a,(bc)			;75bc	0a 	. 
	ld l,003h		;75bd	2e 03 	. . 
	adc a,e			;75bf	8b 	. 
	add a,c			;75c0	81 	. 
	add a,a			;75c1	87 	. 
	sbc a,l			;75c2	9d 	. 
	sub a			;75c3	97 	. 
	sbc a,l			;75c4	9d 	. 
	cp a			;75c5	bf 	. 
	xor (hl)			;75c6	ae 	. 
	ld a,(bc)			;75c7	0a 	. 
	ld l,004h		;75c8	2e 04 	. . 
	ld a,(bc)			;75ca	0a 	. 
	nop			;75cb	00 	. 
	inc bc			;75cc	03 	. 
	ld b,b			;75cd	40 	@ 
	cp b			;75ce	b8 	. 
	ld a,(bc)			;75cf	0a 	. 
	ld a,094h		;75d0	3e 94 	> . 
	xor (hl)			;75d2	ae 	. 
	ld a,(bc)			;75d3	0a 	. 
	ld a,095h		;75d4	3e 95 	> . 
	inc b			;75d6	04 	. 
	dec bc			;75d7	0b 	. 
	nop			;75d8	00 	. 
	nop			;75d9	00 	. 
	ld c,c			;75da	49 	I 
	and b			;75db	a0 	. 
	sub b			;75dc	90 	. 
	nop			;75dd	00 	. 
	ld e,c			;75de	59 	Y 
	and b			;75df	a0 	. 
	sbc a,(hl)			;75e0	9e 	. 
	xor l			;75e1	ad 	. 
	sub b			;75e2	90 	. 
	nop			;75e3	00 	. 
	ld l,h			;75e4	6c 	l 
	cp b			;75e5	b8 	. 
	or h			;75e6	b4 	. 
	nop			;75e7	00 	. 
	add a,c			;75e8	81 	. 
	and b			;75e9	a0 	. 
	nop			;75ea	00 	. 
	adc a,b			;75eb	88 	. 
	cp b			;75ec	b8 	. 
	add a,a			;75ed	87 	. 
	adc a,e			;75ee	8b 	. 
	or h			;75ef	b4 	. 
	nop			;75f0	00 	. 
	sub d			;75f1	92 	. 
	sub b			;75f2	90 	. 
	nop			;75f3	00 	. 
	sbc a,b			;75f4	98 	. 
	cp b			;75f5	b8 	. 
	add a,a			;75f6	87 	. 
	or b			;75f7	b0 	. 
	or b			;75f8	b0 	. 
	adc a,e			;75f9	8b 	. 
	or h			;75fa	b4 	. 
	nop			;75fb	00 	. 
	and e			;75fc	a3 	. 
	or b			;75fd	b0 	. 
	ld a,(bc)			;75fe	0a 	. 
	ld b,0a0h		;75ff	06 a0 	. . 
	sbc a,(hl)			;7601	9e 	. 
	add a,c			;7602	81 	. 
	add a,d			;7603	82 	. 
	xor l			;7604	ad 	. 
	sub b			;7605	90 	. 
	or b			;7606	b0 	. 
	ld a,(bc)			;7607	0a 	. 
	ld b,000h		;7608	06 00 	. . 
	pop bc			;760a	c1 	. 
	cp e			;760b	bb 	. 
	or c			;760c	b1 	. 
	or b			;760d	b0 	. 
	ld a,(bc)			;760e	0a 	. 
	ld (bc),a			;760f	02 	. 
	and b			;7610	a0 	. 
	sbc a,(hl)			;7611	9e 	. 
	add a,c			;7612	81 	. 
	sub a			;7613	97 	. 
	xor e			;7614	ab 	. 
	add a,d			;7615	82 	. 
	xor l			;7616	ad 	. 
	sub b			;7617	90 	. 
	or b			;7618	b0 	. 
	ld a,(bc)			;7619	0a 	. 
	ld (bc),a			;761a	02 	. 
	or d			;761b	b2 	. 
	or a			;761c	b7 	. 
	nop			;761d	00 	. 
	rst 10h			;761e	d7 	. 
	xor (hl)			;761f	ae 	. 
	add a,c			;7620	81 	. 
	nop			;7621	00 	. 
	jp c,laa95h		;7622	da 95 aa 	. . . 
	nop			;7625	00 	. 
	defb 0ddh,082h,09dh	;illegal sequence		;7626	dd 82 9d 	. . . 
	nop			;7629	00 	. 
	pop hl			;762a	e1 	. 
	and b			;762b	a0 	. 
	sbc a,(hl)			;762c	9e 	. 
	add a,c			;762d	81 	. 
	nop			;762e	00 	. 
	jp pe,000abh		;762f	ea ab 00 	. . . 
	call pe,lab97h		;7632	ec 97 ab 	. . . 
	nop			;7635	00 	. 
	rst 28h			;7636	ef 	. 
	sub a			;7637	97 	. 
	nop			;7638	00 	. 
	or 082h		;7639	f6 82 	. . 
	xor l			;763b	ad 	. 
	sub b			;763c	90 	. 
	ld bc,l9501h		;763d	01 01 95 	. . . 
	ld bc,lb805h		;7640	01 05 b8 	. . . 
	add a,a			;7643	87 	. 
	ld bc,l8d09h		;7644	01 09 8d 	. . . 
	adc a,(hl)			;7647	8e 	. 
	ld bc,l8b0dh		;7648	01 0d 8b 	. . . 
	or h			;764b	b4 	. 
	ld bc,laa12h		;764c	01 12 aa 	. . . 
	ld bc,laa17h		;764f	01 17 aa 	. . . 
	ld bc,l8d1ah		;7652	01 1a 8d 	. . . 
	adc a,(hl)			;7655	8e 	. 
	ld bc,l951eh		;7656	01 1e 95 	. . . 
	ld bc,l8820h		;7659	01 20 88 	.   . 
	xor a			;765c	af 	. 
	adc a,h			;765d	8c 	. 
	ld a,(bc)			;765e	0a 	. 
	rlca			;765f	07 	. 
	xor d			;7660	aa 	. 
	ld bc,l8d2ch		;7661	01 2c 8d 	. , . 
	adc a,(hl)			;7664	8e 	. 
	ld bc,l952fh		;7665	01 2f 95 	. / . 
	adc a,h			;7668	8c 	. 
	ld a,(bc)			;7669	0a 	. 
	rlca			;766a	07 	. 
	sbc a,a			;766b	9f 	. 
	add a,h			;766c	84 	. 
	ld bc,l8341h		;766d	01 41 83 	. A . 
	sub a			;7670	97 	. 
	and e			;7671	a3 	. 
	sbc a,(hl)			;7672	9e 	. 
	add a,c			;7673	81 	. 
	xor d			;7674	aa 	. 
	add a,e			;7675	83 	. 
	sub e			;7676	93 	. 
	xor e			;7677	ab 	. 
	sub a			;7678	97 	. 
	and e			;7679	a3 	. 
	add a,e			;767a	83 	. 
	sub l			;767b	95 	. 
	add a,d			;767c	82 	. 
	xor l			;767d	ad 	. 
	sub e			;767e	93 	. 
	xor e			;767f	ab 	. 
	add a,e			;7680	83 	. 
	ld bc,lab55h		;7681	01 55 ab 	. U . 
	add a,e			;7684	83 	. 
	and e			;7685	a3 	. 
	or e			;7686	b3 	. 
	ld a,(bc)			;7687	0a 	. 
	dec b			;7688	05 	. 
	sub e			;7689	93 	. 
	add a,e			;768a	83 	. 
	sub a			;768b	97 	. 
	xor d			;768c	aa 	. 
	ld bc,l9f64h		;768d	01 64 9f 	. d . 
	adc a,e			;7690	8b 	. 
	cp a			;7691	bf 	. 
	add a,a			;7692	87 	. 
	xor a			;7693	af 	. 
	ld bc,l826ah		;7694	01 6a 82 	. j . 
	adc a,e			;7697	8b 	. 
	xor a			;7698	af 	. 
	sbc a,a			;7699	9f 	. 
	add a,a			;769a	87 	. 
	add a,c			;769b	81 	. 
	ld bc,l9f71h		;769c	01 71 9f 	. q . 
	adc a,e			;769f	8b 	. 
	cp a			;76a0	bf 	. 
	add a,a			;76a1	87 	. 
	xor a			;76a2	af 	. 
	ld bc,l9578h		;76a3	01 78 95 	. x . 
	ld bc,lbd82h		;76a6	01 82 bd 	. . . 
	add a,a			;76a9	87 	. 
	ld bc,laa86h		;76aa	01 86 aa 	. . . 
	add a,d			;76ad	82 	. 
	add a,a			;76ae	87 	. 
	xor d			;76af	aa 	. 
	sub l			;76b0	95 	. 
	adc a,e			;76b1	8b 	. 
	add a,c			;76b2	81 	. 
	sub l			;76b3	95 	. 
	ld bc,l8b90h		;76b4	01 90 8b 	. . . 
	cp (hl)			;76b7	be 	. 
	ld bc,laa95h		;76b8	01 95 aa 	. . . 
	ld bc,laa96h+1		;76bb	01 97 aa 	. . . 
	xor b			;76be	a8 	. 
	xor c			;76bf	a9 	. 
	xor d			;76c0	aa 	. 
	sub l			;76c1	95 	. 
	sub (hl)			;76c2	96 	. 
	sub h			;76c3	94 	. 
	sub l			;76c4	95 	. 
	ld bc,l95a0h		;76c5	01 a0 95 	. . . 
	xor d			;76c8	aa 	. 
	ld bc,l95a4h		;76c9	01 a4 95 	. . . 
	ld bc,lbfa6h		;76cc	01 a6 bf 	. . . 
	ld bc,laaa8h		;76cf	01 a8 aa 	. . . 
	ld bc,l95b1h		;76d2	01 b1 95 	. . . 
	ld bc,lbfb3h		;76d5	01 b3 bf 	. . . 
	ld bc,laab5h		;76d8	01 b5 aa 	. . . 
	ld bc,l95b8h		;76db	01 b8 95 	. . . 
	ld bc,lb0c0h		;76de	01 c0 b0 	. . . 
	cp (hl)			;76e1	be 	. 
	or c			;76e2	b1 	. 
	or b			;76e3	b0 	. 
	ld a,(bc)			;76e4	0a 	. 
	ld (bc),a			;76e5	02 	. 
	or d			;76e6	b2 	. 
	or e			;76e7	b3 	. 
	ld a,(bc)			;76e8	0a 	. 
	dec b			;76e9	05 	. 
	or c			;76ea	b1 	. 
	or b			;76eb	b0 	. 
	ld a,(bc)			;76ec	0a 	. 
	ld (bc),a			;76ed	02 	. 
	or d			;76ee	b2 	. 
	cp a			;76ef	bf 	. 
	or e			;76f0	b3 	. 
	add a,e			;76f1	83 	. 
	add a,e			;76f2	83 	. 
	ld bc,l8ad7h		;76f3	01 d7 8a 	. . . 
	adc a,h			;76f6	8c 	. 
	adc a,l			;76f7	8d 	. 
	adc a,(hl)			;76f8	8e 	. 
	adc a,l			;76f9	8d 	. 
	adc a,(hl)			;76fa	8e 	. 
	adc a,h			;76fb	8c 	. 
	add a,l			;76fc	85 	. 
	ld bc,083e0h		;76fd	01 e0 83 	. . . 
	add a,e			;7700	83 	. 
	ld bc,l8fe4h		;7701	01 e4 8f 	. . . 
	adc a,(hl)			;7704	8e 	. 
	adc a,a			;7705	8f 	. 
	adc a,l			;7706	8d 	. 
	adc a,a			;7707	8f 	. 
	ld bc,l8ff1h		;7708	01 f1 8f 	. . . 
	adc a,(hl)			;770b	8e 	. 
	adc a,a			;770c	8f 	. 
	adc a,l			;770d	8d 	. 
	adc a,a			;770e	8f 	. 
	ld bc,083f8h		;770f	01 f8 83 	. . . 
	add a,e			;7712	83 	. 
	adc a,e			;7713	8b 	. 
	or h			;7714	b4 	. 
	ld (bc),a			;7715	02 	. 
	nop			;7716	00 	. 
	xor d			;7717	aa 	. 
	adc a,b			;7718	88 	. 
	sbc a,c			;7719	99 	. 
	xor d			;771a	aa 	. 
	adc a,b			;771b	88 	. 
	sbc a,c			;771c	99 	. 
	xor d			;771d	aa 	. 
	adc a,b			;771e	88 	. 
	sbc a,c			;771f	99 	. 
	xor d			;7720	aa 	. 
	sub l			;7721	95 	. 
	and (hl)			;7722	a6 	. 
	add a,h			;7723	84 	. 
	sub l			;7724	95 	. 
	and (hl)			;7725	a6 	. 
	add a,h			;7726	84 	. 
	sub l			;7727	95 	. 
	and (hl)			;7728	a6 	. 
	add a,h			;7729	84 	. 
	sub l			;772a	95 	. 
	xor d			;772b	aa 	. 
	sub a			;772c	97 	. 
	sub a			;772d	97 	. 
	add a,e			;772e	83 	. 
	add a,e			;772f	83 	. 
	xor e			;7730	ab 	. 
	xor e			;7731	ab 	. 
	sub a			;7732	97 	. 
	sub a			;7733	97 	. 
	add a,e			;7734	83 	. 
	add a,e			;7735	83 	. 
	xor e			;7736	ab 	. 
	xor e			;7737	ab 	. 
	sub l			;7738	95 	. 
	or a			;7739	b7 	. 
	ld a,(bc)			;773a	0a 	. 
	add hl,bc			;773b	09 	. 
	cp a			;773c	bf 	. 
	cp a			;773d	bf 	. 
	cp e			;773e	bb 	. 
	ld a,(bc)			;773f	0a 	. 
	ex af,af'			;7740	08 	. 
	cp a			;7741	bf 	. 
	or a			;7742	b7 	. 
	ld a,(bc)			;7743	0a 	. 
	dec b			;7744	05 	. 
	sub a			;7745	97 	. 
	ld (bc),a			;7746	02 	. 
	ld b,b			;7747	40 	@ 
	xor e			;7748	ab 	. 
	cp e			;7749	bb 	. 
	ld a,(bc)			;774a	0a 	. 
	ex af,af'			;774b	08 	. 
	or a			;774c	b7 	. 
	ld a,(bc)			;774d	0a 	. 
	ex af,af'			;774e	08 	. 
	sub a			;774f	97 	. 
	xor d			;7750	aa 	. 
	or l			;7751	b5 	. 
	or l			;7752	b5 	. 
	or b			;7753	b0 	. 
	or b			;7754	b0 	. 
	cp d			;7755	ba 	. 
	cp d			;7756	ba 	. 
	or l			;7757	b5 	. 
	or l			;7758	b5 	. 
	or b			;7759	b0 	. 
	or b			;775a	b0 	. 
	cp d			;775b	ba 	. 
	cp d			;775c	ba 	. 
	sub l			;775d	95 	. 
	sbc a,l			;775e	9d 	. 
	ld a,(bc)			;775f	0a 	. 
	inc bc			;7760	03 	. 
	add a,c			;7761	81 	. 
	ld (bc),a			;7762	02 	. 
	ld (hl),e			;7763	73 	s 
	add a,d			;7764	82 	. 
	xor (hl)			;7765	ae 	. 
	ld a,(bc)			;7766	0a 	. 
	ld (bc),a			;7767	02 	. 
	cp a			;7768	bf 	. 
	sbc a,l			;7769	9d 	. 
	ld a,(bc)			;776a	0a 	. 
	ld (bc),a			;776b	02 	. 
	add a,c			;776c	81 	. 
	xor d			;776d	aa 	. 
	cp a			;776e	bf 	. 
	sub l			;776f	95 	. 
	ld (bc),a			;7770	02 	. 
	add a,b			;7771	80 	. 
	xor d			;7772	aa 	. 
l7773h:
	and b			;7773	a0 	. 
	or h			;7774	b4 	. 
	xor b			;7775	a8 	. 
	adc a,h			;7776	8c 	. 
	ld a,(bc)			;7777	0a 	. 
	dec bc			;7778	0b 	. 
	sub h			;7779	94 	. 
	cp b			;777a	b8 	. 
	sub b			;777b	90 	. 
	sub l			;777c	95 	. 
	xor d			;777d	aa 	. 
	sub l			;777e	95 	. 
	ld (bc),a			;777f	02 	. 
	sbc a,d			;7780	9a 	. 
	xor d			;7781	aa 	. 
	sub l			;7782	95 	. 
	ld (bc),a			;7783	02 	. 
	and b			;7784	a0 	. 
	xor d			;7785	aa 	. 
	sub l			;7786	95 	. 
	or a			;7787	b7 	. 
	or a			;7788	b7 	. 
	add a,a			;7789	87 	. 
	ld (bc),a			;778a	02 	. 
	and a			;778b	a7 	. 
	sub a			;778c	97 	. 
	add a,e			;778d	83 	. 
	or e			;778e	b3 	. 
	or e			;778f	b3 	. 
	add a,e			;7790	83 	. 
	xor e			;7791	ab 	. 
	sub a			;7792	97 	. 
	add a,e			;7793	83 	. 
	or e			;7794	b3 	. 
	or e			;7795	b3 	. 
	add a,e			;7796	83 	. 
	xor e			;7797	ab 	. 
	ld (bc),a			;7798	02 	. 
	or l			;7799	b5 	. 
	adc a,e			;779a	8b 	. 
	cp e			;779b	bb 	. 
	cp a			;779c	bf 	. 
	or a			;779d	b7 	. 
	add a,a			;779e	87 	. 
	ld (bc),a			;779f	02 	. 
	cp h			;77a0	bc 	. 
	xor d			;77a1	aa 	. 
	cp a			;77a2	bf 	. 
	sub l			;77a3	95 	. 
	ld (bc),a			;77a4	02 	. 
	ret nz			;77a5	c0 	. 
	xor d			;77a6	aa 	. 
	ld a,(bc)			;77a7	0a 	. 
	inc bc			;77a8	03 	. 
	ld (bc),a			;77a9	02 	. 
	ret nc			;77aa	d0 	. 
	sub l			;77ab	95 	. 
	ld a,(bc)			;77ac	0a 	. 
	inc bc			;77ad	03 	. 
	xor d			;77ae	aa 	. 
	sub l			;77af	95 	. 
	ld (bc),a			;77b0	02 	. 
	jp c,l95aah		;77b1	da aa 95 	. . . 
	ld (bc),a			;77b4	02 	. 
	ret po			;77b5	e0 	. 
	xor d			;77b6	aa 	. 
	sub l			;77b7	95 	. 
	cp a			;77b8	bf 	. 
	add a,c			;77b9	81 	. 
	ld (bc),a			;77ba	02 	. 
	rst 20h			;77bb	e7 	. 
	sub l			;77bc	95 	. 
	ld (bc),a			;77bd	02 	. 
	jp (hl)			;77be	e9 	. 
	cp a			;77bf	bf 	. 
	cp a			;77c0	bf 	. 
	ld (bc),a			;77c1	02 	. 
	call pe,l95aah		;77c2	ec aa 95 	. . . 
	ld (bc),a			;77c5	02 	. 
	rst 28h			;77c6	ef 	. 
	cp a			;77c7	bf 	. 
	cp a			;77c8	bf 	. 
	ld (bc),a			;77c9	02 	. 
	jp p,002aah		;77ca	f2 aa 02 	. . . 
	or 082h		;77cd	f6 82 	. . 
	cp a			;77cf	bf 	. 
	add a,c			;77d0	81 	. 
	ld (bc),a			;77d1	02 	. 
	call m,lbf81h+1		;77d2	fc 82 bf 	. . . 
	add a,c			;77d5	81 	. 
	inc bc			;77d6	03 	. 
	nop			;77d7	00 	. 
	xor d			;77d8	aa 	. 
	ld a,(bc)			;77d9	0a 	. 
	inc bc			;77da	03 	. 
	inc bc			;77db	03 	. 
	djnz l7773h		;77dc	10 95 	. . 
	ld a,(bc)			;77de	0a 	. 
	ld (bc),a			;77df	02 	. 
	or l			;77e0	b5 	. 
	or d			;77e1	b2 	. 
	or e			;77e2	b3 	. 
	ld a,(bc)			;77e3	0a 	. 
	dec bc			;77e4	0b 	. 
	or c			;77e5	b1 	. 
	cp a			;77e6	bf 	. 
	inc bc			;77e7	03 	. 
	daa			;77e8	27 	' 
	sub l			;77e9	95 	. 
	inc bc			;77ea	03 	. 
	add hl,hl			;77eb	29 	) 
	adc a,a			;77ec	8f 	. 
	adc a,a			;77ed	8f 	. 
	adc a,b			;77ee	88 	. 
	xor d			;77ef	aa 	. 
	sub l			;77f0	95 	. 
	add a,h			;77f1	84 	. 
	adc a,a			;77f2	8f 	. 
	adc a,a			;77f3	8f 	. 
	inc bc			;77f4	03 	. 
	ld (003aah),a		;77f5	32 aa 03 	2 . . 
	scf			;77f8	37 	7 
	cp a			;77f9	bf 	. 
	inc bc			;77fa	03 	. 
	dec a			;77fb	3d 	= 
	cp a			;77fc	bf 	. 
	inc bc			;77fd	03 	. 
	ld b,b			;77fe	40 	@ 
	xor d			;77ff	aa 	. 
	xor d			;7800	aa 	. 
l7801h:
	cp d			;7801	ba 	. 
	xor d			;7802	aa 	. 
	inc bc			;7803	03 	. 
	ld d,b			;7804	50 	P 
	sub l			;7805	95 	. 
	or l			;7806	b5 	. 
	sub l			;7807	95 	. 
	ld a,(bc)			;7808	0a 	. 
	rrca			;7809	0f 	. 
	cp a			;780a	bf 	. 
	sub l			;780b	95 	. 
	inc bc			;780c	03 	. 
	ld h,a			;780d	67 	g 
	sub l			;780e	95 	. 
	and d			;780f	a2 	. 
	sub c			;7810	91 	. 
	and d			;7811	a2 	. 
	sub c			;7812	91 	. 
	xor d			;7813	aa 	. 
	sub l			;7814	95 	. 
	and d			;7815	a2 	. 
	sub c			;7816	91 	. 
	and d			;7817	a2 	. 
	sub c			;7818	91 	. 
	xor d			;7819	aa 	. 
	inc bc			;781a	03 	. 
	halt			;781b	76 	v 
	xor d			;781c	aa 	. 
	cp a			;781d	bf 	. 
	sbc a,l			;781e	9d 	. 
	sbc a,h			;781f	9c 	. 
	ld a,(bc)			;7820	0a 	. 
	inc bc			;7821	03 	. 
	cp a			;7822	bf 	. 
	sub l			;7823	95 	. 
	inc bc			;7824	03 	. 
	add a,b			;7825	80 	. 
	xor d			;7826	aa 	. 
	or b			;7827	b0 	. 
	or c			;7828	b1 	. 
	or d			;7829	b2 	. 
	or e			;782a	b3 	. 
	ld a,(bc)			;782b	0a 	. 
	dec bc			;782c	0b 	. 
	or c			;782d	b1 	. 
	or d			;782e	b2 	. 
	or b			;782f	b0 	. 
	or a			;7830	b7 	. 
	or e			;7831	b3 	. 
	ld a,(bc)			;7832	0a 	. 
	dec c			;7833	0d 	. 
	cp a			;7834	bf 	. 
	sub l			;7835	95 	. 
	adc a,h			;7836	8c 	. 
	adc a,h			;7837	8c 	. 
	add a,h			;7838	84 	. 
	adc a,l			;7839	8d 	. 
	adc a,h			;783a	8c 	. 
	ld a,(bc)			;783b	0a 	. 
	inc bc			;783c	03 	. 
	adc a,(hl)			;783d	8e 	. 
	adc a,l			;783e	8d 	. 
	adc a,h			;783f	8c 	. 
	ld a,(bc)			;7840	0a 	. 
	inc bc			;7841	03 	. 
	adc a,(hl)			;7842	8e 	. 
	adc a,b			;7843	88 	. 
	adc a,h			;7844	8c 	. 
	adc a,h			;7845	8c 	. 
	xor d			;7846	aa 	. 
	cp a			;7847	bf 	. 
	or l			;7848	b5 	. 
	ld a,(bc)			;7849	0a 	. 
	inc b			;784a	04 	. 
	cp a			;784b	bf 	. 
	sub l			;784c	95 	. 
	inc b			;784d	04 	. 
l784eh:
	inc c			;784e	0c 	. 
	nop			;784f	00 	. 
	ld bc,la09dh		;7850	01 9d a0 	. . . 
	or b			;7853	b0 	. 
	or b			;7854	b0 	. 
	ld bc,l8addh		;7855	01 dd 8a 	. . . 
	sbc a,(hl)			;7858	9e 	. 
	sbc a,(hl)			;7859	9e 	. 
	ld (bc),a			;785a	02 	. 
	dec de			;785b	1b 	. 
	xor b			;785c	a8 	. 
	and e			;785d	a3 	. 
	adc a,a			;785e	8f 	. 
	xor a			;785f	af 	. 
	adc a,a			;7860	8f 	. 
	and a			;7861	a7 	. 
	xor c			;7862	a9 	. 
	ld (bc),a			;7863	02 	. 
	ld e,c			;7864	59 	Y 
	sbc a,b			;7865	98 	. 
	or b			;7866	b0 	. 
	sbc a,d			;7867	9a 	. 
	add a,d			;7868	82 	. 
	or a			;7869	b7 	. 
	cp e			;786a	bb 	. 
	or e			;786b	b3 	. 
	sub a			;786c	97 	. 
	adc a,d			;786d	8a 	. 
	or b			;786e	b0 	. 
	sbc a,b			;786f	98 	. 
	sub b			;7870	90 	. 
	ld (bc),a			;7871	02 	. 
	sbc a,h			;7872	9c 	. 
	adc a,d			;7873	8a 	. 
	sbc a,l			;7874	9d 	. 
	add a,e			;7875	83 	. 
	adc a,c			;7876	89 	. 
l7877h:
	sbc a,a			;7877	9f 	. 
	ld (bc),a			;7878	02 	. 
	call c,sub_9582h		;7879	dc 82 95 	. . . 
	ld (bc),a			;787c	02 	. 
	ret po			;787d	e0 	. 
	or a			;787e	b7 	. 
	sbc a,b			;787f	98 	. 
	inc bc			;7880	03 	. 
	dec de			;7881	1b 	. 
	add a,d			;7882	82 	. 
	adc a,h			;7883	8c 	. 
	add a,l			;7884	85 	. 
	inc b			;7885	04 	. 
	dec c			;7886	0d 	. 
	nop			;7887	00 	. 
	ld bc,la89dh		;7888	01 9d a8 	. . . 
	xor h			;788b	ac 	. 
	xor h			;788c	ac 	. 
	ld bc,lb0dch		;788d	01 dc b0 	. . . 
	or d			;7890	b2 	. 
	or a			;7891	b7 	. 
	or a			;7892	b7 	. 
	or b			;7893	b0 	. 
	sub b			;7894	90 	. 
	ld (bc),a			;7895	02 	. 
	dec de			;7896	1b 	. 
	xor d			;7897	aa 	. 
	xor b			;7898	a8 	. 
	adc a,l			;7899	8d 	. 
	xor (hl)			;789a	ae 	. 
	adc a,h			;789b	8c 	. 
	xor l			;789c	ad 	. 
	xor d			;789d	aa 	. 
	ld (bc),a			;789e	02 	. 
	ld e,c			;789f	59 	Y 
	add a,(hl)			;78a0	86 	. 
	adc a,h			;78a1	8c 	. 
	add a,(hl)			;78a2	86 	. 
	and d			;78a3	a2 	. 
	and a			;78a4	a7 	. 
	cp e			;78a5	bb 	. 
	or e			;78a6	b3 	. 
	and a			;78a7	a7 	. 
	add a,d			;78a8	82 	. 
	adc a,h			;78a9	8c 	. 
	add a,(hl)			;78aa	86 	. 
	add a,h			;78ab	84 	. 
	ld (bc),a			;78ac	02 	. 
	sbc a,h			;78ad	9c 	. 
	cp e			;78ae	bb 	. 
	add a,c			;78af	81 	. 
	add a,e			;78b0	83 	. 
	add a,c			;78b1	81 	. 
	xor e			;78b2	ab 	. 
	add a,c			;78b3	81 	. 
	ld (bc),a			;78b4	02 	. 
	in a,(0a4h)		;78b5	db a4 	. . 
	cp d			;78b7	ba 	. 
	sub b			;78b8	90 	. 
	ld (bc),a			;78b9	02 	. 
	ret po			;78ba	e0 	. 
	xor d			;78bb	aa 	. 
	add a,c			;78bc	81 	. 
	inc bc			;78bd	03 	. 
	jr nz,l784eh		;78be	20 8e 	  . 
	adc a,h			;78c0	8c 	. 
	add a,(hl)			;78c1	86 	. 
	inc b			;78c2	04 	. 
	ld c,000h		;78c3	0e 00 	. . 
	ld bc,laa9dh		;78c5	01 9d aa 	. . . 
	cp e			;78c8	bb 	. 
	cp e			;78c9	bb 	. 
	ld bc,l98dbh		;78ca	01 db 98 	. . . 
	xor h			;78cd	ac 	. 
	adc a,h			;78ce	8c 	. 
	xor l			;78cf	ad 	. 
	adc a,l			;78d0	8d 	. 
	xor h			;78d1	ac 	. 
	adc a,h			;78d2	8c 	. 
	sub b			;78d3	90 	. 
	ld (bc),a			;78d4	02 	. 
	jr l7877h		;78d5	18 a0 	. . 
	ld (bc),a			;78d7	02 	. 
	dec de			;78d8	1b 	. 
	sub l			;78d9	95 	. 
	or a			;78da	b7 	. 
	or e			;78db	b3 	. 
	cp e			;78dc	bb 	. 
	or e			;78dd	b3 	. 
l78deh:
	or e			;78de	b3 	. 
	sub l			;78df	95 	. 
	sub l			;78e0	95 	. 
	ld (bc),a			;78e1	02 	. 
	inc h			;78e2	24 	$ 
	and b			;78e3	a0 	. 
	ld (bc),a			;78e4	02 	. 
	ld e,b			;78e5	58 	X 
	add a,c			;78e6	81 	. 
	add a,e			;78e7	83 	. 
	add a,e			;78e8	83 	. 
	ld (bc),a			;78e9	02 	. 
	ld e,h			;78ea	5c 	\ 
	or d			;78eb	b2 	. 
	adc a,h			;78ec	8c 	. 
	cp (hl)			;78ed	be 	. 
	sbc a,h			;78ee	9c 	. 
	and (hl)			;78ef	a6 	. 
	sub b			;78f0	90 	. 
	add a,d			;78f1	82 	. 
	add a,e			;78f2	83 	. 
	add a,c			;78f3	81 	. 
	add a,c			;78f4	81 	. 
	ld (bc),a			;78f5	02 	. 
	sbc a,h			;78f6	9c 	. 
	xor e			;78f7	ab 	. 
	add a,e			;78f8	83 	. 
	ld (bc),a			;78f9	02 	. 
	sbc a,a			;78fa	9f 	. 
	add a,d			;78fb	82 	. 
	xor e			;78fc	ab 	. 
	sub c			;78fd	91 	. 
	ld (bc),a			;78fe	02 	. 
	call c,002abh		;78ff	dc ab 02 	. . . 
	ret po			;7902	e0 	. 
	cp d			;7903	ba 	. 
	or b			;7904	b0 	. 
	add a,h			;7905	84 	. 
	inc bc			;7906	03 	. 
	dec de			;7907	1b 	. 
	adc a,c			;7908	89 	. 
	adc a,(hl)			;7909	8e 	. 
	add a,h			;790a	84 	. 
	inc b			;790b	04 	. 
	rrca			;790c	0f 	. 
	nop			;790d	00 	. 
	ld bc,la05dh		;790e	01 5d a0 	. ] . 
	or b			;7911	b0 	. 
	or b			;7912	b0 	. 
	ld bc,08a9dh		;7913	01 9d 8a 	. . . 
	sbc a,(hl)			;7916	9e 	. 
	sbc a,(hl)			;7917	9e 	. 
	ld bc,l96dbh		;7918	01 db 96 	. . . 
	cp e			;791b	bb 	. 
	or e			;791c	b3 	. 
	cp e			;791d	bb 	. 
	or e			;791e	b3 	. 
	cp e			;791f	bb 	. 
	sub e			;7920	93 	. 
	sub h			;7921	94 	. 
l7922h:
	ld (bc),a			;7922	02 	. 
	rla			;7923	17 	. 
	and b			;7924	a0 	. 
	and h			;7925	a4 	. 
	or b			;7926	b0 	. 
	or b			;7927	b0 	. 
	add a,l			;7928	85 	. 
	xor l			;7929	ad 	. 
	adc a,h			;792a	8c 	. 
	xor (hl)			;792b	ae 	. 
	adc a,h			;792c	8c 	. 
	xor h			;792d	ac 	. 
	add a,l			;792e	85 	. 
	and l			;792f	a5 	. 
	or b			;7930	b0 	. 
	or b			;7931	b0 	. 
	and h			;7932	a4 	. 
	ld (bc),a			;7933	02 	. 
	ld e,h			;7934	5c 	\ 
	or b			;7935	b0 	. 
	add a,e			;7936	83 	. 
	cp e			;7937	bb 	. 
	sub e			;7938	93 	. 
	and c			;7939	a1 	. 
	sub b			;793a	90 	. 
	ld (bc),a			;793b	02 	. 
	sbc a,h			;793c	9c 	. 
	cp e			;793d	bb 	. 
	add a,e			;793e	83 	. 
	ld (bc),a			;793f	02 	. 
	sbc a,a			;7940	9f 	. 
	add a,d			;7941	82 	. 
	xor e			;7942	ab 	. 
	add a,c			;7943	81 	. 
	ld (bc),a			;7944	02 	. 
	in a,(0a4h)		;7945	db a4 	. . 
	cp d			;7947	ba 	. 
	sub b			;7948	90 	. 
	ld (bc),a			;7949	02 	. 
	ret po			;794a	e0 	. 
	xor d			;794b	aa 	. 
	add a,c			;794c	81 	. 
	inc bc			;794d	03 	. 
	jr nz,l78deh		;794e	20 8e 	  . 
	adc a,h			;7950	8c 	. 
	add a,c			;7951	81 	. 
	inc b			;7952	04 	. 
	djnz l7955h		;7953	10 00 	. . 
l7955h:
	ld bc,0aa5dh		;7955	01 5d aa 	. ] . 
	cp e			;7958	bb 	. 
	cp e			;7959	bb 	. 
	sub l			;795a	95 	. 
	ld bc,la09bh		;795b	01 9b a0 	. . . 
	or b			;795e	b0 	. 
	or b			;795f	b0 	. 
	cp c			;7960	b9 	. 
	or a			;7961	b7 	. 
	or b			;7962	b0 	. 
	or b			;7963	b0 	. 
	sub b			;7964	90 	. 
	ld bc,l95dah+1		;7965	01 db 95 	. . . 
	sbc a,(hl)			;7968	9e 	. 
	adc a,h			;7969	8c 	. 
	xor (hl)			;796a	ae 	. 
	sbc a,l			;796b	9d 	. 
	adc a,h			;796c	8c 	. 
	xor l			;796d	ad 	. 
	xor d			;796e	aa 	. 
	ld (bc),a			;796f	02 	. 
	dec de			;7970	1b 	. 
l7971h:
	sub l			;7971	95 	. 
	adc a,e			;7972	8b 	. 
	or e			;7973	b3 	. 
	cp e			;7974	bb 	. 
	or a			;7975	b7 	. 
	or e			;7976	b3 	. 
	add a,a			;7977	87 	. 
	xor d			;7978	aa 	. 
	ld (bc),a			;7979	02 	. 
	ld e,d			;797a	5a 	Z 
	and h			;797b	a4 	. 
	sub c			;797c	91 	. 
	cp h			;797d	bc 	. 
	or b			;797e	b0 	. 
	adc a,(hl)			;797f	8e 	. 
	adc a,l			;7980	8d 	. 
	or b			;7981	b0 	. 
	cp h			;7982	bc 	. 
	and d			;7983	a2 	. 
	sbc a,b			;7984	98 	. 
	ld (bc),a			;7985	02 	. 
	sbc a,h			;7986	9c 	. 
	cp d			;7987	ba 	. 
	ld (bc),a			;7988	02 	. 
	and c			;7989	a1 	. 
	or l			;798a	b5 	. 
	ld (bc),a			;798b	02 	. 
	call c,002aah		;798c	dc aa 02 	. . . 
	pop hl			;798f	e1 	. 
	sub l			;7990	95 	. 
	inc bc			;7991	03 	. 
	ld a,(de)			;7992	1a 	. 
	adc a,c			;7993	89 	. 
	adc a,h			;7994	8c 	. 
	adc a,(hl)			;7995	8e 	. 
	add a,h			;7996	84 	. 
	inc bc			;7997	03 	. 
	jr nz,l7922h		;7998	20 88 	  . 
	adc a,l			;799a	8d 	. 
	adc a,h			;799b	8c 	. 
	add a,(hl)			;799c	86 	. 
	inc b			;799d	04 	. 
	ld de,00100h		;799e	11 00 01 	. . . 
	ld e,l			;79a1	5d 	] 
	xor d			;79a2	aa 	. 
	or a			;79a3	b7 	. 
	or a			;79a4	b7 	. 
	sub l			;79a5	95 	. 
	ld bc,la09bh		;79a6	01 9b a0 	. . . 
	or b			;79a9	b0 	. 
	or b			;79aa	b0 	. 
	cp e			;79ab	bb 	. 
	or (hl)			;79ac	b6 	. 
	or b			;79ad	b0 	. 
	or b			;79ae	b0 	. 
	sub b			;79af	90 	. 
	ld bc,l95dah+1		;79b0	01 db 95 	. . . 
	sbc a,(hl)			;79b3	9e 	. 
	adc a,h			;79b4	8c 	. 
	xor (hl)			;79b5	ae 	. 
	sbc a,l			;79b6	9d 	. 
	adc a,h			;79b7	8c 	. 
	xor l			;79b8	ad 	. 
	xor d			;79b9	aa 	. 
	ld (bc),a			;79ba	02 	. 
	rla			;79bb	17 	. 
	and b			;79bc	a0 	. 
	sbc a,b			;79bd	98 	. 
	or b			;79be	b0 	. 
	or b			;79bf	b0 	. 
	add a,l			;79c0	85 	. 
	adc a,e			;79c1	8b 	. 
	or e			;79c2	b3 	. 
	cp e			;79c3	bb 	. 
	or a			;79c4	b7 	. 
	or e			;79c5	b3 	. 
	add a,a			;79c6	87 	. 
	adc a,d			;79c7	8a 	. 
	or b			;79c8	b0 	. 
	or b			;79c9	b0 	. 
	and h			;79ca	a4 	. 
	sub b			;79cb	90 	. 
	ld (bc),a			;79cc	02 	. 
	ld e,h			;79cd	5c 	\ 
	cp h			;79ce	bc 	. 
	or b			;79cf	b0 	. 
	adc a,(hl)			;79d0	8e 	. 
	adc a,l			;79d1	8d 	. 
	or b			;79d2	b0 	. 
	cp h			;79d3	bc 	. 
	ld (bc),a			;79d4	02 	. 
	sbc a,h			;79d5	9c 	. 
	cp d			;79d6	ba 	. 
	ld (bc),a			;79d7	02 	. 
	and c			;79d8	a1 	. 
	or l			;79d9	b5 	. 
	ld (bc),a			;79da	02 	. 
	call c,002aah		;79db	dc aa 02 	. . . 
	pop hl			;79de	e1 	. 
	sub l			;79df	95 	. 
	inc bc			;79e0	03 	. 
	ld a,(de)			;79e1	1a 	. 
	adc a,c			;79e2	89 	. 
	adc a,h			;79e3	8c 	. 
	adc a,(hl)			;79e4	8e 	. 
	add a,h			;79e5	84 	. 
	inc bc			;79e6	03 	. 
	jr nz,l7971h		;79e7	20 88 	  . 
	adc a,l			;79e9	8d 	. 
	adc a,h			;79ea	8c 	. 
	add a,(hl)			;79eb	86 	. 
	inc b			;79ec	04 	. 
	ld (de),a			;79ed	12 	. 
	nop			;79ee	00 	. 
	nop			;79ef	00 	. 
	ret c			;79f0	d8 	. 
	xor b			;79f1	a8 	. 
	sub b			;79f2	90 	. 
	nop			;79f3	00 	. 
	defb 0ddh,0a0h,0b0h	;illegal sequence		;79f4	dd a0 b0 	. . . 
	or b			;79f7	b0 	. 
	sub b			;79f8	90 	. 
	nop			;79f9	00 	. 
	push hl			;79fa	e5 	. 
	cp b			;79fb	b8 	. 
	ld bc,laa18h		;79fc	01 18 aa 	. . . 
	ld bc,l8a1dh		;79ff	01 1d 8a 	. . . 
	cp l			;7a02	bd 	. 
	xor l			;7a03	ad 	. 
	add a,l			;7a04	85 	. 
	ld bc,laa25h		;7a05	01 25 aa 	. % . 
	ld bc,08258h		;7a08	01 58 82 	. X . 
	adc a,h			;7a0b	8c 	. 
	adc a,h			;7a0c	8c 	. 
	add a,h			;7a0d	84 	. 
	xor h			;7a0e	ac 	. 
	adc a,h			;7a0f	8c 	. 
	xor (hl)			;7a10	ae 	. 
	sbc a,l			;7a11	9d 	. 
	adc a,h			;7a12	8c 	. 
	sbc a,h			;7a13	9c 	. 
	add a,h			;7a14	84 	. 
	adc a,h			;7a15	8c 	. 
	adc a,h			;7a16	8c 	. 
	add a,(hl)			;7a17	86 	. 
l7a18h:
	ld bc,lb79ch		;7a18	01 9c b7 	. . . 
	or e			;7a1b	b3 	. 
	cp e			;7a1c	bb 	. 
	or a			;7a1d	b7 	. 
	or e			;7a1e	b3 	. 
	cp e			;7a1f	bb 	. 
	ld bc,la0d5h		;7a20	01 d5 a0 	. . . 
	ld bc,l82dch		;7a23	01 dc 82 	. . . 
	adc a,h			;7a26	8c 	. 
	xor (hl)			;7a27	ae 	. 
	sbc a,l			;7a28	9d 	. 
	adc a,h			;7a29	8c 	. 
	add a,c			;7a2a	81 	. 
	ld bc,l90e8h		;7a2b	01 e8 90 	. . . 
	ld (bc),a			;7a2e	02 	. 
	dec d			;7a2f	15 	. 
	and d			;7a30	a2 	. 
	adc a,l			;7a31	8d 	. 
	adc a,h			;7a32	8c 	. 
	adc a,h			;7a33	8c 	. 
	adc a,b			;7a34	88 	. 
	adc a,h			;7a35	8c 	. 
	adc a,h			;7a36	8c 	. 
	adc a,e			;7a37	8b 	. 
	adc a,h			;7a38	8c 	. 
	add a,e			;7a39	83 	. 
	add a,e			;7a3a	83 	. 
	adc a,h			;7a3b	8c 	. 
	add a,a			;7a3c	87 	. 
	adc a,h			;7a3d	8c 	. 
	adc a,h			;7a3e	8c 	. 
	add a,h			;7a3f	84 	. 
	adc a,h			;7a40	8c 	. 
	adc a,h			;7a41	8c 	. 
	adc a,(hl)			;7a42	8e 	. 
	sub c			;7a43	91 	. 
	inc b			;7a44	04 	. 
	inc de			;7a45	13 	. 
	nop			;7a46	00 	. 
	ld bc,0aa5dh		;7a47	01 5d aa 	. ] . 
	or a			;7a4a	b7 	. 
	or a			;7a4b	b7 	. 
	sub l			;7a4c	95 	. 
	ld bc,la09bh		;7a4d	01 9b a0 	. . . 
	or b			;7a50	b0 	. 
	or b			;7a51	b0 	. 
	cp e			;7a52	bb 	. 
	or (hl)			;7a53	b6 	. 
	or b			;7a54	b0 	. 
	or b			;7a55	b0 	. 
	sub b			;7a56	90 	. 
	ld bc,l95dah+1		;7a57	01 db 95 	. . . 
	sbc a,(hl)			;7a5a	9e 	. 
	adc a,h			;7a5b	8c 	. 
	xor (hl)			;7a5c	ae 	. 
	sbc a,l			;7a5d	9d 	. 
	adc a,h			;7a5e	8c 	. 
	xor l			;7a5f	ad 	. 
	xor d			;7a60	aa 	. 
	ld (bc),a			;7a61	02 	. 
	rla			;7a62	17 	. 
l7a63h:
	and b			;7a63	a0 	. 
	sbc a,b			;7a64	98 	. 
	or b			;7a65	b0 	. 
	or b			;7a66	b0 	. 
	add a,l			;7a67	85 	. 
	adc a,e			;7a68	8b 	. 
	or e			;7a69	b3 	. 
	cp e			;7a6a	bb 	. 
	or a			;7a6b	b7 	. 
	or e			;7a6c	b3 	. 
	add a,a			;7a6d	87 	. 
	adc a,d			;7a6e	8a 	. 
	or b			;7a6f	b0 	. 
	or b			;7a70	b0 	. 
	and h			;7a71	a4 	. 
	sub b			;7a72	90 	. 
	ld (bc),a			;7a73	02 	. 
	ld e,h			;7a74	5c 	\ 
	cp h			;7a75	bc 	. 
	or b			;7a76	b0 	. 
	adc a,(hl)			;7a77	8e 	. 
	adc a,l			;7a78	8d 	. 
	or b			;7a79	b0 	. 
	cp h			;7a7a	bc 	. 
	ld (bc),a			;7a7b	02 	. 
	sbc a,h			;7a7c	9c 	. 
	cp d			;7a7d	ba 	. 
	ld (bc),a			;7a7e	02 	. 
	and c			;7a7f	a1 	. 
	or l			;7a80	b5 	. 
	ld (bc),a			;7a81	02 	. 
	call c,002aah		;7a82	dc aa 02 	. . . 
	pop hl			;7a85	e1 	. 
	sub l			;7a86	95 	. 
	inc bc			;7a87	03 	. 
	ld a,(de)			;7a88	1a 	. 
	adc a,c			;7a89	89 	. 
	adc a,h			;7a8a	8c 	. 
	adc a,(hl)			;7a8b	8e 	. 
	add a,h			;7a8c	84 	. 
	inc bc			;7a8d	03 	. 
	jr nz,l7a18h		;7a8e	20 88 	  . 
	adc a,l			;7a90	8d 	. 
	adc a,h			;7a91	8c 	. 
	add a,(hl)			;7a92	86 	. 
	inc b			;7a93	04 	. 
	inc d			;7a94	14 	. 
	nop			;7a95	00 	. 
	ld bc,0aa5dh		;7a96	01 5d aa 	. ] . 
	cp e			;7a99	bb 	. 
	cp e			;7a9a	bb 	. 
	sub l			;7a9b	95 	. 
	ld bc,la09bh		;7a9c	01 9b a0 	. . . 
	or b			;7a9f	b0 	. 
	or b			;7aa0	b0 	. 
	cp c			;7aa1	b9 	. 
	or a			;7aa2	b7 	. 
	or b			;7aa3	b0 	. 
	or b			;7aa4	b0 	. 
	sub b			;7aa5	90 	. 
	ld bc,l95dah+1		;7aa6	01 db 95 	. . . 
	sbc a,(hl)			;7aa9	9e 	. 
	adc a,h			;7aaa	8c 	. 
	xor (hl)			;7aab	ae 	. 
	sbc a,l			;7aac	9d 	. 
	adc a,h			;7aad	8c 	. 
	xor l			;7aae	ad 	. 
	xor d			;7aaf	aa 	. 
	ld (bc),a			;7ab0	02 	. 
	dec de			;7ab1	1b 	. 
	sub l			;7ab2	95 	. 
	adc a,e			;7ab3	8b 	. 
	or e			;7ab4	b3 	. 
	cp e			;7ab5	bb 	. 
	or a			;7ab6	b7 	. 
	or e			;7ab7	b3 	. 
	add a,a			;7ab8	87 	. 
	xor d			;7ab9	aa 	. 
	ld (bc),a			;7aba	02 	. 
	ld e,d			;7abb	5a 	Z 
	and h			;7abc	a4 	. 
	sub c			;7abd	91 	. 
	cp h			;7abe	bc 	. 
	or b			;7abf	b0 	. 
	adc a,(hl)			;7ac0	8e 	. 
	adc a,l			;7ac1	8d 	. 
	or b			;7ac2	b0 	. 
	cp h			;7ac3	bc 	. 
	and d			;7ac4	a2 	. 
	sbc a,b			;7ac5	98 	. 
	ld (bc),a			;7ac6	02 	. 
	sbc a,h			;7ac7	9c 	. 
	cp d			;7ac8	ba 	. 
	ld (bc),a			;7ac9	02 	. 
	and c			;7aca	a1 	. 
	or l			;7acb	b5 	. 
	ld (bc),a			;7acc	02 	. 
	call c,002aah		;7acd	dc aa 02 	. . . 
	pop hl			;7ad0	e1 	. 
	sub l			;7ad1	95 	. 
	inc bc			;7ad2	03 	. 
	ld a,(de)			;7ad3	1a 	. 
	adc a,c			;7ad4	89 	. 
	adc a,h			;7ad5	8c 	. 
	adc a,(hl)			;7ad6	8e 	. 
	add a,h			;7ad7	84 	. 
	inc bc			;7ad8	03 	. 
	jr nz,l7a63h		;7ad9	20 88 	  . 
	adc a,l			;7adb	8d 	. 
	adc a,h			;7adc	8c 	. 
	add a,(hl)			;7add	86 	. 
	inc b			;7ade	04 	. 
	dec d			;7adf	15 	. 
	nop			;7ae0	00 	. 
	ld bc,la81dh		;7ae1	01 1d a8 	. . . 
	sbc a,h			;7ae4	9c 	. 
	cp h			;7ae5	bc 	. 
	xor h			;7ae6	ac 	. 
	ld bc,l825dh		;7ae7	01 5d 82 	. ] . 
	xor a			;7aea	af 	. 
	or e			;7aeb	b3 	. 
	add a,a			;7aec	87 	. 
	ld bc,la89ah		;7aed	01 9a a8 	. . . 
	and e			;7af0	a3 	. 
	or a			;7af1	b7 	. 
	or e			;7af2	b3 	. 
	cp e			;7af3	bb 	. 
	or a			;7af4	b7 	. 
	or e			;7af5	b3 	. 
	cp e			;7af6	bb 	. 
	sub e			;7af7	93 	. 
	sub h			;7af8	94 	. 
	ld bc,laadah		;7af9	01 da aa 	. . . 
	adc a,d			;7afc	8a 	. 
	sbc a,h			;7afd	9c 	. 
	adc a,h			;7afe	8c 	. 
	xor (hl)			;7aff	ae 	. 
	sbc a,l			;7b00	9d 	. 
	adc a,h			;7b01	8c 	. 
	xor h			;7b02	ac 	. 
	add a,l			;7b03	85 	. 
	sub l			;7b04	95 	. 
	ld (bc),a			;7b05	02 	. 
	ld d,088h		;7b06	16 88 	. . 
	add a,(hl)			;7b08	86 	. 
	adc a,h			;7b09	8c 	. 
	adc a,h			;7b0a	8c 	. 
	add a,(hl)			;7b0b	86 	. 
	ld (bc),a			;7b0c	02 	. 
	inc e			;7b0d	1c 	. 
	xor e			;7b0e	ab 	. 
	or e			;7b0f	b3 	. 
	cp e			;7b10	bb 	. 
	or a			;7b11	b7 	. 
	or e			;7b12	b3 	. 
	sub a			;7b13	97 	. 
	ld (bc),a			;7b14	02 	. 
	inc hl			;7b15	23 	# 
	adc a,c			;7b16	89 	. 
	adc a,h			;7b17	8c 	. 
	adc a,h			;7b18	8c 	. 
	adc a,c			;7b19	89 	. 
	add a,h			;7b1a	84 	. 
	ld (bc),a			;7b1b	02 	. 
	ld e,e			;7b1c	5b 	[ 
	adc a,d			;7b1d	8a 	. 
	sbc a,l			;7b1e	9d 	. 
	add a,(hl)			;7b1f	86 	. 
	add a,e			;7b20	83 	. 
	add a,e			;7b21	83 	. 
	adc a,c			;7b22	89 	. 
	xor (hl)			;7b23	ae 	. 
	add a,l			;7b24	85 	. 
	ld (bc),a			;7b25	02 	. 
	sbc a,e			;7b26	9b 	. 
	add a,d			;7b27	82 	. 
	sub l			;7b28	95 	. 
	ld (bc),a			;7b29	02 	. 
	and c			;7b2a	a1 	. 
	xor d			;7b2b	aa 	. 
	add a,h			;7b2c	84 	. 
	ld (bc),a			;7b2d	02 	. 
	jp c,lb0a4h		;7b2e	da a4 b0 	. . . 
	or l			;7b31	b5 	. 
	ld (bc),a			;7b32	02 	. 
	pop hl			;7b33	e1 	. 
	xor d			;7b34	aa 	. 
	inc bc			;7b35	03 	. 
	ld hl,sub_8c8ch+2		;7b36	21 8e 8c 	! . . 
	add a,(hl)			;7b39	86 	. 
	inc b			;7b3a	04 	. 
	ld d,000h		;7b3b	16 00 	. . 
	nop			;7b3d	00 	. 
	cp ixh		;7b3e	dd bc 	. . 
	xor h			;7b40	ac 	. 
	sbc a,h			;7b41	9c 	. 
	cp h			;7b42	bc 	. 
	ld bc,lad1dh		;7b43	01 1d ad 	. . . 
	sbc a,(hl)			;7b46	9e 	. 
	xor l			;7b47	ad 	. 
	sbc a,(hl)			;7b48	9e 	. 
	ld bc,la059h		;7b49	01 59 a0 	. Y . 
	adc a,h			;7b4c	8c 	. 
	xor h			;7b4d	ac 	. 
	adc a,h			;7b4e	8c 	. 
	adc a,h			;7b4f	8c 	. 
	cp a			;7b50	bf 	. 
	sbc a,a			;7b51	9f 	. 
	adc a,h			;7b52	8c 	. 
	xor h			;7b53	ac 	. 
	adc a,h			;7b54	8c 	. 
	and h			;7b55	a4 	. 
	ld bc,laa99h		;7b56	01 99 aa 	. . . 
	and b			;7b59	a0 	. 
	or a			;7b5a	b7 	. 
	or e			;7b5b	b3 	. 
	or e			;7b5c	b3 	. 
	cp a			;7b5d	bf 	. 
	or a			;7b5e	b7 	. 
	or e			;7b5f	b3 	. 
	or e			;7b60	b3 	. 
	or l			;7b61	b5 	. 
	xor d			;7b62	aa 	. 
	ld bc,l90d6h		;7b63	01 d6 90 	. . . 
	ld bc,laad9h		;7b66	01 d9 aa 	. . . 
	ld bc,laddbh		;7b69	01 db ad 	. . . 
	adc a,h			;7b6c	8c 	. 
	adc a,h			;7b6d	8c 	. 
	cp a			;7b6e	bf 	. 
	sbc a,l			;7b6f	9d 	. 
	adc a,h			;7b70	8c 	. 
	xor h			;7b71	ac 	. 
	add a,l			;7b72	85 	. 
	xor d			;7b73	aa 	. 
	ld bc,la0e6h		;7b74	01 e6 a0 	. . . 
	ld (bc),a			;7b77	02 	. 
	dec d			;7b78	15 	. 
	add a,e			;7b79	83 	. 
	add a,d			;7b7a	82 	. 
	add a,e			;7b7b	83 	. 
	add a,e			;7b7c	83 	. 
	add a,c			;7b7d	81 	. 
	and b			;7b7e	a0 	. 
	or b			;7b7f	b0 	. 
	add a,e			;7b80	83 	. 
	and e			;7b81	a3 	. 
	cp a			;7b82	bf 	. 
	or a			;7b83	b7 	. 
	add a,e			;7b84	83 	. 
	and c			;7b85	a1 	. 
	sub b			;7b86	90 	. 
	ld (bc),a			;7b87	02 	. 
	inc h			;7b88	24 	$ 
	add a,e			;7b89	83 	. 
	add a,e			;7b8a	83 	. 
	add a,c			;7b8b	81 	. 
	add a,e			;7b8c	83 	. 
	ld (bc),a			;7b8d	02 	. 
	ld e,d			;7b8e	5a 	Z 
	add a,d			;7b8f	82 	. 
	xor e			;7b90	ab 	. 
	add a,e			;7b91	83 	. 
	add a,c			;7b92	81 	. 
	ld (bc),a			;7b93	02 	. 
	ld h,b			;7b94	60 	` 
	add a,e			;7b95	83 	. 
	xor e			;7b96	ab 	. 
	sub c			;7b97	91 	. 
	ld (bc),a			;7b98	02 	. 
	sbc a,e			;7b99	9b 	. 
	xor (hl)			;7b9a	ae 	. 
	ld (bc),a			;7b9b	02 	. 
	and c			;7b9c	a1 	. 
	xor d			;7b9d	aa 	. 
	ld (bc),a			;7b9e	02 	. 
	in a,(0aah)		;7b9f	db aa 	. . 
	ld (bc),a			;7ba1	02 	. 
	pop hl			;7ba2	e1 	. 
	cp d			;7ba3	ba 	. 
	or b			;7ba4	b0 	. 
	or b			;7ba5	b0 	. 
	add a,h			;7ba6	84 	. 
	inc bc			;7ba7	03 	. 
	add hl,de			;7ba8	19 	. 
	adc a,c			;7ba9	89 	. 
	adc a,h			;7baa	8c 	. 
	adc a,(hl)			;7bab	8e 	. 
	add a,h			;7bac	84 	. 
	inc b			;7bad	04 	. 
	rla			;7bae	17 	. 
	nop			;7baf	00 	. 
	nop			;7bb0	00 	. 
	sbc a,l			;7bb1	9d 	. 
	or b			;7bb2	b0 	. 
	ld a,(bc)			;7bb3	0a 	. 
	inc bc			;7bb4	03 	. 
	nop			;7bb5	00 	. 
	defb 0ddh,0b7h,09ah	;illegal sequence		;7bb6	dd b7 9a 	. . . 
	and l			;7bb9	a5 	. 
	cp e			;7bba	bb 	. 
	ld bc,l8a1dh		;7bbb	01 1d 8a 	. . . 
	or a			;7bbe	b7 	. 
	cp e			;7bbf	bb 	. 
	add a,l			;7bc0	85 	. 
	ld bc,l9659h		;7bc1	01 59 96 	. Y . 
	and e			;7bc4	a3 	. 
	or a			;7bc5	b7 	. 
	or e			;7bc6	b3 	. 
	or e			;7bc7	b3 	. 
	cp a			;7bc8	bf 	. 
	or a			;7bc9	b7 	. 
	or e			;7bca	b3 	. 
	or e			;7bcb	b3 	. 
	or a			;7bcc	b7 	. 
	add a,e			;7bcd	83 	. 
	sub h			;7bce	94 	. 
	ld bc,l9599h		;7bcf	01 99 95 	. . . 
	xor (hl)			;7bd2	ae 	. 
	adc a,h			;7bd3	8c 	. 
	ld a,(bc)			;7bd4	0a 	. 
	ld (bc),a			;7bd5	02 	. 
	cp a			;7bd6	bf 	. 
	sbc a,l			;7bd7	9d 	. 
	adc a,h			;7bd8	8c 	. 
	adc a,h			;7bd9	8c 	. 
	xor (hl)			;7bda	ae 	. 
	add a,h			;7bdb	84 	. 
	sub l			;7bdc	95 	. 
	ld bc,lb0d4h		;7bdd	01 d4 b0 	. . . 
	sbc a,b			;7be0	98 	. 
	or b			;7be1	b0 	. 
	ld a,(bc)			;7be2	0a 	. 
	ld (bc),a			;7be3	02 	. 
	add a,l			;7be4	85 	. 
	add a,d			;7be5	82 	. 
	and a			;7be6	a7 	. 
	or e			;7be7	b3 	. 
	or e			;7be8	b3 	. 
	cp a			;7be9	bf 	. 
	or a			;7bea	b7 	. 
	or e			;7beb	b3 	. 
	or e			;7bec	b3 	. 
	add a,a			;7bed	87 	. 
	ld bc,la5e4h		;7bee	01 e4 a5 	. . . 
	or b			;7bf1	b0 	. 
	or b			;7bf2	b0 	. 
	sbc a,b			;7bf3	98 	. 
	or b			;7bf4	b0 	. 
	sub b			;7bf5	90 	. 
	ld (bc),a			;7bf6	02 	. 
	ld a,(de)			;7bf7	1a 	. 
	xor b			;7bf8	a8 	. 
	cp h			;7bf9	bc 	. 
	or b			;7bfa	b0 	. 
	sbc a,b			;7bfb	98 	. 
	adc a,a			;7bfc	8f 	. 
	adc a,l			;7bfd	8d 	. 
	or b			;7bfe	b0 	. 
	or b			;7bff	b0 	. 
	cp h			;7c00	bc 	. 
l7c01h:
	sub h			;7c01	94 	. 
	ld (bc),a			;7c02	02 	. 
	ld e,e			;7c03	5b 	[ 
	cp d			;7c04	ba 	. 
	ld (bc),a			;7c05	02 	. 
l7c06h:
	ld h,d			;7c06	62 	b 
	sub l			;7c07	95 	. 
	ld (bc),a			;7c08	02 	. 
	sbc a,e			;7c09	9b 	. 
	xor d			;7c0a	aa 	. 
	ld (bc),a			;7c0b	02 	. 
	and d			;7c0c	a2 	. 
	sbc a,l			;7c0d	9d 	. 
	ld (bc),a			;7c0e	02 	. 
	ret c			;7c0f	d8 	. 
	add a,d			;7c10	82 	. 
	adc a,l			;7c11	8d 	. 
	adc a,h			;7c12	8c 	. 
	adc a,(hl)			;7c13	8e 	. 
	add a,h			;7c14	84 	. 
	ld (bc),a			;7c15	02 	. 
	jp po,00395h		;7c16	e2 95 03 	. . . 
	ld hl,l8d88h		;7c19	21 88 8d 	! . . 
	adc a,h			;7c1c	8c 	. 
	add a,c			;7c1d	81 	. 
	inc b			;7c1e	04 	. 
	jr l7c21h		;7c1f	18 00 	. . 
l7c21h:
	nop			;7c21	00 	. 
	ld e,h			;7c22	5c 	\ 
	cp b			;7c23	b8 	. 
	cp h			;7c24	bc 	. 
	xor h			;7c25	ac 	. 
	sbc a,h			;7c26	9c 	. 
	cp h			;7c27	bc 	. 
	sub b			;7c28	90 	. 
	nop			;7c29	00 	. 
	sbc a,h			;7c2a	9c 	. 
	xor a			;7c2b	af 	. 
	cp l			;7c2c	bd 	. 
	sbc a,(hl)			;7c2d	9e 	. 
	xor l			;7c2e	ad 	. 
	cp (hl)			;7c2f	be 	. 
	add a,l			;7c30	85 	. 
	nop			;7c31	00 	. 
	defb 0ddh,0afh,0b7h	;illegal sequence		;7c32	dd af b7 	. . . 
l7c35h:
	cp e			;7c35	bb 	. 
	add a,l			;7c36	85 	. 
	ld bc,la818h		;7c37	01 18 a8 	. . . 
	add a,e			;7c3a	83 	. 
	sbc a,e			;7c3b	9b 	. 
	adc a,a			;7c3c	8f 	. 
	ld a,(bc)			;7c3d	0a 	. 
	ld (bc),a			;7c3e	02 	. 
	cp a			;7c3f	bf 	. 
	sbc a,a			;7c40	9f 	. 
	adc a,a			;7c41	8f 	. 
	ld a,(bc)			;7c42	0a 	. 
	ld (bc),a			;7c43	02 	. 
	sub e			;7c44	93 	. 
	xor c			;7c45	a9 	. 
	ld bc,laa58h		;7c46	01 58 aa 	. X . 
	and b			;7c49	a0 	. 
	or a			;7c4a	b7 	. 
	or e			;7c4b	b3 	. 
	ld a,(bc)			;7c4c	0a 	. 
	ld (bc),a			;7c4d	02 	. 
	cp a			;7c4e	bf 	. 
	or a			;7c4f	b7 	. 
	or e			;7c50	b3 	. 
	ld a,(bc)			;7c51	0a 	. 
	ld (bc),a			;7c52	02 	. 
	or l			;7c53	b5 	. 
	xor d			;7c54	aa 	. 
	ld bc,la094h		;7c55	01 94 a0 	. . . 
	ld bc,laa96h+2		;7c58	01 98 aa 	. . . 
	ld bc,lad9ah		;7c5b	01 9a ad 	. . . 
	adc a,h			;7c5e	8c 	. 
	ld a,(bc)			;7c5f	0a 	. 
	ld (bc),a			;7c60	02 	. 
	cp a			;7c61	bf 	. 
	sbc a,l			;7c62	9d 	. 
	adc a,h			;7c63	8c 	. 
	adc a,h			;7c64	8c 	. 
	xor h			;7c65	ac 	. 
	add a,l			;7c66	85 	. 
	xor d			;7c67	aa 	. 
	ld bc,la0a8h		;7c68	01 a8 a0 	. . . 
	ld bc,l83d3h		;7c6b	01 d3 83 	. . . 
	add a,c			;7c6e	81 	. 
	add a,e			;7c6f	83 	. 
	ld a,(bc)			;7c70	0a 	. 
	ld (bc),a			;7c71	02 	. 
	add a,c			;7c72	81 	. 
	and b			;7c73	a0 	. 
	or b			;7c74	b0 	. 
	add a,e			;7c75	83 	. 
	add a,e			;7c76	83 	. 
	or e			;7c77	b3 	. 
	cp a			;7c78	bf 	. 
	or a			;7c79	b7 	. 
	add a,e			;7c7a	83 	. 
	add a,e			;7c7b	83 	. 
	or c			;7c7c	b1 	. 
	sub b			;7c7d	90 	. 
	ld bc,l83e5h		;7c7e	01 e5 83 	. . . 
	ld a,(bc)			;7c81	0a 	. 
	ld (bc),a			;7c82	02 	. 
	add a,c			;7c83	81 	. 
	add a,e			;7c84	83 	. 
	add a,c			;7c85	81 	. 
	ld (bc),a			;7c86	02 	. 
	add hl,de			;7c87	19 	. 
	adc a,d			;7c88	8a 	. 
	xor a			;7c89	af 	. 
	adc a,h			;7c8a	8c 	. 
	adc a,h			;7c8b	8c 	. 
	add a,e			;7c8c	83 	. 
	ld a,(bc)			;7c8d	0a 	. 
	ld (bc),a			;7c8e	02 	. 
	adc a,h			;7c8f	8c 	. 
	adc a,h			;7c90	8c 	. 
	sbc a,a			;7c91	9f 	. 
	add a,l			;7c92	85 	. 
	ld (bc),a			;7c93	02 	. 
	ld e,d			;7c94	5a 	Z 
	xor d			;7c95	aa 	. 
	ld (bc),a			;7c96	02 	. 
	ld h,d			;7c97	62 	b 
	sbc a,l			;7c98	9d 	. 
	ld (bc),a			;7c99	02 	. 
	sbc a,d			;7c9a	9a 	. 
	xor e			;7c9b	ab 	. 
	ld (bc),a			;7c9c	02 	. 
	and d			;7c9d	a2 	. 
	sub l			;7c9e	95 	. 
	ld (bc),a			;7c9f	02 	. 
	jp c,002aah		;7ca0	da aa 02 	. . . 
	pop hl			;7ca3	e1 	. 
	adc a,h			;7ca4	8c 	. 
	adc a,l			;7ca5	8d 	. 
	adc a,h			;7ca6	8c 	. 
	adc a,h			;7ca7	8c 	. 
	add a,c			;7ca8	81 	. 
	inc bc			;7ca9	03 	. 
	jr l7c35h		;7caa	18 89 	. . 
	adc a,h			;7cac	8c 	. 
	adc a,(hl)			;7cad	8e 	. 
	add a,h			;7cae	84 	. 
	inc b			;7caf	04 	. 
	add hl,de			;7cb0	19 	. 
	nop			;7cb1	00 	. 
	nop			;7cb2	00 	. 
	dec de			;7cb3	1b 	. 
	and b			;7cb4	a0 	. 
	or b			;7cb5	b0 	. 
	ld a,(bc)			;7cb6	0a 	. 
	dec b			;7cb7	05 	. 
	nop			;7cb8	00 	. 
	ld e,e			;7cb9	5b 	[ 
	cp a			;7cba	bf 	. 
	cp a			;7cbb	bf 	. 
	adc a,a			;7cbc	8f 	. 
	cp a			;7cbd	bf 	. 
	sbc a,a			;7cbe	9f 	. 
	xor a			;7cbf	af 	. 
	cp a			;7cc0	bf 	. 
	sub l			;7cc1	95 	. 
	nop			;7cc2	00 	. 
	sbc a,e			;7cc3	9b 	. 
	xor a			;7cc4	af 	. 
	cp l			;7cc5	bd 	. 
	cp h			;7cc6	bc 	. 
	sbc a,a			;7cc7	9f 	. 
	cp l			;7cc8	bd 	. 
	cp h			;7cc9	bc 	. 
	cp a			;7cca	bf 	. 
	add a,l			;7ccb	85 	. 
	nop			;7ccc	00 	. 
	call c,sub_9faah		;7ccd	dc aa 9f 	. . . 
	adc a,h			;7cd0	8c 	. 
	adc a,(hl)			;7cd1	8e 	. 
	cp a			;7cd2	bf 	. 
	ld bc,la016h		;7cd3	01 16 a0 	. . . 
	sbc a,h			;7cd6	9c 	. 
	xor h			;7cd7	ac 	. 
	adc a,h			;7cd8	8c 	. 
	cp h			;7cd9	bc 	. 
	adc a,h			;7cda	8c 	. 
	adc a,h			;7cdb	8c 	. 
	xor a			;7cdc	af 	. 
	cp a			;7cdd	bf 	. 
	sbc a,a			;7cde	9f 	. 
	adc a,l			;7cdf	8d 	. 
	adc a,h			;7ce0	8c 	. 
	cp h			;7ce1	bc 	. 
	adc a,h			;7ce2	8c 	. 
	sbc a,h			;7ce3	9c 	. 
	xor h			;7ce4	ac 	. 
	sub b			;7ce5	90 	. 
	ld bc,laa56h		;7ce6	01 56 aa 	. V . 
	sub l			;7ce9	95 	. 
	xor b			;7cea	a8 	. 
	or a			;7ceb	b7 	. 
	or e			;7cec	b3 	. 
	ld a,(bc)			;7ced	0a 	. 
	ld (bc),a			;7cee	02 	. 
	cp e			;7cef	bb 	. 
	cp a			;7cf0	bf 	. 
	or a			;7cf1	b7 	. 
	or e			;7cf2	b3 	. 
	ld a,(bc)			;7cf3	0a 	. 
	ld (bc),a			;7cf4	02 	. 
	cp e			;7cf5	bb 	. 
	sub h			;7cf6	94 	. 
	xor d			;7cf7	aa 	. 
	sub l			;7cf8	95 	. 
	ld bc,laa96h		;7cf9	01 96 aa 	. . . 
	sub l			;7cfc	95 	. 
	cp a			;7cfd	bf 	. 
	adc a,h			;7cfe	8c 	. 
	ld a,(bc)			;7cff	0a 	. 
	inc bc			;7d00	03 	. 
l7d01h:
	xor (hl)			;7d01	ae 	. 
l7d02h:
	cp a			;7d02	bf 	. 
	sbc a,l			;7d03	9d 	. 
	adc a,h			;7d04	8c 	. 
	ld a,(bc)			;7d05	0a 	. 
	inc bc			;7d06	03 	. 
l7d07h:
	cp a			;7d07	bf 	. 
	xor d			;7d08	aa 	. 
	sub l			;7d09	95 	. 
	ld bc,la0d1h		;7d0a	01 d1 a0 	. . . 
	ld bc,laad6h		;7d0d	01 d6 aa 	. . . 
	sub l			;7d10	95 	. 
	adc a,d			;7d11	8a 	. 
	or a			;7d12	b7 	. 
	or e			;7d13	b3 	. 
	ld a,(bc)			;7d14	0a 	. 
	ld (bc),a			;7d15	02 	. 
	cp e			;7d16	bb 	. 
	cp a			;7d17	bf 	. 
	or a			;7d18	b7 	. 
	or e			;7d19	b3 	. 
	ld a,(bc)			;7d1a	0a 	. 
	ld (bc),a			;7d1b	02 	. 
	cp e			;7d1c	bb 	. 
	add a,l			;7d1d	85 	. 
	xor d			;7d1e	aa 	. 
	sub l			;7d1f	95 	. 
	ld bc,l90ebh		;7d20	01 eb 90 	. . . 
	ld (bc),a			;7d23	02 	. 
	rrca			;7d24	0f 	. 
	adc a,d			;7d25	8a 	. 
	adc a,a			;7d26	8f 	. 
	add a,(hl)			;7d27	86 	. 
	adc a,h			;7d28	8c 	. 
	ld a,(bc)			;7d29	0a 	. 
	inc bc			;7d2a	03 	. 
	add a,(hl)			;7d2b	86 	. 
	add a,c			;7d2c	81 	. 
	ld (bc),a			;7d2d	02 	. 
	add hl,de			;7d2e	19 	. 
	adc a,c			;7d2f	89 	. 
	adc a,h			;7d30	8c 	. 
	ld a,(bc)			;7d31	0a 	. 
	ld (bc),a			;7d32	02 	. 
	xor (hl)			;7d33	ae 	. 
	cp a			;7d34	bf 	. 
	sbc a,l			;7d35	9d 	. 
	adc a,h			;7d36	8c 	. 
	ld a,(bc)			;7d37	0a 	. 
	ld (bc),a			;7d38	02 	. 
	add a,(hl)			;7d39	86 	. 
	ld (bc),a			;7d3a	02 	. 
	dec h			;7d3b	25 	% 
	add a,d			;7d3c	82 	. 
	adc a,c			;7d3d	89 	. 
	adc a,h			;7d3e	8c 	. 
	ld a,(bc)			;7d3f	0a 	. 
	inc bc			;7d40	03 	. 
	adc a,c			;7d41	89 	. 
	adc a,a			;7d42	8f 	. 
	add a,l			;7d43	85 	. 
	ld (bc),a			;7d44	02 	. 
	ld e,b			;7d45	58 	X 
	xor b			;7d46	a8 	. 
	cp h			;7d47	bc 	. 
	sub h			;7d48	94 	. 
	ld (bc),a			;7d49	02 	. 
	ld e,h			;7d4a	5c 	\ 
	xor d			;7d4b	aa 	. 
	cp a			;7d4c	bf 	. 
	ld a,(bc)			;7d4d	0a 	. 
	ld (bc),a			;7d4e	02 	. 
	sub l			;7d4f	95 	. 
	ld (bc),a			;7d50	02 	. 
	ld h,e			;7d51	63 	c 
	cp h			;7d52	bc 	. 
	cp h			;7d53	bc 	. 
	ld (bc),a			;7d54	02 	. 
	sbc a,b			;7d55	98 	. 
	add a,d			;7d56	82 	. 
	xor e			;7d57	ab 	. 
	sub a			;7d58	97 	. 
	add a,e			;7d59	83 	. 
	add a,c			;7d5a	81 	. 
	ld (bc),a			;7d5b	02 	. 
	and b			;7d5c	a0 	. 
	add a,d			;7d5d	82 	. 
	add a,e			;7d5e	83 	. 
	add a,e			;7d5f	83 	. 
	cp a			;7d60	bf 	. 
	add a,e			;7d61	83 	. 
	ld (bc),a			;7d62	02 	. 
	exx			;7d63	d9 	. 
	xor (hl)			;7d64	ae 	. 
	sub l			;7d65	95 	. 
	ld (bc),a			;7d66	02 	. 
	ex (sp),hl			;7d67	e3 	. 
	cp a			;7d68	bf 	. 
	inc bc			;7d69	03 	. 
	add hl,de			;7d6a	19 	. 
	xor d			;7d6b	aa 	. 
	sub l			;7d6c	95 	. 
	inc bc			;7d6d	03 	. 
	inc hl			;7d6e	23 	# 
	cp a			;7d6f	bf 	. 
	add a,h			;7d70	84 	. 
	inc bc			;7d71	03 	. 
	ld d,(hl)			;7d72	56 	V 
	sub b			;7d73	90 	. 
	inc bc			;7d74	03 	. 
	ld e,c			;7d75	59 	Y 
	xor d			;7d76	aa 	. 
	sub l			;7d77	95 	. 
	inc bc			;7d78	03 	. 
	ld h,e			;7d79	63 	c 
	cp a			;7d7a	bf 	. 
	inc bc			;7d7b	03 	. 
	sub (hl)			;7d7c	96 	. 
	add a,d			;7d7d	82 	. 
	add a,e			;7d7e	83 	. 
	ld a,(bc)			;7d7f	0a 	. 
	inc bc			;7d80	03 	. 
	add a,c			;7d81	81 	. 
	inc bc			;7d82	03 	. 
	and e			;7d83	a3 	. 
	cp a			;7d84	bf 	. 
	inc bc			;7d85	03 	. 
	jp po,l8f88h		;7d86	e2 88 8f 	. . . 
	adc a,h			;7d89	8c 	. 
	adc a,h			;7d8a	8c 	. 
	add a,(hl)			;7d8b	86 	. 
	inc b			;7d8c	04 	. 
	ld a,(de)			;7d8d	1a 	. 
	nop			;7d8e	00 	. 
	nop			;7d8f	00 	. 
	add hl,de			;7d90	19 	. 
	and b			;7d91	a0 	. 
	cp b			;7d92	b8 	. 
	cp h			;7d93	bc 	. 
	ld a,(bc)			;7d94	0a 	. 
	rlca			;7d95	07 	. 
	or b			;7d96	b0 	. 
	nop			;7d97	00 	. 
	ld e,b			;7d98	58 	X 
	and b			;7d99	a0 	. 
	cp a			;7d9a	bf 	. 
	or a			;7d9b	b7 	. 
	cp a			;7d9c	bf 	. 
	ld a,(bc)			;7d9d	0a 	. 
	ld b,0b7h		;7d9e	06 b7 	. . 
	cp a			;7da0	bf 	. 
	or l			;7da1	b5 	. 
	nop			;7da2	00 	. 
	sbc a,b			;7da3	98 	. 
	xor d			;7da4	aa 	. 
	cp a			;7da5	bf 	. 
l7da6h:
	ld a,(bc)			;7da6	0a 	. 
	ld (bc),a			;7da7	02 	. 
	adc a,a			;7da8	8f 	. 
	adc a,a			;7da9	8f 	. 
	cp a			;7daa	bf 	. 
	sbc a,a			;7dab	9f 	. 
	adc a,a			;7dac	8f 	. 
	xor a			;7dad	af 	. 
	cp a			;7dae	bf 	. 
	ld a,(bc)			;7daf	0a 	. 
	ld (bc),a			;7db0	02 	. 
	nop			;7db1	00 	. 
	exx			;7db2	d9 	. 
	cp e			;7db3	bb 	. 
	cp a			;7db4	bf 	. 
	and c			;7db5	a1 	. 
	cp b			;7db6	b8 	. 
	cp h			;7db7	bc 	. 
	sbc a,a			;7db8	9f 	. 
	cp l			;7db9	bd 	. 
	cp h			;7dba	bc 	. 
	or b			;7dbb	b0 	. 
	xor e			;7dbc	ab 	. 
	cp a			;7dbd	bf 	. 
	sub c			;7dbe	91 	. 
	ld bc,l8b19h		;7dbf	01 19 8b 	. . . 
	cp a			;7dc2	bf 	. 
	ld a,(bc)			;7dc3	0a 	. 
	inc bc			;7dc4	03 	. 
	cp (hl)			;7dc5	be 	. 
	cp (hl)			;7dc6	be 	. 
	cp a			;7dc7	bf 	. 
	ld a,(bc)			;7dc8	0a 	. 
	ld (bc),a			;7dc9	02 	. 
	sbc a,a			;7dca	9f 	. 
	add a,c			;7dcb	81 	. 
	ld bc,laf5ah		;7dcc	01 5a af 	. Z . 
	sub a			;7dcf	97 	. 
	add a,d			;7dd0	82 	. 
	ld a,(bc)			;7dd1	0a 	. 
	dec b			;7dd2	05 	. 
	cp a			;7dd3	bf 	. 
	add a,l			;7dd4	85 	. 
	ld bc,l829ah		;7dd5	01 9a 82 	. . . 
	adc a,a			;7dd8	8f 	. 
	adc a,(hl)			;7dd9	8e 	. 
	xor (hl)			;7dda	ae 	. 
	cp (hl)			;7ddb	be 	. 
	cp (hl)			;7ddc	be 	. 
	adc a,(hl)			;7ddd	8e 	. 
	adc a,(hl)			;7dde	8e 	. 
	add a,a			;7ddf	87 	. 
	ld bc,la0d0h		;7de0	01 d0 a0 	. . . 
	xor (hl)			;7de3	ae 	. 
	adc a,e			;7de4	8b 	. 
	or a			;7de5	b7 	. 
	or e			;7de6	b3 	. 
	cp e			;7de7	bb 	. 
	cp a			;7de8	bf 	. 
	add a,e			;7de9	83 	. 
	ld a,(bc)			;7dea	0a 	. 
	dec b			;7deb	05 	. 
	xor a			;7dec	af 	. 
	cp a			;7ded	bf 	. 
	sbc a,a			;7dee	9f 	. 
	add a,e			;7def	83 	. 
	ld a,(bc)			;7df0	0a 	. 
	inc b			;7df1	04 	. 
	xor e			;7df2	ab 	. 
	cp a			;7df3	bf 	. 
	or e			;7df4	b3 	. 
	or e			;7df5	b3 	. 
	sbc a,a			;7df6	9f 	. 
	xor e			;7df7	ab 	. 
	and h			;7df8	a4 	. 
	ld (bc),a			;7df9	02 	. 
	djnz l7da6h		;7dfa	10 aa 	. . 
	xor d			;7dfc	aa 	. 
	ld (bc),a			;7dfd	02 	. 
	dec d			;7dfe	15 	. 
	cp (hl)			;7dff	be 	. 
	sub a			;7e00	97 	. 
	add a,e			;7e01	83 	. 
	ld a,(bc)			;7e02	0a 	. 
	dec b			;7e03	05 	. 
	xor a			;7e04	af 	. 
	cp a			;7e05	bf 	. 
	sbc a,a			;7e06	9f 	. 
	add a,e			;7e07	83 	. 
	ld a,(bc)			;7e08	0a 	. 
	dec b			;7e09	05 	. 
	xor e			;7e0a	ab 	. 
	cp h			;7e0b	bc 	. 
	ld (bc),a			;7e0c	02 	. 
	ld hl,(laaa8h+2)		;7e0d	2a aa aa 	* . . 
	ld (bc),a			;7e10	02 	. 
	ld d,b			;7e11	50 	P 
	xor d			;7e12	aa 	. 
	xor d			;7e13	aa 	. 
	ld (bc),a			;7e14	02 	. 
	ld d,h			;7e15	54 	T 
	cp h			;7e16	bc 	. 
	sub a			;7e17	97 	. 
	add a,e			;7e18	83 	. 
	ld a,(bc)			;7e19	0a 	. 
	ld b,0afh		;7e1a	06 af 	. . 
	cp a			;7e1c	bf 	. 
	sbc a,a			;7e1d	9f 	. 
	add a,e			;7e1e	83 	. 
	ld a,(bc)			;7e1f	0a 	. 
	ld b,0bfh		;7e20	06 bf 	. . 
	sub h			;7e22	94 	. 
	ld (bc),a			;7e23	02 	. 
	ld l,d			;7e24	6a 	j 
	xor d			;7e25	aa 	. 
	xor d			;7e26	aa 	. 
	ld (bc),a			;7e27	02 	. 
	sub b			;7e28	90 	. 
	xor d			;7e29	aa 	. 
	xor d			;7e2a	aa 	. 
	ld (bc),a			;7e2b	02 	. 
	sub h			;7e2c	94 	. 
	cp a			;7e2d	bf 	. 
	sub a			;7e2e	97 	. 
	add a,e			;7e2f	83 	. 
	ld a,(bc)			;7e30	0a 	. 
	ld b,0afh		;7e31	06 af 	. . 
	cp a			;7e33	bf 	. 
	sbc a,a			;7e34	9f 	. 
	add a,e			;7e35	83 	. 
	ld a,(bc)			;7e36	0a 	. 
	ld b,0bfh		;7e37	06 bf 	. . 
	sub l			;7e39	95 	. 
	ld (bc),a			;7e3a	02 	. 
	xor d			;7e3b	aa 	. 
	xor d			;7e3c	aa 	. 
	xor d			;7e3d	aa 	. 
	ld (bc),a			;7e3e	02 	. 
	ret nc			;7e3f	d0 	. 
	xor d			;7e40	aa 	. 
	xor d			;7e41	aa 	. 
	ld (bc),a			;7e42	02 	. 
	push de			;7e43	d5 	. 
	cp a			;7e44	bf 	. 
	sub a			;7e45	97 	. 
	add a,e			;7e46	83 	. 
	ld a,(bc)			;7e47	0a 	. 
	dec b			;7e48	05 	. 
	xor a			;7e49	af 	. 
	cp a			;7e4a	bf 	. 
	sbc a,a			;7e4b	9f 	. 
	add a,e			;7e4c	83 	. 
	ld a,(bc)			;7e4d	0a 	. 
	dec b			;7e4e	05 	. 
	xor e			;7e4f	ab 	. 
	cp a			;7e50	bf 	. 
	ld (bc),a			;7e51	02 	. 
	jp pe,laaa8h+2		;7e52	ea aa aa 	. . . 
	inc bc			;7e55	03 	. 
	dec b			;7e56	05 	. 
	adc a,b			;7e57	88 	. 
	adc a,h			;7e58	8c 	. 
	adc a,h			;7e59	8c 	. 
	xor h			;7e5a	ac 	. 
	or l			;7e5b	b5 	. 
	or b			;7e5c	b0 	. 
	ld a,(bc)			;7e5d	0a 	. 
	dec b			;7e5e	05 	. 
	cp d			;7e5f	ba 	. 
	xor d			;7e60	aa 	. 
	inc bc			;7e61	03 	. 
	dec d			;7e62	15 	. 
	xor d			;7e63	aa 	. 
	sub a			;7e64	97 	. 
	add a,e			;7e65	83 	. 
	ld a,(bc)			;7e66	0a 	. 
	dec b			;7e67	05 	. 
	xor a			;7e68	af 	. 
	cp a			;7e69	bf 	. 
	sbc a,a			;7e6a	9f 	. 
	add a,e			;7e6b	83 	. 
	ld a,(bc)			;7e6c	0a 	. 
	dec b			;7e6d	05 	. 
	xor e			;7e6e	ab 	. 
	sub l			;7e6f	95 	. 
	inc bc			;7e70	03 	. 
	ld hl,(laaa8h+2)		;7e71	2a aa aa 	* . . 
	or b			;7e74	b0 	. 
	ld a,(bc)			;7e75	0a 	. 
	ld b,0bdh		;7e76	06 bd 	. . 
	adc a,h			;7e78	8c 	. 
	ld a,(bc)			;7e79	0a 	. 
	ld (bc),a			;7e7a	02 	. 
	inc bc			;7e7b	03 	. 
	ld b,l			;7e7c	45 	E 
	add a,d			;7e7d	82 	. 
	and e			;7e7e	a3 	. 
	or e			;7e7f	b3 	. 
	or e			;7e80	b3 	. 
	add a,(hl)			;7e81	86 	. 
	adc a,h			;7e82	8c 	. 
	ld a,(bc)			;7e83	0a 	. 
	ld b,085h		;7e84	06 85 	. . 
	inc bc			;7e86	03 	. 
	ld d,(hl)			;7e87	56 	V 
	add a,d			;7e88	82 	. 
	add a,e			;7e89	83 	. 
	ld a,(bc)			;7e8a	0a 	. 
	dec b			;7e8b	05 	. 
	xor a			;7e8c	af 	. 
	cp a			;7e8d	bf 	. 
	sbc a,a			;7e8e	9f 	. 
	add a,e			;7e8f	83 	. 
	ld a,(bc)			;7e90	0a 	. 
	dec b			;7e91	05 	. 
	add a,c			;7e92	81 	. 
	inc bc			;7e93	03 	. 
	ld l,e			;7e94	6b 	k 
	adc a,l			;7e95	8d 	. 
	adc a,h			;7e96	8c 	. 
	ld a,(bc)			;7e97	0a 	. 
	dec b			;7e98	05 	. 
	add a,(hl)			;7e99	86 	. 
	and (hl)			;7e9a	a6 	. 
	or e			;7e9b	b3 	. 
	or e			;7e9c	b3 	. 
	add a,e			;7e9d	83 	. 
	inc bc			;7e9e	03 	. 
	sub l			;7e9f	95 	. 
	cp b			;7ea0	b8 	. 
	cp h			;7ea1	bc 	. 
	or h			;7ea2	b4 	. 
	inc bc			;7ea3	03 	. 
	sbc a,e			;7ea4	9b 	. 
	cp (hl)			;7ea5	be 	. 
	or a			;7ea6	b7 	. 
	cp a			;7ea7	bf 	. 
	cp a			;7ea8	bf 	. 
	or a			;7ea9	b7 	. 
	cp a			;7eaa	bf 	. 
	sub h			;7eab	94 	. 
	inc bc			;7eac	03 	. 
	and h			;7ead	a4 	. 
	and b			;7eae	a0 	. 
	cp h			;7eaf	bc 	. 
	cp h			;7eb0	bc 	. 
	sub b			;7eb1	90 	. 
	inc bc			;7eb2	03 	. 
	push de			;7eb3	d5 	. 
	adc a,e			;7eb4	8b 	. 
	xor a			;7eb5	af 	. 
	sbc a,a			;7eb6	9f 	. 
	adc a,h			;7eb7	8c 	. 
	ld a,(bc)			;7eb8	0a 	. 
	ld (bc),a			;7eb9	02 	. 
	add a,e			;7eba	83 	. 
	inc bc			;7ebb	03 	. 
	ret po			;7ebc	e0 	. 
	add a,d			;7ebd	82 	. 
	adc a,c			;7ebe	89 	. 
	adc a,h			;7ebf	8c 	. 
	adc a,h			;7ec0	8c 	. 
	adc a,(hl)			;7ec1	8e 	. 
	cp a			;7ec2	bf 	. 
	adc a,a			;7ec3	8f 	. 
	add a,c			;7ec4	81 	. 
	inc b			;7ec5	04 	. 
	dec de			;7ec6	1b 	. 
	nop			;7ec7	00 	. 
	nop			;7ec8	00 	. 
	add hl,de			;7ec9	19 	. 
	or b			;7eca	b0 	. 
	or b			;7ecb	b0 	. 
	cp h			;7ecc	bc 	. 
	ld a,(bc)			;7ecd	0a 	. 
	rlca			;7ece	07 	. 
	or b			;7ecf	b0 	. 
	or b			;7ed0	b0 	. 
	nop			;7ed1	00 	. 
	ld d,a			;7ed2	57 	W 
	cp (hl)			;7ed3	be 	. 
	cp a			;7ed4	bf 	. 
	adc a,a			;7ed5	8f 	. 
	or e			;7ed6	b3 	. 
	cp a			;7ed7	bf 	. 
	ld a,(bc)			;7ed8	0a 	. 
	rlca			;7ed9	07 	. 
	or e			;7eda	b3 	. 
	adc a,a			;7edb	8f 	. 
	cp a			;7edc	bf 	. 
	cp l			;7edd	bd 	. 
	nop			;7ede	00 	. 
	sub l			;7edf	95 	. 
	and b			;7ee0	a0 	. 
	cp (hl)			;7ee1	be 	. 
	cp a			;7ee2	bf 	. 
	cp a			;7ee3	bf 	. 
	cp (hl)			;7ee4	be 	. 
	cp a			;7ee5	bf 	. 
	ld a,(bc)			;7ee6	0a 	. 
	add hl,bc			;7ee7	09 	. 
	cp l			;7ee8	bd 	. 
	cp a			;7ee9	bf 	. 
	cp a			;7eea	bf 	. 
	cp l			;7eeb	bd 	. 
l7eech:
	sub b			;7eec	90 	. 
	nop			;7eed	00 	. 
	push de			;7eee	d5 	. 
	xor d			;7eef	aa 	. 
	cp a			;7ef0	bf 	. 
	ld a,(bc)			;7ef1	0a 	. 
	ld de,00195h		;7ef2	11 95 01 	. . . 
	ld d,08bh		;7ef5	16 8b 	. . 
	cp a			;7ef7	bf 	. 
	adc a,a			;7ef8	8f 	. 
	cp a			;7ef9	bf 	. 
	sub a			;7efa	97 	. 
	ld bc,l821dh		;7efb	01 1d 82 	. . . 
	cp a			;7efe	bf 	. 
	cp a			;7eff	bf 	. 
	add a,c			;7f00	81 	. 
	ld bc,lab23h		;7f01	01 23 ab 	. # . 
	cp a			;7f04	bf 	. 
	adc a,a			;7f05	8f 	. 
	cp a			;7f06	bf 	. 
	add a,a			;7f07	87 	. 
	ld bc,lba57h		;7f08	01 57 ba 	. W . 
	cp (hl)			;7f0b	be 	. 
	or l			;7f0c	b5 	. 
	cp b			;7f0d	b8 	. 
	cp h			;7f0e	bc 	. 
	cp h			;7f0f	bc 	. 
	cp (hl)			;7f10	be 	. 
	sbc a,a			;7f11	9f 	. 
	xor a			;7f12	af 	. 
	cp l			;7f13	bd 	. 
	cp h			;7f14	bc 	. 
	cp h			;7f15	bc 	. 
	or h			;7f16	b4 	. 
	cp d			;7f17	ba 	. 
	cp l			;7f18	bd 	. 
	or l			;7f19	b5 	. 
	ld bc,laf97h		;7f1a	01 97 af 	. . . 
	cp a			;7f1d	bf 	. 
	ld a,(bc)			;7f1e	0a 	. 
	inc bc			;7f1f	03 	. 
	sbc a,a			;7f20	9f 	. 
	add a,e			;7f21	83 	. 
	cp d			;7f22	ba 	. 
	or l			;7f23	b5 	. 
	add a,e			;7f24	83 	. 
	xor a			;7f25	af 	. 
	cp a			;7f26	bf 	. 
	ld a,(bc)			;7f27	0a 	. 
	inc bc			;7f28	03 	. 
	sbc a,a			;7f29	9f 	. 
	ld bc,lbed8h		;7f2a	01 d8 be 	. . . 
	sbc a,a			;7f2d	9f 	. 
	cp a			;7f2e	bf 	. 
	xor a			;7f2f	af 	. 
	sbc a,a			;7f30	9f 	. 
	cp a			;7f31	bf 	. 
	sbc a,a			;7f32	9f 	. 
	cp a			;7f33	bf 	. 
	sbc a,a			;7f34	9f 	. 
	cp a			;7f35	bf 	. 
	sbc a,a			;7f36	9f 	. 
	sbc a,a			;7f37	9f 	. 
	cp a			;7f38	bf 	. 
	sub h			;7f39	94 	. 
	ld (bc),a			;7f3a	02 	. 
	jr l7eech		;7f3b	18 af 	. . 
	add a,c			;7f3d	81 	. 
	add a,e			;7f3e	83 	. 
	add a,d			;7f3f	82 	. 
	add a,c			;7f40	81 	. 
	add a,e			;7f41	83 	. 
	add a,c			;7f42	81 	. 
	add a,e			;7f43	83 	. 
	add a,c			;7f44	81 	. 
	add a,e			;7f45	83 	. 
	add a,c			;7f46	81 	. 
	add a,c			;7f47	81 	. 
	xor e			;7f48	ab 	. 
	add a,l			;7f49	85 	. 
	ld (bc),a			;7f4a	02 	. 
	ld e,b			;7f4b	58 	X 
	cp a			;7f4c	bf 	. 
	sub h			;7f4d	94 	. 
	cp h			;7f4e	bc 	. 
	xor b			;7f4f	a8 	. 
	sub h			;7f50	94 	. 
	cp h			;7f51	bc 	. 
	sub h			;7f52	94 	. 
	cp h			;7f53	bc 	. 
	sub h			;7f54	94 	. 
	cp h			;7f55	bc 	. 
	sub h			;7f56	94 	. 
	sub h			;7f57	94 	. 
	cp (hl)			;7f58	be 	. 
	sub l			;7f59	95 	. 
	ld (bc),a			;7f5a	02 	. 
	sbc a,b			;7f5b	98 	. 
	add a,d			;7f5c	82 	. 
	adc a,a			;7f5d	8f 	. 
	cp a			;7f5e	bf 	. 
	ld a,(bc)			;7f5f	0a 	. 
	ld (bc),a			;7f60	02 	. 
	or e			;7f61	b3 	. 
	cp a			;7f62	bf 	. 
	cp a			;7f63	bf 	. 
	or e			;7f64	b3 	. 
	cp a			;7f65	bf 	. 
	cp a			;7f66	bf 	. 
	sbc a,a			;7f67	9f 	. 
	add a,a			;7f68	87 	. 
	ld (bc),a			;7f69	02 	. 
	call c,sub_ae92h		;7f6a	dc 92 ae 	. . . 
	cp a			;7f6d	bf 	. 
	cp a			;7f6e	bf 	. 
	sbc a,l			;7f6f	9d 	. 
	and c			;7f70	a1 	. 
	inc bc			;7f71	03 	. 
	ex af,af'			;7f72	08 	. 
	and b			;7f73	a0 	. 
	or b			;7f74	b0 	. 
	ld a,(bc)			;7f75	0a 	. 
	ld (de),a			;7f76	12 	. 
	or e			;7f77	b3 	. 
	cp e			;7f78	bb 	. 
	cp a			;7f79	bf 	. 
	cp a			;7f7a	bf 	. 
	or a			;7f7b	b7 	. 
	or e			;7f7c	b3 	. 
	or b			;7f7d	b0 	. 
	ld a,(bc)			;7f7e	0a 	. 
	ld (de),a			;7f7f	12 	. 
	sub b			;7f80	90 	. 
	inc bc			;7f81	03 	. 
	ld b,(hl)			;7f82	46 	F 
	and b			;7f83	a0 	. 
	sbc a,b			;7f84	98 	. 
	xor (hl)			;7f85	ae 	. 
	sub a			;7f86	97 	. 
	adc a,e			;7f87	8b 	. 
	cp a			;7f88	bf 	. 
	or e			;7f89	b3 	. 
	ld a,(bc)			;7f8a	0a 	. 
	ld (bc),a			;7f8b	02 	. 
	cp e			;7f8c	bb 	. 
	cp a			;7f8d	bf 	. 
	sub a			;7f8e	97 	. 
	add a,e			;7f8f	83 	. 
	ld a,(bc)			;7f90	0a 	. 
	add hl,bc			;7f91	09 	. 
	adc a,e			;7f92	8b 	. 
	xor a			;7f93	af 	. 
	cp a			;7f94	bf 	. 
	ld a,(bc)			;7f95	0a 	. 
	ld (bc),a			;7f96	02 	. 
	adc a,a			;7f97	8f 	. 
	add a,e			;7f98	83 	. 
	ld a,(bc)			;7f99	0a 	. 
	add hl,bc			;7f9a	09 	. 
	xor e			;7f9b	ab 	. 
	cp a			;7f9c	bf 	. 
	or a			;7f9d	b7 	. 
	or e			;7f9e	b3 	. 
	ld a,(bc)			;7f9f	0a 	. 
	ld (bc),a			;7fa0	02 	. 
	cp a			;7fa1	bf 	. 
	adc a,a			;7fa2	8f 	. 
	xor e			;7fa3	ab 	. 
	sbc a,l			;7fa4	9d 	. 
	and h			;7fa5	a4 	. 
	inc bc			;7fa6	03 	. 
	add a,(hl)			;7fa7	86 	. 
	xor d			;7fa8	aa 	. 
	sub l			;7fa9	95 	. 
	xor d			;7faa	aa 	. 
	sub l			;7fab	95 	. 
	inc bc			;7fac	03 	. 
	adc a,(hl)			;7fad	8e 	. 
	and b			;7fae	a0 	. 
	cp d			;7faf	ba 	. 
	cp a			;7fb0	bf 	. 
	sbc a,a			;7fb1	9f 	. 
	adc a,a			;7fb2	8f 	. 
	ld a,(bc)			;7fb3	0a 	. 
	add hl,bc			;7fb4	09 	. 
	xor a			;7fb5	af 	. 
	cp a			;7fb6	bf 	. 
	ld a,(bc)			;7fb7	0a 	. 
	inc b			;7fb8	04 	. 
	adc a,a			;7fb9	8f 	. 
	ld a,(bc)			;7fba	0a 	. 
	ld a,(bc)			;7fbb	0a 	. 
	xor a			;7fbc	af 	. 
	or l			;7fbd	b5 	. 
	or b			;7fbe	b0 	. 
	inc bc			;7fbf	03 	. 
	or h			;7fc0	b4 	. 
	xor d			;7fc1	aa 	. 
	sub l			;7fc2	95 	. 
	xor d			;7fc3	aa 	. 
	inc bc			;7fc4	03 	. 
	add a,0aah		;7fc5	c6 aa 	. . 
	sub l			;7fc7	95 	. 
	xor d			;7fc8	aa 	. 
	sub l			;7fc9	95 	. 
	inc bc			;7fca	03 	. 
	adc a,0aah		;7fcb	ce aa 	. . 
	cp a			;7fcd	bf 	. 
	cp a			;7fce	bf 	. 
	or l			;7fcf	b5 	. 
	or b			;7fd0	b0 	. 
	ld a,(bc)			;7fd1	0a 	. 
	ld a,(bc)			;7fd2	0a 	. 
	cp d			;7fd3	ba 	. 
	cp a			;7fd4	bf 	. 
	ld a,(bc)			;7fd5	0a 	. 
	ld (bc),a			;7fd6	02 	. 
	or b			;7fd7	b0 	. 
	ld a,(bc)			;7fd8	0a 	. 
	dec bc			;7fd9	0b 	. 
	cp d			;7fda	ba 	. 
	cp a			;7fdb	bf 	. 
	cp a			;7fdc	bf 	. 
	inc bc			;7fdd	03 	. 
	call p,l95aah		;7fde	f4 aa 95 	. . . 
	xor d			;7fe1	aa 	. 
	inc b			;7fe2	04 	. 
	inc e			;7fe3	1c 	. 
	nop			;7fe4	00 	. 
	nop			;7fe5	00 	. 
	ld d,0b0h		;7fe6	16 b0 	. . 
	cp b			;7fe8	b8 	. 
	cp h			;7fe9	bc 	. 
	cp h			;7fea	bc 	. 
	cp a			;7feb	bf 	. 
	ld a,(bc)			;7fec	0a 	. 
	add hl,bc			;7fed	09 	. 
	cp h			;7fee	bc 	. 
	cp h			;7fef	bc 	. 
	or h			;7ff0	b4 	. 
	or b			;7ff1	b0 	. 
	nop			;7ff2	00 	. 
	ld d,h			;7ff3	54 	T 
	and b			;7ff4	a0 	. 
	cp (hl)			;7ff5	be 	. 
	cp a			;7ff6	bf 	. 
	sbc a,a			;7ff7	9f 	. 
	and a			;7ff8	a7 	. 
	or e			;7ff9	b3 	. 
	cp (hl)			;7ffa	be 	. 
	cp a			;7ffb	bf 	. 
	ld a,(bc)			;7ffc	0a 	. 
	rlca			;7ffd	07 	. 
	cp l			;7ffe	bd 	. 
	or e			;7fff	b3 	. 
l8000h:
	sbc a,e			;8000	9b 	. 
	xor a			;8001	af 	. 
	cp a			;8002	bf 	. 
	cp l			;8003	bd 	. 
	sub b			;8004	90 	. 
	nop			;8005	00 	. 
	sub e			;8006	93 	. 
	and b			;8007	a0 	. 
	cp a			;8008	bf 	. 
	ld a,(bc)			;8009	0a 	. 
	ld (bc),a			;800a	02 	. 
	cp c			;800b	b9 	. 
	cp a			;800c	bf 	. 
	ld a,(bc)			;800d	0a 	. 
	dec c			;800e	0d 	. 
	or (hl)			;800f	b6 	. 
	cp a			;8010	bf 	. 
	ld a,(bc)			;8011	0a 	. 
	ld (bc),a			;8012	02 	. 
	sub b			;8013	90 	. 
	nop			;8014	00 	. 
	out (0bfh),a		;8015	d3 bf 	. . 
	ld a,(bc)			;8017	0a 	. 
	rla			;8018	17 	. 
	ld bc,l8b13h		;8019	01 13 8b 	. . . 
	cp a			;801c	bf 	. 
	ld a,(bc)			;801d	0a 	. 
	ld (bc),a			;801e	02 	. 
	xor e			;801f	ab 	. 
	cp a			;8020	bf 	. 
	sbc a,a			;8021	9f 	. 
	add a,e			;8022	83 	. 
	ld a,(bc)			;8023	0a 	. 
	ld (bc),a			;8024	02 	. 
	xor a			;8025	af 	. 
	cp a			;8026	bf 	. 
	cp a			;8027	bf 	. 
	sbc a,a			;8028	9f 	. 
	add a,e			;8029	83 	. 
	ld a,(bc)			;802a	0a 	. 
	ld (bc),a			;802b	02 	. 
	xor a			;802c	af 	. 
	cp a			;802d	bf 	. 
	sub a			;802e	97 	. 
	cp a			;802f	bf 	. 
	ld a,(bc)			;8030	0a 	. 
	ld (bc),a			;8031	02 	. 
	add a,a			;8032	87 	. 
	ld bc,l8254h		;8033	01 54 82 	. T . 
l8036h:
	xor a			;8036	af 	. 
	and e			;8037	a3 	. 
	cp (hl)			;8038	be 	. 
	adc a,a			;8039	8f 	. 
	ld bc,lba5dh		;803a	01 5d ba 	. ] . 
	cp a			;803d	bf 	. 
l803eh:
	cp a			;803e	bf 	. 
	or l			;803f	b5 	. 
	ld bc,l8f65h		;8040	01 65 8f 	. e . 
	cp l			;8043	bd 	. 
	sub e			;8044	93 	. 
l8045h:
	sbc a,a			;8045	9f 	. 
	add a,c			;8046	81 	. 
l8047h:
	ld bc,la894h		;8047	01 94 a8 	. . . 
	cp a			;804a	bf 	. 
	ld a,(bc)			;804b	0a 	. 
	ld (bc),a			;804c	02 	. 
	cp h			;804d	bc 	. 
	cp (hl)			;804e	be 	. 
l804fh:
	cp a			;804f	bf 	. 
	ld a,(bc)			;8050	0a 	. 
	inc bc			;8051	03 	. 
	add a,a			;8052	87 	. 
	adc a,e			;8053	8b 	. 
l8054h:
	cp a			;8054	bf 	. 
l8055h:
	ld a,(bc)			;8055	0a 	. 
	inc bc			;8056	03 	. 
	cp l			;8057	bd 	. 
	cp h			;8058	bc 	. 
	cp a			;8059	bf 	. 
	ld a,(bc)			;805a	0a 	. 
	ld (bc),a			;805b	02 	. 
	sub h			;805c	94 	. 
	ld bc,l82d4h		;805d	01 d4 82 	. . . 
	xor a			;8060	af 	. 
	cp a			;8061	bf 	. 
	ld a,(bc)			;8062	0a 	. 
	dec b			;8063	05 	. 
	add a,a			;8064	87 	. 
	add a,c			;8065	81 	. 
	cp d			;8066	ba 	. 
	or l			;8067	b5 	. 
	add a,d			;8068	82 	. 
	adc a,e			;8069	8b 	. 
	cp a			;806a	bf 	. 
	ld a,(bc)			;806b	0a 	. 
	dec b			;806c	05 	. 
	sbc a,a			;806d	9f 	. 
	add a,c			;806e	81 	. 
	ld (bc),a			;806f	02 	. 
	ld d,0b8h		;8070	16 b8 	. . 
	cp (hl)			;8072	be 	. 
	cp a			;8073	bf 	. 
l8074h:
	ld a,(bc)			;8074	0a 	. 
l8075h:
	dec c			;8075	0d 	. 
	cp l			;8076	bd 	. 
	sub b			;8077	90 	. 
	ld (bc),a			;8078	02 	. 
	ld d,(hl)			;8079	56 	V 
	xor a			;807a	af 	. 
	adc a,d			;807b	8a 	. 
l807ch:
	adc a,d			;807c	8a 	. 
l807dh:
	add a,l			;807d	85 	. 
	adc a,a			;807e	8f 	. 
	adc a,a			;807f	8f 	. 
l8080h:
	adc a,d			;8080	8a 	. 
	adc a,a			;8081	8f 	. 
	add a,l			;8082	85 	. 
	adc a,a			;8083	8f 	. 
	adc a,a			;8084	8f 	. 
	adc a,d			;8085	8a 	. 
	adc a,a			;8086	8f 	. 
	add a,l			;8087	85 	. 
	adc a,a			;8088	8f 	. 
	adc a,d			;8089	8a 	. 
	xor d			;808a	aa 	. 
	add a,l			;808b	85 	. 
	ld (bc),a			;808c	02 	. 
	sub (hl)			;808d	96 	. 
	and d			;808e	a2 	. 
	add a,l			;808f	85 	. 
	ld (bc),a			;8090	02 	. 
	and (hl)			;8091	a6 	. 
	and a			;8092	a7 	. 
	ld (bc),a			;8093	02 	. 
	sub 0afh		;8094	d6 af 	. . 
	sbc a,(hl)			;8096	9e 	. 
	cp d			;8097	ba 	. 
	or l			;8098	b5 	. 
	cp a			;8099	bf 	. 
	cp a			;809a	bf 	. 
	cp d			;809b	ba 	. 
	cp a			;809c	bf 	. 
	or l			;809d	b5 	. 
	cp a			;809e	bf 	. 
	cp a			;809f	bf 	. 
	cp d			;80a0	ba 	. 
	cp a			;80a1	bf 	. 
	or l			;80a2	b5 	. 
	cp a			;80a3	bf 	. 
	sbc a,d			;80a4	9a 	. 
	cp (hl)			;80a5	be 	. 
	add a,l			;80a6	85 	. 
	inc bc			;80a7	03 	. 
	rla			;80a8	17 	. 
	adc a,e			;80a9	8b 	. 
	xor (hl)			;80aa	ae 	. 
	cp e			;80ab	bb 	. 
	cp a			;80ac	bf 	. 
	ld a,(bc)			;80ad	0a 	. 
	ld (bc),a			;80ae	02 	. 
	cp e			;80af	bb 	. 
	cp a			;80b0	bf 	. 
	cp a			;80b1	bf 	. 
	cp e			;80b2	bb 	. 
	cp a			;80b3	bf 	. 
	ld a,(bc)			;80b4	0a 	. 
	ld (bc),a			;80b5	02 	. 
	cp e			;80b6	bb 	. 
	adc a,(hl)			;80b7	8e 	. 
	add a,c			;80b8	81 	. 
	inc bc			;80b9	03 	. 
	ld e,h			;80ba	5c 	\ 
	adc a,b			;80bb	88 	. 
	adc a,a			;80bc	8f 	. 
	ld a,(bc)			;80bd	0a 	. 
	inc bc			;80be	03 	. 
	add a,h			;80bf	84 	. 
	inc bc			;80c0	03 	. 
	sbc a,e			;80c1	9b 	. 
	add a,d			;80c2	82 	. 
	adc a,h			;80c3	8c 	. 
	adc a,a			;80c4	8f 	. 
	ld a,(bc)			;80c5	0a 	. 
	inc bc			;80c6	03 	. 
	adc a,h			;80c7	8c 	. 
	add a,c			;80c8	81 	. 
	inc bc			;80c9	03 	. 
	jp c,lb9b0h		;80ca	da b0 b9 	. . . 
	cp (hl)			;80cd	be 	. 
	cp a			;80ce	bf 	. 
	ld a,(bc)			;80cf	0a 	. 
	inc bc			;80d0	03 	. 
	cp l			;80d1	bd 	. 
	or (hl)			;80d2	b6 	. 
	or b			;80d3	b0 	. 
	inc b			;80d4	04 	. 
	dec e			;80d5	1d 	. 
	nop			;80d6	00 	. 
	nop			;80d7	00 	. 
	dec d			;80d8	15 	. 
	and b			;80d9	a0 	. 
	or b			;80da	b0 	. 
	ld a,(bc)			;80db	0a 	. 
	ld (bc),a			;80dc	02 	. 
	cp h			;80dd	bc 	. 
	ld a,(bc)			;80de	0a 	. 
	dec bc			;80df	0b 	. 
	or h			;80e0	b4 	. 
	or b			;80e1	b0 	. 
	ld a,(bc)			;80e2	0a 	. 
	ld (bc),a			;80e3	02 	. 
	nop			;80e4	00 	. 
	ld d,e			;80e5	53 	S 
	cp b			;80e6	b8 	. 
	cp (hl)			;80e7	be 	. 
	cp a			;80e8	bf 	. 
	ld a,(bc)			;80e9	0a 	. 
	inc bc			;80ea	03 	. 
	xor a			;80eb	af 	. 
	cp a			;80ec	bf 	. 
	ld a,(bc)			;80ed	0a 	. 
	ld a,(bc)			;80ee	0a 	. 
	xor a			;80ef	af 	. 
	cp a			;80f0	bf 	. 
	ld a,(bc)			;80f1	0a 	. 
	inc bc			;80f2	03 	. 
	cp h			;80f3	bc 	. 
	sub b			;80f4	90 	. 
	nop			;80f5	00 	. 
	sub c			;80f6	91 	. 
	cp b			;80f7	b8 	. 
	cp a			;80f8	bf 	. 
	ld a,(bc)			;80f9	0a 	. 
	ld (bc),a			;80fa	02 	. 
	sub a			;80fb	97 	. 
	and e			;80fc	a3 	. 
	cp h			;80fd	bc 	. 
	cp h			;80fe	bc 	. 
	cp a			;80ff	bf 	. 
	ld a,(bc)			;8100	0a 	. 
	dec bc			;8101	0b 	. 
	cp l			;8102	bd 	. 
	cp h			;8103	bc 	. 
l8104h:
	or (hl)			;8104	b6 	. 
	add a,e			;8105	83 	. 
	cp a			;8106	bf 	. 
	ld a,(bc)			;8107	0a 	. 
	ld (bc),a			;8108	02 	. 
	cp l			;8109	bd 	. 
	sub b			;810a	90 	. 
	nop			;810b	00 	. 
	ret nc			;810c	d0 	. 
l810dh:
	cp b			;810d	b8 	. 
	cp a			;810e	bf 	. 
	or a			;810f	b7 	. 
	cp (hl)			;8110	be 	. 
	cp a			;8111	bf 	. 
	cp d			;8112	ba 	. 
	cp a			;8113	bf 	. 
	ld a,(bc)			;8114	0a 	. 
	ld (de),a			;8115	12 	. 
	cp d			;8116	ba 	. 
	cp a			;8117	bf 	. 
	or (hl)			;8118	b6 	. 
	cp a			;8119	bf 	. 
	cp l			;811a	bd 	. 
	sub b			;811b	90 	. 
	ld bc,lbf10h		;811c	01 10 bf 	. . . 
	cp c			;811f	b9 	. 
	cp a			;8120	bf 	. 
	ld a,(bc)			;8121	0a 	. 
	add hl,de			;8122	19 	. 
	cp l			;8123	bd 	. 
	cp e			;8124	bb 	. 
	sub l			;8125	95 	. 
	ld bc,l8b50h		;8126	01 50 8b 	. P . 
	cp l			;8129	bd 	. 
	cp e			;812a	bb 	. 
	cp a			;812b	bf 	. 
	cp a			;812c	bf 	. 
	xor e			;812d	ab 	. 
	cp a			;812e	bf 	. 
	cp a			;812f	bf 	. 
	sbc a,a			;8130	9f 	. 
	add a,e			;8131	83 	. 
	ld a,(bc)			;8132	0a 	. 
	ld (bc),a			;8133	02 	. 
	adc a,e			;8134	8b 	. 
	cp a			;8135	bf 	. 
	ld a,(bc)			;8136	0a 	. 
	inc bc			;8137	03 	. 
	sbc a,a			;8138	9f 	. 
	add a,e			;8139	83 	. 
	ld a,(bc)			;813a	0a 	. 
	ld (bc),a			;813b	02 	. 
	adc a,e			;813c	8b 	. 
	cp a			;813d	bf 	. 
	ld a,(bc)			;813e	0a 	. 
	ld (bc),a			;813f	02 	. 
	xor e			;8140	ab 	. 
	cp a			;8141	bf 	. 
	cp a			;8142	bf 	. 
	cp c			;8143	b9 	. 
	sbc a,a			;8144	9f 	. 
	add a,c			;8145	81 	. 
	ld bc,l8291h		;8146	01 91 82 	. . . 
	xor a			;8149	af 	. 
	cp a			;814a	bf 	. 
	add a,a			;814b	87 	. 
	cp d			;814c	ba 	. 
l814dh:
	cp a			;814d	bf 	. 
	adc a,a			;814e	8f 	. 
	ld bc,laa9dh		;814f	01 9d aa 	. . . 
	cp a			;8152	bf 	. 
	ld a,(bc)			;8153	0a 	. 
	ld (bc),a			;8154	02 	. 
	ld bc,l8aa6h		;8155	01 a6 8a 	. . . 
	xor a			;8158	af 	. 
	cp a			;8159	bf 	. 
	sub d			;815a	92 	. 
	xor a			;815b	af 	. 
	cp a			;815c	bf 	. 
	add a,a			;815d	87 	. 
	ld bc,la0d2h		;815e	01 d2 a0 	. . . 
	cp a			;8161	bf 	. 
l8162h:
	cp (hl)			;8162	be 	. 
	cp a			;8163	bf 	. 
	add a,c			;8164	81 	. 
	ld bc,la0d8h		;8165	01 d8 a0 	. . . 
	cp b			;8168	b8 	. 
	cp h			;8169	bc 	. 
	cp h			;816a	bc 	. 
	cp (hl)			;816b	be 	. 
	cp a			;816c	bf 	. 
	ld a,(bc)			;816d	0a 	. 
	inc b			;816e	04 	. 
	cp h			;816f	bc 	. 
	ld a,(bc)			;8170	0a 	. 
	ld (bc),a			;8171	02 	. 
	or b			;8172	b0 	. 
	ld bc,labe8h		;8173	01 e8 ab 	. . . 
	cp a			;8176	bf 	. 
	cp (hl)			;8177	be 	. 
	or l			;8178	b5 	. 
	ld (bc),a			;8179	02 	. 
	ld (de),a			;817a	12 	. 
	xor a			;817b	af 	. 
	cp a			;817c	bf 	. 
	ld a,(bc)			;817d	0a 	. 
	add hl,bc			;817e	09 	. 
	sbc a,a			;817f	9f 	. 
	and c			;8180	a1 	. 
	or b			;8181	b0 	. 
	adc a,e			;8182	8b 	. 
	cp a			;8183	bf 	. 
	ld a,(bc)			;8184	0a 	. 
	ld a,(bc)			;8185	0a 	. 
	add a,l			;8186	85 	. 
	ld (bc),a			;8187	02 	. 
	ld d,e			;8188	53 	S 
	add a,e			;8189	83 	. 
	adc a,a			;818a	8f 	. 
	cp a			;818b	bf 	. 
	ld a,(bc)			;818c	0a 	. 
	dec b			;818d	05 	. 
	or a			;818e	b7 	. 
	or b			;818f	b0 	. 
	or b			;8190	b0 	. 
	cp (hl)			;8191	be 	. 
	cp a			;8192	bf 	. 
	or h			;8193	b4 	. 
	or b			;8194	b0 	. 
	or d			;8195	b2 	. 
	cp a			;8196	bf 	. 
	ld a,(bc)			;8197	0a 	. 
	dec b			;8198	05 	. 
	sbc a,a			;8199	9f 	. 
	add a,a			;819a	87 	. 
	add a,c			;819b	81 	. 
	ld (bc),a			;819c	02 	. 
	sub h			;819d	94 	. 
	cp b			;819e	b8 	. 
	cp (hl)			;819f	be 	. 
l81a0h:
	cp a			;81a0	bf 	. 
	ld a,(bc)			;81a1	0a 	. 
	ld (de),a			;81a2	12 	. 
	cp h			;81a3	bc 	. 
	sub b			;81a4	90 	. 
	ld (bc),a			;81a5	02 	. 
	call nc,sub_8aafh		;81a6	d4 af 8a 	. . . 
	add a,l			;81a9	85 	. 
	adc a,a			;81aa	8f 	. 
l81abh:
	add a,l			;81ab	85 	. 
	adc a,a			;81ac	8f 	. 
	adc a,a			;81ad	8f 	. 
	add a,l			;81ae	85 	. 
	adc a,a			;81af	8f 	. 
	ld a,(bc)			;81b0	0a 	. 
	ld (bc),a			;81b1	02 	. 
	adc a,d			;81b2	8a 	. 
	adc a,a			;81b3	8f 	. 
	adc a,a			;81b4	8f 	. 
	add a,l			;81b5	85 	. 
	adc a,a			;81b6	8f 	. 
	adc a,a			;81b7	8f 	. 
	add a,l			;81b8	85 	. 
	adc a,a			;81b9	8f 	. 
	add a,l			;81ba	85 	. 
	adc a,a			;81bb	8f 	. 
	xor d			;81bc	aa 	. 
	add a,l			;81bd	85 	. 
	inc bc			;81be	03 	. 
	inc d			;81bf	14 	. 
	and d			;81c0	a2 	. 
	sbc a,l			;81c1	9d 	. 
	inc bc			;81c2	03 	. 
	jr z,l814dh		;81c3	28 88 	( . 
	or a			;81c5	b7 	. 
	inc bc			;81c6	03 	. 
	ld d,h			;81c7	54 	T 
	cp (hl)			;81c8	be 	. 
	cp b			;81c9	b8 	. 
	sub h			;81ca	94 	. 
	cp h			;81cb	bc 	. 
	sub h			;81cc	94 	. 
	cp h			;81cd	bc 	. 
	cp h			;81ce	bc 	. 
	sub h			;81cf	94 	. 
	cp h			;81d0	bc 	. 
	ld a,(bc)			;81d1	0a 	. 
	ld (bc),a			;81d2	02 	. 
	xor b			;81d3	a8 	. 
	cp h			;81d4	bc 	. 
	cp h			;81d5	bc 	. 
	sub h			;81d6	94 	. 
	cp h			;81d7	bc 	. 
l81d8h:
	cp h			;81d8	bc 	. 
	sub h			;81d9	94 	. 
l81dah:
	cp h			;81da	bc 	. 
	sub h			;81db	94 	. 
l81dch:
	cp h			;81dc	bc 	. 
	cp d			;81dd	ba 	. 
	sub h			;81de	94 	. 
	inc bc			;81df	03 	. 
	sub h			;81e0	94 	. 
	adc a,d			;81e1	8a 	. 
	cp l			;81e2	bd 	. 
	sbc a,a			;81e3	9f 	. 
	cp a			;81e4	bf 	. 
	ld a,(bc)			;81e5	0a 	. 
	ld b,0afh		;81e6	06 af 	. . 
	cp a			;81e8	bf 	. 
	xor a			;81e9	af 	. 
	cp a			;81ea	bf 	. 
	ld a,(bc)			;81eb	0a 	. 
	dec b			;81ec	05 	. 
	sbc a,a			;81ed	9f 	. 
	cp l			;81ee	bd 	. 
	sbc a,a			;81ef	9f 	. 
	inc bc			;81f0	03 	. 
	push de			;81f1	d5 	. 
	add a,d			;81f2	82 	. 
	add a,e			;81f3	83 	. 
	adc a,l			;81f4	8d 	. 
	adc a,(hl)			;81f5	8e 	. 
	adc a,a			;81f6	8f 	. 
	ld a,(bc)			;81f7	0a 	. 
	ld (bc),a			;81f8	02 	. 
	adc a,(hl)			;81f9	8e 	. 
	adc a,a			;81fa	8f 	. 
	ld a,(bc)			;81fb	0a 	. 
	inc b			;81fc	04 	. 
	adc a,(hl)			;81fd	8e 	. 
l81feh:
	adc a,a			;81fe	8f 	. 
	ld a,(bc)			;81ff	0a 	. 
	ld (bc),a			;8200	02 	. 
	adc a,h			;8201	8c 	. 
	add a,a			;8202	87 	. 
	add a,e			;8203	83 	. 
	inc b			;8204	04 	. 
	ld e,000h		;8205	1e 00 	. . 
	nop			;8207	00 	. 
	dec d			;8208	15 	. 
	and b			;8209	a0 	. 
	or b			;820a	b0 	. 
	ld a,(bc)			;820b	0a 	. 
	ld (bc),a			;820c	02 	. 
	cp h			;820d	bc 	. 
	ld a,(bc)			;820e	0a 	. 
	dec bc			;820f	0b 	. 
	or h			;8210	b4 	. 
	or b			;8211	b0 	. 
	ld a,(bc)			;8212	0a 	. 
	ld (bc),a			;8213	02 	. 
	nop			;8214	00 	. 
	ld d,e			;8215	53 	S 
	cp b			;8216	b8 	. 
	cp (hl)			;8217	be 	. 
	cp a			;8218	bf 	. 
	ld a,(bc)			;8219	0a 	. 
l821ah:
	inc bc			;821a	03 	. 
	xor a			;821b	af 	. 
	cp a			;821c	bf 	. 
l821dh:
	ld a,(bc)			;821d	0a 	. 
	ld a,(bc)			;821e	0a 	. 
	xor a			;821f	af 	. 
	cp a			;8220	bf 	. 
	ld a,(bc)			;8221	0a 	. 
	inc bc			;8222	03 	. 
	cp h			;8223	bc 	. 
	sub b			;8224	90 	. 
	nop			;8225	00 	. 
	sub c			;8226	91 	. 
	cp b			;8227	b8 	. 
	cp a			;8228	bf 	. 
	ld a,(bc)			;8229	0a 	. 
	ld (bc),a			;822a	02 	. 
	sub a			;822b	97 	. 
	and e			;822c	a3 	. 
	cp h			;822d	bc 	. 
	cp h			;822e	bc 	. 
	cp a			;822f	bf 	. 
	ld a,(bc)			;8230	0a 	. 
	dec bc			;8231	0b 	. 
	cp l			;8232	bd 	. 
	cp h			;8233	bc 	. 
	or (hl)			;8234	b6 	. 
	add a,e			;8235	83 	. 
	cp a			;8236	bf 	. 
	ld a,(bc)			;8237	0a 	. 
	ld (bc),a			;8238	02 	. 
	cp l			;8239	bd 	. 
	sub b			;823a	90 	. 
	nop			;823b	00 	. 
	ret nc			;823c	d0 	. 
	cp b			;823d	b8 	. 
	cp a			;823e	bf 	. 
	or a			;823f	b7 	. 
	cp (hl)			;8240	be 	. 
	cp a			;8241	bf 	. 
	cp d			;8242	ba 	. 
	cp a			;8243	bf 	. 
	ld a,(bc)			;8244	0a 	. 
	ld (de),a			;8245	12 	. 
	cp d			;8246	ba 	. 
	cp a			;8247	bf 	. 
	or (hl)			;8248	b6 	. 
	cp a			;8249	bf 	. 
	cp l			;824a	bd 	. 
	sub b			;824b	90 	. 
	ld bc,lbf10h		;824c	01 10 bf 	. . . 
	cp c			;824f	b9 	. 
l8250h:
	cp a			;8250	bf 	. 
	ld a,(bc)			;8251	0a 	. 
	add hl,de			;8252	19 	. 
	cp l			;8253	bd 	. 
l8254h:
	cp e			;8254	bb 	. 
	sub l			;8255	95 	. 
	ld bc,l8b50h		;8256	01 50 8b 	. P . 
	cp l			;8259	bd 	. 
	cp e			;825a	bb 	. 
	cp a			;825b	bf 	. 
	cp a			;825c	bf 	. 
l825dh:
	xor e			;825d	ab 	. 
	cp a			;825e	bf 	. 
l825fh:
	cp a			;825f	bf 	. 
	sbc a,a			;8260	9f 	. 
	add a,e			;8261	83 	. 
	ld a,(bc)			;8262	0a 	. 
l8263h:
	ld (bc),a			;8263	02 	. 
l8264h:
	adc a,e			;8264	8b 	. 
	cp a			;8265	bf 	. 
	ld a,(bc)			;8266	0a 	. 
	inc bc			;8267	03 	. 
	sbc a,a			;8268	9f 	. 
	add a,e			;8269	83 	. 
l826ah:
	ld a,(bc)			;826a	0a 	. 
	ld (bc),a			;826b	02 	. 
	adc a,e			;826c	8b 	. 
	cp a			;826d	bf 	. 
	ld a,(bc)			;826e	0a 	. 
	ld (bc),a			;826f	02 	. 
l8270h:
	xor e			;8270	ab 	. 
	cp a			;8271	bf 	. 
l8272h:
	cp a			;8272	bf 	. 
l8273h:
	cp c			;8273	b9 	. 
	sbc a,a			;8274	9f 	. 
	add a,c			;8275	81 	. 
	ld bc,l8291h		;8276	01 91 82 	. . . 
	xor a			;8279	af 	. 
	cp a			;827a	bf 	. 
	add a,a			;827b	87 	. 
l827ch:
	cp d			;827c	ba 	. 
	cp a			;827d	bf 	. 
	adc a,a			;827e	8f 	. 
	ld bc,laa9dh		;827f	01 9d aa 	. . . 
	cp a			;8282	bf 	. 
	ld a,(bc)			;8283	0a 	. 
	ld (bc),a			;8284	02 	. 
	ld bc,l8aa6h		;8285	01 a6 8a 	. . . 
	xor a			;8288	af 	. 
	cp a			;8289	bf 	. 
	sub d			;828a	92 	. 
	xor a			;828b	af 	. 
	cp a			;828c	bf 	. 
	add a,a			;828d	87 	. 
	ld bc,la0d2h		;828e	01 d2 a0 	. . . 
l8291h:
	cp a			;8291	bf 	. 
	cp (hl)			;8292	be 	. 
	cp a			;8293	bf 	. 
	add a,c			;8294	81 	. 
l8295h:
	ld bc,la0d8h		;8295	01 d8 a0 	. . . 
	cp b			;8298	b8 	. 
	cp h			;8299	bc 	. 
l829ah:
	cp h			;829a	bc 	. 
	cp (hl)			;829b	be 	. 
	cp a			;829c	bf 	. 
	ld a,(bc)			;829d	0a 	. 
	inc b			;829e	04 	. 
	cp h			;829f	bc 	. 
	ld a,(bc)			;82a0	0a 	. 
	ld (bc),a			;82a1	02 	. 
	or b			;82a2	b0 	. 
	ld bc,labe8h		;82a3	01 e8 ab 	. . . 
	cp a			;82a6	bf 	. 
	cp (hl)			;82a7	be 	. 
	or l			;82a8	b5 	. 
	ld (bc),a			;82a9	02 	. 
	ld (de),a			;82aa	12 	. 
	xor a			;82ab	af 	. 
	cp a			;82ac	bf 	. 
	ld a,(bc)			;82ad	0a 	. 
	add hl,bc			;82ae	09 	. 
	sbc a,a			;82af	9f 	. 
l82b0h:
	and c			;82b0	a1 	. 
	or b			;82b1	b0 	. 
	adc a,e			;82b2	8b 	. 
	cp a			;82b3	bf 	. 
	ld a,(bc)			;82b4	0a 	. 
	ld a,(bc)			;82b5	0a 	. 
	add a,l			;82b6	85 	. 
	ld (bc),a			;82b7	02 	. 
	ld d,e			;82b8	53 	S 
	add a,e			;82b9	83 	. 
	adc a,a			;82ba	8f 	. 
	cp a			;82bb	bf 	. 
	ld a,(bc)			;82bc	0a 	. 
	dec b			;82bd	05 	. 
	or a			;82be	b7 	. 
	or b			;82bf	b0 	. 
	or b			;82c0	b0 	. 
	cp (hl)			;82c1	be 	. 
	cp a			;82c2	bf 	. 
	or h			;82c3	b4 	. 
	or b			;82c4	b0 	. 
	or d			;82c5	b2 	. 
	cp a			;82c6	bf 	. 
	ld a,(bc)			;82c7	0a 	. 
	dec b			;82c8	05 	. 
	sbc a,a			;82c9	9f 	. 
	add a,a			;82ca	87 	. 
	add a,c			;82cb	81 	. 
	ld (bc),a			;82cc	02 	. 
	sub h			;82cd	94 	. 
	cp b			;82ce	b8 	. 
	cp (hl)			;82cf	be 	. 
l82d0h:
	cp a			;82d0	bf 	. 
	ld a,(bc)			;82d1	0a 	. 
	ld (de),a			;82d2	12 	. 
l82d3h:
	cp h			;82d3	bc 	. 
l82d4h:
	sub b			;82d4	90 	. 
	ld (bc),a			;82d5	02 	. 
	call nc,sub_8aafh		;82d6	d4 af 8a 	. . . 
	add a,l			;82d9	85 	. 
	adc a,a			;82da	8f 	. 
	add a,l			;82db	85 	. 
l82dch:
	adc a,a			;82dc	8f 	. 
	adc a,a			;82dd	8f 	. 
l82deh:
	add a,l			;82de	85 	. 
	adc a,a			;82df	8f 	. 
	ld a,(bc)			;82e0	0a 	. 
	ld (bc),a			;82e1	02 	. 
	adc a,d			;82e2	8a 	. 
	adc a,a			;82e3	8f 	. 
	adc a,a			;82e4	8f 	. 
	add a,l			;82e5	85 	. 
	adc a,a			;82e6	8f 	. 
	adc a,a			;82e7	8f 	. 
l82e8h:
	add a,l			;82e8	85 	. 
	adc a,a			;82e9	8f 	. 
	add a,l			;82ea	85 	. 
l82ebh:
	adc a,a			;82eb	8f 	. 
	xor d			;82ec	aa 	. 
	add a,l			;82ed	85 	. 
	inc bc			;82ee	03 	. 
	dec d			;82ef	15 	. 
l82f0h:
	sbc a,c			;82f0	99 	. 
	inc bc			;82f1	03 	. 
	jr z,l827ch		;82f2	28 88 	( . 
	sub c			;82f4	91 	. 
	inc bc			;82f5	03 	. 
	ld d,h			;82f6	54 	T 
	cp (hl)			;82f7	be 	. 
	cp b			;82f8	b8 	. 
	sub h			;82f9	94 	. 
	or b			;82fa	b0 	. 
	sub b			;82fb	90 	. 
	inc bc			;82fc	03 	. 
	ld h,(hl)			;82fd	66 	f 
	or b			;82fe	b0 	. 
	sub b			;82ff	90 	. 
	cp h			;8300	bc 	. 
	cp d			;8301	ba 	. 
	sub h			;8302	94 	. 
	inc bc			;8303	03 	. 
	sub h			;8304	94 	. 
	xor e			;8305	ab 	. 
	or a			;8306	b7 	. 
	cp a			;8307	bf 	. 
	cp a			;8308	bf 	. 
	cp l			;8309	bd 	. 
	cp a			;830a	bf 	. 
	cp a			;830b	bf 	. 
	or l			;830c	b5 	. 
	cp h			;830d	bc 	. 
	ld a,(bc)			;830e	0a 	. 
	ld (bc),a			;830f	02 	. 
	xor b			;8310	a8 	. 
	cp h			;8311	bc 	. 
	cp h			;8312	bc 	. 
	or h			;8313	b4 	. 
	cp a			;8314	bf 	. 
	cp a			;8315	bf 	. 
	cp l			;8316	bd 	. 
	cp a			;8317	bf 	. 
	cp a			;8318	bf 	. 
	or a			;8319	b7 	. 
	cp a			;831a	bf 	. 
	add a,c			;831b	81 	. 
	inc bc			;831c	03 	. 
	push de			;831d	d5 	. 
	adc a,e			;831e	8b 	. 
	adc a,l			;831f	8d 	. 
	add a,a			;8320	87 	. 
l8321h:
	adc a,a			;8321	8f 	. 
	ld a,(bc)			;8322	0a 	. 
	dec c			;8323	0d 	. 
	add a,a			;8324	87 	. 
	adc a,l			;8325	8d 	. 
	adc a,a			;8326	8f 	. 
	add a,c			;8327	81 	. 
	inc b			;8328	04 	. 
	dec (hl)			;8329	35 	5 
	nop			;832a	00 	. 
	inc bc			;832b	03 	. 
	dec d			;832c	15 	. 
	sbc a,c			;832d	99 	. 
	xor b			;832e	a8 	. 
	and e			;832f	a3 	. 
	xor b			;8330	a8 	. 
	cp c			;8331	b9 	. 
	xor d			;8332	aa 	. 
	and h			;8333	a4 	. 
	xor (hl)			;8334	ae 	. 
	xor d			;8335	aa 	. 
	sub c			;8336	91 	. 
	inc bc			;8337	03 	. 
	jr nz,l82d0h		;8338	20 96 	  . 
	xor c			;833a	a9 	. 
	xor d			;833b	aa 	. 
	ld a,(bc)			;833c	0a 	. 
	ld (bc),a			;833d	02 	. 
	sub c			;833e	91 	. 
	or a			;833f	b7 	. 
	add a,l			;8340	85 	. 
l8341h:
	adc a,b			;8341	88 	. 
	sub c			;8342	91 	. 
	inc bc			;8343	03 	. 
	ld d,h			;8344	54 	T 
	cp (hl)			;8345	be 	. 
	cp b			;8346	b8 	. 
	sub h			;8347	94 	. 
	or e			;8348	b3 	. 
	sub d			;8349	92 	. 
	adc a,d			;834a	8a 	. 
	adc a,d			;834b	8a 	. 
	inc bc			;834c	03 	. 
	ld e,h			;834d	5c 	\ 
	xor d			;834e	aa 	. 
	xor d			;834f	aa 	. 
	sub b			;8350	90 	. 
	inc bc			;8351	03 	. 
	ld h,b			;8352	60 	` 
l8353h:
	and l			;8353	a5 	. 
	sbc a,d			;8354	9a 	. 
	add a,d			;8355	82 	. 
	add a,(hl)			;8356	86 	. 
	adc a,d			;8357	8a 	. 
	add a,h			;8358	84 	. 
	or c			;8359	b1 	. 
	sub c			;835a	91 	. 
	cp h			;835b	bc 	. 
	cp d			;835c	ba 	. 
	sub h			;835d	94 	. 
	inc b			;835e	04 	. 
	scf			;835f	37 	7 
	nop			;8360	00 	. 
	ld bc,la047h		;8361	01 47 a0 	. G . 
	adc a,h			;8364	8c 	. 
	and h			;8365	a4 	. 
	ld bc,l9c4bh		;8366	01 4b 9c 	. K . 
	adc a,h			;8369	8c 	. 
	sub b			;836a	90 	. 
	ld bc,l9c4fh		;836b	01 4f 9c 	. O . 
	adc a,h			;836e	8c 	. 
	add a,h			;836f	84 	. 
	ld bc,l9853h		;8370	01 53 98 	. S . 
	and h			;8373	a4 	. 
	ld bc,l8856h		;8374	01 56 88 	. V . 
	xor h			;8377	ac 	. 
	adc a,h			;8378	8c 	. 
	ld bc,0985eh		;8379	01 5e 98 	. ^ . 
	and h			;837c	a4 	. 
	ld bc,l9862h		;837d	01 62 98 	. b . 
	and h			;8380	a4 	. 
	ld bc,la065h		;8381	01 65 a0 	. e . 
	adc a,h			;8384	8c 	. 
	sub b			;8385	90 	. 
	ld bc,l9c69h		;8386	01 69 9c 	. i . 
	adc a,h			;8389	8c 	. 
	sub b			;838a	90 	. 
	ld bc,l9c6dh		;838b	01 6d 9c 	. m . 
	adc a,h			;838e	8c 	. 
	add a,h			;838f	84 	. 
	ld bc,la871h		;8390	01 71 a8 	. q . 
	ld bc,l9473h		;8393	01 73 94 	. s . 
	xor b			;8396	a8 	. 
	ld bc,l9587h		;8397	01 87 95 	. . . 
	ld bc,l958bh		;839a	01 8b 95 	. . . 
l839dh:
	ld bc,laa8ch+1		;839d	01 8d aa 	. . . 
	ld bc,l958fh		;83a0	01 8f 95 	. . . 
	ld bc,laa92h		;83a3	01 92 aa 	. . . 
	ld bc,l9595h		;83a6	01 95 95 	. . . 
	ld bc,laa96h+1		;83a9	01 97 aa 	. . . 
	ld bc,08a9dh		;83ac	01 9d 8a 	. . . 
	sub b			;83af	90 	. 
	ld bc,l81a0h		;83b0	01 a0 81 	. . . 
	xor d			;83b3	aa 	. 
	ld bc,l95a5h		;83b4	01 a5 95 	. . . 
	ld bc,laaa7h		;83b7	01 a7 aa 	. . . 
	ld bc,l95a9h		;83ba	01 a9 95 	. . . 
	ld bc,laaabh		;83bd	01 ab aa 	. . . 
	ld bc,l95adh		;83c0	01 ad 95 	. . . 
	ld bc,0aab1h		;83c3	01 b1 aa 	. . . 
	ld bc,l95b3h		;83c6	01 b3 95 	. . . 
	xor d			;83c9	aa 	. 
	ld bc,l95c7h		;83ca	01 c7 95 	. . . 
	adc a,b			;83cd	88 	. 
	xor h			;83ce	ac 	. 
l83cfh:
	ld bc,09dcbh		;83cf	01 cb 9d 	. . . 
	adc a,h			;83d2	8c 	. 
l83d3h:
	sub c			;83d3	91 	. 
	ld bc,l9dcfh		;83d4	01 cf 9d 	. . . 
	adc a,h			;83d7	8c 	. 
	ld bc,laad2h		;83d8	01 d2 aa 	. . . 
	adc a,h			;83db	8c 	. 
l83dch:
	adc a,h			;83dc	8c 	. 
	sub l			;83dd	95 	. 
	ld bc,laad7h		;83de	01 d7 aa 	. . . 
l83e1h:
	ld bc,l82deh		;83e1	01 de 82 	. . . 
	adc a,h			;83e4	8c 	. 
l83e5h:
	sub b			;83e5	90 	. 
	xor d			;83e6	aa 	. 
	ld bc,l95e5h		;83e7	01 e5 95 	. . . 
	ld bc,laae7h		;83ea	01 e7 aa 	. . . 
	ld bc,l9de9h		;83ed	01 e9 9d 	. . . 
	adc a,h			;83f0	8c 	. 
l83f1h:
	sub c			;83f1	91 	. 
	ld bc,09dedh		;83f2	01 ed 9d 	. . . 
	adc a,h			;83f5	8c 	. 
	ld bc,laaf1h		;83f6	01 f1 aa 	. . . 
	ld bc,l95f3h		;83f9	01 f3 95 	. . . 
	xor d			;83fc	aa 	. 
	ld (bc),a			;83fd	02 	. 
	rlca			;83fe	07 	. 
	adc a,c			;83ff	89 	. 
	or b			;8400	b0 	. 
	sbc a,d			;8401	9a 	. 
	ld (bc),a			;8402	02 	. 
	dec bc			;8403	0b 	. 
	sub l			;8404	95 	. 
	ld (bc),a			;8405	02 	. 
l8406h:
	dec c			;8406	0d 	. 
	xor d			;8407	aa 	. 
	ld (bc),a			;8408	02 	. 
	rrca			;8409	0f 	. 
	or l			;840a	b5 	. 
	or b			;840b	b0 	. 
	sub b			;840c	90 	. 
	xor d			;840d	aa 	. 
	ld (bc),a			;840e	02 	. 
	dec d			;840f	15 	. 
	sub l			;8410	95 	. 
	ld (bc),a			;8411	02 	. 
	rla			;8412	17 	. 
	xor d			;8413	aa 	. 
	ld (bc),a			;8414	02 	. 
	dec e			;8415	1d 	. 
	add a,d			;8416	82 	. 
	and h			;8417	a4 	. 
	sbc a,b			;8418	98 	. 
	add a,c			;8419	81 	. 
	add a,d			;841a	82 	. 
	and h			;841b	a4 	. 
	sbc a,b			;841c	98 	. 
	ld (bc),a			;841d	02 	. 
	dec h			;841e	25 	% 
	adc a,c			;841f	89 	. 
	or b			;8420	b0 	. 
	add a,(hl)			;8421	86 	. 
	ld (bc),a			;8422	02 	. 
	add hl,hl			;8423	29 	) 
	sub l			;8424	95 	. 
	ld (bc),a			;8425	02 	. 
	dec hl			;8426	2b 	+ 
	xor d			;8427	aa 	. 
	ld (bc),a			;8428	02 	. 
	dec l			;8429	2d 	- 
	or l			;842a	b5 	. 
l842bh:
	or b			;842b	b0 	. 
	sub b			;842c	90 	. 
	ld (bc),a			;842d	02 	. 
	ld sp,002a2h		;842e	31 a2 02 	1 . . 
	inc sp			;8431	33 	3 
	sub c			;8432	91 	. 
	and d			;8433	a2 	. 
	ld (bc),a			;8434	02 	. 
	add a,a			;8435	87 	. 
	ld d,b			;8436	50 	P 
	ld l,h			;8437	6c 	l 
	ld h,l			;8438	65 	e 
	ld h,c			;8439	61 	a 
	ld (hl),e			;843a	73 	s 
	ld h,l			;843b	65 	e 
	ld (bc),a			;843c	02 	. 
	adc a,(hl)			;843d	8e 	. 
	ld h,l			;843e	65 	e 
	ld l,(hl)			;843f	6e 	n 
	ld (hl),h			;8440	74 	t 
	ld h,l			;8441	65 	e 
	ld (hl),d			;8442	72 	r 
	ld (bc),a			;8443	02 	. 
	sub h			;8444	94 	. 
	ld a,c			;8445	79 	y 
	ld l,a			;8446	6f 	o 
	ld (hl),l			;8447	75 	u 
	ld (hl),d			;8448	72 	r 
	ld (bc),a			;8449	02 	. 
	sbc a,c			;844a	99 	. 
	ld l,(hl)			;844b	6e 	n 
	ld h,c			;844c	61 	a 
	ld l,l			;844d	6d 	m 
	ld h,l			;844e	65 	e 
	ld (bc),a			;844f	02 	. 
	sbc a,(hl)			;8450	9e 	. 
	jr z,l84c8h		;8451	28 75 	( u 
	ld (hl),b			;8453	70 	p 
	ld (bc),a			;8454	02 	. 
	and d			;8455	a2 	. 
	ld (hl),h			;8456	74 	t 
	ld l,a			;8457	6f 	o 
	ld (bc),a			;8458	02 	. 
	and l			;8459	a5 	. 
	ld sp,00235h		;845a	31 35 02 	1 5 . 
	xor b			;845d	a8 	. 
	ld h,e			;845e	63 	c 
	ld l,b			;845f	68 	h 
	ld h,c			;8460	61 	a 
	ld (hl),d			;8461	72 	r 
	ld h,c			;8462	61 	a 
	ld h,e			;8463	63 	c 
	ld (hl),h			;8464	74 	t 
	ld h,l			;8465	65 	e 
	ld (hl),d			;8466	72 	r 
	ld (hl),e			;8467	73 	s 
	add hl,hl			;8468	29 	) 
	ld (bc),a			;8469	02 	. 
	or h			;846a	b4 	. 
	ld (hl),h			;846b	74 	t 
	ld l,a			;846c	6f 	o 
	ld (bc),a			;846d	02 	. 
	rst 0			;846e	c7 	. 
	ld (hl),d			;846f	72 	r 
	ld h,l			;8470	65 	e 
	ld h,e			;8471	63 	c 
	ld l,a			;8472	6f 	o 
	ld (hl),d			;8473	72 	r 
	ld h,h			;8474	64 	d 
	ld (bc),a			;8475	02 	. 
	adc a,079h		;8476	ce 79 	. y 
	ld l,a			;8478	6f 	o 
	ld (hl),l			;8479	75 	u 
	ld (hl),d			;847a	72 	r 
	ld (bc),a			;847b	02 	. 
	out (073h),a		;847c	d3 73 	. s 
	ld h,e			;847e	63 	c 
	ld l,a			;847f	6f 	o 
	ld (hl),d			;8480	72 	r 
	ld h,l			;8481	65 	e 
	ld (bc),a			;8482	02 	. 
	exx			;8483	d9 	. 
	ld l,c			;8484	69 	i 
	ld l,(hl)			;8485	6e 	n 
	ld (bc),a			;8486	02 	. 
	call c,sub_6874h		;8487	dc 74 68 	. t h 
	ld h,l			;848a	65 	e 
	ld (bc),a			;848b	02 	. 
	ret po			;848c	e0 	. 
	ld d,h			;848d	54 	T 
	ld c,a			;848e	4f 	O 
	ld d,b			;848f	50 	P 
	ld (bc),a			;8490	02 	. 
	call po,04554h		;8491	e4 54 45 	. T E 
	ld c,(hl)			;8494	4e 	N 
	ld a,(03804h)		;8495	3a 04 38 	: . 8 
	nop			;8498	00 	. 
	nop			;8499	00 	. 
	inc d			;849a	14 	. 
	add a,e			;849b	83 	. 
	sub a			;849c	97 	. 
l849dh:
	add a,c			;849d	81 	. 
	and b			;849e	a0 	. 
	add a,(hl)			;849f	86 	. 
	adc a,c			;84a0	89 	. 
	sub b			;84a1	90 	. 
	xor d			;84a2	aa 	. 
	add a,e			;84a3	83 	. 
	adc a,c			;84a4	89 	. 
	sub b			;84a5	90 	. 
	nop			;84a6	00 	. 
	jr nz,l842bh		;84a7	20 82 	  . 
	xor e			;84a9	ab 	. 
	add a,e			;84aa	83 	. 
	nop			;84ab	00 	. 
	inc h			;84ac	24 	$ 
	sub a			;84ad	97 	. 
l84aeh:
	add a,e			;84ae	83 	. 
	add a,c			;84af	81 	. 
	xor d			;84b0	aa 	. 
	sub b			;84b1	90 	. 
	nop			;84b2	00 	. 
	ld hl,(00095h)		;84b3	2a 95 00 	* . . 
	ld d,l			;84b6	55 	U 
	sub l			;84b7	95 	. 
	nop			;84b8	00 	. 
	ld d,a			;84b9	57 	W 
	xor d			;84ba	aa 	. 
	nop			;84bb	00 	. 
	ld e,d			;84bc	5a 	Z 
	sub l			;84bd	95 	. 
	xor d			;84be	aa 	. 
	nop			;84bf	00 	. 
	ld e,l			;84c0	5d 	] 
	and b			;84c1	a0 	. 
	add a,l			;84c2	85 	. 
	nop			;84c3	00 	. 
	ld h,c			;84c4	61 	a 
	xor d			;84c5	aa 	. 
	nop			;84c6	00 	. 
	ld h,h			;84c7	64 	d 
l84c8h:
	sub l			;84c8	95 	. 
	nop			;84c9	00 	. 
	ld h,a			;84ca	67 	g 
	xor d			;84cb	aa 	. 
	xor c			;84cc	a9 	. 
	nop			;84cd	00 	. 
	ld l,d			;84ce	6a 	j 
	sub l			;84cf	95 	. 
	nop			;84d0	00 	. 
	sub l			;84d1	95 	. 
	sub l			;84d2	95 	. 
	nop			;84d3	00 	. 
	sub a			;84d4	97 	. 
	xor d			;84d5	aa 	. 
	nop			;84d6	00 	. 
	sbc a,d			;84d7	9a 	. 
	sub l			;84d8	95 	. 
	xor d			;84d9	aa 	. 
	add a,e			;84da	83 	. 
	add a,c			;84db	81 	. 
	nop			;84dc	00 	. 
	and c			;84dd	a1 	. 
	xor d			;84de	aa 	. 
	nop			;84df	00 	. 
	and h			;84e0	a4 	. 
	sub a			;84e1	97 	. 
	add a,e			;84e2	83 	. 
	nop			;84e3	00 	. 
	and a			;84e4	a7 	. 
	xor d			;84e5	aa 	. 
	nop			;84e6	00 	. 
	xor c			;84e7	a9 	. 
	and l			;84e8	a5 	. 
	sub l			;84e9	95 	. 
	nop			;84ea	00 	. 
	push de			;84eb	d5 	. 
	add a,l			;84ec	85 	. 
	nop			;84ed	00 	. 
	ret c			;84ee	d8 	. 
	adc a,c			;84ef	89 	. 
	add a,(hl)			;84f0	86 	. 
	nop			;84f1	00 	. 
	in a,(08ah)		;84f2	db 8a 	. . 
	nop			;84f4	00 	. 
	pop hl			;84f5	e1 	. 
	adc a,d			;84f6	8a 	. 
	nop			;84f7	00 	. 
	call po,sub_8c8ch+1		;84f8	e4 8d 8c 	. . . 
	add a,h			;84fb	84 	. 
	adc a,d			;84fc	8a 	. 
	nop			;84fd	00 	. 
	jp (hl)			;84fe	e9 	. 
	add a,d			;84ff	82 	. 
	add a,l			;8500	85 	. 
	ld bc,l940dh		;8501	01 0d 94 	. . . 
	ld bc,la80fh		;8504	01 0f a8 	. . . 
	ld bc,la811h		;8507	01 11 a8 	. . . 
	ld bc,l9814h		;850a	01 14 98 	. . . 
	adc a,h			;850d	8c 	. 
	sub b			;850e	90 	. 
	xor b			;850f	a8 	. 
	ld bc,0941ah		;8510	01 1a 94 	. . . 
	ld bc,la01dh		;8513	01 1d a0 	. . . 
	adc a,h			;8516	8c 	. 
	sub b			;8517	90 	. 
	ld bc,la021h		;8518	01 21 a0 	. ! . 
	adc a,h			;851b	8c 	. 
	sub b			;851c	90 	. 
	ld bc,l9825h		;851d	01 25 98 	. % . 
	and h			;8520	a4 	. 
	ld bc,la828h		;8521	01 28 a8 	. ( . 
	adc a,h			;8524	8c 	. 
	and h			;8525	a4 	. 
	ld bc,la82ch		;8526	01 2c a8 	. , . 
	adc a,h			;8529	8c 	. 
	adc a,h			;852a	8c 	. 
	ld bc,la030h		;852b	01 30 a0 	. 0 . 
	adc a,h			;852e	8c 	. 
	sub b			;852f	90 	. 
	ld bc,l954dh		;8530	01 4d 95 	. M . 
	ld bc,laa4fh		;8533	01 4f aa 	. O . 
	ld bc,laa51h		;8536	01 51 aa 	. Q . 
	ld bc,laa53h		;8539	01 53 aa 	. S . 
	ld bc,laa57h		;853c	01 57 aa 	. W . 
	ld bc,l955ah		;853f	01 5a 95 	. Z . 
	ld bc,la55dh		;8542	01 5d a5 	. ] . 
	ld bc,l825fh		;8545	01 5f 82 	. _ . 
	ld bc,l9561h		;8548	01 61 95 	. a . 
	ld bc,laa64h		;854b	01 64 aa 	. d . 
	ld bc,l9567h		;854e	01 67 95 	. g . 
	xor d			;8551	aa 	. 
	ld bc,l956bh		;8552	01 6b 95 	. k . 
	xor d			;8555	aa 	. 
	ld bc,la570h		;8556	01 70 a5 	. p . 
	ld bc,l8272h		;8559	01 72 82 	. r . 
	ld bc,l9d8dh		;855c	01 8d 9d 	. . . 
	adc a,h			;855f	8c 	. 
	xor (hl)			;8560	ae 	. 
	ld bc,laa91h		;8561	01 91 aa 	. . . 
	ld bc,laa93h		;8564	01 93 aa 	. . . 
	ld bc,l8c95h		;8567	01 95 8c 	. . . 
	sub h			;856a	94 	. 
	xor d			;856b	aa 	. 
	adc a,h			;856c	8c 	. 
	adc a,h			;856d	8c 	. 
	sub l			;856e	95 	. 
	ld bc,l899eh		;856f	01 9e 89 	. . . 
	and h			;8572	a4 	. 
	ld bc,l95a1h		;8573	01 a1 95 	. . . 
	ld bc,laaa4h		;8576	01 a4 aa 	. . . 
	ld bc,l95a7h		;8579	01 a7 95 	. . . 
	xor d			;857c	aa 	. 
	adc a,h			;857d	8c 	. 
	and (hl)			;857e	a6 	. 
	ld bc,laaach		;857f	01 ac aa 	. . . 
	adc a,h			;8582	8c 	. 
	add a,h			;8583	84 	. 
	ld bc,l89b1h		;8584	01 b1 89 	. . . 
	and h			;8587	a4 	. 
	ld bc,l95cdh		;8588	01 cd 95 	. . . 
	ld bc,0aacfh		;858b	01 cf aa 	. . . 
	ld bc,0aad1h		;858e	01 d1 aa 	. . . 
	ld bc,l82d3h		;8591	01 d3 82 	. . . 
	and h			;8594	a4 	. 
	or b			;8595	b0 	. 
	add a,l			;8596	85 	. 
	xor d			;8597	aa 	. 
	ld bc,l95dah		;8598	01 da 95 	. . . 
	ld bc,l89ddh		;859b	01 dd 89 	. . . 
	or b			;859e	b0 	. 
	add a,(hl)			;859f	86 	. 
	ld bc,l89e1h		;85a0	01 e1 89 	. . . 
	or b			;85a3	b0 	. 
	add a,h			;85a4	84 	. 
	add a,d			;85a5	82 	. 
	and h			;85a6	a4 	. 
	sbc a,b			;85a7	98 	. 
	add a,c			;85a8	81 	. 
	xor d			;85a9	aa 	. 
	ld bc,l95ebh		;85aa	01 eb 95 	. . . 
	xor d			;85ad	aa 	. 
	or b			;85ae	b0 	. 
	or b			;85af	b0 	. 
	ld bc,l89f0h		;85b0	01 f0 89 	. . . 
	or b			;85b3	b0 	. 
	add a,(hl)			;85b4	86 	. 
	ld (bc),a			;85b5	02 	. 
	ld b,e			;85b6	43 	C 
	ld c,(hl)			;85b7	4e 	N 
	ld h,c			;85b8	61 	a 
	ld l,l			;85b9	6d 	m 
	ld h,l			;85ba	65 	e 
	ld (bc),a			;85bb	02 	. 
	ld d,h			;85bc	54 	T 
	ld d,e			;85bd	53 	S 
	ld h,e			;85be	63 	c 
	ld l,a			;85bf	6f 	o 
	ld (hl),d			;85c0	72 	r 
	ld h,l			;85c1	65 	e 
	ld (bc),a			;85c2	02 	. 
	ld h,h			;85c3	64 	d 
	ld c,(hl)			;85c4	4e 	N 
l85c5h:
	ld h,c			;85c5	61 	a 
	ld l,l			;85c6	6d 	m 
	ld h,l			;85c7	65 	e 
	ld (bc),a			;85c8	02 	. 
	ld (hl),l			;85c9	75 	u 
	ld d,e			;85ca	53 	S 
	ld h,e			;85cb	63 	c 
	ld l,a			;85cc	6f 	o 
l85cdh:
	ld (hl),d			;85cd	72 	r 
	ld h,l			;85ce	65 	e 
	ld (bc),a			;85cf	02 	. 
	add a,e			;85d0	83 	. 
	add a,e			;85d1	83 	. 
	ld a,(bc)			;85d2	0a 	. 
	ld c,002h		;85d3	0e 02 	. . 
	sub h			;85d5	94 	. 
	add a,e			;85d6	83 	. 
	ld a,(bc)			;85d7	0a 	. 
	ex af,af'			;85d8	08 	. 
	ld (bc),a			;85d9	02 	. 
	and h			;85da	a4 	. 
	add a,e			;85db	83 	. 
	ld a,(bc)			;85dc	0a 	. 
	ld c,002h		;85dd	0e 02 	. . 
	or l			;85df	b5 	. 
	add a,e			;85e0	83 	. 
	ld a,(bc)			;85e1	0a 	. 
	ex af,af'			;85e2	08 	. 
	ld (bc),a			;85e3	02 	. 
	pop bc			;85e4	c1 	. 
	ld sp,0e202h		;85e5	31 02 e2 	1 . . 
	ld (hl),003h		;85e8	36 03 	6 . 
	ld bc,00332h		;85ea	01 32 03 	. 2 . 
	ld (00337h),hl		;85ed	22 37 03 	" 7 . 
	ld b,c			;85f0	41 	A 
	inc sp			;85f1	33 	3 
	inc bc			;85f2	03 	. 
	ld h,d			;85f3	62 	b 
	jr c,l85f9h		;85f4	38 03 	8 . 
	add a,c			;85f6	81 	. 
	inc (hl)			;85f7	34 	4 
	inc bc			;85f8	03 	. 
l85f9h:
	and d			;85f9	a2 	. 
	add hl,sp			;85fa	39 	9 
	inc bc			;85fb	03 	. 
	pop bc			;85fc	c1 	. 
	dec (hl)			;85fd	35 	5 
	inc bc			;85fe	03 	. 
	pop hl			;85ff	e1 	. 
	ld sp,00430h		;8600	31 30 04 	1 0 . 
	add hl,sp			;8603	39 	9 
	nop			;8604	00 	. 
	nop			;8605	00 	. 
	ld de,000a0h		;8606	11 a0 00 	. . . 
	inc de			;8609	13 	. 
	and b			;860a	a0 	. 
	nop			;860b	00 	. 
	dec d			;860c	15 	. 
	and b			;860d	a0 	. 
	or b			;860e	b0 	. 
	nop			;860f	00 	. 
	jr $-94		;8610	18 a0 	. . 
l8612h:
	nop			;8612	00 	. 
	ld a,(de)			;8613	1a 	. 
	and b			;8614	a0 	. 
	nop			;8615	00 	. 
	ld e,0b0h		;8616	1e b0 	. . 
	or b			;8618	b0 	. 
	nop			;8619	00 	. 
	ld hl,sub_b0a0h		;861a	21 a0 b0 	! . . 
	or b			;861d	b0 	. 
	nop			;861e	00 	. 
	dec h			;861f	25 	% 
	and b			;8620	a0 	. 
	or b			;8621	b0 	. 
	nop			;8622	00 	. 
	jr z,l85c5h		;8623	28 a0 	( . 
	or b			;8625	b0 	. 
	or b			;8626	b0 	. 
	nop			;8627	00 	. 
	ld d,c			;8628	51 	Q 
	add a,d			;8629	82 	. 
	xor h			;862a	ac 	. 
	add a,(hl)			;862b	86 	. 
	nop			;862c	00 	. 
	ld d,l			;862d	55 	U 
	sub l			;862e	95 	. 
	nop			;862f	00 	. 
	ld d,a			;8630	57 	W 
	sub l			;8631	95 	. 
	xor d			;8632	aa 	. 
	nop			;8633	00 	. 
	ld e,d			;8634	5a 	Z 
	xor d			;8635	aa 	. 
	nop			;8636	00 	. 
	ld e,(hl)			;8637	5e 	^ 
	sbc a,l			;8638	9d 	. 
	adc a,h			;8639	8c 	. 
	sub c			;863a	91 	. 
	xor d			;863b	aa 	. 
	adc a,h			;863c	8c 	. 
	add a,h			;863d	84 	. 
	nop			;863e	00 	. 
	ld h,l			;863f	65 	e 
	or l			;8640	b5 	. 
	or b			;8641	b0 	. 
	sub l			;8642	95 	. 
	nop			;8643	00 	. 
	ld l,c			;8644	69 	i 
	xor d			;8645	aa 	. 
	nop			;8646	00 	. 
	sub d			;8647	92 	. 
	adc a,d			;8648	8a 	. 
	nop			;8649	00 	. 
	sub l			;864a	95 	. 
	adc a,c			;864b	89 	. 
	adc a,h			;864c	8c 	. 
	add a,c			;864d	81 	. 
	add a,d			;864e	82 	. 
	adc a,h			;864f	8c 	. 
	add a,(hl)			;8650	86 	. 
	nop			;8651	00 	. 
	sbc a,(hl)			;8652	9e 	. 
	adc a,l			;8653	8d 	. 
	adc a,h			;8654	8c 	. 
	add a,c			;8655	81 	. 
	adc a,d			;8656	8a 	. 
	adc a,h			;8657	8c 	. 
	adc a,h			;8658	8c 	. 
	nop			;8659	00 	. 
	and l			;865a	a5 	. 
	add a,l			;865b	85 	. 
	nop			;865c	00 	. 
	and a			;865d	a7 	. 
	add a,l			;865e	85 	. 
	nop			;865f	00 	. 
	xor c			;8660	a9 	. 
	adc a,d			;8661	8a 	. 
	nop			;8662	00 	. 
	rst 8			;8663	cf 	. 
	and b			;8664	a0 	. 
	nop			;8665	00 	. 
	out (0b0h),a		;8666	d3 b0 	. . 
	nop			;8668	00 	. 
	exx			;8669	d9 	. 
	or b			;866a	b0 	. 
	sub b			;866b	90 	. 
	nop			;866c	00 	. 
	call c,00090h		;866d	dc 90 00 	. . . 
	sbc a,0a0h		;8670	de a0 	. . 
	nop			;8672	00 	. 
	pop hl			;8673	e1 	. 
	or b			;8674	b0 	. 
	nop			;8675	00 	. 
	push hl			;8676	e5 	. 
	or b			;8677	b0 	. 
	nop			;8678	00 	. 
	rst 20h			;8679	e7 	. 
	and b			;867a	a0 	. 
	or b			;867b	b0 	. 
	or b			;867c	b0 	. 
	nop			;867d	00 	. 
	ex de,hl			;867e	eb 	. 
	and b			;867f	a0 	. 
	sub b			;8680	90 	. 
	nop			;8681	00 	. 
	ret p			;8682	f0 	. 
	xor d			;8683	aa 	. 
	sub l			;8684	95 	. 
	ld bc,lab0fh		;8685	01 0f ab 	. . . 
	ld bc,l8612h		;8688	01 12 86 	. . . 
	ld bc,la914h		;868b	01 14 a9 	. . . 
	ld bc,l9618h		;868e	01 18 96 	. . . 
	ld bc,l821ah		;8691	01 1a 82 	. . . 
	ld bc,0951ch		;8694	01 1c 95 	. . . 
	ld bc,laa1eh		;8697	01 1e aa 	. . . 
	ld bc,l9620h		;869a	01 20 96 	.   . 
	ld bc,la922h		;869d	01 22 a9 	. " . 
	ld bc,l9624h		;86a0	01 24 96 	. $ . 
	ld bc,l8926h		;86a3	01 26 89 	. & . 
	ld bc,laa28h		;86a6	01 28 aa 	. ( . 
	ld bc,la82ah		;86a9	01 2a a8 	. * . 
	add a,c			;86ac	81 	. 
	add a,d			;86ad	82 	. 
	add a,h			;86ae	84 	. 
	ld bc,laa30h		;86af	01 30 aa 	. 0 . 
	sub l			;86b2	95 	. 
	ld bc,laa4fh		;86b3	01 4f aa 	. O . 
	ld bc,l8353h		;86b6	01 53 83 	. S . 
	xor c			;86b9	a9 	. 
	ld bc,l9558h		;86ba	01 58 95 	. X . 
	and b			;86bd	a0 	. 
	or b			;86be	b0 	. 
	ld bc,lb55ch		;86bf	01 5c b5 	. \ . 
	or b			;86c2	b0 	. 
	cp d			;86c3	ba 	. 
	ld bc,l9560h		;86c4	01 60 95 	. ` . 
	ld bc,laa62h		;86c7	01 62 aa 	. b . 
	ld bc,l8264h		;86ca	01 64 82 	. d . 
	and h			;86cd	a4 	. 
	sub b			;86ce	90 	. 
	ld bc,laa68h		;86cf	01 68 aa 	. h . 
	ld bc,l896bh		;86d2	01 6b 89 	. k . 
	or b			;86d5	b0 	. 
	ld bc,laa70h		;86d6	01 70 aa 	. p . 
	sub l			;86d9	95 	. 
	ld bc,laa8fh		;86da	01 8f aa 	. . . 
	ld bc,0a492h		;86dd	01 92 a4 	. . . 
	ld bc,l9a94h		;86e0	01 94 9a 	. . . 
	ld bc,la598h		;86e3	01 98 a5 	. . . 
	ld bc,laa9ah		;86e6	01 9a aa 	. . . 
	ld bc,l959ch		;86e9	01 9c 95 	. . . 
	ld bc,laa9eh		;86ec	01 9e aa 	. . . 
	ld bc,la5a0h		;86ef	01 a0 a5 	. . . 
	ld bc,l9aa2h		;86f2	01 a2 9a 	. . . 
	ld bc,la4a4h		;86f5	01 a4 a4 	. . . 
	ld bc,l9aa6h		;86f8	01 a6 9a 	. . . 
	ld bc,laaa8h		;86fb	01 a8 aa 	. . . 
	ld bc,l88aah		;86fe	01 aa 88 	. . . 
	sub b			;8701	90 	. 
	and b			;8702	a0 	. 
	add a,l			;8703	85 	. 
	ld bc,l82b0h		;8704	01 b0 82 	. . . 
	add a,c			;8707	81 	. 
	ld bc,l83cfh		;8708	01 cf 83 	. . . 
	add a,c			;870b	81 	. 
	ld bc,l83d3h		;870c	01 d3 83 	. . . 
	ld bc,083d9h		;870f	01 d9 83 	. . . 
	add a,c			;8712	81 	. 
	ld bc,l81dch		;8713	01 dc 81 	. . . 
	ld bc,l82deh		;8716	01 de 82 	. . . 
	ld bc,l83e1h		;8719	01 e1 83 	. . . 
	ld bc,l83e5h		;871c	01 e5 83 	. . . 
	ld bc,l82e8h		;871f	01 e8 82 	. . . 
	ld bc,l82ebh		;8722	01 eb 82 	. . . 
	add a,c			;8725	81 	. 
	ld bc,l82f0h		;8726	01 f0 82 	. . . 
	add a,c			;8729	81 	. 
	ld (bc),a			;872a	02 	. 
	ld b,098h		;872b	06 98 	. . 
	adc a,h			;872d	8c 	. 
	sub b			;872e	90 	. 
	and b			;872f	a0 	. 
	adc a,h			;8730	8c 	. 
	and h			;8731	a4 	. 
	ld (bc),a			;8732	02 	. 
	dec c			;8733	0d 	. 
	or h			;8734	b4 	. 
	ld (bc),a			;8735	02 	. 
	rrca			;8736	0f 	. 
	sub h			;8737	94 	. 
	and b			;8738	a0 	. 
	adc a,h			;8739	8c 	. 
	and h			;873a	a4 	. 
	ld (bc),a			;873b	02 	. 
	inc d			;873c	14 	. 
	sbc a,h			;873d	9c 	. 
	adc a,h			;873e	8c 	. 
	sub b			;873f	90 	. 
	and b			;8740	a0 	. 
	adc a,h			;8741	8c 	. 
	and h			;8742	a4 	. 
	ld (bc),a			;8743	02 	. 
	dec de			;8744	1b 	. 
	adc a,h			;8745	8c 	. 
	sbc a,h			;8746	9c 	. 
	add a,h			;8747	84 	. 
	xor b			;8748	a8 	. 
	ld (bc),a			;8749	02 	. 
	jr nz,$-86		;874a	20 a8 	  . 
	ld (bc),a			;874c	02 	. 
	ld (00294h),hl		;874d	22 94 02 	" . . 
	dec h			;8750	25 	% 
	and b			;8751	a0 	. 
	adc a,h			;8752	8c 	. 
	and h			;8753	a4 	. 
	ld (bc),a			;8754	02 	. 
	add hl,hl			;8755	29 	) 
	adc a,h			;8756	8c 	. 
	sbc a,h			;8757	9c 	. 
	add a,h			;8758	84 	. 
	ld (bc),a			;8759	02 	. 
	dec l			;875a	2d 	- 
	xor h			;875b	ac 	. 
	add a,h			;875c	84 	. 
	and b			;875d	a0 	. 
	adc a,h			;875e	8c 	. 
	and h			;875f	a4 	. 
	ld (bc),a			;8760	02 	. 
	inc sp			;8761	33 	3 
	or h			;8762	b4 	. 
	ld (bc),a			;8763	02 	. 
	dec (hl)			;8764	35 	5 
	sub h			;8765	94 	. 
	and b			;8766	a0 	. 
	adc a,h			;8767	8c 	. 
	and h			;8768	a4 	. 
	ld (bc),a			;8769	02 	. 
	ld b,(hl)			;876a	46 	F 
	sub l			;876b	95 	. 
	ld (bc),a			;876c	02 	. 
	ld c,b			;876d	48 	H 
	sub b			;876e	90 	. 
	xor d			;876f	aa 	. 
	ld (bc),a			;8770	02 	. 
	ld c,e			;8771	4b 	K 
	xor d			;8772	aa 	. 
	ld (bc),a			;8773	02 	. 
	ld c,l			;8774	4d 	M 
	sub a			;8775	97 	. 
	xor l			;8776	ad 	. 
	sub l			;8777	95 	. 
	xor d			;8778	aa 	. 
	ld (bc),a			;8779	02 	. 
	ld d,d			;877a	52 	R 
	xor h			;877b	ac 	. 
	ld (bc),a			;877c	02 	. 
	ld d,h			;877d	54 	T 
	sbc a,l			;877e	9d 	. 
	adc a,h			;877f	8c 	. 
	sub c			;8780	91 	. 
	xor d			;8781	aa 	. 
	adc a,h			;8782	8c 	. 
	xor (hl)			;8783	ae 	. 
	ld (bc),a			;8784	02 	. 
	ld e,h			;8785	5c 	\ 
	sub l			;8786	95 	. 
	ld (bc),a			;8787	02 	. 
	ld e,(hl)			;8788	5e 	^ 
	xor d			;8789	aa 	. 
	ld (bc),a			;878a	02 	. 
	ld h,b			;878b	60 	` 
	xor d			;878c	aa 	. 
	ld (bc),a			;878d	02 	. 
	ld h,d			;878e	62 	b 
	sub l			;878f	95 	. 
	ld (bc),a			;8790	02 	. 
	ld h,l			;8791	65 	e 
	xor d			;8792	aa 	. 
	adc a,h			;8793	8c 	. 
	xor (hl)			;8794	ae 	. 
	ld (bc),a			;8795	02 	. 
	ld l,d			;8796	6a 	j 
	sub l			;8797	95 	. 
	ld (bc),a			;8798	02 	. 
	ld l,l			;8799	6d 	m 
	xor d			;879a	aa 	. 
	ld (bc),a			;879b	02 	. 
	ld l,a			;879c	6f 	o 
	xor d			;879d	aa 	. 
	ld (bc),a			;879e	02 	. 
	ld (hl),c			;879f	71 	q 
	xor d			;87a0	aa 	. 
	ld (bc),a			;87a1	02 	. 
	ld (hl),e			;87a2	73 	s 
	sub a			;87a3	97 	. 
	xor l			;87a4	ad 	. 
	sub l			;87a5	95 	. 
	and b			;87a6	a0 	. 
	add a,e			;87a7	83 	. 
	and h			;87a8	a4 	. 
	ld (bc),a			;87a9	02 	. 
	add a,(hl)			;87aa	86 	. 
	add a,d			;87ab	82 	. 
	add a,e			;87ac	83 	. 
	ld (bc),a			;87ad	02 	. 
	adc a,d			;87ae	8a 	. 
	add a,e			;87af	83 	. 
	add a,c			;87b0	81 	. 
	ld (bc),a			;87b1	02 	. 
	adc a,l			;87b2	8d 	. 
	add a,c			;87b3	81 	. 
	ld (bc),a			;87b4	02 	. 
	adc a,a			;87b5	8f 	. 
	add a,c			;87b6	81 	. 
	ld (bc),a			;87b7	02 	. 
	sub c			;87b8	91 	. 
	add a,e			;87b9	83 	. 
	add a,c			;87ba	81 	. 
	ld (bc),a			;87bb	02 	. 
	sub h			;87bc	94 	. 
	add a,c			;87bd	81 	. 
	ld (bc),a			;87be	02 	. 
	sub (hl)			;87bf	96 	. 
	add a,c			;87c0	81 	. 
	add a,d			;87c1	82 	. 
	ld (bc),a			;87c2	02 	. 
	sbc a,c			;87c3	99 	. 
	add a,d			;87c4	82 	. 
	ld (bc),a			;87c5	02 	. 
	sbc a,h			;87c6	9c 	. 
	add a,c			;87c7	81 	. 
	ld (bc),a			;87c8	02 	. 
	sbc a,a			;87c9	9f 	. 
	add a,e			;87ca	83 	. 
	add a,c			;87cb	81 	. 
	ld (bc),a			;87cc	02 	. 
	and d			;87cd	a2 	. 
	add a,e			;87ce	83 	. 
	add a,e			;87cf	83 	. 
	add a,c			;87d0	81 	. 
	add a,d			;87d1	82 	. 
	ld (bc),a			;87d2	02 	. 
	and a			;87d3	a7 	. 
	add a,d			;87d4	82 	. 
	ld (bc),a			;87d5	02 	. 
	xor d			;87d6	aa 	. 
	add a,c			;87d7	81 	. 
	ld (bc),a			;87d8	02 	. 
	xor l			;87d9	ad 	. 
	add a,e			;87da	83 	. 
	add a,c			;87db	81 	. 
	ld (bc),a			;87dc	02 	. 
	or b			;87dd	b0 	. 
	add a,e			;87de	83 	. 
	add a,c			;87df	81 	. 
	ld (bc),a			;87e0	02 	. 
	or e			;87e1	b3 	. 
	add a,c			;87e2	81 	. 
	ld (bc),a			;87e3	02 	. 
l87e4h:
	or l			;87e4	b5 	. 
	add a,c			;87e5	81 	. 
	ld (bc),a			;87e6	02 	. 
	or a			;87e7	b7 	. 
	add a,e			;87e8	83 	. 
	add a,c			;87e9	81 	. 
	ld (bc),a			;87ea	02 	. 
	jp nz,lb3aah		;87eb	c2 aa b3 	. . . 
	sub e			;87ee	93 	. 
	xor d			;87ef	aa 	. 
	or e			;87f0	b3 	. 
	sbc a,c			;87f1	99 	. 
	xor b			;87f2	a8 	. 
	add a,e			;87f3	83 	. 
	xor c			;87f4	a9 	. 
	xor d			;87f5	aa 	. 
	and h			;87f6	a4 	. 
	xor (hl)			;87f7	ae 	. 
	ld (bc),a			;87f8	02 	. 
	ret nc			;87f9	d0 	. 
	xor d			;87fa	aa 	. 
	ld (bc),a			;87fb	02 	. 
	out (0a8h),a		;87fc	d3 a8 	. . 
	or e			;87fe	b3 	. 
	cp c			;87ff	b9 	. 
	xor d			;8800	aa 	. 
l8801h:
	or e			;8801	b3 	. 
l8802h:
	sbc a,c			;8802	99 	. 
	xor d			;8803	aa 	. 
	or e			;8804	b3 	. 
l8805h:
	sbc a,c			;8805	99 	. 
	adc a,d			;8806	8a 	. 
	or b			;8807	b0 	. 
	sbc a,d			;8808	9a 	. 
	ld (bc),a			;8809	02 	. 
	pop hl			;880a	e1 	. 
l880bh:
	or (hl)			;880b	b6 	. 
	or e			;880c	b3 	. 
	sub h			;880d	94 	. 
l880eh:
	cp l			;880e	bd 	. 
	sub b			;880f	90 	. 
	sub l			;8810	95 	. 
	sub a			;8811	97 	. 
	add a,e			;8812	83 	. 
	sub h			;8813	94 	. 
	ld (bc),a			;8814	02 	. 
	call pe,lb3b7h		;8815	ec b7 b3 	. . . 
	add a,h			;8818	84 	. 
	or a			;8819	b7 	. 
	or e			;881a	b3 	. 
	add a,h			;881b	84 	. 
	and l			;881c	a5 	. 
	or b			;881d	b0 	. 
	add a,l			;881e	85 	. 
	sub (hl)			;881f	96 	. 
l8820h:
	add a,e			;8820	83 	. 
	sub h			;8821	94 	. 
	cp l			;8822	bd 	. 
	sub b			;8823	90 	. 
	sub l			;8824	95 	. 
	ld (bc),a			;8825	02 	. 
	call m,003aah		;8826	fc aa 03 	. . . 
	ld (bc),a			;8829	02 	. 
	xor d			;882a	aa 	. 
	inc bc			;882b	03 	. 
	dec b			;882c	05 	. 
	xor d			;882d	aa 	. 
	add a,d			;882e	82 	. 
	and h			;882f	a4 	. 
	adc a,d			;8830	8a 	. 
	or b			;8831	b0 	. 
	sbc a,d			;8832	9a 	. 
	xor d			;8833	aa 	. 
	inc bc			;8834	03 	. 
	dec c			;8835	0d 	. 
	xor d			;8836	aa 	. 
	inc bc			;8837	03 	. 
	djnz l87e4h		;8838	10 aa 	. . 
	or b			;883a	b0 	. 
	or b			;883b	b0 	. 
	xor d			;883c	aa 	. 
	inc bc			;883d	03 	. 
	dec d			;883e	15 	. 
	xor d			;883f	aa 	. 
l8840h:
	xor d			;8840	aa 	. 
	add a,d			;8841	82 	. 
	and h			;8842	a4 	. 
	xor d			;8843	aa 	. 
l8844h:
	add a,d			;8844	82 	. 
	and h			;8845	a4 	. 
	inc bc			;8846	03 	. 
	dec e			;8847	1d 	. 
	xor d			;8848	aa 	. 
l8849h:
	inc bc			;8849	03 	. 
	ld hl,00395h		;884a	21 95 03 	! . . 
	inc hl			;884d	23 	# 
	sub l			;884e	95 	. 
	sub l			;884f	95 	. 
	adc a,e			;8850	8b 	. 
	sub l			;8851	95 	. 
	or l			;8852	b5 	. 
	or b			;8853	b0 	. 
	add a,l			;8854	85 	. 
	inc bc			;8855	03 	. 
l8856h:
	inc l			;8856	2c 	, 
	or l			;8857	b5 	. 
	or b			;8858	b0 	. 
	add a,l			;8859	85 	. 
	sub l			;885a	95 	. 
	adc a,c			;885b	89 	. 
	sub b			;885c	90 	. 
	inc bc			;885d	03 	. 
	inc sp			;885e	33 	3 
	sub l			;885f	95 	. 
	inc bc			;8860	03 	. 
	dec (hl)			;8861	35 	5 
	sub a			;8862	97 	. 
	add a,e			;8863	83 	. 
	sub l			;8864	95 	. 
	sub l			;8865	95 	. 
	adc a,e			;8866	8b 	. 
	sub l			;8867	95 	. 
	inc bc			;8868	03 	. 
	inc a			;8869	3c 	< 
	and d			;886a	a2 	. 
	add hl,bc			;886b	09 	. 
	ld (bc),a			;886c	02 	. 
	ld (hl),c			;886d	71 	q 
	adc a,b			;886e	88 	. 
	ld a,l			;886f	7d 	} 
	adc a,b			;8870	88 	. 
	adc a,c			;8871	89 	. 
	adc a,b			;8872	88 	. 
	adc a,c			;8873	89 	. 
	adc a,b			;8874	88 	. 
	adc a,c			;8875	89 	. 
	adc a,b			;8876	88 	. 
	adc a,c			;8877	89 	. 
	adc a,b			;8878	88 	. 
	adc a,c			;8879	89 	. 
	adc a,b			;887a	88 	. 
	adc a,c			;887b	89 	. 
	adc a,b			;887c	88 	. 
	adc a,a			;887d	8f 	. 
	adc a,b			;887e	88 	. 
	adc a,a			;887f	8f 	. 
	adc a,b			;8880	88 	. 
	adc a,a			;8881	8f 	. 
	adc a,b			;8882	88 	. 
	adc a,a			;8883	8f 	. 
	adc a,b			;8884	88 	. 
l8885h:
	adc a,a			;8885	8f 	. 
	adc a,b			;8886	88 	. 
	adc a,a			;8887	8f 	. 
	adc a,b			;8888	88 	. 
	ld bc,0023fh		;8889	01 3f 02 	. ? . 
	or a			;888c	b7 	. 
	cp e			;888d	bb 	. 
	nop			;888e	00 	. 
	ld bc,0023fh		;888f	01 3f 02 	. ? . 
	adc a,b			;8892	88 	. 
	add a,h			;8893	84 	. 
	nop			;8894	00 	. 
	ld b,0a2h		;8895	06 a2 	. . 
	adc a,b			;8897	88 	. 
	xor (hl)			;8898	ae 	. 
	adc a,b			;8899	88 	. 
	cp d			;889a	ba 	. 
	adc a,b			;889b	88 	. 
	add a,088h		;889c	c6 88 	. . 
	jp nc,0de88h		;889e	d2 88 de 	. . . 
	adc a,b			;88a1	88 	. 
	jp pe,0ea88h		;88a2	ea 88 ea 	. . . 
	adc a,b			;88a5	88 	. 
	jp pe,0ea88h		;88a6	ea 88 ea 	. . . 
	adc a,b			;88a9	88 	. 
l88aah:
	jp pe,0ea88h		;88aa	ea 88 ea 	. . . 
	adc a,b			;88ad	88 	. 
	defb 0fdh,088h,0fdh	;illegal sequence		;88ae	fd 88 fd 	. . . 
	adc a,b			;88b1	88 	. 
	defb 0fdh,088h,0fdh	;illegal sequence		;88b2	fd 88 fd 	. . . 
	adc a,b			;88b5	88 	. 
	defb 0fdh,088h,0fdh	;illegal sequence		;88b6	fd 88 fd 	. . . 
	adc a,b			;88b9	88 	. 
	rla			;88ba	17 	. 
	adc a,c			;88bb	89 	. 
	rla			;88bc	17 	. 
l88bdh:
	adc a,c			;88bd	89 	. 
	rla			;88be	17 	. 
	adc a,c			;88bf	89 	. 
	rla			;88c0	17 	. 
	adc a,c			;88c1	89 	. 
	rla			;88c2	17 	. 
	adc a,c			;88c3	89 	. 
	rla			;88c4	17 	. 
	adc a,c			;88c5	89 	. 
	ld (03289h),a		;88c6	32 89 32 	2 . 2 
	adc a,c			;88c9	89 	. 
	ld (03289h),a		;88ca	32 89 32 	2 . 2 
	adc a,c			;88cd	89 	. 
	ld (03289h),a		;88ce	32 89 32 	2 . 2 
	adc a,c			;88d1	89 	. 
	ld c,c			;88d2	49 	I 
	adc a,c			;88d3	89 	. 
	ld c,c			;88d4	49 	I 
	adc a,c			;88d5	89 	. 
	ld c,c			;88d6	49 	I 
	adc a,c			;88d7	89 	. 
	ld c,c			;88d8	49 	I 
	adc a,c			;88d9	89 	. 
	ld c,c			;88da	49 	I 
	adc a,c			;88db	89 	. 
	ld c,c			;88dc	49 	I 
	adc a,c			;88dd	89 	. 
	ld e,d			;88de	5a 	Z 
	adc a,c			;88df	89 	. 
	ld e,d			;88e0	5a 	Z 
	adc a,c			;88e1	89 	. 
	ld e,d			;88e2	5a 	Z 
	adc a,c			;88e3	89 	. 
	ld e,d			;88e4	5a 	Z 
	adc a,c			;88e5	89 	. 
	ld e,d			;88e6	5a 	Z 
	adc a,c			;88e7	89 	. 
	ld e,d			;88e8	5a 	Z 
	adc a,c			;88e9	89 	. 
	ld bc,08398h		;88ea	01 98 83 	. . . 
	add a,e			;88ed	83 	. 
	and h			;88ee	a4 	. 
	dec sp			;88ef	3b 	; 
	xor d			;88f0	aa 	. 
	add a,b			;88f1	80 	. 
	add a,b			;88f2	80 	. 
	add a,b			;88f3	80 	. 
	add a,b			;88f4	80 	. 
	sub l			;88f5	95 	. 
	ld a,(l8901h)		;88f6	3a 01 89 	: . . 
	or b			;88f9	b0 	. 
l88fah:
	or b			;88fa	b0 	. 
	add a,(hl)			;88fb	86 	. 
	nop			;88fc	00 	. 
	ld bc,la041h		;88fd	01 41 a0 	. A . 
	ld b,b			;8900	40 	@ 
l8901h:
	add a,(hl)			;8901	86 	. 
	adc a,c			;8902	89 	. 
	ld b,d			;8903	42 	B 
	sub b			;8904	90 	. 
	dec sp			;8905	3b 	; 
	ld b,b			;8906	40 	@ 
	adc a,b			;8907	88 	. 
	sub c			;8908	91 	. 
	add a,b			;8909	80 	. 
	add a,b			;890a	80 	. 
	and d			;890b	a2 	. 
	add a,h			;890c	84 	. 
	ld a,(05001h)		;890d	3a 01 50 	: . P 
l8910h:
	add a,d			;8910	82 	. 
	ld b,b			;8911	40 	@ 
	and h			;8912	a4 	. 
	sbc a,b			;8913	98 	. 
	ld h,b			;8914	60 	` 
	add a,c			;8915	81 	. 
	nop			;8916	00 	. 
	ld bc,l8047h		;8917	01 47 80 	. G . 
	ld b,b			;891a	40 	@ 
l891bh:
	sbc a,b			;891b	98 	. 
	and h			;891c	a4 	. 
l891dh:
	ld c,e			;891d	4b 	K 
	add a,b			;891e	80 	. 
l891fh:
	dec sp			;891f	3b 	; 
	ld d,l			;8920	55 	U 
l8921h:
	add a,b			;8921	80 	. 
	ld b,b			;8922	40 	@ 
l8923h:
	and (hl)			;8923	a6 	. 
	add a,b			;8924	80 	. 
	add a,b			;8925	80 	. 
l8926h:
	sbc a,c			;8926	99 	. 
	ld l,d			;8927	6a 	j 
	add a,b			;8928	80 	. 
	dec sp			;8929	3b 	; 
	ld (hl),h			;892a	74 	t 
	add a,b			;892b	80 	. 
	ld b,b			;892c	40 	@ 
	adc a,c			;892d	89 	. 
	add a,(hl)			;892e	86 	. 
	ld a,b			;892f	78 	x 
	add a,b			;8930	80 	. 
	nop			;8931	00 	. 
	ld bc,0805fh		;8932	01 5f 80 	. _ . 
	ld b,e			;8935	43 	C 
	and b			;8936	a0 	. 
	sub b			;8937	90 	. 
	ld l,a			;8938	6f 	o 
	add a,b			;8939	80 	. 
	inc a			;893a	3c 	< 
	ld b,b			;893b	40 	@ 
	adc a,b			;893c	88 	. 
	sub c			;893d	91 	. 
	and d			;893e	a2 	. 
	add a,h			;893f	84 	. 
	inc a			;8940	3c 	< 
	ld a,l			;8941	7d 	} 
	add a,b			;8942	80 	. 
	ld (hl),b			;8943	70 	p 
	add a,d			;8944	82 	. 
	add a,c			;8945	81 	. 
	ld a,(hl)			;8946	7e 	~ 
	add a,b			;8947	80 	. 
	nop			;8948	00 	. 
	ld (bc),a			;8949	02 	. 
	ld c,a			;894a	4f 	O 
	add a,b			;894b	80 	. 
	add a,b			;894c	80 	. 
	dec a			;894d	3d 	= 
	ld d,l			;894e	55 	U 
	add a,b			;894f	80 	. 
	ld b,b			;8950	40 	@ 
	and (hl)			;8951	a6 	. 
	sbc a,c			;8952	99 	. 
	ld l,d			;8953	6a 	j 
	add a,b			;8954	80 	. 
	dec a			;8955	3d 	= 
	ld a,h			;8956	7c 	| 
	add a,b			;8957	80 	. 
	add a,b			;8958	80 	. 
	nop			;8959	00 	. 
	ld bc,0023fh		;895a	01 3f 02 	. ? . 
	adc a,b			;895d	88 	. 
	add a,h			;895e	84 	. 
	nop			;895f	00 	. 
	ld a,(bc)			;8960	0a 	. 
	ld (hl),l			;8961	75 	u 
	adc a,c			;8962	89 	. 
	add a,c			;8963	81 	. 
	adc a,c			;8964	89 	. 
	adc a,l			;8965	8d 	. 
	adc a,c			;8966	89 	. 
	sbc a,c			;8967	99 	. 
	adc a,c			;8968	89 	. 
	and l			;8969	a5 	. 
	adc a,c			;896a	89 	. 
l896bh:
	or c			;896b	b1 	. 
	adc a,c			;896c	89 	. 
	cp l			;896d	bd 	. 
	adc a,c			;896e	89 	. 
	ret			;896f	c9 	. 
	adc a,c			;8970	89 	. 
	push de			;8971	d5 	. 
	adc a,c			;8972	89 	. 
	pop hl			;8973	e1 	. 
	adc a,c			;8974	89 	. 
	defb 0edh;next byte illegal after ed		;8975	ed 	. 
l8976h:
	adc a,c			;8976	89 	. 
	defb 0edh;next byte illegal after ed		;8977	ed 	. 
	adc a,c			;8978	89 	. 
	defb 0edh;next byte illegal after ed		;8979	ed 	. 
	adc a,c			;897a	89 	. 
	defb 0edh;next byte illegal after ed		;897b	ed 	. 
	adc a,c			;897c	89 	. 
	defb 0edh;next byte illegal after ed		;897d	ed 	. 
	adc a,c			;897e	89 	. 
	defb 0edh;next byte illegal after ed		;897f	ed 	. 
	adc a,c			;8980	89 	. 
	nop			;8981	00 	. 
	adc a,d			;8982	8a 	. 
	nop			;8983	00 	. 
	adc a,d			;8984	8a 	. 
	nop			;8985	00 	. 
	adc a,d			;8986	8a 	. 
	nop			;8987	00 	. 
	adc a,d			;8988	8a 	. 
	nop			;8989	00 	. 
	adc a,d			;898a	8a 	. 
	nop			;898b	00 	. 
	adc a,d			;898c	8a 	. 
	jr nz,$-116		;898d	20 8a 	  . 
	jr nz,l891bh		;898f	20 8a 	  . 
	jr nz,l891dh		;8991	20 8a 	  . 
	jr nz,l891fh		;8993	20 8a 	  . 
	jr nz,l8921h		;8995	20 8a 	  . 
	jr nz,l8923h		;8997	20 8a 	  . 
	ld d,h			;8999	54 	T 
	adc a,d			;899a	8a 	. 
	ld d,h			;899b	54 	T 
	adc a,d			;899c	8a 	. 
	ld d,h			;899d	54 	T 
l899eh:
	adc a,d			;899e	8a 	. 
	ld d,h			;899f	54 	T 
	adc a,d			;89a0	8a 	. 
	ld d,h			;89a1	54 	T 
	adc a,d			;89a2	8a 	. 
	ld d,h			;89a3	54 	T 
	adc a,d			;89a4	8a 	. 
	sbc a,e			;89a5	9b 	. 
	adc a,d			;89a6	8a 	. 
	sbc a,e			;89a7	9b 	. 
	adc a,d			;89a8	8a 	. 
	sbc a,e			;89a9	9b 	. 
	adc a,d			;89aa	8a 	. 
	sbc a,e			;89ab	9b 	. 
l89ach:
	adc a,d			;89ac	8a 	. 
	sbc a,e			;89ad	9b 	. 
	adc a,d			;89ae	8a 	. 
	sbc a,e			;89af	9b 	. 
	adc a,d			;89b0	8a 	. 
l89b1h:
	call m,0fc8ah		;89b1	fc 8a fc 	. . . 
	adc a,d			;89b4	8a 	. 
	call m,0fc8ah		;89b5	fc 8a fc 	. . . 
	adc a,d			;89b8	8a 	. 
	call m,0fc8ah		;89b9	fc 8a fc 	. . . 
	adc a,d			;89bc	8a 	. 
	ld (hl),e			;89bd	73 	s 
	adc a,e			;89be	8b 	. 
	ld (hl),e			;89bf	73 	s 
	adc a,e			;89c0	8b 	. 
	ld (hl),e			;89c1	73 	s 
	adc a,e			;89c2	8b 	. 
	ld (hl),e			;89c3	73 	s 
	adc a,e			;89c4	8b 	. 
	ld (hl),e			;89c5	73 	s 
	adc a,e			;89c6	8b 	. 
	ld (hl),e			;89c7	73 	s 
	adc a,e			;89c8	8b 	. 
	inc d			;89c9	14 	. 
	adc a,h			;89ca	8c 	. 
	inc d			;89cb	14 	. 
	adc a,h			;89cc	8c 	. 
	inc d			;89cd	14 	. 
	adc a,h			;89ce	8c 	. 
	inc d			;89cf	14 	. 
	adc a,h			;89d0	8c 	. 
	inc d			;89d1	14 	. 
	adc a,h			;89d2	8c 	. 
	inc d			;89d3	14 	. 
	adc a,h			;89d4	8c 	. 
	ret po			;89d5	e0 	. 
	adc a,h			;89d6	8c 	. 
	ret po			;89d7	e0 	. 
	adc a,h			;89d8	8c 	. 
	ret po			;89d9	e0 	. 
	adc a,h			;89da	8c 	. 
	ret po			;89db	e0 	. 
	adc a,h			;89dc	8c 	. 
l89ddh:
	ret po			;89dd	e0 	. 
	adc a,h			;89de	8c 	. 
	ret po			;89df	e0 	. 
	adc a,h			;89e0	8c 	. 
l89e1h:
	rst 8			;89e1	cf 	. 
	adc a,l			;89e2	8d 	. 
	rst 8			;89e3	cf 	. 
	adc a,l			;89e4	8d 	. 
	rst 8			;89e5	cf 	. 
	adc a,l			;89e6	8d 	. 
	rst 8			;89e7	cf 	. 
	adc a,l			;89e8	8d 	. 
	rst 8			;89e9	cf 	. 
	adc a,l			;89ea	8d 	. 
	rst 8			;89eb	cf 	. 
	adc a,l			;89ec	8d 	. 
	ld bc,0013fh		;89ed	01 3f 01 	. ? . 
l89f0h:
	ccf			;89f0	3f 	? 
	ld bc,0013fh		;89f1	01 3f 01 	. ? . 
	ccf			;89f4	3f 	? 
	rrca			;89f5	0f 	. 
	sub b			;89f6	90 	. 
	add a,h			;89f7	84 	. 
	sub b			;89f8	90 	. 
	ld l,00eh		;89f9	2e 0e 	. . 
	add a,d			;89fb	82 	. 
	add a,h			;89fc	84 	. 
	sub b			;89fd	90 	. 
	add a,(hl)			;89fe	86 	. 
	nop			;89ff	00 	. 
	ld bc,0013fh		;8a00	01 3f 01 	. ? . 
	ccf			;8a03	3f 	? 
	ld bc,0103fh		;8a04	01 3f 10 	. ? . 
	sub b			;8a07	90 	. 
	cpl			;8a08	2f 	/ 
	dec c			;8a09	0d 	. 
	and b			;8a0a	a0 	. 
	add a,c			;8a0b	81 	. 
	add a,c			;8a0c	81 	. 
	add a,b			;8a0d	80 	. 
	and c			;8a0e	a1 	. 
	adc a,c			;8a0f	89 	. 
	dec l			;8a10	2d 	- 
l8a11h:
	dec c			;8a11	0d 	. 
	add a,h			;8a12	84 	. 
	sub d			;8a13	92 	. 
	adc a,b			;8a14	88 	. 
	add a,b			;8a15	80 	. 
	add a,h			;8a16	84 	. 
	adc a,c			;8a17	89 	. 
l8a18h:
	add a,c			;8a18	81 	. 
	inc l			;8a19	2c 	, 
	rrca			;8a1a	0f 	. 
l8a1bh:
	add a,c			;8a1b	81 	. 
	add a,h			;8a1c	84 	. 
l8a1dh:
	add a,c			;8a1d	81 	. 
	add a,c			;8a1e	81 	. 
	nop			;8a1f	00 	. 
	ld bc,0013fh		;8a20	01 3f 01 	. ? . 
	ccf			;8a23	3f 	? 
	ld bc,00d3fh		;8a24	01 3f 0d 	. ? . 
	sub b			;8a27	90 	. 
	add a,h			;8a28	84 	. 
	sub d			;8a29	92 	. 
	adc a,b			;8a2a	88 	. 
	and d			;8a2b	a2 	. 
	adc a,b			;8a2c	88 	. 
	sub b			;8a2d	90 	. 
	sub b			;8a2e	90 	. 
	dec hl			;8a2f	2b 	+ 
	dec bc			;8a30	0b 	. 
	and b			;8a31	a0 	. 
	and c			;8a32	a1 	. 
	adc a,b			;8a33	88 	. 
	add a,d			;8a34	82 	. 
	add a,b			;8a35	80 	. 
	add a,b			;8a36	80 	. 
	add a,b			;8a37	80 	. 
	sub b			;8a38	90 	. 
	add a,b			;8a39	80 	. 
	add a,h			;8a3a	84 	. 
	and h			;8a3b	a4 	. 
	ld hl,(l880bh)		;8a3c	2a 0b 88 	* . . 
	sub b			;8a3f	90 	. 
l8a40h:
	add a,b			;8a40	80 	. 
	sub c			;8a41	91 	. 
	adc a,b			;8a42	88 	. 
	add a,b			;8a43	80 	. 
	and b			;8a44	a0 	. 
	add a,b			;8a45	80 	. 
	and c			;8a46	a1 	. 
	add a,d			;8a47	82 	. 
	sub b			;8a48	90 	. 
	ld hl,(l810dh)		;8a49	2a 0d 81 	* . . 
	adc a,b			;8a4c	88 	. 
	add a,b			;8a4d	80 	. 
	sub c			;8a4e	91 	. 
	adc a,b			;8a4f	88 	. 
	add a,b			;8a50	80 	. 
	add a,h			;8a51	84 	. 
	add a,d			;8a52	82 	. 
	nop			;8a53	00 	. 
	ld bc,0013fh		;8a54	01 3f 01 	. ? . 
	ccf			;8a57	3f 	? 
	rrca			;8a58	0f 	. 
	and b			;8a59	a0 	. 
	add a,b			;8a5a	80 	. 
	add a,b			;8a5b	80 	. 
	sub b			;8a5c	90 	. 
	dec l			;8a5d	2d 	- 
	inc c			;8a5e	0c 	. 
	add a,h			;8a5f	84 	. 
	sub d			;8a60	92 	. 
	adc a,b			;8a61	88 	. 
	add a,b			;8a62	80 	. 
	add a,d			;8a63	82 	. 
	add a,b			;8a64	80 	. 
	add a,h			;8a65	84 	. 
	add a,c			;8a66	81 	. 
	add a,h			;8a67	84 	. 
	sub c			;8a68	91 	. 
	ld hl,(l900ah)		;8a69	2a 0a 90 	* . . 
	and c			;8a6c	a1 	. 
	adc a,b			;8a6d	88 	. 
	add a,b			;8a6e	80 	. 
	add a,c			;8a6f	81 	. 
	add a,b			;8a70	80 	. 
	add a,b			;8a71	80 	. 
	add a,b			;8a72	80 	. 
	and b			;8a73	a0 	. 
	add a,c			;8a74	81 	. 
	add a,b			;8a75	80 	. 
	add a,h			;8a76	84 	. 
	adc a,c			;8a77	89 	. 
	sub b			;8a78	90 	. 
	jr z,l8a85h		;8a79	28 0a 	( . 
	sbc a,b			;8a7b	98 	. 
	add a,b			;8a7c	80 	. 
	add a,h			;8a7d	84 	. 
	add a,d			;8a7e	82 	. 
	add a,b			;8a7f	80 	. 
	and b			;8a80	a0 	. 
	add a,b			;8a81	80 	. 
	add a,b			;8a82	80 	. 
	add a,b			;8a83	80 	. 
	and b			;8a84	a0 	. 
l8a85h:
	add a,c			;8a85	81 	. 
	and b			;8a86	a0 	. 
	add a,c			;8a87	81 	. 
	add a,h			;8a88	84 	. 
	jr z,l8a96h		;8a89	28 0b 	( . 
	add a,c			;8a8b	81 	. 
	add a,h			;8a8c	84 	. 
l8a8dh:
	add a,d			;8a8d	82 	. 
	sub b			;8a8e	90 	. 
	add a,b			;8a8f	80 	. 
	add a,h			;8a90	84 	. 
	add a,b			;8a91	80 	. 
	sub c			;8a92	91 	. 
	add a,b			;8a93	80 	. 
	sub d			;8a94	92 	. 
	adc a,b			;8a95	88 	. 
l8a96h:
	add a,d			;8a96	82 	. 
	add hl,hl			;8a97	29 	) 
	djnz l8a1bh		;8a98	10 81 	. . 
	nop			;8a9a	00 	. 
	ld bc,0013fh		;8a9b	01 3f 01 	. ? . 
	ccf			;8a9e	3f 	? 
	dec c			;8a9f	0d 	. 
	sub b			;8aa0	90 	. 
	add a,b			;8aa1	80 	. 
	adc a,b			;8aa2	88 	. 
	and b			;8aa3	a0 	. 
	add a,b			;8aa4	80 	. 
	adc a,b			;8aa5	88 	. 
l8aa6h:
	and b			;8aa6	a0 	. 
	add a,b			;8aa7	80 	. 
	add a,b			;8aa8	80 	. 
	sub b			;8aa9	90 	. 
	add hl,hl			;8aaa	29 	) 
	dec bc			;8aab	0b 	. 
	add a,c			;8aac	81 	. 
	and b			;8aad	a0 	. 
	add a,b			;8aae	80 	. 
sub_8aafh:
	add a,c			;8aaf	81 	. 
	add a,b			;8ab0	80 	. 
	add a,b			;8ab1	80 	. 
	add a,b			;8ab2	80 	. 
	adc a,b			;8ab3	88 	. 
	add a,b			;8ab4	80 	. 
	add a,b			;8ab5	80 	. 
	add a,h			;8ab6	84 	. 
	sub b			;8ab7	90 	. 
	add hl,hl			;8ab8	29 	) 
	ex af,af'			;8ab9	08 	. 
	and b			;8aba	a0 	. 
	add a,b			;8abb	80 	. 
	and c			;8abc	a1 	. 
	add a,b			;8abd	80 	. 
	add a,h			;8abe	84 	. 
	add a,d			;8abf	82 	. 
	add a,b			;8ac0	80 	. 
	add a,b			;8ac1	80 	. 
	add a,b			;8ac2	80 	. 
	add a,b			;8ac3	80 	. 
	add a,b			;8ac4	80 	. 
	sub d			;8ac5	92 	. 
	add a,b			;8ac6	80 	. 
	add a,b			;8ac7	80 	. 
	add a,h			;8ac8	84 	. 
	add a,d			;8ac9	82 	. 
l8acah:
	and b			;8aca	a0 	. 
	daa			;8acb	27 	' 
	add hl,bc			;8acc	09 	. 
	add a,h			;8acd	84 	. 
	add a,b			;8ace	80 	. 
	add a,h			;8acf	84 	. 
	add a,b			;8ad0	80 	. 
	add a,c			;8ad1	81 	. 
	add a,b			;8ad2	80 	. 
	and b			;8ad3	a0 	. 
	add a,b			;8ad4	80 	. 
	add a,b			;8ad5	80 	. 
	add a,b			;8ad6	80 	. 
l8ad7h:
	add a,b			;8ad7	80 	. 
	sub b			;8ad8	90 	. 
	add a,c			;8ad9	81 	. 
	add a,b			;8ada	80 	. 
	sub d			;8adb	92 	. 
	adc a,b			;8adc	88 	. 
l8addh:
	daa			;8add	27 	' 
	ex af,af'			;8ade	08 	. 
	add a,d			;8adf	82 	. 
	add a,b			;8ae0	80 	. 
	add a,h			;8ae1	84 	. 
	sub b			;8ae2	90 	. 
	add a,b			;8ae3	80 	. 
	add a,h			;8ae4	84 	. 
	add a,b			;8ae5	80 	. 
	add a,b			;8ae6	80 	. 
	sub b			;8ae7	90 	. 
	add a,b			;8ae8	80 	. 
	adc a,b			;8ae9	88 	. 
	add a,b			;8aea	80 	. 
	add a,d			;8aeb	82 	. 
	adc a,b			;8aec	88 	. 
	add a,b			;8aed	80 	. 
	sub b			;8aee	90 	. 
	add a,h			;8aef	84 	. 
	daa			;8af0	27 	' 
	dec c			;8af1	0d 	. 
	add a,d			;8af2	82 	. 
	add a,b			;8af3	80 	. 
	add a,b			;8af4	80 	. 
	add a,h			;8af5	84 	. 
	add a,b			;8af6	80 	. 
	add a,d			;8af7	82 	. 
	add a,b			;8af8	80 	. 
	add a,b			;8af9	80 	. 
	add a,c			;8afa	81 	. 
	nop			;8afb	00 	. 
	ld bc,0013fh		;8afc	01 3f 01 	. ? . 
	ccf			;8aff	3f 	? 
	ld a,(bc)			;8b00	0a 	. 
	sub b			;8b01	90 	. 
	add a,b			;8b02	80 	. 
	adc a,b			;8b03	88 	. 
	add a,b			;8b04	80 	. 
	add a,b			;8b05	80 	. 
	add a,d			;8b06	82 	. 
	adc a,b			;8b07	88 	. 
	add a,b			;8b08	80 	. 
	add a,b			;8b09	80 	. 
	add a,c			;8b0a	81 	. 
	add a,h			;8b0b	84 	. 
	add a,b			;8b0c	80 	. 
l8b0dh:
	add a,b			;8b0d	80 	. 
	add a,h			;8b0e	84 	. 
	jr z,l8b19h		;8b0f	28 08 	( . 
	add a,h			;8b11	84 	. 
	add a,b			;8b12	80 	. 
l8b13h:
	add a,b			;8b13	80 	. 
	add a,b			;8b14	80 	. 
	sub b			;8b15	90 	. 
	add a,d			;8b16	82 	. 
	add a,b			;8b17	80 	. 
	add a,b			;8b18	80 	. 
l8b19h:
	add a,b			;8b19	80 	. 
	add a,b			;8b1a	80 	. 
	add a,b			;8b1b	80 	. 
	add a,h			;8b1c	84 	. 
	add a,b			;8b1d	80 	. 
	add a,b			;8b1e	80 	. 
	add a,h			;8b1f	84 	. 
	sub b			;8b20	90 	. 
	jr z,l8b2ah		;8b21	28 07 	( . 
	sub b			;8b23	90 	. 
	add a,b			;8b24	80 	. 
	and c			;8b25	a1 	. 
	add a,b			;8b26	80 	. 
	adc a,b			;8b27	88 	. 
	add a,b			;8b28	80 	. 
	add a,c			;8b29	81 	. 
l8b2ah:
	add a,b			;8b2a	80 	. 
	add a,b			;8b2b	80 	. 
	add a,b			;8b2c	80 	. 
	add a,b			;8b2d	80 	. 
	add a,b			;8b2e	80 	. 
	and b			;8b2f	a0 	. 
	add a,c			;8b30	81 	. 
l8b31h:
	add a,b			;8b31	80 	. 
	add a,b			;8b32	80 	. 
	add a,h			;8b33	84 	. 
	add a,b			;8b34	80 	. 
	add a,c			;8b35	81 	. 
	sub b			;8b36	90 	. 
	dec h			;8b37	25 	% 
	ex af,af'			;8b38	08 	. 
	add a,h			;8b39	84 	. 
	add a,b			;8b3a	80 	. 
	add a,h			;8b3b	84 	. 
	add a,b			;8b3c	80 	. 
	add a,d			;8b3d	82 	. 
	add a,b			;8b3e	80 	. 
	add a,b			;8b3f	80 	. 
	add a,b			;8b40	80 	. 
	add a,b			;8b41	80 	. 
	add a,b			;8b42	80 	. 
	add a,b			;8b43	80 	. 
	add a,b			;8b44	80 	. 
	and b			;8b45	a0 	. 
	add a,b			;8b46	80 	. 
	add a,c			;8b47	81 	. 
	add a,b			;8b48	80 	. 
	add a,b			;8b49	80 	. 
	add a,c			;8b4a	81 	. 
	add a,h			;8b4b	84 	. 
	dec h			;8b4c	25 	% 
	rlca			;8b4d	07 	. 
	add a,h			;8b4e	84 	. 
	add a,b			;8b4f	80 	. 
l8b50h:
	sub b			;8b50	90 	. 
	add a,b			;8b51	80 	. 
	add a,b			;8b52	80 	. 
	and b			;8b53	a0 	. 
	add a,b			;8b54	80 	. 
	add a,b			;8b55	80 	. 
	add a,d			;8b56	82 	. 
	add a,b			;8b57	80 	. 
	add a,b			;8b58	80 	. 
	add a,b			;8b59	80 	. 
	sub b			;8b5a	90 	. 
	add a,b			;8b5b	80 	. 
	adc a,b			;8b5c	88 	. 
	and b			;8b5d	a0 	. 
	add a,b			;8b5e	80 	. 
	add a,d			;8b5f	82 	. 
	and b			;8b60	a0 	. 
	ld h,00ah		;8b61	26 0a 	& . 
	add a,c			;8b63	81 	. 
	add a,b			;8b64	80 	. 
	add a,b			;8b65	80 	. 
	add a,h			;8b66	84 	. 
	add a,b			;8b67	80 	. 
	add a,b			;8b68	80 	. 
	sub c			;8b69	91 	. 
	add a,b			;8b6a	80 	. 
	add a,b			;8b6b	80 	. 
	add a,h			;8b6c	84 	. 
	add a,b			;8b6d	80 	. 
	add a,b			;8b6e	80 	. 
	add a,h			;8b6f	84 	. 
	add a,b			;8b70	80 	. 
	add a,d			;8b71	82 	. 
	nop			;8b72	00 	. 
	ld bc,00f3fh		;8b73	01 3f 0f 	. ? . 
	and b			;8b76	a0 	. 
	add a,b			;8b77	80 	. 
	add a,b			;8b78	80 	. 
	add a,b			;8b79	80 	. 
	and b			;8b7a	a0 	. 
	inc l			;8b7b	2c 	, 
	add hl,bc			;8b7c	09 	. 
	add a,h			;8b7d	84 	. 
	add a,b			;8b7e	80 	. 
	add a,b			;8b7f	80 	. 
	add a,c			;8b80	81 	. 
	sub b			;8b81	90 	. 
	add a,b			;8b82	80 	. 
	add a,b			;8b83	80 	. 
	add a,d			;8b84	82 	. 
	add a,b			;8b85	80 	. 
	add a,b			;8b86	80 	. 
	add a,b			;8b87	80 	. 
	add a,d			;8b88	82 	. 
	add a,b			;8b89	80 	. 
	add a,b			;8b8a	80 	. 
	add a,b			;8b8b	80 	. 
	add a,c			;8b8c	81 	. 
	and b			;8b8d	a0 	. 
	ld h,006h		;8b8e	26 06 	& . 
l8b90h:
	adc a,b			;8b90	88 	. 
	add a,b			;8b91	80 	. 
	add a,b			;8b92	80 	. 
	add a,b			;8b93	80 	. 
	add a,b			;8b94	80 	. 
	and b			;8b95	a0 	. 
	add a,b			;8b96	80 	. 
	add a,b			;8b97	80 	. 
	add a,b			;8b98	80 	. 
	add a,b			;8b99	80 	. 
	add a,b			;8b9a	80 	. 
	add a,b			;8b9b	80 	. 
	add a,b			;8b9c	80 	. 
	adc a,b			;8b9d	88 	. 
	add a,b			;8b9e	80 	. 
	add a,b			;8b9f	80 	. 
	add a,b			;8ba0	80 	. 
	add a,h			;8ba1	84 	. 
	sub b			;8ba2	90 	. 
	daa			;8ba3	27 	' 
	dec b			;8ba4	05 	. 
	and b			;8ba5	a0 	. 
	add a,b			;8ba6	80 	. 
	add a,b			;8ba7	80 	. 
	and c			;8ba8	a1 	. 
	add a,b			;8ba9	80 	. 
	add a,b			;8baa	80 	. 
	add a,h			;8bab	84 	. 
	add a,d			;8bac	82 	. 
	add a,b			;8bad	80 	. 
	add a,b			;8bae	80 	. 
	add a,b			;8baf	80 	. 
	add a,b			;8bb0	80 	. 
	add a,b			;8bb1	80 	. 
	add a,b			;8bb2	80 	. 
	add a,b			;8bb3	80 	. 
	sub d			;8bb4	92 	. 
	add a,b			;8bb5	80 	. 
	add a,b			;8bb6	80 	. 
	add a,b			;8bb7	80 	. 
	add a,h			;8bb8	84 	. 
	add a,b			;8bb9	80 	. 
	add a,d			;8bba	82 	. 
	and b			;8bbb	a0 	. 
	inc h			;8bbc	24 	$ 
	dec b			;8bbd	05 	. 
	sub b			;8bbe	90 	. 
	adc a,b			;8bbf	88 	. 
	add a,b			;8bc0	80 	. 
	add a,b			;8bc1	80 	. 
	add a,h			;8bc2	84 	. 
	add a,b			;8bc3	80 	. 
	add a,b			;8bc4	80 	. 
	add a,c			;8bc5	81 	. 
	add a,b			;8bc6	80 	. 
	add a,b			;8bc7	80 	. 
	add a,b			;8bc8	80 	. 
	add a,b			;8bc9	80 	. 
	add a,b			;8bca	80 	. 
	add a,b			;8bcb	80 	. 
	add a,b			;8bcc	80 	. 
	add a,b			;8bcd	80 	. 
	and b			;8bce	a0 	. 
	add a,b			;8bcf	80 	. 
	add a,c			;8bd0	81 	. 
	add a,b			;8bd1	80 	. 
	add a,b			;8bd2	80 	. 
	add a,d			;8bd3	82 	. 
	adc a,b			;8bd4	88 	. 
	inc h			;8bd5	24 	$ 
	dec b			;8bd6	05 	. 
	and b			;8bd7	a0 	. 
	add a,d			;8bd8	82 	. 
	add a,b			;8bd9	80 	. 
	add a,b			;8bda	80 	. 
	add a,b			;8bdb	80 	. 
	add a,b			;8bdc	80 	. 
	add a,b			;8bdd	80 	. 
	add a,b			;8bde	80 	. 
	add a,b			;8bdf	80 	. 
	add a,b			;8be0	80 	. 
	adc a,b			;8be1	88 	. 
	add a,b			;8be2	80 	. 
	and b			;8be3	a0 	. 
	add a,b			;8be4	80 	. 
	add a,b			;8be5	80 	. 
	add a,b			;8be6	80 	. 
	add a,b			;8be7	80 	. 
	and b			;8be8	a0 	. 
	add a,b			;8be9	80 	. 
	add a,b			;8bea	80 	. 
	add a,b			;8beb	80 	. 
	add a,c			;8bec	81 	. 
	adc a,b			;8bed	88 	. 
	inc h			;8bee	24 	$ 
	rlca			;8bef	07 	. 
	and b			;8bf0	a0 	. 
	add a,c			;8bf1	81 	. 
	add a,h			;8bf2	84 	. 
	add a,b			;8bf3	80 	. 
	add a,b			;8bf4	80 	. 
	and c			;8bf5	a1 	. 
	add a,b			;8bf6	80 	. 
	add a,b			;8bf7	80 	. 
	add a,b			;8bf8	80 	. 
	add a,h			;8bf9	84 	. 
	add a,b			;8bfa	80 	. 
	add a,b			;8bfb	80 	. 
	and d			;8bfc	a2 	. 
	add a,b			;8bfd	80 	. 
	add a,b			;8bfe	80 	. 
	add a,b			;8bff	80 	. 
	sub d			;8c00	92 	. 
l8c01h:
	add a,b			;8c01	80 	. 
	add a,b			;8c02	80 	. 
	add a,h			;8c03	84 	. 
	add a,c			;8c04	81 	. 
	inc h			;8c05	24 	$ 
	add hl,bc			;8c06	09 	. 
	add a,d			;8c07	82 	. 
	add a,b			;8c08	80 	. 
	add a,b			;8c09	80 	. 
	add a,b			;8c0a	80 	. 
	and b			;8c0b	a0 	. 
	add a,b			;8c0c	80 	. 
	add a,c			;8c0d	81 	. 
	add a,b			;8c0e	80 	. 
	and b			;8c0f	a0 	. 
	add a,b			;8c10	80 	. 
	add a,b			;8c11	80 	. 
	adc a,b			;8c12	88 	. 
	nop			;8c13	00 	. 
	ld bc,00b3fh		;8c14	01 3f 0b 	. ? . 
	and b			;8c17	a0 	. 
	add a,b			;8c18	80 	. 
	add a,b			;8c19	80 	. 
	add a,b			;8c1a	80 	. 
	adc a,b			;8c1b	88 	. 
	and b			;8c1c	a0 	. 
	add a,b			;8c1d	80 	. 
	add a,b			;8c1e	80 	. 
	add a,b			;8c1f	80 	. 
	add a,h			;8c20	84 	. 
	sub b			;8c21	90 	. 
	add a,b			;8c22	80 	. 
	add a,b			;8c23	80 	. 
	add a,b			;8c24	80 	. 
	sub b			;8c25	90 	. 
	ld h,006h		;8c26	26 06 	& . 
	and b			;8c28	a0 	. 
	add a,c			;8c29	81 	. 
	add a,b			;8c2a	80 	. 
	add a,b			;8c2b	80 	. 
	add a,b			;8c2c	80 	. 
	adc a,b			;8c2d	88 	. 
	add a,b			;8c2e	80 	. 
	add a,b			;8c2f	80 	. 
	add a,b			;8c30	80 	. 
	add a,b			;8c31	80 	. 
	add a,b			;8c32	80 	. 
	add a,b			;8c33	80 	. 
	add a,b			;8c34	80 	. 
	add a,b			;8c35	80 	. 
	add a,b			;8c36	80 	. 
	add a,b			;8c37	80 	. 
	add a,b			;8c38	80 	. 
	add a,b			;8c39	80 	. 
	add a,b			;8c3a	80 	. 
	adc a,b			;8c3b	88 	. 
	ld h,005h		;8c3c	26 05 	& . 
	adc a,b			;8c3e	88 	. 
	add a,b			;8c3f	80 	. 
	add a,b			;8c40	80 	. 
	add a,b			;8c41	80 	. 
	add a,b			;8c42	80 	. 
	add a,b			;8c43	80 	. 
	sub b			;8c44	90 	. 
l8c45h:
	add a,b			;8c45	80 	. 
	add a,b			;8c46	80 	. 
	add a,b			;8c47	80 	. 
	add a,b			;8c48	80 	. 
	add a,b			;8c49	80 	. 
	add a,b			;8c4a	80 	. 
	add a,b			;8c4b	80 	. 
	add a,b			;8c4c	80 	. 
	add a,h			;8c4d	84 	. 
	add a,b			;8c4e	80 	. 
	add a,b			;8c4f	80 	. 
	add a,b			;8c50	80 	. 
	add a,h			;8c51	84 	. 
	sub b			;8c52	90 	. 
	ld h,004h		;8c53	26 04 	& . 
	sub b			;8c55	90 	. 
	add a,b			;8c56	80 	. 
	add a,b			;8c57	80 	. 
	and c			;8c58	a1 	. 
	add a,b			;8c59	80 	. 
	add a,b			;8c5a	80 	. 
	adc a,b			;8c5b	88 	. 
	add a,b			;8c5c	80 	. 
	add a,c			;8c5d	81 	. 
	add a,b			;8c5e	80 	. 
	add a,b			;8c5f	80 	. 
	add a,b			;8c60	80 	. 
	add a,b			;8c61	80 	. 
	add a,b			;8c62	80 	. 
	add a,b			;8c63	80 	. 
	add a,b			;8c64	80 	. 
	and b			;8c65	a0 	. 
	add a,c			;8c66	81 	. 
	add a,b			;8c67	80 	. 
	add a,b			;8c68	80 	. 
	add a,b			;8c69	80 	. 
	add a,h			;8c6a	84 	. 
	add a,b			;8c6b	80 	. 
	add a,b			;8c6c	80 	. 
	add a,c			;8c6d	81 	. 
	sub b			;8c6e	90 	. 
	ld (la003h),hl		;8c6f	22 03 a0 	" . . 
	add a,b			;8c72	80 	. 
	adc a,b			;8c73	88 	. 
	add a,b			;8c74	80 	. 
	add a,b			;8c75	80 	. 
	add a,h			;8c76	84 	. 
	add a,b			;8c77	80 	. 
	add a,b			;8c78	80 	. 
	add a,d			;8c79	82 	. 
	add a,b			;8c7a	80 	. 
	add a,b			;8c7b	80 	. 
	add a,b			;8c7c	80 	. 
	add a,b			;8c7d	80 	. 
	add a,b			;8c7e	80 	. 
	add a,b			;8c7f	80 	. 
	add a,b			;8c80	80 	. 
	add a,b			;8c81	80 	. 
	add a,b			;8c82	80 	. 
	add a,b			;8c83	80 	. 
	sub b			;8c84	90 	. 
	add a,b			;8c85	80 	. 
	add a,c			;8c86	81 	. 
	add a,b			;8c87	80 	. 
	add a,b			;8c88	80 	. 
	add a,b			;8c89	80 	. 
	add a,c			;8c8a	81 	. 
	add a,h			;8c8b	84 	. 
sub_8c8ch:
	ld (l8805h),hl		;8c8c	22 05 88 	" . . 
	add a,b			;8c8f	80 	. 
	add a,b			;8c90	80 	. 
	add a,b			;8c91	80 	. 
	add a,b			;8c92	80 	. 
	add a,b			;8c93	80 	. 
	add a,b			;8c94	80 	. 
l8c95h:
	add a,b			;8c95	80 	. 
	add a,b			;8c96	80 	. 
	add a,b			;8c97	80 	. 
	and b			;8c98	a0 	. 
	add a,b			;8c99	80 	. 
	add a,b			;8c9a	80 	. 
	add a,b			;8c9b	80 	. 
	add a,b			;8c9c	80 	. 
	add a,b			;8c9d	80 	. 
	add a,b			;8c9e	80 	. 
	add a,b			;8c9f	80 	. 
	add a,b			;8ca0	80 	. 
	add a,b			;8ca1	80 	. 
	add a,b			;8ca2	80 	. 
	add a,b			;8ca3	80 	. 
	add a,d			;8ca4	82 	. 
	add a,b			;8ca5	80 	. 
	sub b			;8ca6	90 	. 
	ld (l8104h),hl		;8ca7	22 04 81 	" . . 
	add a,b			;8caa	80 	. 
	add a,b			;8cab	80 	. 
	add a,h			;8cac	84 	. 
	sub b			;8cad	90 	. 
	add a,b			;8cae	80 	. 
	add a,b			;8caf	80 	. 
	adc a,b			;8cb0	88 	. 
	add a,b			;8cb1	80 	. 
	add a,b			;8cb2	80 	. 
	add a,b			;8cb3	80 	. 
	add a,b			;8cb4	80 	. 
	sub b			;8cb5	90 	. 
	add a,d			;8cb6	82 	. 
	add a,b			;8cb7	80 	. 
	add a,b			;8cb8	80 	. 
	add a,h			;8cb9	84 	. 
	add a,b			;8cba	80 	. 
	add a,b			;8cbb	80 	. 
	add a,d			;8cbc	82 	. 
	adc a,b			;8cbd	88 	. 
	add a,b			;8cbe	80 	. 
	add a,b			;8cbf	80 	. 
	and b			;8cc0	a0 	. 
	adc a,b			;8cc1	88 	. 
	inc hl			;8cc2	23 	# 
	ld b,082h		;8cc3	06 82 	. . 
	add a,b			;8cc5	80 	. 
	add a,b			;8cc6	80 	. 
	add a,b			;8cc7	80 	. 
	add a,h			;8cc8	84 	. 
	add a,b			;8cc9	80 	. 
	add a,c			;8cca	81 	. 
	add a,b			;8ccb	80 	. 
	add a,b			;8ccc	80 	. 
	add a,b			;8ccd	80 	. 
	add a,h			;8cce	84 	. 
	add a,b			;8ccf	80 	. 
	add a,b			;8cd0	80 	. 
	add a,b			;8cd1	80 	. 
	add a,c			;8cd2	81 	. 
	add a,b			;8cd3	80 	. 
	sub b			;8cd4	90 	. 
	add a,b			;8cd5	80 	. 
	add a,c			;8cd6	81 	. 
l8cd7h:
	daa			;8cd7	27 	' 
	ld c,082h		;8cd8	0e 82 	. . 
	add a,b			;8cda	80 	. 
	add a,b			;8cdb	80 	. 
	add a,b			;8cdc	80 	. 
	add a,b			;8cdd	80 	. 
	add a,c			;8cde	81 	. 
	nop			;8cdf	00 	. 
	ld bc,0073fh		;8ce0	01 3f 07 	. ? . 
	sub b			;8ce3	90 	. 
	add a,b			;8ce4	80 	. 
	add a,b			;8ce5	80 	. 
	add a,b			;8ce6	80 	. 
	add a,h			;8ce7	84 	. 
	add a,b			;8ce8	80 	. 
	add a,b			;8ce9	80 	. 
	add a,b			;8cea	80 	. 
	add a,d			;8ceb	82 	. 
	adc a,b			;8cec	88 	. 
	add a,b			;8ced	80 	. 
	add a,b			;8cee	80 	. 
	add a,b			;8cef	80 	. 
	add a,d			;8cf0	82 	. 
	adc a,b			;8cf1	88 	. 
	add a,b			;8cf2	80 	. 
	add a,b			;8cf3	80 	. 
	add a,b			;8cf4	80 	. 
	add a,b			;8cf5	80 	. 
	add a,h			;8cf6	84 	. 
	dec h			;8cf7	25 	% 
	dec b			;8cf8	05 	. 
	adc a,b			;8cf9	88 	. 
	add a,b			;8cfa	80 	. 
	add a,b			;8cfb	80 	. 
	add a,b			;8cfc	80 	. 
	and b			;8cfd	a0 	. 
	add a,b			;8cfe	80 	. 
	add a,b			;8cff	80 	. 
	add a,c			;8d00	81 	. 
	add a,b			;8d01	80 	. 
	add a,b			;8d02	80 	. 
	add a,b			;8d03	80 	. 
	add a,b			;8d04	80 	. 
	add a,b			;8d05	80 	. 
	add a,b			;8d06	80 	. 
	add a,c			;8d07	81 	. 
	add a,b			;8d08	80 	. 
l8d09h:
	add a,b			;8d09	80 	. 
	add a,b			;8d0a	80 	. 
	add a,b			;8d0b	80 	. 
l8d0ch:
	add a,h			;8d0c	84 	. 
	add a,b			;8d0d	80 	. 
	add a,b			;8d0e	80 	. 
	add a,b			;8d0f	80 	. 
	add a,c			;8d10	81 	. 
	inc hl			;8d11	23 	# 
	inc b			;8d12	04 	. 
	adc a,b			;8d13	88 	. 
	add a,b			;8d14	80 	. 
	add a,b			;8d15	80 	. 
	add a,b			;8d16	80 	. 
	add a,b			;8d17	80 	. 
	add a,b			;8d18	80 	. 
	and b			;8d19	a0 	. 
l8d1ah:
	add a,b			;8d1a	80 	. 
	add a,b			;8d1b	80 	. 
	add a,b			;8d1c	80 	. 
	add a,b			;8d1d	80 	. 
	add a,b			;8d1e	80 	. 
	add a,b			;8d1f	80 	. 
	add a,b			;8d20	80 	. 
	add a,b			;8d21	80 	. 
	add a,b			;8d22	80 	. 
	adc a,b			;8d23	88 	. 
	add a,b			;8d24	80 	. 
	add a,b			;8d25	80 	. 
	add a,b			;8d26	80 	. 
	add a,b			;8d27	80 	. 
	add a,h			;8d28	84 	. 
	sub b			;8d29	90 	. 
	add a,b			;8d2a	80 	. 
	add a,b			;8d2b	80 	. 
l8d2ch:
	add a,d			;8d2c	82 	. 
	ld (la002h),hl		;8d2d	22 02 a0 	" . . 
	add a,b			;8d30	80 	. 
	add a,b			;8d31	80 	. 
	add a,b			;8d32	80 	. 
	and c			;8d33	a1 	. 
	add a,b			;8d34	80 	. 
	add a,b			;8d35	80 	. 
	add a,b			;8d36	80 	. 
	add a,h			;8d37	84 	. 
	add a,d			;8d38	82 	. 
	add a,b			;8d39	80 	. 
	add a,b			;8d3a	80 	. 
	add a,b			;8d3b	80 	. 
	add a,b			;8d3c	80 	. 
	add a,b			;8d3d	80 	. 
	add a,b			;8d3e	80 	. 
	add a,b			;8d3f	80 	. 
	add a,b			;8d40	80 	. 
	add a,b			;8d41	80 	. 
	sub d			;8d42	92 	. 
	add a,b			;8d43	80 	. 
	add a,b			;8d44	80 	. 
	add a,b			;8d45	80 	. 
	add a,b			;8d46	80 	. 
	add a,h			;8d47	84 	. 
	add a,b			;8d48	80 	. 
	add a,b			;8d49	80 	. 
	add a,d			;8d4a	82 	. 
	and b			;8d4b	a0 	. 
	ld hl,l9002h		;8d4c	21 02 90 	! . . 
	add a,b			;8d4f	80 	. 
	adc a,b			;8d50	88 	. 
	add a,b			;8d51	80 	. 
	add a,b			;8d52	80 	. 
	add a,h			;8d53	84 	. 
	add a,b			;8d54	80 	. 
	add a,b			;8d55	80 	. 
	add a,b			;8d56	80 	. 
	add a,c			;8d57	81 	. 
	add a,b			;8d58	80 	. 
	add a,b			;8d59	80 	. 
	add a,b			;8d5a	80 	. 
	add a,b			;8d5b	80 	. 
	add a,b			;8d5c	80 	. 
	add a,b			;8d5d	80 	. 
	add a,b			;8d5e	80 	. 
	add a,b			;8d5f	80 	. 
	add a,b			;8d60	80 	. 
	add a,b			;8d61	80 	. 
	add a,b			;8d62	80 	. 
	sub b			;8d63	90 	. 
	add a,b			;8d64	80 	. 
	add a,c			;8d65	81 	. 
l8d66h:
	add a,b			;8d66	80 	. 
	add a,b			;8d67	80 	. 
	add a,b			;8d68	80 	. 
	add a,d			;8d69	82 	. 
	adc a,b			;8d6a	88 	. 
	ld hl,la003h		;8d6b	21 03 a0 	! . . 
	add a,b			;8d6e	80 	. 
l8d6fh:
	add a,b			;8d6f	80 	. 
	add a,b			;8d70	80 	. 
	add a,b			;8d71	80 	. 
	add a,b			;8d72	80 	. 
	add a,b			;8d73	80 	. 
	add a,b			;8d74	80 	. 
	add a,b			;8d75	80 	. 
	add a,b			;8d76	80 	. 
	add a,b			;8d77	80 	. 
	add a,b			;8d78	80 	. 
	add a,b			;8d79	80 	. 
	add a,b			;8d7a	80 	. 
	add a,b			;8d7b	80 	. 
	add a,b			;8d7c	80 	. 
	add a,b			;8d7d	80 	. 
	add a,b			;8d7e	80 	. 
	add a,b			;8d7f	80 	. 
	add a,b			;8d80	80 	. 
	add a,b			;8d81	80 	. 
	add a,b			;8d82	80 	. 
	add a,b			;8d83	80 	. 
	add a,b			;8d84	80 	. 
	add a,b			;8d85	80 	. 
	add a,b			;8d86	80 	. 
	add a,c			;8d87	81 	. 
l8d88h:
	ld (l8802h),hl		;8d88	22 02 88 	" . . 
	add a,b			;8d8b	80 	. 
	add a,b			;8d8c	80 	. 
	add a,b			;8d8d	80 	. 
	sub b			;8d8e	90 	. 
	add a,b			;8d8f	80 	. 
	add a,b			;8d90	80 	. 
	add a,b			;8d91	80 	. 
	add a,b			;8d92	80 	. 
	sub b			;8d93	90 	. 
	add a,b			;8d94	80 	. 
	add a,b			;8d95	80 	. 
	add a,b			;8d96	80 	. 
	add a,d			;8d97	82 	. 
	add a,b			;8d98	80 	. 
	add a,b			;8d99	80 	. 
	add a,h			;8d9a	84 	. 
	add a,b			;8d9b	80 	. 
	and b			;8d9c	a0 	. 
	add a,b			;8d9d	80 	. 
	add a,b			;8d9e	80 	. 
	add a,b			;8d9f	80 	. 
	adc a,b			;8da0	88 	. 
	and b			;8da1	a0 	. 
	add a,b			;8da2	80 	. 
	add a,b			;8da3	80 	. 
	add a,b			;8da4	80 	. 
	add a,b			;8da5	80 	. 
	sub d			;8da6	92 	. 
	ld hl,l8805h		;8da7	21 05 88 	! . . 
	add a,b			;8daa	80 	. 
	add a,c			;8dab	81 	. 
	add a,b			;8dac	80 	. 
	and b			;8dad	a0 	. 
	add a,b			;8dae	80 	. 
	adc a,b			;8daf	88 	. 
	add a,b			;8db0	80 	. 
	add a,b			;8db1	80 	. 
	add a,b			;8db2	80 	. 
	add a,b			;8db3	80 	. 
	sub c			;8db4	91 	. 
	add a,b			;8db5	80 	. 
	add a,b			;8db6	80 	. 
	add a,b			;8db7	80 	. 
	adc a,b			;8db8	88 	. 
	add a,b			;8db9	80 	. 
	add a,b			;8dba	80 	. 
	add a,b			;8dbb	80 	. 
	add a,b			;8dbc	80 	. 
	add a,h			;8dbd	84 	. 
	add a,b			;8dbe	80 	. 
	add a,b			;8dbf	80 	. 
	add a,b			;8dc0	80 	. 
	add a,c			;8dc1	81 	. 
	ld (l880eh),hl		;8dc2	22 0e 88 	" . . 
	add a,b			;8dc5	80 	. 
	add a,b			;8dc6	80 	. 
	add a,b			;8dc7	80 	. 
	add a,b			;8dc8	80 	. 
	adc a,b			;8dc9	88 	. 
	add a,b			;8dca	80 	. 
	add a,b			;8dcb	80 	. 
	add a,b			;8dcc	80 	. 
	add a,c			;8dcd	81 	. 
	nop			;8dce	00 	. 
	rrca			;8dcf	0f 	. 
	and b			;8dd0	a0 	. 
	add a,b			;8dd1	80 	. 
	add a,b			;8dd2	80 	. 
	add a,b			;8dd3	80 	. 
	add a,b			;8dd4	80 	. 
	add a,b			;8dd5	80 	. 
	sub b			;8dd6	90 	. 
	ld hl,(l8406h)		;8dd7	2a 06 84 	* . . 
	add a,b			;8dda	80 	. 
	add a,b			;8ddb	80 	. 
	add a,b			;8ddc	80 	. 
	add a,d			;8ddd	82 	. 
	and b			;8dde	a0 	. 
	add a,b			;8ddf	80 	. 
	add a,b			;8de0	80 	. 
	add a,b			;8de1	80 	. 
	add a,b			;8de2	80 	. 
	add a,d			;8de3	82 	. 
	add a,b			;8de4	80 	. 
	add a,b			;8de5	80 	. 
	and b			;8de6	a0 	. 
	add a,b			;8de7	80 	. 
	add a,b			;8de8	80 	. 
	add a,c			;8de9	81 	. 
	add a,b			;8dea	80 	. 
	add a,b			;8deb	80 	. 
	add a,b			;8dec	80 	. 
	add a,b			;8ded	80 	. 
	add a,c			;8dee	81 	. 
	add a,b			;8def	80 	. 
	and b			;8df0	a0 	. 
	ld (l8104h),hl		;8df1	22 04 81 	" . . 
	add a,b			;8df4	80 	. 
	add a,b			;8df5	80 	. 
	add a,b			;8df6	80 	. 
	sub b			;8df7	90 	. 
	add a,b			;8df8	80 	. 
	add a,b			;8df9	80 	. 
	add a,b			;8dfa	80 	. 
	add a,b			;8dfb	80 	. 
	add a,b			;8dfc	80 	. 
	add a,b			;8dfd	80 	. 
	add a,b			;8dfe	80 	. 
	add a,b			;8dff	80 	. 
	add a,b			;8e00	80 	. 
	add a,b			;8e01	80 	. 
	add a,b			;8e02	80 	. 
	add a,b			;8e03	80 	. 
	add a,b			;8e04	80 	. 
	add a,b			;8e05	80 	. 
	add a,b			;8e06	80 	. 
	add a,b			;8e07	80 	. 
	add a,b			;8e08	80 	. 
	add a,h			;8e09	84 	. 
	dec h			;8e0a	25 	% 
	inc bc			;8e0b	03 	. 
	adc a,b			;8e0c	88 	. 
	add a,b			;8e0d	80 	. 
	add a,b			;8e0e	80 	. 
	add a,b			;8e0f	80 	. 
	add a,b			;8e10	80 	. 
	add a,b			;8e11	80 	. 
	add a,b			;8e12	80 	. 
	sub b			;8e13	90 	. 
	add a,b			;8e14	80 	. 
	add a,b			;8e15	80 	. 
	add a,b			;8e16	80 	. 
	add a,b			;8e17	80 	. 
	add a,b			;8e18	80 	. 
	add a,b			;8e19	80 	. 
	add a,b			;8e1a	80 	. 
	add a,b			;8e1b	80 	. 
	add a,b			;8e1c	80 	. 
	add a,b			;8e1d	80 	. 
	add a,h			;8e1e	84 	. 
	add a,b			;8e1f	80 	. 
	add a,b			;8e20	80 	. 
	add a,b			;8e21	80 	. 
	add a,b			;8e22	80 	. 
	add a,h			;8e23	84 	. 
	sub b			;8e24	90 	. 
	add a,b			;8e25	80 	. 
	add a,b			;8e26	80 	. 
	add a,d			;8e27	82 	. 
	ld hl,l9001h		;8e28	21 01 90 	! . . 
	add a,b			;8e2b	80 	. 
	add a,b			;8e2c	80 	. 
	add a,b			;8e2d	80 	. 
	and c			;8e2e	a1 	. 
	add a,b			;8e2f	80 	. 
	add a,b			;8e30	80 	. 
	add a,b			;8e31	80 	. 
	adc a,b			;8e32	88 	. 
	add a,b			;8e33	80 	. 
	add a,c			;8e34	81 	. 
	add a,b			;8e35	80 	. 
	add a,b			;8e36	80 	. 
	add a,b			;8e37	80 	. 
	add a,b			;8e38	80 	. 
	add a,b			;8e39	80 	. 
	add a,b			;8e3a	80 	. 
	add a,b			;8e3b	80 	. 
	add a,b			;8e3c	80 	. 
	add a,b			;8e3d	80 	. 
	and b			;8e3e	a0 	. 
	add a,c			;8e3f	81 	. 
	add a,b			;8e40	80 	. 
	add a,b			;8e41	80 	. 
	add a,b			;8e42	80 	. 
	add a,b			;8e43	80 	. 
	add a,h			;8e44	84 	. 
	add a,b			;8e45	80 	. 
	add a,b			;8e46	80 	. 
	add a,b			;8e47	80 	. 
	add a,c			;8e48	81 	. 
	sub b			;8e49	90 	. 
	rra			;8e4a	1f 	. 
	and b			;8e4b	a0 	. 
	add a,b			;8e4c	80 	. 
	add a,b			;8e4d	80 	. 
	adc a,b			;8e4e	88 	. 
	add a,b			;8e4f	80 	. 
	add a,b			;8e50	80 	. 
	add a,h			;8e51	84 	. 
	add a,b			;8e52	80 	. 
	add a,b			;8e53	80 	. 
	add a,b			;8e54	80 	. 
	add a,d			;8e55	82 	. 
	add a,b			;8e56	80 	. 
	add a,b			;8e57	80 	. 
	add a,b			;8e58	80 	. 
	add a,b			;8e59	80 	. 
	add a,b			;8e5a	80 	. 
	add a,b			;8e5b	80 	. 
	add a,b			;8e5c	80 	. 
	add a,b			;8e5d	80 	. 
	add a,b			;8e5e	80 	. 
	add a,b			;8e5f	80 	. 
	add a,b			;8e60	80 	. 
	add a,b			;8e61	80 	. 
	add a,b			;8e62	80 	. 
	sub b			;8e63	90 	. 
	add a,b			;8e64	80 	. 
	add a,c			;8e65	81 	. 
	add a,b			;8e66	80 	. 
	add a,b			;8e67	80 	. 
	add a,b			;8e68	80 	. 
	add a,b			;8e69	80 	. 
	add a,c			;8e6a	81 	. 
	add a,h			;8e6b	84 	. 
	rra			;8e6c	1f 	. 
	ld (bc),a			;8e6d	02 	. 
	add a,h			;8e6e	84 	. 
	add a,b			;8e6f	80 	. 
	add a,b			;8e70	80 	. 
	add a,b			;8e71	80 	. 
	add a,b			;8e72	80 	. 
	add a,b			;8e73	80 	. 
	add a,b			;8e74	80 	. 
	add a,b			;8e75	80 	. 
	add a,b			;8e76	80 	. 
	add a,b			;8e77	80 	. 
	add a,b			;8e78	80 	. 
	add a,b			;8e79	80 	. 
l8e7ah:
	add a,b			;8e7a	80 	. 
	add a,b			;8e7b	80 	. 
	add a,b			;8e7c	80 	. 
	add a,b			;8e7d	80 	. 
	add a,b			;8e7e	80 	. 
	add a,b			;8e7f	80 	. 
	add a,b			;8e80	80 	. 
	add a,b			;8e81	80 	. 
	add a,b			;8e82	80 	. 
	add a,b			;8e83	80 	. 
	add a,b			;8e84	80 	. 
	add a,b			;8e85	80 	. 
	add a,b			;8e86	80 	. 
	add a,b			;8e87	80 	. 
	add a,b			;8e88	80 	. 
	add a,b			;8e89	80 	. 
	add a,d			;8e8a	82 	. 
	ld hl,l9201h		;8e8b	21 01 92 	! . . 
	add a,b			;8e8e	80 	. 
	add a,b			;8e8f	80 	. 
	add a,b			;8e90	80 	. 
	add a,b			;8e91	80 	. 
	add a,b			;8e92	80 	. 
	add a,b			;8e93	80 	. 
	add a,b			;8e94	80 	. 
	add a,b			;8e95	80 	. 
	add a,b			;8e96	80 	. 
	add a,b			;8e97	80 	. 
	add a,b			;8e98	80 	. 
	add a,b			;8e99	80 	. 
	add a,b			;8e9a	80 	. 
	adc a,b			;8e9b	88 	. 
	add a,b			;8e9c	80 	. 
	add a,b			;8e9d	80 	. 
	and b			;8e9e	a0 	. 
	add a,b			;8e9f	80 	. 
	add a,b			;8ea0	80 	. 
	add a,b			;8ea1	80 	. 
	add a,b			;8ea2	80 	. 
	add a,b			;8ea3	80 	. 
	add a,b			;8ea4	80 	. 
	and b			;8ea5	a0 	. 
	add a,b			;8ea6	80 	. 
	add a,b			;8ea7	80 	. 
	add a,b			;8ea8	80 	. 
	add a,b			;8ea9	80 	. 
	add a,b			;8eaa	80 	. 
	add a,b			;8eab	80 	. 
	add a,h			;8eac	84 	. 
	rra			;8ead	1f 	. 
	inc b			;8eae	04 	. 
	and b			;8eaf	a0 	. 
	add a,c			;8eb0	81 	. 
	add a,h			;8eb1	84 	. 
	add a,b			;8eb2	80 	. 
	add a,b			;8eb3	80 	. 
	add a,b			;8eb4	80 	. 
	add a,d			;8eb5	82 	. 
	sub b			;8eb6	90 	. 
	add a,b			;8eb7	80 	. 
	add a,b			;8eb8	80 	. 
	add a,b			;8eb9	80 	. 
	add a,b			;8eba	80 	. 
l8ebbh:
	add a,h			;8ebb	84 	. 
	add a,b			;8ebc	80 	. 
l8ebdh:
	add a,b			;8ebd	80 	. 
	add a,b			;8ebe	80 	. 
	add a,b			;8ebf	80 	. 
	sub c			;8ec0	91 	. 
	add a,b			;8ec1	80 	. 
	add a,b			;8ec2	80 	. 
	add a,b			;8ec3	80 	. 
	add a,b			;8ec4	80 	. 
	sub d			;8ec5	92 	. 
	add a,b			;8ec6	80 	. 
	add a,b			;8ec7	80 	. 
	add a,b			;8ec8	80 	. 
	adc a,b			;8ec9	88 	. 
	add a,d			;8eca	82 	. 
	jr nz,l8ed5h		;8ecb	20 08 	  . 
	add a,c			;8ecd	81 	. 
	add a,b			;8ece	80 	. 
	add a,b			;8ecf	80 	. 
	add a,b			;8ed0	80 	. 
	add a,b			;8ed1	80 	. 
	and b			;8ed2	a0 	. 
	add a,b			;8ed3	80 	. 
	add a,c			;8ed4	81 	. 
l8ed5h:
	add a,b			;8ed5	80 	. 
	add a,b			;8ed6	80 	. 
	add a,b			;8ed7	80 	. 
	sub b			;8ed8	90 	. 
	add a,b			;8ed9	80 	. 
	add a,b			;8eda	80 	. 
	add a,b			;8edb	80 	. 
	add a,h			;8edc	84 	. 
	nop			;8edd	00 	. 
	dec bc			;8ede	0b 	. 
	push af			;8edf	f5 	. 
	adc a,(hl)			;8ee0	8e 	. 
	push af			;8ee1	f5 	. 
	adc a,(hl)			;8ee2	8e 	. 
	push af			;8ee3	f5 	. 
	adc a,(hl)			;8ee4	8e 	. 
	ld bc,00d8fh		;8ee5	01 8f 0d 	. . . 
	adc a,a			;8ee8	8f 	. 
	add hl,de			;8ee9	19 	. 
	adc a,a			;8eea	8f 	. 
	dec h			;8eeb	25 	% 
	adc a,a			;8eec	8f 	. 
	dec h			;8eed	25 	% 
	adc a,a			;8eee	8f 	. 
	add hl,de			;8eef	19 	. 
	adc a,a			;8ef0	8f 	. 
	dec c			;8ef1	0d 	. 
	adc a,a			;8ef2	8f 	. 
	ld bc,0318fh		;8ef3	01 8f 31 	. . 1 
	adc a,a			;8ef6	8f 	. 
	ld sp,0fe8fh		;8ef7	31 8f fe 	1 . . 
	adc a,a			;8efa	8f 	. 
	cp 08fh		;8efb	fe 8f 	. . 
	ret z			;8efd	c8 	. 
	sub b			;8efe	90 	. 
	ret z			;8eff	c8 	. 
	sub b			;8f00	90 	. 
	adc a,l			;8f01	8d 	. 
	sub c			;8f02	91 	. 
l8f03h:
	adc a,l			;8f03	8d 	. 
	sub c			;8f04	91 	. 
	ld e,c			;8f05	59 	Y 
	sub d			;8f06	92 	. 
	ld e,c			;8f07	59 	Y 
	sub d			;8f08	92 	. 
	dec hl			;8f09	2b 	+ 
	sub e			;8f0a	93 	. 
	dec hl			;8f0b	2b 	+ 
	sub e			;8f0c	93 	. 
	ret m			;8f0d	f8 	. 
	sub e			;8f0e	93 	. 
	ret m			;8f0f	f8 	. 
	sub e			;8f10	93 	. 
	call z,0cc94h		;8f11	cc 94 cc 	. . . 
	sub h			;8f14	94 	. 
	sbc a,l			;8f15	9d 	. 
	sub l			;8f16	95 	. 
	sbc a,l			;8f17	9d 	. 
	sub l			;8f18	95 	. 
	ld (hl),d			;8f19	72 	r 
	sub (hl)			;8f1a	96 	. 
	ld (hl),d			;8f1b	72 	r 
	sub (hl)			;8f1c	96 	. 
	ld c,d			;8f1d	4a 	J 
	sub a			;8f1e	97 	. 
	ld c,d			;8f1f	4a 	J 
l8f20h:
	sub a			;8f20	97 	. 
	jr nz,l8ebbh		;8f21	20 98 	  . 
	jr nz,l8ebdh		;8f23	20 98 	  . 
	jp p,0f298h		;8f25	f2 98 f2 	. . . 
	sbc a,b			;8f28	98 	. 
	add a,099h		;8f29	c6 99 	. . 
	add a,099h		;8f2b	c6 99 	. . 
	sbc a,(hl)			;8f2d	9e 	. 
	sbc a,d			;8f2e	9a 	. 
	sbc a,(hl)			;8f2f	9e 	. 
	sbc a,d			;8f30	9a 	. 
	dec b			;8f31	05 	. 
	ld e,a			;8f32	5f 	_ 
	add a,b			;8f33	80 	. 
	ld c,a			;8f34	4f 	O 
	add a,b			;8f35	80 	. 
	add a,b			;8f36	80 	. 
	add a,b			;8f37	80 	. 
	scf			;8f38	37 	7 
	inc b			;8f39	04 	. 
	ld d,a			;8f3a	57 	W 
	add a,b			;8f3b	80 	. 
	ld b,b			;8f3c	40 	@ 
	cp b			;8f3d	b8 	. 
	add a,a			;8f3e	87 	. 
	sub a			;8f3f	97 	. 
	xor l			;8f40	ad 	. 
	ld b,d			;8f41	42 	B 
	sub b			;8f42	90 	. 
	ld (hl),04fh		;8f43	36 4f 	6 O 
	add a,b			;8f45	80 	. 
	ld b,e			;8f46	43 	C 
	and b			;8f47	a0 	. 
	and b			;8f48	a0 	. 
	ld c,e			;8f49	4b 	K 
	add a,b			;8f4a	80 	. 
	ld b,l			;8f4b	45 	E 
	add a,b			;8f4c	80 	. 
	ld b,b			;8f4d	40 	@ 
	cp l			;8f4e	bd 	. 
	cp h			;8f4f	bc 	. 
	cp c			;8f50	b9 	. 
	cp h			;8f51	bc 	. 
	sub l			;8f52	95 	. 
	ld c,a			;8f53	4f 	O 
	add a,b			;8f54	80 	. 
	ld b,e			;8f55	43 	C 
	and b			;8f56	a0 	. 
	and b			;8f57	a0 	. 
	ld c,e			;8f58	4b 	K 
	add a,b			;8f59	80 	. 
	ld l,a			;8f5a	6f 	o 
	add a,b			;8f5b	80 	. 
	ld sp,0aa40h		;8f5c	31 40 aa 	1 @ . 
	cp d			;8f5f	ba 	. 
	cp d			;8f60	ba 	. 
	sbc a,d			;8f61	9a 	. 
	add a,b			;8f62	80 	. 
	adc a,d			;8f63	8a 	. 
	cp l			;8f64	bd 	. 
l8f65h:
	cp h			;8f65	bc 	. 
	sbc a,a			;8f66	9f 	. 
	add a,b			;8f67	80 	. 
	adc a,d			;8f68	8a 	. 
	cp d			;8f69	ba 	. 
	cp d			;8f6a	ba 	. 
	cp d			;8f6b	ba 	. 
	ld l,d			;8f6c	6a 	j 
	add a,b			;8f6d	80 	. 
	ld sp,l8054h		;8f6e	31 54 80 	1 T . 
	ld b,b			;8f71	40 	@ 
	cp a			;8f72	bf 	. 
	cp a			;8f73	bf 	. 
	cp h			;8f74	bc 	. 
	cp (hl)			;8f75	be 	. 
	cp a			;8f76	bf 	. 
	cp a			;8f77	bf 	. 
	cp a			;8f78	bf 	. 
	cp a			;8f79	bf 	. 
	cp a			;8f7a	bf 	. 
	cp h			;8f7b	bc 	. 
	cp (hl)			;8f7c	be 	. 
	cp a			;8f7d	bf 	. 
	sub l			;8f7e	95 	. 
	ld a,(hl)			;8f7f	7e 	~ 
	add a,b			;8f80	80 	. 
	ld sp,l8075h		;8f81	31 75 80 	1 u . 
	ld b,b			;8f84	40 	@ 
	adc a,e			;8f85	8b 	. 
	xor a			;8f86	af 	. 
	cp a			;8f87	bf 	. 
l8f88h:
	cp a			;8f88	bf 	. 
	cp a			;8f89	bf 	. 
	cp a			;8f8a	bf 	. 
	cp a			;8f8b	bf 	. 
	cp a			;8f8c	bf 	. 
	cp a			;8f8d	bf 	. 
	cp a			;8f8e	bf 	. 
	cp a			;8f8f	bf 	. 
	adc a,a			;8f90	8f 	. 
	ld h,b			;8f91	60 	` 
	add a,c			;8f92	81 	. 
	ld (l7402h),a		;8f93	32 02 74 	2 . t 
	add a,b			;8f96	80 	. 
	ld b,b			;8f97	40 	@ 
	xor e			;8f98	ab 	. 
	cp a			;8f99	bf 	. 
	cp a			;8f9a	bf 	. 
	cp a			;8f9b	bf 	. 
	cp a			;8f9c	bf 	. 
	cp a			;8f9d	bf 	. 
	cp a			;8f9e	bf 	. 
	cp a			;8f9f	bf 	. 
	ld h,b			;8fa0	60 	` 
	add a,c			;8fa1	81 	. 
	ld a,(hl)			;8fa2	7e 	~ 
	add a,b			;8fa3	80 	. 
	inc sp			;8fa4	33 	3 
	inc bc			;8fa5	03 	. 
	ld b,b			;8fa6	40 	@ 
	xor d			;8fa7	aa 	. 
	cp a			;8fa8	bf 	. 
	cp a			;8fa9	bf 	. 
	cp a			;8faa	bf 	. 
	cp a			;8fab	bf 	. 
	cp a			;8fac	bf 	. 
	cp a			;8fad	bf 	. 
	cp a			;8fae	bf 	. 
	ld l,d			;8faf	6a 	j 
	add a,b			;8fb0	80 	. 
	inc (hl)			;8fb1	34 	4 
	inc bc			;8fb2	03 	. 
	ld b,b			;8fb3	40 	@ 
	xor d			;8fb4	aa 	. 
	cp a			;8fb5	bf 	. 
	cp a			;8fb6	bf 	. 
	cp a			;8fb7	bf 	. 
	cp a			;8fb8	bf 	. 
	cp a			;8fb9	bf 	. 
	cp a			;8fba	bf 	. 
	cp a			;8fbb	bf 	. 
	ld l,d			;8fbc	6a 	j 
	add a,b			;8fbd	80 	. 
	inc (hl)			;8fbe	34 	4 
	inc bc			;8fbf	03 	. 
	ld b,b			;8fc0	40 	@ 
	xor d			;8fc1	aa 	. 
	cp a			;8fc2	bf 	. 
	cp a			;8fc3	bf 	. 
	cp a			;8fc4	bf 	. 
	cp a			;8fc5	bf 	. 
	cp a			;8fc6	bf 	. 
	cp a			;8fc7	bf 	. 
	cp a			;8fc8	bf 	. 
	ld l,d			;8fc9	6a 	j 
	add a,b			;8fca	80 	. 
	inc (hl)			;8fcb	34 	4 
	inc bc			;8fcc	03 	. 
	ld b,b			;8fcd	40 	@ 
	xor d			;8fce	aa 	. 
	cp a			;8fcf	bf 	. 
	cp a			;8fd0	bf 	. 
	cp a			;8fd1	bf 	. 
	cp a			;8fd2	bf 	. 
	cp a			;8fd3	bf 	. 
	cp a			;8fd4	bf 	. 
	cp a			;8fd5	bf 	. 
	ld l,d			;8fd6	6a 	j 
	add a,b			;8fd7	80 	. 
	inc (hl)			;8fd8	34 	4 
	inc bc			;8fd9	03 	. 
	ld b,b			;8fda	40 	@ 
	adc a,d			;8fdb	8a 	. 
	sbc a,a			;8fdc	9f 	. 
	cp a			;8fdd	bf 	. 
	cp a			;8fde	bf 	. 
	cp a			;8fdf	bf 	. 
	cp a			;8fe0	bf 	. 
	xor a			;8fe1	af 	. 
	cp a			;8fe2	bf 	. 
	ld l,d			;8fe3	6a 	j 
l8fe4h:
	add a,b			;8fe4	80 	. 
	inc (hl)			;8fe5	34 	4 
	inc bc			;8fe6	03 	. 
	ld a,l			;8fe7	7d 	} 
	add a,b			;8fe8	80 	. 
	ld a,h			;8fe9	7c 	| 
	add a,b			;8fea	80 	. 
	ld b,b			;8feb	40 	@ 
	adc a,d			;8fec	8a 	. 
	xor e			;8fed	ab 	. 
	adc a,e			;8fee	8b 	. 
	ld h,b			;8fef	60 	` 
	add a,c			;8ff0	81 	. 
l8ff1h:
	ld (hl),h			;8ff1	74 	t 
	add a,b			;8ff2	80 	. 
	ld (hl),b			;8ff3	70 	p 
	add a,c			;8ff4	81 	. 
	ld a,(hl)			;8ff5	7e 	~ 
	add a,b			;8ff6	80 	. 
	inc (hl)			;8ff7	34 	4 
	ld b,07ch		;8ff8	06 7c 	. | 
	add a,b			;8ffa	80 	. 
	ld a,(hl)			;8ffb	7e 	~ 
	add a,b			;8ffc	80 	. 
	nop			;8ffd	00 	. 
	ld bc,0043fh		;8ffe	01 3f 04 	. ? . 
l9001h:
	ld e,a			;9001	5f 	_ 
l9002h:
	add a,b			;9002	80 	. 
	ld b,c			;9003	41 	A 
	and b			;9004	a0 	. 
	ld b,b			;9005	40 	@ 
	sbc a,h			;9006	9c 	. 
	sbc a,h			;9007	9c 	. 
	or h			;9008	b4 	. 
	ld c,e			;9009	4b 	K 
l900ah:
	add a,b			;900a	80 	. 
	ld (hl),001h		;900b	36 01 	6 . 
	ld c,a			;900d	4f 	O 
	add a,b			;900e	80 	. 
	add a,b			;900f	80 	. 
	ld l,a			;9010	6f 	o 
	add a,b			;9011	80 	. 
	ld d,l			;9012	55 	U 
	add a,b			;9013	80 	. 
	ld b,b			;9014	40 	@ 
	or a			;9015	b7 	. 
	or b			;9016	b0 	. 
	and l			;9017	a5 	. 
	or d			;9018	b2 	. 
	sub l			;9019	95 	. 
	ld a,a			;901a	7f 	 
	add a,b			;901b	80 	. 
	ld c,a			;901c	4f 	O 
	add a,b			;901d	80 	. 
	add a,b			;901e	80 	. 
	ld l,a			;901f	6f 	o 
	add a,b			;9020	80 	. 
	ld (la840h),a		;9021	32 40 a8 	2 @ . 
	xor d			;9024	aa 	. 
	xor d			;9025	aa 	. 
	xor b			;9026	a8 	. 
	add a,b			;9027	80 	. 
	xor e			;9028	ab 	. 
	or a			;9029	b7 	. 
	or e			;902a	b3 	. 
	cp a			;902b	bf 	. 
	add a,c			;902c	81 	. 
	xor b			;902d	a8 	. 
	xor d			;902e	aa 	. 
	xor d			;902f	aa 	. 
	xor b			;9030	a8 	. 
	ld l,d			;9031	6a 	j 
	add a,b			;9032	80 	. 
	ld sp,l8250h		;9033	31 50 82 	1 P . 
	ld b,b			;9036	40 	@ 
	cp a			;9037	bf 	. 
	cp a			;9038	bf 	. 
	or c			;9039	b1 	. 
	cp b			;903a	b8 	. 
	cp h			;903b	bc 	. 
	cp a			;903c	bf 	. 
	cp a			;903d	bf 	. 
	cp l			;903e	bd 	. 
	cp h			;903f	bc 	. 
	or b			;9040	b0 	. 
	cp e			;9041	bb 	. 
	cp a			;9042	bf 	. 
	sub a			;9043	97 	. 
	ld a,d			;9044	7a 	z 
l9045h:
	add a,b			;9045	80 	. 
	ld sp,l8055h		;9046	31 55 80 	1 U . 
	ld b,b			;9049	40 	@ 
	xor a			;904a	af 	. 
	cp a			;904b	bf 	. 
	cp a			;904c	bf 	. 
	cp a			;904d	bf 	. 
	cp a			;904e	bf 	. 
	cp a			;904f	bf 	. 
	cp a			;9050	bf 	. 
	cp a			;9051	bf 	. 
	cp a			;9052	bf 	. 
	cp a			;9053	bf 	. 
	cp a			;9054	bf 	. 
	cp a			;9055	bf 	. 
	add a,l			;9056	85 	. 
	ld (l7c01h),a		;9057	32 01 7c 	2 . | 
	add a,b			;905a	80 	. 
	ld d,b			;905b	50 	P 
	add a,d			;905c	82 	. 
	ld b,b			;905d	40 	@ 
	xor a			;905e	af 	. 
	cp a			;905f	bf 	. 
	cp a			;9060	bf 	. 
	cp a			;9061	bf 	. 
	cp a			;9062	bf 	. 
	cp a			;9063	bf 	. 
	cp a			;9064	bf 	. 
	cp a			;9065	bf 	. 
	add a,a			;9066	87 	. 
	ld a,b			;9067	78 	x 
	add a,b			;9068	80 	. 
	ld a,(hl)			;9069	7e 	~ 
	add a,b			;906a	80 	. 
	ld (04003h),a		;906b	32 03 40 	2 . @ 
	xor d			;906e	aa 	. 
	cp a			;906f	bf 	. 
	cp a			;9070	bf 	. 
	cp a			;9071	bf 	. 
	cp a			;9072	bf 	. 
	cp a			;9073	bf 	. 
	cp a			;9074	bf 	. 
	cp a			;9075	bf 	. 
	ld l,d			;9076	6a 	j 
	add a,b			;9077	80 	. 
	inc (hl)			;9078	34 	4 
	inc bc			;9079	03 	. 
	ld b,b			;907a	40 	@ 
	xor d			;907b	aa 	. 
	cp a			;907c	bf 	. 
	cp a			;907d	bf 	. 
	cp a			;907e	bf 	. 
	cp a			;907f	bf 	. 
	cp a			;9080	bf 	. 
	cp a			;9081	bf 	. 
	cp a			;9082	bf 	. 
	ld l,d			;9083	6a 	j 
	add a,b			;9084	80 	. 
	inc (hl)			;9085	34 	4 
	inc bc			;9086	03 	. 
	ld b,b			;9087	40 	@ 
	xor d			;9088	aa 	. 
	cp a			;9089	bf 	. 
	cp a			;908a	bf 	. 
	cp a			;908b	bf 	. 
	cp a			;908c	bf 	. 
	cp a			;908d	bf 	. 
	cp a			;908e	bf 	. 
	cp a			;908f	bf 	. 
	ld l,d			;9090	6a 	j 
	add a,b			;9091	80 	. 
	inc (hl)			;9092	34 	4 
	inc bc			;9093	03 	. 
	ld b,b			;9094	40 	@ 
	xor d			;9095	aa 	. 
	cp a			;9096	bf 	. 
	cp a			;9097	bf 	. 
	cp a			;9098	bf 	. 
	cp a			;9099	bf 	. 
	cp a			;909a	bf 	. 
	cp a			;909b	bf 	. 
	cp a			;909c	bf 	. 
	ld l,d			;909d	6a 	j 
	add a,b			;909e	80 	. 
	inc (hl)			;909f	34 	4 
	inc bc			;90a0	03 	. 
	ld b,b			;90a1	40 	@ 
	xor d			;90a2	aa 	. 
	cp a			;90a3	bf 	. 
	cp a			;90a4	bf 	. 
	cp a			;90a5	bf 	. 
	cp a			;90a6	bf 	. 
l90a7h:
	cp a			;90a7	bf 	. 
	cp a			;90a8	bf 	. 
	cp a			;90a9	bf 	. 
	ld l,d			;90aa	6a 	j 
	add a,b			;90ab	80 	. 
	inc (hl)			;90ac	34 	4 
	inc bc			;90ad	03 	. 
	ld (hl),h			;90ae	74 	t 
	add a,b			;90af	80 	. 
	ld (hl),b			;90b0	70 	p 
	add a,c			;90b1	81 	. 
	ld b,b			;90b2	40 	@ 
	xor e			;90b3	ab 	. 
	xor a			;90b4	af 	. 
	xor a			;90b5	af 	. 
	add a,a			;90b6	87 	. 
	ld d,b			;90b7	50 	P 
	add a,d			;90b8	82 	. 
	ld b,b			;90b9	40 	@ 
	add a,a			;90ba	87 	. 
	ld a,d			;90bb	7a 	z 
	add a,b			;90bc	80 	. 
	inc (hl)			;90bd	34 	4 
	dec b			;90be	05 	. 
	ld a,h			;90bf	7c 	| 
	add a,b			;90c0	80 	. 
	ld (hl),b			;90c1	70 	p 
	add a,d			;90c2	82 	. 
	ld a,b			;90c3	78 	x 
	add a,b			;90c4	80 	. 
	ld a,(hl)			;90c5	7e 	~ 
	add a,b			;90c6	80 	. 
	nop			;90c7	00 	. 
	ld bc,0053fh		;90c8	01 3f 05 	. ? . 
	ld b,a			;90cb	47 	G 
	add a,b			;90cc	80 	. 
	ld b,e			;90cd	43 	C 
	or b			;90ce	b0 	. 
	or b			;90cf	b0 	. 
	sub b			;90d0	90 	. 
	ld l,a			;90d1	6f 	o 
	add a,b			;90d2	80 	. 
	ld (hl),004h		;90d3	36 04 	6 . 
	ld d,l			;90d5	55 	U 
l90d6h:
	add a,b			;90d6	80 	. 
	ld b,b			;90d7	40 	@ 
	sbc a,(hl)			;90d8	9e 	. 
	add a,c			;90d9	81 	. 
	sub l			;90da	95 	. 
	adc a,e			;90db	8b 	. 
	sub h			;90dc	94 	. 
	ld (hl),043h		;90dd	36 43 	6 C 
	and b			;90df	a0 	. 
	ld b,b			;90e0	40 	@ 
	xor b			;90e1	a8 	. 
	xor b			;90e2	a8 	. 
	ld b,d			;90e3	42 	B 
	and b			;90e4	a0 	. 
	ld b,c			;90e5	41 	A 
	add a,b			;90e6	80 	. 
	ld b,b			;90e7	40 	@ 
l90e8h:
	xor a			;90e8	af 	. 
	sbc a,a			;90e9	9f 	. 
	adc a,(hl)			;90ea	8e 	. 
l90ebh:
	cp a			;90eb	bf 	. 
	add a,l			;90ec	85 	. 
	ld b,e			;90ed	43 	C 
	and b			;90ee	a0 	. 
	ld b,b			;90ef	40 	@ 
	xor b			;90f0	a8 	. 
	xor b			;90f1	a8 	. 
	ld b,d			;90f2	42 	B 
	and b			;90f3	a0 	. 
	ld l,e			;90f4	6b 	k 
	add a,b			;90f5	80 	. 
	ld sp,l8a40h		;90f6	31 40 8a 	1 @ . 
	cp (hl)			;90f9	be 	. 
	cp (hl)			;90fa	be 	. 
	add a,(hl)			;90fb	86 	. 
	and b			;90fc	a0 	. 
	or d			;90fd	b2 	. 
	cp a			;90fe	bf 	. 
	cp a			;90ff	bf 	. 
	or a			;9100	b7 	. 
	or b			;9101	b0 	. 
	add a,d			;9102	82 	. 
	xor (hl)			;9103	ae 	. 
	cp (hl)			;9104	be 	. 
	sbc a,(hl)			;9105	9e 	. 
	ld l,d			;9106	6a 	j 
	add a,b			;9107	80 	. 
	ld sp,l8055h		;9108	31 55 80 	1 U . 
	ld b,b			;910b	40 	@ 
	cp a			;910c	bf 	. 
	cp a			;910d	bf 	. 
	cp a			;910e	bf 	. 
	cp a			;910f	bf 	. 
	cp a			;9110	bf 	. 
	cp a			;9111	bf 	. 
	cp a			;9112	bf 	. 
	cp a			;9113	bf 	. 
	cp a			;9114	bf 	. 
	cp a			;9115	bf 	. 
	cp a			;9116	bf 	. 
	cp a			;9117	bf 	. 
	sub l			;9118	95 	. 
	ld (l807dh),a		;9119	32 7d 80 	2 } . 
	ld (hl),b			;911c	70 	p 
	add a,d			;911d	82 	. 
	ld b,b			;911e	40 	@ 
	adc a,e			;911f	8b 	. 
	cp a			;9120	bf 	. 
	cp a			;9121	bf 	. 
	cp a			;9122	bf 	. 
	cp a			;9123	bf 	. 
	cp a			;9124	bf 	. 
	cp a			;9125	bf 	. 
	cp a			;9126	bf 	. 
	cp a			;9127	bf 	. 
	sbc a,a			;9128	9f 	. 
	ld h,b			;9129	60 	` 
	add a,e			;912a	83 	. 
	ld a,b			;912b	78 	x 
	add a,b			;912c	80 	. 
	ld (l7d02h),a		;912d	32 02 7d 	2 . } 
	add a,b			;9130	80 	. 
	ld b,b			;9131	40 	@ 
	xor d			;9132	aa 	. 
	cp a			;9133	bf 	. 
	cp a			;9134	bf 	. 
	cp a			;9135	bf 	. 
	cp a			;9136	bf 	. 
	cp a			;9137	bf 	. 
	cp a			;9138	bf 	. 
	cp a			;9139	bf 	. 
	ld l,b			;913a	68 	h 
	add a,b			;913b	80 	. 
	inc (hl)			;913c	34 	4 
	inc bc			;913d	03 	. 
	ld b,b			;913e	40 	@ 
	xor d			;913f	aa 	. 
	cp a			;9140	bf 	. 
	cp a			;9141	bf 	. 
	cp a			;9142	bf 	. 
	cp a			;9143	bf 	. 
	cp a			;9144	bf 	. 
	cp a			;9145	bf 	. 
	cp a			;9146	bf 	. 
	ld l,d			;9147	6a 	j 
	add a,b			;9148	80 	. 
	inc (hl)			;9149	34 	4 
	inc bc			;914a	03 	. 
	ld b,b			;914b	40 	@ 
	xor d			;914c	aa 	. 
	cp a			;914d	bf 	. 
	cp a			;914e	bf 	. 
	cp a			;914f	bf 	. 
	cp a			;9150	bf 	. 
	cp a			;9151	bf 	. 
	cp a			;9152	bf 	. 
	cp a			;9153	bf 	. 
	ld l,d			;9154	6a 	j 
	add a,b			;9155	80 	. 
	inc (hl)			;9156	34 	4 
	inc bc			;9157	03 	. 
	ld b,b			;9158	40 	@ 
	xor d			;9159	aa 	. 
	cp a			;915a	bf 	. 
	cp a			;915b	bf 	. 
	cp a			;915c	bf 	. 
	cp a			;915d	bf 	. 
	cp a			;915e	bf 	. 
	cp a			;915f	bf 	. 
	cp a			;9160	bf 	. 
	ld l,d			;9161	6a 	j 
	add a,b			;9162	80 	. 
	inc (hl)			;9163	34 	4 
	inc bc			;9164	03 	. 
	ld b,b			;9165	40 	@ 
	xor d			;9166	aa 	. 
	cp a			;9167	bf 	. 
	cp a			;9168	bf 	. 
	cp a			;9169	bf 	. 
	cp a			;916a	bf 	. 
	cp a			;916b	bf 	. 
	cp a			;916c	bf 	. 
	cp a			;916d	bf 	. 
	ld l,d			;916e	6a 	j 
	add a,b			;916f	80 	. 
	inc (hl)			;9170	34 	4 
	inc bc			;9171	03 	. 
	ld d,b			;9172	50 	P 
	add a,d			;9173	82 	. 
	ld b,b			;9174	40 	@ 
	add a,a			;9175	87 	. 
	xor a			;9176	af 	. 
	cp a			;9177	bf 	. 
	cp a			;9178	bf 	. 
	sbc a,a			;9179	9f 	. 
	adc a,e			;917a	8b 	. 
	sbc a,a			;917b	9f 	. 
	ld l,d			;917c	6a 	j 
	add a,b			;917d	80 	. 
	inc (hl)			;917e	34 	4 
	dec b			;917f	05 	. 
	ld (hl),b			;9180	70 	p 
	add a,d			;9181	82 	. 
	ld b,b			;9182	40 	@ 
	adc a,d			;9183	8a 	. 
	ld h,b			;9184	60 	` 
	add a,d			;9185	82 	. 
	ld a,b			;9186	78 	x 
	add a,b			;9187	80 	. 
	ld a,l			;9188	7d 	} 
	add a,b			;9189	80 	. 
	ld a,h			;918a	7c 	| 
	add a,b			;918b	80 	. 
	nop			;918c	00 	. 
	dec b			;918d	05 	. 
	ld b,a			;918e	47 	G 
	add a,b			;918f	80 	. 
	ld b,e			;9190	43 	C 
	or b			;9191	b0 	. 
	or b			;9192	b0 	. 
	sub b			;9193	90 	. 
	ld l,a			;9194	6f 	o 
	add a,b			;9195	80 	. 
	ld (hl),004h		;9196	36 04 	6 . 
	ld d,l			;9198	55 	U 
	add a,b			;9199	80 	. 
	ld b,b			;919a	40 	@ 
	sbc a,(hl)			;919b	9e 	. 
	add a,c			;919c	81 	. 
	sub l			;919d	95 	. 
	adc a,e			;919e	8b 	. 
	sub h			;919f	94 	. 
	ld (hl),043h		;91a0	36 43 	6 C 
	and b			;91a2	a0 	. 
	ld b,b			;91a3	40 	@ 
	xor b			;91a4	a8 	. 
	xor b			;91a5	a8 	. 
	ld b,d			;91a6	42 	B 
	and b			;91a7	a0 	. 
	ld b,c			;91a8	41 	A 
	add a,b			;91a9	80 	. 
	ld b,b			;91aa	40 	@ 
	xor a			;91ab	af 	. 
	sbc a,a			;91ac	9f 	. 
	adc a,(hl)			;91ad	8e 	. 
	cp a			;91ae	bf 	. 
	add a,l			;91af	85 	. 
	ld b,e			;91b0	43 	C 
	and b			;91b1	a0 	. 
	ld b,b			;91b2	40 	@ 
	xor b			;91b3	a8 	. 
	xor b			;91b4	a8 	. 
	ld b,d			;91b5	42 	B 
	and b			;91b6	a0 	. 
	ld l,e			;91b7	6b 	k 
	add a,b			;91b8	80 	. 
	ld sp,l8a40h		;91b9	31 40 8a 	1 @ . 
	cp (hl)			;91bc	be 	. 
	cp (hl)			;91bd	be 	. 
	add a,(hl)			;91be	86 	. 
	add a,b			;91bf	80 	. 
	and d			;91c0	a2 	. 
	cp a			;91c1	bf 	. 
	cp a			;91c2	bf 	. 
	or a			;91c3	b7 	. 
	add a,b			;91c4	80 	. 
	add a,d			;91c5	82 	. 
	xor (hl)			;91c6	ae 	. 
	cp (hl)			;91c7	be 	. 
	sbc a,(hl)			;91c8	9e 	. 
	ld l,d			;91c9	6a 	j 
	add a,b			;91ca	80 	. 
	ld sp,l8055h		;91cb	31 55 80 	1 U . 
	ld b,b			;91ce	40 	@ 
	cp a			;91cf	bf 	. 
	cp a			;91d0	bf 	. 
	cp h			;91d1	bc 	. 
	cp (hl)			;91d2	be 	. 
	cp a			;91d3	bf 	. 
	cp a			;91d4	bf 	. 
	cp a			;91d5	bf 	. 
	cp a			;91d6	bf 	. 
	cp a			;91d7	bf 	. 
	cp h			;91d8	bc 	. 
	cp (hl)			;91d9	be 	. 
	cp a			;91da	bf 	. 
	sub l			;91db	95 	. 
	ld (l8075h),a		;91dc	32 75 80 	2 u . 
	ld b,b			;91df	40 	@ 
	adc a,e			;91e0	8b 	. 
	xor a			;91e1	af 	. 
	cp a			;91e2	bf 	. 
	cp a			;91e3	bf 	. 
	cp a			;91e4	bf 	. 
	cp a			;91e5	bf 	. 
	cp a			;91e6	bf 	. 
	cp a			;91e7	bf 	. 
	cp a			;91e8	bf 	. 
	cp a			;91e9	bf 	. 
	cp a			;91ea	bf 	. 
	adc a,a			;91eb	8f 	. 
	ld h,b			;91ec	60 	` 
	add a,c			;91ed	81 	. 
	ld (l7402h),a		;91ee	32 02 74 	2 . t 
	add a,b			;91f1	80 	. 
	ld b,b			;91f2	40 	@ 
	xor e			;91f3	ab 	. 
	cp a			;91f4	bf 	. 
	cp a			;91f5	bf 	. 
	cp a			;91f6	bf 	. 
	cp a			;91f7	bf 	. 
	cp a			;91f8	bf 	. 
	cp a			;91f9	bf 	. 
	cp a			;91fa	bf 	. 
	ld h,b			;91fb	60 	` 
	add a,c			;91fc	81 	. 
	ld a,(hl)			;91fd	7e 	~ 
	add a,b			;91fe	80 	. 
	inc sp			;91ff	33 	3 
	inc bc			;9200	03 	. 
l9201h:
	ld b,b			;9201	40 	@ 
	xor d			;9202	aa 	. 
	cp a			;9203	bf 	. 
	cp a			;9204	bf 	. 
	cp a			;9205	bf 	. 
	cp a			;9206	bf 	. 
	cp a			;9207	bf 	. 
	cp a			;9208	bf 	. 
	cp a			;9209	bf 	. 
	ld l,d			;920a	6a 	j 
	add a,b			;920b	80 	. 
	inc (hl)			;920c	34 	4 
	inc bc			;920d	03 	. 
	ld b,b			;920e	40 	@ 
	xor d			;920f	aa 	. 
	cp a			;9210	bf 	. 
	cp a			;9211	bf 	. 
	cp a			;9212	bf 	. 
	cp a			;9213	bf 	. 
	cp a			;9214	bf 	. 
	cp a			;9215	bf 	. 
	cp a			;9216	bf 	. 
	ld l,d			;9217	6a 	j 
	add a,b			;9218	80 	. 
	inc (hl)			;9219	34 	4 
	inc bc			;921a	03 	. 
	ld b,b			;921b	40 	@ 
	xor d			;921c	aa 	. 
	cp a			;921d	bf 	. 
	cp a			;921e	bf 	. 
	cp a			;921f	bf 	. 
	cp a			;9220	bf 	. 
	cp a			;9221	bf 	. 
	cp a			;9222	bf 	. 
	cp a			;9223	bf 	. 
	ld l,d			;9224	6a 	j 
	add a,b			;9225	80 	. 
	inc (hl)			;9226	34 	4 
	inc bc			;9227	03 	. 
	ld b,b			;9228	40 	@ 
	xor d			;9229	aa 	. 
	cp a			;922a	bf 	. 
	cp a			;922b	bf 	. 
	cp a			;922c	bf 	. 
	cp a			;922d	bf 	. 
	cp a			;922e	bf 	. 
	cp a			;922f	bf 	. 
	cp a			;9230	bf 	. 
	ld l,d			;9231	6a 	j 
	add a,b			;9232	80 	. 
	inc (hl)			;9233	34 	4 
	inc bc			;9234	03 	. 
	ld b,b			;9235	40 	@ 
	adc a,d			;9236	8a 	. 
	sbc a,a			;9237	9f 	. 
	cp a			;9238	bf 	. 
	cp a			;9239	bf 	. 
	cp a			;923a	bf 	. 
	cp a			;923b	bf 	. 
	xor a			;923c	af 	. 
	cp a			;923d	bf 	. 
	ld l,d			;923e	6a 	j 
	add a,b			;923f	80 	. 
	inc (hl)			;9240	34 	4 
	inc bc			;9241	03 	. 
	ld a,l			;9242	7d 	} 
	add a,b			;9243	80 	. 
	ld a,h			;9244	7c 	| 
	add a,b			;9245	80 	. 
	ld b,b			;9246	40 	@ 
	adc a,d			;9247	8a 	. 
	xor e			;9248	ab 	. 
	adc a,e			;9249	8b 	. 
	ld h,b			;924a	60 	` 
	add a,c			;924b	81 	. 
	ld (hl),h			;924c	74 	t 
	add a,b			;924d	80 	. 
	ld (hl),b			;924e	70 	p 
	add a,c			;924f	81 	. 
	ld a,(hl)			;9250	7e 	~ 
	add a,b			;9251	80 	. 
	inc (hl)			;9252	34 	4 
	ld b,07ch		;9253	06 7c 	. | 
	add a,b			;9255	80 	. 
	ld a,(hl)			;9256	7e 	~ 
l9257h:
	add a,b			;9257	80 	. 
	nop			;9258	00 	. 
	dec b			;9259	05 	. 
	ld e,a			;925a	5f 	_ 
	add a,b			;925b	80 	. 
	ld c,a			;925c	4f 	O 
	add a,b			;925d	80 	. 
	add a,b			;925e	80 	. 
	add a,b			;925f	80 	. 
	scf			;9260	37 	7 
	inc b			;9261	04 	. 
	ld d,a			;9262	57 	W 
	add a,b			;9263	80 	. 
	ld b,b			;9264	40 	@ 
	cp b			;9265	b8 	. 
	add a,a			;9266	87 	. 
	sub a			;9267	97 	. 
	xor l			;9268	ad 	. 
	ld b,d			;9269	42 	B 
	sub b			;926a	90 	. 
	ld (hl),04fh		;926b	36 4f 	6 O 
	add a,b			;926d	80 	. 
	ld b,e			;926e	43 	C 
	and b			;926f	a0 	. 
	and b			;9270	a0 	. 
	ld c,e			;9271	4b 	K 
	add a,b			;9272	80 	. 
	ld b,l			;9273	45 	E 
	add a,b			;9274	80 	. 
	ld b,b			;9275	40 	@ 
	cp l			;9276	bd 	. 
	cp h			;9277	bc 	. 
	cp c			;9278	b9 	. 
	cp h			;9279	bc 	. 
	sub l			;927a	95 	. 
	ld c,a			;927b	4f 	O 
	add a,b			;927c	80 	. 
	ld b,e			;927d	43 	C 
	and b			;927e	a0 	. 
	and b			;927f	a0 	. 
	ld c,e			;9280	4b 	K 
	add a,b			;9281	80 	. 
	ld l,a			;9282	6f 	o 
	add a,b			;9283	80 	. 
	ld sp,0aa40h		;9284	31 40 aa 	1 @ . 
	cp d			;9287	ba 	. 
	cp d			;9288	ba 	. 
	sbc a,d			;9289	9a 	. 
	add a,b			;928a	80 	. 
	adc a,d			;928b	8a 	. 
	cp l			;928c	bd 	. 
	cp h			;928d	bc 	. 
	sbc a,a			;928e	9f 	. 
	add a,b			;928f	80 	. 
	adc a,d			;9290	8a 	. 
	cp d			;9291	ba 	. 
	cp d			;9292	ba 	. 
	cp d			;9293	ba 	. 
	ld l,d			;9294	6a 	j 
	add a,b			;9295	80 	. 
	ld sp,l8054h		;9296	31 54 80 	1 T . 
	ld b,b			;9299	40 	@ 
	cp a			;929a	bf 	. 
	cp a			;929b	bf 	. 
	or b			;929c	b0 	. 
	cp b			;929d	b8 	. 
	cp (hl)			;929e	be 	. 
	cp a			;929f	bf 	. 
	cp a			;92a0	bf 	. 
	cp a			;92a1	bf 	. 
	cp h			;92a2	bc 	. 
	or b			;92a3	b0 	. 
	cp d			;92a4	ba 	. 
	cp a			;92a5	bf 	. 
	sub l			;92a6	95 	. 
	ld a,(hl)			;92a7	7e 	~ 
	add a,b			;92a8	80 	. 
	ld sp,l8055h		;92a9	31 55 80 	1 U . 
	ld b,b			;92ac	40 	@ 
	xor a			;92ad	af 	. 
	cp a			;92ae	bf 	. 
	cp a			;92af	bf 	. 
	cp a			;92b0	bf 	. 
	cp a			;92b1	bf 	. 
	cp a			;92b2	bf 	. 
	cp a			;92b3	bf 	. 
	cp a			;92b4	bf 	. 
	cp a			;92b5	bf 	. 
	cp a			;92b6	bf 	. 
	cp a			;92b7	bf 	. 
	cp a			;92b8	bf 	. 
	add a,l			;92b9	85 	. 
	ld (l7c01h),a		;92ba	32 01 7c 	2 . | 
	add a,b			;92bd	80 	. 
	ld d,b			;92be	50 	P 
	add a,d			;92bf	82 	. 
	ld b,b			;92c0	40 	@ 
	xor a			;92c1	af 	. 
	cp a			;92c2	bf 	. 
	cp a			;92c3	bf 	. 
	cp a			;92c4	bf 	. 
	cp a			;92c5	bf 	. 
	cp a			;92c6	bf 	. 
	cp a			;92c7	bf 	. 
	cp a			;92c8	bf 	. 
	add a,a			;92c9	87 	. 
	ld a,b			;92ca	78 	x 
	add a,b			;92cb	80 	. 
	ld a,(hl)			;92cc	7e 	~ 
	add a,b			;92cd	80 	. 
	ld (04003h),a		;92ce	32 03 40 	2 . @ 
	xor d			;92d1	aa 	. 
	cp a			;92d2	bf 	. 
	cp a			;92d3	bf 	. 
	cp a			;92d4	bf 	. 
	cp a			;92d5	bf 	. 
	cp a			;92d6	bf 	. 
	cp a			;92d7	bf 	. 
	cp a			;92d8	bf 	. 
	ld l,d			;92d9	6a 	j 
	add a,b			;92da	80 	. 
	inc (hl)			;92db	34 	4 
	inc bc			;92dc	03 	. 
	ld b,b			;92dd	40 	@ 
	xor d			;92de	aa 	. 
	cp a			;92df	bf 	. 
	cp a			;92e0	bf 	. 
	cp a			;92e1	bf 	. 
	cp a			;92e2	bf 	. 
	cp a			;92e3	bf 	. 
	cp a			;92e4	bf 	. 
	cp a			;92e5	bf 	. 
	ld l,d			;92e6	6a 	j 
	add a,b			;92e7	80 	. 
	inc (hl)			;92e8	34 	4 
	inc bc			;92e9	03 	. 
	ld b,b			;92ea	40 	@ 
	xor d			;92eb	aa 	. 
	cp a			;92ec	bf 	. 
	cp a			;92ed	bf 	. 
	cp a			;92ee	bf 	. 
	cp a			;92ef	bf 	. 
	cp a			;92f0	bf 	. 
	cp a			;92f1	bf 	. 
	cp a			;92f2	bf 	. 
	ld l,d			;92f3	6a 	j 
	add a,b			;92f4	80 	. 
	inc (hl)			;92f5	34 	4 
	inc bc			;92f6	03 	. 
	ld b,b			;92f7	40 	@ 
	xor d			;92f8	aa 	. 
	cp a			;92f9	bf 	. 
	cp a			;92fa	bf 	. 
	cp a			;92fb	bf 	. 
	cp a			;92fc	bf 	. 
	cp a			;92fd	bf 	. 
	cp a			;92fe	bf 	. 
	cp a			;92ff	bf 	. 
	ld l,d			;9300	6a 	j 
	add a,b			;9301	80 	. 
	inc (hl)			;9302	34 	4 
	inc bc			;9303	03 	. 
	ld b,b			;9304	40 	@ 
	xor d			;9305	aa 	. 
	cp a			;9306	bf 	. 
	cp a			;9307	bf 	. 
	cp a			;9308	bf 	. 
	cp a			;9309	bf 	. 
	cp a			;930a	bf 	. 
	cp a			;930b	bf 	. 
	cp a			;930c	bf 	. 
	ld l,d			;930d	6a 	j 
	add a,b			;930e	80 	. 
	inc (hl)			;930f	34 	4 
	inc bc			;9310	03 	. 
	ld (hl),h			;9311	74 	t 
	add a,b			;9312	80 	. 
	ld (hl),b			;9313	70 	p 
	add a,c			;9314	81 	. 
	ld b,b			;9315	40 	@ 
	xor e			;9316	ab 	. 
	xor a			;9317	af 	. 
	xor a			;9318	af 	. 
	add a,a			;9319	87 	. 
	ld d,b			;931a	50 	P 
	add a,d			;931b	82 	. 
	ld b,b			;931c	40 	@ 
	add a,a			;931d	87 	. 
	ld a,d			;931e	7a 	z 
	add a,b			;931f	80 	. 
	inc (hl)			;9320	34 	4 
	dec b			;9321	05 	. 
	ld a,h			;9322	7c 	| 
	add a,b			;9323	80 	. 
	ld (hl),b			;9324	70 	p 
	add a,d			;9325	82 	. 
	ld a,b			;9326	78 	x 
	add a,b			;9327	80 	. 
	ld a,(hl)			;9328	7e 	~ 
	add a,b			;9329	80 	. 
	nop			;932a	00 	. 
	ld bc,0043fh		;932b	01 3f 04 	. ? . 
	ld e,a			;932e	5f 	_ 
	add a,b			;932f	80 	. 
	ld b,c			;9330	41 	A 
	and b			;9331	a0 	. 
	ld b,b			;9332	40 	@ 
	sbc a,h			;9333	9c 	. 
	sbc a,h			;9334	9c 	. 
	or h			;9335	b4 	. 
	ld c,e			;9336	4b 	K 
	add a,b			;9337	80 	. 
	ld (hl),001h		;9338	36 01 	6 . 
	ld c,a			;933a	4f 	O 
	add a,b			;933b	80 	. 
	add a,b			;933c	80 	. 
	ld l,a			;933d	6f 	o 
	add a,b			;933e	80 	. 
	ld d,l			;933f	55 	U 
	add a,b			;9340	80 	. 
	ld b,b			;9341	40 	@ 
	or a			;9342	b7 	. 
	or b			;9343	b0 	. 
	and l			;9344	a5 	. 
	or d			;9345	b2 	. 
	sub l			;9346	95 	. 
	ld a,a			;9347	7f 	 
	add a,b			;9348	80 	. 
	ld c,a			;9349	4f 	O 
	add a,b			;934a	80 	. 
	add a,b			;934b	80 	. 
	ld l,a			;934c	6f 	o 
	add a,b			;934d	80 	. 
	ld (la840h),a		;934e	32 40 a8 	2 @ . 
	xor d			;9351	aa 	. 
	xor d			;9352	aa 	. 
	xor b			;9353	a8 	. 
	add a,b			;9354	80 	. 
	xor e			;9355	ab 	. 
	or a			;9356	b7 	. 
	or e			;9357	b3 	. 
	cp a			;9358	bf 	. 
	add a,c			;9359	81 	. 
	xor b			;935a	a8 	. 
	xor d			;935b	aa 	. 
	xor d			;935c	aa 	. 
	xor b			;935d	a8 	. 
	ld l,d			;935e	6a 	j 
	add a,b			;935f	80 	. 
	ld sp,l8250h		;9360	31 50 82 	1 P . 
	ld b,b			;9363	40 	@ 
	cp a			;9364	bf 	. 
	cp a			;9365	bf 	. 
	add a,c			;9366	81 	. 
	and b			;9367	a0 	. 
	cp b			;9368	b8 	. 
	cp a			;9369	bf 	. 
	cp a			;936a	bf 	. 
	cp l			;936b	bd 	. 
	or b			;936c	b0 	. 
	add a,b			;936d	80 	. 
	xor e			;936e	ab 	. 
	cp a			;936f	bf 	. 
	sub a			;9370	97 	. 
	ld a,d			;9371	7a 	z 
	add a,b			;9372	80 	. 
	ld sp,l8055h		;9373	31 55 80 	1 U . 
	ld b,b			;9376	40 	@ 
	cp a			;9377	bf 	. 
	cp a			;9378	bf 	. 
	cp a			;9379	bf 	. 
	cp a			;937a	bf 	. 
	cp a			;937b	bf 	. 
	cp a			;937c	bf 	. 
	cp a			;937d	bf 	. 
	cp a			;937e	bf 	. 
	cp a			;937f	bf 	. 
	cp a			;9380	bf 	. 
	cp a			;9381	bf 	. 
	cp a			;9382	bf 	. 
	sub l			;9383	95 	. 
	ld (l807dh),a		;9384	32 7d 80 	2 } . 
	ld (hl),b			;9387	70 	p 
	add a,d			;9388	82 	. 
	ld b,b			;9389	40 	@ 
	adc a,e			;938a	8b 	. 
	cp a			;938b	bf 	. 
	cp a			;938c	bf 	. 
	cp a			;938d	bf 	. 
	cp a			;938e	bf 	. 
	cp a			;938f	bf 	. 
	cp a			;9390	bf 	. 
	cp a			;9391	bf 	. 
	cp a			;9392	bf 	. 
	sbc a,a			;9393	9f 	. 
	ld h,b			;9394	60 	` 
	add a,e			;9395	83 	. 
	ld a,b			;9396	78 	x 
	add a,b			;9397	80 	. 
	ld (l7d02h),a		;9398	32 02 7d 	2 . } 
	add a,b			;939b	80 	. 
	ld b,b			;939c	40 	@ 
	xor d			;939d	aa 	. 
	cp a			;939e	bf 	. 
	cp a			;939f	bf 	. 
	cp a			;93a0	bf 	. 
	cp a			;93a1	bf 	. 
	cp a			;93a2	bf 	. 
	cp a			;93a3	bf 	. 
	cp a			;93a4	bf 	. 
	ld l,b			;93a5	68 	h 
	add a,b			;93a6	80 	. 
	inc (hl)			;93a7	34 	4 
	inc bc			;93a8	03 	. 
	ld b,b			;93a9	40 	@ 
	xor d			;93aa	aa 	. 
	cp a			;93ab	bf 	. 
	cp a			;93ac	bf 	. 
	cp a			;93ad	bf 	. 
	cp a			;93ae	bf 	. 
	cp a			;93af	bf 	. 
	cp a			;93b0	bf 	. 
	cp a			;93b1	bf 	. 
	ld l,d			;93b2	6a 	j 
	add a,b			;93b3	80 	. 
	inc (hl)			;93b4	34 	4 
	inc bc			;93b5	03 	. 
	ld b,b			;93b6	40 	@ 
	xor d			;93b7	aa 	. 
	cp a			;93b8	bf 	. 
	cp a			;93b9	bf 	. 
	cp a			;93ba	bf 	. 
	cp a			;93bb	bf 	. 
	cp a			;93bc	bf 	. 
	cp a			;93bd	bf 	. 
	cp a			;93be	bf 	. 
	ld l,d			;93bf	6a 	j 
	add a,b			;93c0	80 	. 
	inc (hl)			;93c1	34 	4 
	inc bc			;93c2	03 	. 
	ld b,b			;93c3	40 	@ 
	xor d			;93c4	aa 	. 
	cp a			;93c5	bf 	. 
	cp a			;93c6	bf 	. 
	cp a			;93c7	bf 	. 
	cp a			;93c8	bf 	. 
	cp a			;93c9	bf 	. 
	cp a			;93ca	bf 	. 
	cp a			;93cb	bf 	. 
	ld l,d			;93cc	6a 	j 
	add a,b			;93cd	80 	. 
	inc (hl)			;93ce	34 	4 
	inc bc			;93cf	03 	. 
	ld b,b			;93d0	40 	@ 
	xor d			;93d1	aa 	. 
	cp a			;93d2	bf 	. 
	cp a			;93d3	bf 	. 
	cp a			;93d4	bf 	. 
	cp a			;93d5	bf 	. 
	cp a			;93d6	bf 	. 
	cp a			;93d7	bf 	. 
	cp a			;93d8	bf 	. 
	ld l,d			;93d9	6a 	j 
	add a,b			;93da	80 	. 
	inc (hl)			;93db	34 	4 
	inc bc			;93dc	03 	. 
	ld d,b			;93dd	50 	P 
	add a,d			;93de	82 	. 
	ld b,b			;93df	40 	@ 
	add a,a			;93e0	87 	. 
	xor a			;93e1	af 	. 
	cp a			;93e2	bf 	. 
	cp a			;93e3	bf 	. 
	sbc a,a			;93e4	9f 	. 
	adc a,e			;93e5	8b 	. 
	sbc a,a			;93e6	9f 	. 
	ld l,d			;93e7	6a 	j 
	add a,b			;93e8	80 	. 
	inc (hl)			;93e9	34 	4 
	dec b			;93ea	05 	. 
	ld (hl),b			;93eb	70 	p 
	add a,d			;93ec	82 	. 
	ld b,b			;93ed	40 	@ 
	adc a,d			;93ee	8a 	. 
	ld h,b			;93ef	60 	` 
	add a,d			;93f0	82 	. 
	ld a,b			;93f1	78 	x 
	add a,b			;93f2	80 	. 
	ld a,l			;93f3	7d 	} 
	add a,b			;93f4	80 	. 
	ld a,h			;93f5	7c 	| 
	add a,b			;93f6	80 	. 
	nop			;93f7	00 	. 
	inc b			;93f8	04 	. 
	ld e,a			;93f9	5f 	_ 
	add a,b			;93fa	80 	. 
	ld b,c			;93fb	41 	A 
	and b			;93fc	a0 	. 
	ld b,b			;93fd	40 	@ 
	sbc a,h			;93fe	9c 	. 
	sbc a,h			;93ff	9c 	. 
	or h			;9400	b4 	. 
	ld c,e			;9401	4b 	K 
	add a,b			;9402	80 	. 
	ld (hl),001h		;9403	36 01 	6 . 
	ld c,a			;9405	4f 	O 
	add a,b			;9406	80 	. 
	add a,b			;9407	80 	. 
	ld l,a			;9408	6f 	o 
	add a,b			;9409	80 	. 
	ld d,l			;940a	55 	U 
	add a,b			;940b	80 	. 
	ld b,b			;940c	40 	@ 
l940dh:
	or a			;940d	b7 	. 
	or b			;940e	b0 	. 
	and l			;940f	a5 	. 
	or d			;9410	b2 	. 
	sub l			;9411	95 	. 
	ld a,a			;9412	7f 	 
	add a,b			;9413	80 	. 
	ld c,a			;9414	4f 	O 
	add a,b			;9415	80 	. 
	add a,b			;9416	80 	. 
	ld l,a			;9417	6f 	o 
	add a,b			;9418	80 	. 
	ld (la840h),a		;9419	32 40 a8 	2 @ . 
	xor d			;941c	aa 	. 
	xor d			;941d	aa 	. 
	xor b			;941e	a8 	. 
	add a,b			;941f	80 	. 
	xor e			;9420	ab 	. 
	sub a			;9421	97 	. 
	add a,e			;9422	83 	. 
	cp a			;9423	bf 	. 
	add a,c			;9424	81 	. 
	xor b			;9425	a8 	. 
	xor d			;9426	aa 	. 
	xor d			;9427	aa 	. 
	xor b			;9428	a8 	. 
	ld l,d			;9429	6a 	j 
	add a,b			;942a	80 	. 
	ld sp,l8250h		;942b	31 50 82 	1 P . 
	ld b,b			;942e	40 	@ 
	cp a			;942f	bf 	. 
	cp a			;9430	bf 	. 
	add a,c			;9431	81 	. 
	add a,b			;9432	80 	. 
	add a,b			;9433	80 	. 
	cp e			;9434	bb 	. 
	cp a			;9435	bf 	. 
	sub c			;9436	91 	. 
	add a,b			;9437	80 	. 
	add a,b			;9438	80 	. 
	xor e			;9439	ab 	. 
	cp a			;943a	bf 	. 
	sub a			;943b	97 	. 
	ld a,d			;943c	7a 	z 
	add a,b			;943d	80 	. 
	ld sp,l8055h		;943e	31 55 80 	1 U . 
	ld b,b			;9441	40 	@ 
	cp a			;9442	bf 	. 
	cp a			;9443	bf 	. 
	cp l			;9444	bd 	. 
	cp (hl)			;9445	be 	. 
	cp a			;9446	bf 	. 
	cp a			;9447	bf 	. 
	cp a			;9448	bf 	. 
	cp a			;9449	bf 	. 
	cp a			;944a	bf 	. 
	cp h			;944b	bc 	. 
	cp a			;944c	bf 	. 
	cp a			;944d	bf 	. 
	sub l			;944e	95 	. 
	ld (l8075h),a		;944f	32 75 80 	2 u . 
	ld b,b			;9452	40 	@ 
	adc a,e			;9453	8b 	. 
	xor a			;9454	af 	. 
	cp a			;9455	bf 	. 
	cp a			;9456	bf 	. 
	cp a			;9457	bf 	. 
	cp a			;9458	bf 	. 
	cp a			;9459	bf 	. 
	cp a			;945a	bf 	. 
	cp a			;945b	bf 	. 
	cp a			;945c	bf 	. 
	cp a			;945d	bf 	. 
	adc a,a			;945e	8f 	. 
	ld h,b			;945f	60 	` 
	add a,c			;9460	81 	. 
l9461h:
	ld (l7402h),a		;9461	32 02 74 	2 . t 
	add a,b			;9464	80 	. 
	ld b,b			;9465	40 	@ 
	xor e			;9466	ab 	. 
	cp a			;9467	bf 	. 
	cp a			;9468	bf 	. 
	cp a			;9469	bf 	. 
	cp a			;946a	bf 	. 
	cp a			;946b	bf 	. 
	cp a			;946c	bf 	. 
	cp a			;946d	bf 	. 
	ld h,b			;946e	60 	` 
	add a,c			;946f	81 	. 
	ld a,(hl)			;9470	7e 	~ 
	add a,b			;9471	80 	. 
	inc sp			;9472	33 	3 
l9473h:
	inc bc			;9473	03 	. 
	ld b,b			;9474	40 	@ 
	xor d			;9475	aa 	. 
	cp a			;9476	bf 	. 
	cp a			;9477	bf 	. 
	cp a			;9478	bf 	. 
	cp a			;9479	bf 	. 
	cp a			;947a	bf 	. 
	cp a			;947b	bf 	. 
	cp a			;947c	bf 	. 
	ld l,d			;947d	6a 	j 
	add a,b			;947e	80 	. 
	inc (hl)			;947f	34 	4 
	inc bc			;9480	03 	. 
	ld b,b			;9481	40 	@ 
	xor d			;9482	aa 	. 
	cp a			;9483	bf 	. 
	cp a			;9484	bf 	. 
	cp a			;9485	bf 	. 
	cp a			;9486	bf 	. 
	cp a			;9487	bf 	. 
	cp a			;9488	bf 	. 
	cp a			;9489	bf 	. 
	ld l,d			;948a	6a 	j 
	add a,b			;948b	80 	. 
	inc (hl)			;948c	34 	4 
	inc bc			;948d	03 	. 
	ld b,b			;948e	40 	@ 
	xor d			;948f	aa 	. 
	cp a			;9490	bf 	. 
	cp a			;9491	bf 	. 
	cp a			;9492	bf 	. 
	cp a			;9493	bf 	. 
	cp a			;9494	bf 	. 
	cp a			;9495	bf 	. 
	cp a			;9496	bf 	. 
	ld l,d			;9497	6a 	j 
	add a,b			;9498	80 	. 
	inc (hl)			;9499	34 	4 
	inc bc			;949a	03 	. 
	ld b,b			;949b	40 	@ 
	xor d			;949c	aa 	. 
	cp a			;949d	bf 	. 
	cp a			;949e	bf 	. 
	cp a			;949f	bf 	. 
	cp a			;94a0	bf 	. 
	cp a			;94a1	bf 	. 
	cp a			;94a2	bf 	. 
	cp a			;94a3	bf 	. 
	ld l,d			;94a4	6a 	j 
	add a,b			;94a5	80 	. 
	inc (hl)			;94a6	34 	4 
	inc bc			;94a7	03 	. 
	ld b,b			;94a8	40 	@ 
	adc a,d			;94a9	8a 	. 
	sbc a,a			;94aa	9f 	. 
	cp a			;94ab	bf 	. 
	cp a			;94ac	bf 	. 
	cp a			;94ad	bf 	. 
	cp a			;94ae	bf 	. 
	xor a			;94af	af 	. 
	cp a			;94b0	bf 	. 
	ld l,d			;94b1	6a 	j 
	add a,b			;94b2	80 	. 
	inc (hl)			;94b3	34 	4 
	inc bc			;94b4	03 	. 
	ld a,l			;94b5	7d 	} 
	add a,b			;94b6	80 	. 
	ld a,h			;94b7	7c 	| 
	add a,b			;94b8	80 	. 
	ld b,b			;94b9	40 	@ 
	adc a,d			;94ba	8a 	. 
	xor e			;94bb	ab 	. 
	adc a,e			;94bc	8b 	. 
	ld h,b			;94bd	60 	` 
	add a,c			;94be	81 	. 
	ld (hl),h			;94bf	74 	t 
	add a,b			;94c0	80 	. 
	ld (hl),b			;94c1	70 	p 
	add a,c			;94c2	81 	. 
	ld a,(hl)			;94c3	7e 	~ 
	add a,b			;94c4	80 	. 
	inc (hl)			;94c5	34 	4 
	ld b,07ch		;94c6	06 7c 	. | 
	add a,b			;94c8	80 	. 
	ld a,(hl)			;94c9	7e 	~ 
	add a,b			;94ca	80 	. 
	nop			;94cb	00 	. 
	dec b			;94cc	05 	. 
	ld b,a			;94cd	47 	G 
	add a,b			;94ce	80 	. 
	ld b,e			;94cf	43 	C 
	or b			;94d0	b0 	. 
	or b			;94d1	b0 	. 
	sub b			;94d2	90 	. 
	ld l,a			;94d3	6f 	o 
	add a,b			;94d4	80 	. 
	ld (hl),004h		;94d5	36 04 	6 . 
	ld d,l			;94d7	55 	U 
	add a,b			;94d8	80 	. 
	ld b,b			;94d9	40 	@ 
	sbc a,(hl)			;94da	9e 	. 
	add a,c			;94db	81 	. 
	sub l			;94dc	95 	. 
	adc a,e			;94dd	8b 	. 
	sub h			;94de	94 	. 
	ld (hl),043h		;94df	36 43 	6 C 
	and b			;94e1	a0 	. 
	ld b,b			;94e2	40 	@ 
	xor b			;94e3	a8 	. 
	xor b			;94e4	a8 	. 
	ld b,d			;94e5	42 	B 
	and b			;94e6	a0 	. 
	ld b,c			;94e7	41 	A 
	add a,b			;94e8	80 	. 
	ld b,b			;94e9	40 	@ 
l94eah:
	xor a			;94ea	af 	. 
	sbc a,a			;94eb	9f 	. 
	adc a,(hl)			;94ec	8e 	. 
	cp a			;94ed	bf 	. 
	add a,l			;94ee	85 	. 
	ld b,e			;94ef	43 	C 
	and b			;94f0	a0 	. 
	ld b,b			;94f1	40 	@ 
	xor b			;94f2	a8 	. 
	xor b			;94f3	a8 	. 
	ld b,d			;94f4	42 	B 
	and b			;94f5	a0 	. 
	ld l,e			;94f6	6b 	k 
	add a,b			;94f7	80 	. 
	ld sp,l8a40h		;94f8	31 40 8a 	1 @ . 
	cp (hl)			;94fb	be 	. 
	cp (hl)			;94fc	be 	. 
	add a,(hl)			;94fd	86 	. 
	add a,b			;94fe	80 	. 
	add a,d			;94ff	82 	. 
	xor l			;9500	ad 	. 
l9501h:
	cp h			;9501	bc 	. 
	add a,a			;9502	87 	. 
	add a,b			;9503	80 	. 
l9504h:
	add a,d			;9504	82 	. 
	xor (hl)			;9505	ae 	. 
l9506h:
	cp (hl)			;9506	be 	. 
	sbc a,(hl)			;9507	9e 	. 
	ld l,d			;9508	6a 	j 
	add a,b			;9509	80 	. 
	ld sp,l8055h		;950a	31 55 80 	1 U . 
	ld b,b			;950d	40 	@ 
	cp a			;950e	bf 	. 
	cp a			;950f	bf 	. 
	or h			;9510	b4 	. 
	cp b			;9511	b8 	. 
	cp h			;9512	bc 	. 
	cp a			;9513	bf 	. 
	cp a			;9514	bf 	. 
	cp l			;9515	bd 	. 
	cp h			;9516	bc 	. 
	or b			;9517	b0 	. 
	cp (hl)			;9518	be 	. 
	cp a			;9519	bf 	. 
	sub l			;951a	95 	. 
	ld (l8055h),a		;951b	32 55 80 	2 U . 
l951eh:
	ld b,b			;951e	40 	@ 
	xor a			;951f	af 	. 
	cp a			;9520	bf 	. 
	cp a			;9521	bf 	. 
	cp a			;9522	bf 	. 
	cp a			;9523	bf 	. 
	cp a			;9524	bf 	. 
	cp a			;9525	bf 	. 
	cp a			;9526	bf 	. 
	cp a			;9527	bf 	. 
	cp a			;9528	bf 	. 
	cp a			;9529	bf 	. 
l952ah:
	cp a			;952a	bf 	. 
	add a,l			;952b	85 	. 
	ld (l7c01h),a		;952c	32 01 7c 	2 . | 
l952fh:
	add a,b			;952f	80 	. 
	ld d,b			;9530	50 	P 
	add a,d			;9531	82 	. 
	ld b,b			;9532	40 	@ 
	xor a			;9533	af 	. 
	cp a			;9534	bf 	. 
	cp a			;9535	bf 	. 
l9536h:
	cp a			;9536	bf 	. 
	cp a			;9537	bf 	. 
l9538h:
	cp a			;9538	bf 	. 
	cp a			;9539	bf 	. 
	cp a			;953a	bf 	. 
	add a,a			;953b	87 	. 
	ld a,b			;953c	78 	x 
l953dh:
	add a,b			;953d	80 	. 
	ld a,(hl)			;953e	7e 	~ 
	add a,b			;953f	80 	. 
	ld (04003h),a		;9540	32 03 40 	2 . @ 
	xor d			;9543	aa 	. 
	cp a			;9544	bf 	. 
	cp a			;9545	bf 	. 
	cp a			;9546	bf 	. 
	cp a			;9547	bf 	. 
l9548h:
	cp a			;9548	bf 	. 
	cp a			;9549	bf 	. 
	cp a			;954a	bf 	. 
	ld l,d			;954b	6a 	j 
	add a,b			;954c	80 	. 
l954dh:
	inc (hl)			;954d	34 	4 
	inc bc			;954e	03 	. 
l954fh:
	ld b,b			;954f	40 	@ 
	xor d			;9550	aa 	. 
	cp a			;9551	bf 	. 
	cp a			;9552	bf 	. 
	cp a			;9553	bf 	. 
	cp a			;9554	bf 	. 
	cp a			;9555	bf 	. 
	cp a			;9556	bf 	. 
	cp a			;9557	bf 	. 
l9558h:
	ld l,d			;9558	6a 	j 
	add a,b			;9559	80 	. 
l955ah:
	inc (hl)			;955a	34 	4 
	inc bc			;955b	03 	. 
	ld b,b			;955c	40 	@ 
	xor d			;955d	aa 	. 
l955eh:
	cp a			;955e	bf 	. 
	cp a			;955f	bf 	. 
l9560h:
	cp a			;9560	bf 	. 
l9561h:
	cp a			;9561	bf 	. 
	cp a			;9562	bf 	. 
l9563h:
	cp a			;9563	bf 	. 
	cp a			;9564	bf 	. 
	ld l,d			;9565	6a 	j 
	add a,b			;9566	80 	. 
l9567h:
	inc (hl)			;9567	34 	4 
	inc bc			;9568	03 	. 
	ld b,b			;9569	40 	@ 
l956ah:
	xor d			;956a	aa 	. 
l956bh:
	cp a			;956b	bf 	. 
	cp a			;956c	bf 	. 
	cp a			;956d	bf 	. 
l956eh:
	cp a			;956e	bf 	. 
	cp a			;956f	bf 	. 
	cp a			;9570	bf 	. 
	cp a			;9571	bf 	. 
	ld l,d			;9572	6a 	j 
	add a,b			;9573	80 	. 
	inc (hl)			;9574	34 	4 
	inc bc			;9575	03 	. 
	ld b,b			;9576	40 	@ 
	xor d			;9577	aa 	. 
l9578h:
	cp a			;9578	bf 	. 
	cp a			;9579	bf 	. 
	cp a			;957a	bf 	. 
	cp a			;957b	bf 	. 
	cp a			;957c	bf 	. 
l957dh:
	cp a			;957d	bf 	. 
	cp a			;957e	bf 	. 
	ld l,d			;957f	6a 	j 
	add a,b			;9580	80 	. 
	inc (hl)			;9581	34 	4 
sub_9582h:
	inc bc			;9582	03 	. 
	ld (hl),h			;9583	74 	t 
	add a,b			;9584	80 	. 
	ld (hl),b			;9585	70 	p 
	add a,c			;9586	81 	. 
l9587h:
	ld b,b			;9587	40 	@ 
l9588h:
	xor e			;9588	ab 	. 
	xor a			;9589	af 	. 
	xor a			;958a	af 	. 
l958bh:
	add a,a			;958b	87 	. 
	ld d,b			;958c	50 	P 
	add a,d			;958d	82 	. 
	ld b,b			;958e	40 	@ 
l958fh:
	add a,a			;958f	87 	. 
	ld a,d			;9590	7a 	z 
	add a,b			;9591	80 	. 
	inc (hl)			;9592	34 	4 
	dec b			;9593	05 	. 
	ld a,h			;9594	7c 	| 
l9595h:
	add a,b			;9595	80 	. 
	ld (hl),b			;9596	70 	p 
	add a,d			;9597	82 	. 
	ld a,b			;9598	78 	x 
l9599h:
	add a,b			;9599	80 	. 
	ld a,(hl)			;959a	7e 	~ 
	add a,b			;959b	80 	. 
l959ch:
	nop			;959c	00 	. 
	dec b			;959d	05 	. 
	ld e,a			;959e	5f 	_ 
	add a,b			;959f	80 	. 
l95a0h:
	ld c,a			;95a0	4f 	O 
l95a1h:
	add a,b			;95a1	80 	. 
	add a,b			;95a2	80 	. 
l95a3h:
	add a,b			;95a3	80 	. 
l95a4h:
	scf			;95a4	37 	7 
l95a5h:
	inc b			;95a5	04 	. 
	ld d,a			;95a6	57 	W 
l95a7h:
	add a,b			;95a7	80 	. 
	ld b,b			;95a8	40 	@ 
l95a9h:
	cp b			;95a9	b8 	. 
l95aah:
	add a,a			;95aa	87 	. 
	sub a			;95ab	97 	. 
	xor l			;95ac	ad 	. 
l95adh:
	ld b,d			;95ad	42 	B 
	sub b			;95ae	90 	. 
	ld (hl),04fh		;95af	36 4f 	6 O 
l95b1h:
	add a,b			;95b1	80 	. 
	ld b,e			;95b2	43 	C 
l95b3h:
	and b			;95b3	a0 	. 
	and b			;95b4	a0 	. 
	ld c,e			;95b5	4b 	K 
	add a,b			;95b6	80 	. 
	ld b,l			;95b7	45 	E 
l95b8h:
	add a,b			;95b8	80 	. 
	ld b,b			;95b9	40 	@ 
	cp l			;95ba	bd 	. 
	cp h			;95bb	bc 	. 
	cp c			;95bc	b9 	. 
	cp h			;95bd	bc 	. 
	sub l			;95be	95 	. 
	ld c,a			;95bf	4f 	O 
	add a,b			;95c0	80 	. 
	ld b,e			;95c1	43 	C 
	and b			;95c2	a0 	. 
	and b			;95c3	a0 	. 
	ld c,e			;95c4	4b 	K 
	add a,b			;95c5	80 	. 
	ld l,a			;95c6	6f 	o 
l95c7h:
	add a,b			;95c7	80 	. 
l95c8h:
	ld sp,0aa40h		;95c8	31 40 aa 	1 @ . 
	cp d			;95cb	ba 	. 
l95cch:
	cp d			;95cc	ba 	. 
l95cdh:
	sbc a,d			;95cd	9a 	. 
	add a,b			;95ce	80 	. 
l95cfh:
	adc a,d			;95cf	8a 	. 
	or l			;95d0	b5 	. 
	or b			;95d1	b0 	. 
l95d2h:
	sbc a,a			;95d2	9f 	. 
	add a,b			;95d3	80 	. 
l95d4h:
	adc a,d			;95d4	8a 	. 
	cp d			;95d5	ba 	. 
	cp d			;95d6	ba 	. 
	cp d			;95d7	ba 	. 
	ld l,d			;95d8	6a 	j 
	add a,b			;95d9	80 	. 
l95dah:
	ld sp,l8054h		;95da	31 54 80 	1 T . 
	ld b,b			;95dd	40 	@ 
	cp a			;95de	bf 	. 
	cp a			;95df	bf 	. 
	sub b			;95e0	90 	. 
l95e1h:
	and b			;95e1	a0 	. 
	or b			;95e2	b0 	. 
l95e3h:
	cp (hl)			;95e3	be 	. 
l95e4h:
	cp a			;95e4	bf 	. 
l95e5h:
	or h			;95e5	b4 	. 
	or b			;95e6	b0 	. 
l95e7h:
	add a,b			;95e7	80 	. 
	cp d			;95e8	ba 	. 
	cp a			;95e9	bf 	. 
	sub l			;95ea	95 	. 
l95ebh:
	ld a,(hl)			;95eb	7e 	~ 
	add a,b			;95ec	80 	. 
	ld sp,l8055h		;95ed	31 55 80 	1 U . 
	ld b,b			;95f0	40 	@ 
	cp a			;95f1	bf 	. 
	cp a			;95f2	bf 	. 
l95f3h:
	cp a			;95f3	bf 	. 
	cp a			;95f4	bf 	. 
	cp a			;95f5	bf 	. 
	cp a			;95f6	bf 	. 
	cp a			;95f7	bf 	. 
	cp a			;95f8	bf 	. 
l95f9h:
	cp a			;95f9	bf 	. 
	cp a			;95fa	bf 	. 
	cp a			;95fb	bf 	. 
	cp a			;95fc	bf 	. 
	sub l			;95fd	95 	. 
	ld (l807dh),a		;95fe	32 7d 80 	2 } . 
	ld (hl),b			;9601	70 	p 
	add a,d			;9602	82 	. 
	ld b,b			;9603	40 	@ 
	adc a,e			;9604	8b 	. 
	cp a			;9605	bf 	. 
	cp a			;9606	bf 	. 
	cp a			;9607	bf 	. 
	cp a			;9608	bf 	. 
	cp a			;9609	bf 	. 
	cp a			;960a	bf 	. 
	cp a			;960b	bf 	. 
	cp a			;960c	bf 	. 
	sbc a,a			;960d	9f 	. 
	ld h,b			;960e	60 	` 
	add a,e			;960f	83 	. 
	ld a,b			;9610	78 	x 
	add a,b			;9611	80 	. 
	ld (l7d02h),a		;9612	32 02 7d 	2 . } 
	add a,b			;9615	80 	. 
	ld b,b			;9616	40 	@ 
	xor d			;9617	aa 	. 
l9618h:
	cp a			;9618	bf 	. 
	cp a			;9619	bf 	. 
	cp a			;961a	bf 	. 
	cp a			;961b	bf 	. 
	cp a			;961c	bf 	. 
	cp a			;961d	bf 	. 
	cp a			;961e	bf 	. 
	ld l,b			;961f	68 	h 
l9620h:
	add a,b			;9620	80 	. 
	inc (hl)			;9621	34 	4 
	inc bc			;9622	03 	. 
	ld b,b			;9623	40 	@ 
l9624h:
	xor d			;9624	aa 	. 
	cp a			;9625	bf 	. 
	cp a			;9626	bf 	. 
	cp a			;9627	bf 	. 
	cp a			;9628	bf 	. 
	cp a			;9629	bf 	. 
	cp a			;962a	bf 	. 
	cp a			;962b	bf 	. 
	ld l,d			;962c	6a 	j 
	add a,b			;962d	80 	. 
	inc (hl)			;962e	34 	4 
	inc bc			;962f	03 	. 
	ld b,b			;9630	40 	@ 
	xor d			;9631	aa 	. 
	cp a			;9632	bf 	. 
	cp a			;9633	bf 	. 
	cp a			;9634	bf 	. 
	cp a			;9635	bf 	. 
	cp a			;9636	bf 	. 
	cp a			;9637	bf 	. 
	cp a			;9638	bf 	. 
	ld l,d			;9639	6a 	j 
	add a,b			;963a	80 	. 
	inc (hl)			;963b	34 	4 
	inc bc			;963c	03 	. 
	ld b,b			;963d	40 	@ 
	xor d			;963e	aa 	. 
	cp a			;963f	bf 	. 
	cp a			;9640	bf 	. 
	cp a			;9641	bf 	. 
	cp a			;9642	bf 	. 
	cp a			;9643	bf 	. 
	cp a			;9644	bf 	. 
	cp a			;9645	bf 	. 
	ld l,d			;9646	6a 	j 
	add a,b			;9647	80 	. 
	inc (hl)			;9648	34 	4 
	inc bc			;9649	03 	. 
	ld b,b			;964a	40 	@ 
	xor d			;964b	aa 	. 
	cp a			;964c	bf 	. 
	cp a			;964d	bf 	. 
	cp a			;964e	bf 	. 
	cp a			;964f	bf 	. 
	cp a			;9650	bf 	. 
	cp a			;9651	bf 	. 
	cp a			;9652	bf 	. 
	ld l,d			;9653	6a 	j 
	add a,b			;9654	80 	. 
	inc (hl)			;9655	34 	4 
	inc bc			;9656	03 	. 
	ld d,b			;9657	50 	P 
	add a,d			;9658	82 	. 
l9659h:
	ld b,b			;9659	40 	@ 
	add a,a			;965a	87 	. 
	xor a			;965b	af 	. 
	cp a			;965c	bf 	. 
	cp a			;965d	bf 	. 
	sbc a,a			;965e	9f 	. 
	adc a,e			;965f	8b 	. 
	sbc a,a			;9660	9f 	. 
	ld l,d			;9661	6a 	j 
	add a,b			;9662	80 	. 
	inc (hl)			;9663	34 	4 
	dec b			;9664	05 	. 
	ld (hl),b			;9665	70 	p 
	add a,d			;9666	82 	. 
	ld b,b			;9667	40 	@ 
	adc a,d			;9668	8a 	. 
	ld h,b			;9669	60 	` 
	add a,d			;966a	82 	. 
	ld a,b			;966b	78 	x 
	add a,b			;966c	80 	. 
	ld a,l			;966d	7d 	} 
	add a,b			;966e	80 	. 
	ld a,h			;966f	7c 	| 
	add a,b			;9670	80 	. 
	nop			;9671	00 	. 
	inc b			;9672	04 	. 
	ld e,a			;9673	5f 	_ 
	add a,b			;9674	80 	. 
	ld b,c			;9675	41 	A 
	and b			;9676	a0 	. 
	ld b,b			;9677	40 	@ 
	sbc a,h			;9678	9c 	. 
	sbc a,h			;9679	9c 	. 
	or h			;967a	b4 	. 
	ld c,e			;967b	4b 	K 
	add a,b			;967c	80 	. 
	ld (hl),04fh		;967d	36 4f 	6 O 
	add a,b			;967f	80 	. 
	ld b,e			;9680	43 	C 
	and b			;9681	a0 	. 
	and b			;9682	a0 	. 
	ld c,e			;9683	4b 	K 
	add a,b			;9684	80 	. 
	ld b,l			;9685	45 	E 
	add a,b			;9686	80 	. 
	ld b,b			;9687	40 	@ 
	or a			;9688	b7 	. 
	or b			;9689	b0 	. 
	and l			;968a	a5 	. 
	or d			;968b	b2 	. 
	sub l			;968c	95 	. 
	ld c,a			;968d	4f 	O 
	add a,b			;968e	80 	. 
	ld b,e			;968f	43 	C 
	and b			;9690	a0 	. 
	and b			;9691	a0 	. 
	ld c,e			;9692	4b 	K 
	add a,b			;9693	80 	. 
	ld l,a			;9694	6f 	o 
	add a,b			;9695	80 	. 
	ld sp,0aa40h		;9696	31 40 aa 	1 @ . 
	cp d			;9699	ba 	. 
	cp d			;969a	ba 	. 
	sbc a,d			;969b	9a 	. 
	add a,b			;969c	80 	. 
	xor e			;969d	ab 	. 
	sub a			;969e	97 	. 
	add a,e			;969f	83 	. 
	cp a			;96a0	bf 	. 
	add a,c			;96a1	81 	. 
	adc a,d			;96a2	8a 	. 
	cp d			;96a3	ba 	. 
	cp d			;96a4	ba 	. 
	cp d			;96a5	ba 	. 
	ld l,d			;96a6	6a 	j 
	add a,b			;96a7	80 	. 
	ld sp,l8054h		;96a8	31 54 80 	1 T . 
	ld b,b			;96ab	40 	@ 
	cp a			;96ac	bf 	. 
	cp a			;96ad	bf 	. 
	add a,b			;96ae	80 	. 
	add a,b			;96af	80 	. 
	add a,b			;96b0	80 	. 
	xor l			;96b1	ad 	. 
	cp h			;96b2	bc 	. 
	add a,l			;96b3	85 	. 
	add a,b			;96b4	80 	. 
	add a,b			;96b5	80 	. 
	xor d			;96b6	aa 	. 
	cp a			;96b7	bf 	. 
	sub l			;96b8	95 	. 
	ld a,(hl)			;96b9	7e 	~ 
	add a,b			;96ba	80 	. 
	ld sp,l8055h		;96bb	31 55 80 	1 U . 
	ld b,b			;96be	40 	@ 
	cp a			;96bf	bf 	. 
	cp a			;96c0	bf 	. 
	cp l			;96c1	bd 	. 
	cp (hl)			;96c2	be 	. 
	cp a			;96c3	bf 	. 
	cp a			;96c4	bf 	. 
	cp a			;96c5	bf 	. 
	cp a			;96c6	bf 	. 
	cp a			;96c7	bf 	. 
	cp h			;96c8	bc 	. 
	cp a			;96c9	bf 	. 
	cp a			;96ca	bf 	. 
	sub l			;96cb	95 	. 
	ld (l807dh),a		;96cc	32 7d 80 	2 } . 
	ld d,b			;96cf	50 	P 
	add a,d			;96d0	82 	. 
	ld b,b			;96d1	40 	@ 
	xor a			;96d2	af 	. 
	cp a			;96d3	bf 	. 
	cp a			;96d4	bf 	. 
	cp a			;96d5	bf 	. 
	cp a			;96d6	bf 	. 
	cp a			;96d7	bf 	. 
	cp a			;96d8	bf 	. 
	cp a			;96d9	bf 	. 
	cp a			;96da	bf 	. 
l96dbh:
	cp a			;96db	bf 	. 
	add a,a			;96dc	87 	. 
	ld a,b			;96dd	78 	x 
	add a,b			;96de	80 	. 
	ld (l7402h),a		;96df	32 02 74 	2 . t 
	add a,b			;96e2	80 	. 
	ld b,b			;96e3	40 	@ 
	xor e			;96e4	ab 	. 
	cp a			;96e5	bf 	. 
	cp a			;96e6	bf 	. 
	cp a			;96e7	bf 	. 
	cp a			;96e8	bf 	. 
	cp a			;96e9	bf 	. 
	cp a			;96ea	bf 	. 
	cp a			;96eb	bf 	. 
	ld h,b			;96ec	60 	` 
	add a,c			;96ed	81 	. 
	ld a,(hl)			;96ee	7e 	~ 
	add a,b			;96ef	80 	. 
	inc sp			;96f0	33 	3 
	inc bc			;96f1	03 	. 
	ld b,b			;96f2	40 	@ 
	xor d			;96f3	aa 	. 
	cp a			;96f4	bf 	. 
	cp a			;96f5	bf 	. 
	cp a			;96f6	bf 	. 
	cp a			;96f7	bf 	. 
	cp a			;96f8	bf 	. 
	cp a			;96f9	bf 	. 
	cp a			;96fa	bf 	. 
	ld l,d			;96fb	6a 	j 
	add a,b			;96fc	80 	. 
	inc (hl)			;96fd	34 	4 
	inc bc			;96fe	03 	. 
	ld b,b			;96ff	40 	@ 
	xor d			;9700	aa 	. 
	cp a			;9701	bf 	. 
	cp a			;9702	bf 	. 
	cp a			;9703	bf 	. 
	cp a			;9704	bf 	. 
	cp a			;9705	bf 	. 
	cp a			;9706	bf 	. 
	cp a			;9707	bf 	. 
	ld l,d			;9708	6a 	j 
	add a,b			;9709	80 	. 
	inc (hl)			;970a	34 	4 
	inc bc			;970b	03 	. 
	ld b,b			;970c	40 	@ 
	xor d			;970d	aa 	. 
	cp a			;970e	bf 	. 
	cp a			;970f	bf 	. 
	cp a			;9710	bf 	. 
	cp a			;9711	bf 	. 
	cp a			;9712	bf 	. 
	cp a			;9713	bf 	. 
	cp a			;9714	bf 	. 
	ld l,d			;9715	6a 	j 
	add a,b			;9716	80 	. 
	inc (hl)			;9717	34 	4 
	inc bc			;9718	03 	. 
	ld b,b			;9719	40 	@ 
	xor d			;971a	aa 	. 
	cp a			;971b	bf 	. 
	cp a			;971c	bf 	. 
	cp a			;971d	bf 	. 
	cp a			;971e	bf 	. 
	cp a			;971f	bf 	. 
	cp a			;9720	bf 	. 
	cp a			;9721	bf 	. 
	ld l,d			;9722	6a 	j 
	add a,b			;9723	80 	. 
	inc (hl)			;9724	34 	4 
	inc bc			;9725	03 	. 
	ld b,b			;9726	40 	@ 
	adc a,d			;9727	8a 	. 
	sbc a,a			;9728	9f 	. 
	cp a			;9729	bf 	. 
	cp a			;972a	bf 	. 
	cp a			;972b	bf 	. 
	cp a			;972c	bf 	. 
	xor a			;972d	af 	. 
	cp a			;972e	bf 	. 
	ld l,d			;972f	6a 	j 
	add a,b			;9730	80 	. 
	inc (hl)			;9731	34 	4 
	inc bc			;9732	03 	. 
	ld a,l			;9733	7d 	} 
	add a,b			;9734	80 	. 
	ld a,h			;9735	7c 	| 
	add a,b			;9736	80 	. 
	ld b,b			;9737	40 	@ 
	adc a,d			;9738	8a 	. 
	xor e			;9739	ab 	. 
	adc a,e			;973a	8b 	. 
	ld h,b			;973b	60 	` 
	add a,c			;973c	81 	. 
	ld (hl),h			;973d	74 	t 
	add a,b			;973e	80 	. 
	ld (hl),b			;973f	70 	p 
	add a,c			;9740	81 	. 
	ld a,(hl)			;9741	7e 	~ 
	add a,b			;9742	80 	. 
	inc (hl)			;9743	34 	4 
	ld b,07ch		;9744	06 7c 	. | 
	add a,b			;9746	80 	. 
	ld a,(hl)			;9747	7e 	~ 
	add a,b			;9748	80 	. 
	nop			;9749	00 	. 
	dec b			;974a	05 	. 
	ld b,a			;974b	47 	G 
	add a,b			;974c	80 	. 
	ld b,e			;974d	43 	C 
	or b			;974e	b0 	. 
	or b			;974f	b0 	. 
	sub b			;9750	90 	. 
	ld l,a			;9751	6f 	o 
	add a,b			;9752	80 	. 
	ld (hl),001h		;9753	36 01 	6 . 
	ld c,a			;9755	4f 	O 
	add a,b			;9756	80 	. 
	add a,b			;9757	80 	. 
	ld l,a			;9758	6f 	o 
	add a,b			;9759	80 	. 
	ld d,l			;975a	55 	U 
	add a,b			;975b	80 	. 
	ld b,b			;975c	40 	@ 
	sbc a,(hl)			;975d	9e 	. 
	add a,c			;975e	81 	. 
	sub l			;975f	95 	. 
	adc a,e			;9760	8b 	. 
	sub h			;9761	94 	. 
	ld a,a			;9762	7f 	 
	add a,b			;9763	80 	. 
	ld c,a			;9764	4f 	O 
l9765h:
	add a,b			;9765	80 	. 
	add a,b			;9766	80 	. 
	ld l,a			;9767	6f 	o 
	add a,b			;9768	80 	. 
	ld (la840h),a		;9769	32 40 a8 	2 @ . 
	xor d			;976c	aa 	. 
	xor d			;976d	aa 	. 
	xor b			;976e	a8 	. 
	add a,b			;976f	80 	. 
	xor a			;9770	af 	. 
	sbc a,a			;9771	9f 	. 
	adc a,(hl)			;9772	8e 	. 
	cp a			;9773	bf 	. 
	add a,l			;9774	85 	. 
	xor b			;9775	a8 	. 
	xor d			;9776	aa 	. 
	xor d			;9777	aa 	. 
	xor b			;9778	a8 	. 
	ld l,d			;9779	6a 	j 
	add a,b			;977a	80 	. 
	ld sp,l8250h		;977b	31 50 82 	1 P . 
	ld b,b			;977e	40 	@ 
	cp a			;977f	bf 	. 
	cp a			;9780	bf 	. 
	add a,c			;9781	81 	. 
	add a,b			;9782	80 	. 
	add a,d			;9783	82 	. 
	or l			;9784	b5 	. 
	or b			;9785	b0 	. 
	sub a			;9786	97 	. 
	add a,b			;9787	80 	. 
	add a,b			;9788	80 	. 
	xor e			;9789	ab 	. 
	cp a			;978a	bf 	. 
	sub a			;978b	97 	. 
	ld a,d			;978c	7a 	z 
	add a,b			;978d	80 	. 
	ld sp,l8055h		;978e	31 55 80 	1 U . 
	ld b,b			;9791	40 	@ 
	cp a			;9792	bf 	. 
	cp a			;9793	bf 	. 
	or h			;9794	b4 	. 
	cp b			;9795	b8 	. 
	cp h			;9796	bc 	. 
	cp (hl)			;9797	be 	. 
l9798h:
	cp a			;9798	bf 	. 
	cp h			;9799	bc 	. 
	cp h			;979a	bc 	. 
	or b			;979b	b0 	. 
	cp (hl)			;979c	be 	. 
	cp a			;979d	bf 	. 
	sub l			;979e	95 	. 
	ld (l8075h),a		;979f	32 75 80 	2 u . 
	ld b,b			;97a2	40 	@ 
	adc a,e			;97a3	8b 	. 
	cp a			;97a4	bf 	. 
	cp a			;97a5	bf 	. 
	cp a			;97a6	bf 	. 
	cp a			;97a7	bf 	. 
	cp a			;97a8	bf 	. 
	cp a			;97a9	bf 	. 
	cp a			;97aa	bf 	. 
	cp a			;97ab	bf 	. 
	cp a			;97ac	bf 	. 
	cp a			;97ad	bf 	. 
	sbc a,a			;97ae	9f 	. 
	ld h,b			;97af	60 	` 
	add a,c			;97b0	81 	. 
	ld (l7d01h),a		;97b1	32 01 7d 	2 . } 
	add a,b			;97b4	80 	. 
	ld d,b			;97b5	50 	P 
	add a,d			;97b6	82 	. 
	ld b,b			;97b7	40 	@ 
	xor a			;97b8	af 	. 
	cp a			;97b9	bf 	. 
	cp a			;97ba	bf 	. 
	cp a			;97bb	bf 	. 
	cp a			;97bc	bf 	. 
	cp a			;97bd	bf 	. 
	cp a			;97be	bf 	. 
	cp a			;97bf	bf 	. 
	add a,a			;97c0	87 	. 
	ld a,b			;97c1	78 	x 
	add a,b			;97c2	80 	. 
	inc sp			;97c3	33 	3 
	inc bc			;97c4	03 	. 
	ld b,b			;97c5	40 	@ 
	xor d			;97c6	aa 	. 
	cp a			;97c7	bf 	. 
	cp a			;97c8	bf 	. 
	cp a			;97c9	bf 	. 
	cp a			;97ca	bf 	. 
	cp a			;97cb	bf 	. 
	cp a			;97cc	bf 	. 
	cp a			;97cd	bf 	. 
	ld l,d			;97ce	6a 	j 
	add a,b			;97cf	80 	. 
	inc (hl)			;97d0	34 	4 
	inc bc			;97d1	03 	. 
	ld b,b			;97d2	40 	@ 
	xor d			;97d3	aa 	. 
	cp a			;97d4	bf 	. 
	cp a			;97d5	bf 	. 
	cp a			;97d6	bf 	. 
	cp a			;97d7	bf 	. 
	cp a			;97d8	bf 	. 
	cp a			;97d9	bf 	. 
	cp a			;97da	bf 	. 
	ld l,d			;97db	6a 	j 
	add a,b			;97dc	80 	. 
	inc (hl)			;97dd	34 	4 
	inc bc			;97de	03 	. 
	ld b,b			;97df	40 	@ 
	xor d			;97e0	aa 	. 
	cp a			;97e1	bf 	. 
	cp a			;97e2	bf 	. 
	cp a			;97e3	bf 	. 
	cp a			;97e4	bf 	. 
	cp a			;97e5	bf 	. 
	cp a			;97e6	bf 	. 
	cp a			;97e7	bf 	. 
	ld l,d			;97e8	6a 	j 
	add a,b			;97e9	80 	. 
	inc (hl)			;97ea	34 	4 
	inc bc			;97eb	03 	. 
	ld b,b			;97ec	40 	@ 
	xor d			;97ed	aa 	. 
	cp a			;97ee	bf 	. 
	cp a			;97ef	bf 	. 
	cp a			;97f0	bf 	. 
	cp a			;97f1	bf 	. 
	cp a			;97f2	bf 	. 
	cp a			;97f3	bf 	. 
	cp a			;97f4	bf 	. 
	ld l,d			;97f5	6a 	j 
	add a,b			;97f6	80 	. 
	inc (hl)			;97f7	34 	4 
	inc bc			;97f8	03 	. 
	ld b,b			;97f9	40 	@ 
	xor d			;97fa	aa 	. 
	cp a			;97fb	bf 	. 
	cp a			;97fc	bf 	. 
	cp a			;97fd	bf 	. 
	cp a			;97fe	bf 	. 
	cp a			;97ff	bf 	. 
	cp a			;9800	bf 	. 
l9801h:
	cp a			;9801	bf 	. 
	ld l,d			;9802	6a 	j 
	add a,b			;9803	80 	. 
	inc (hl)			;9804	34 	4 
	inc bc			;9805	03 	. 
	ld (hl),h			;9806	74 	t 
	add a,b			;9807	80 	. 
	ld (hl),b			;9808	70 	p 
	add a,c			;9809	81 	. 
	ld b,b			;980a	40 	@ 
	xor e			;980b	ab 	. 
	xor a			;980c	af 	. 
	xor a			;980d	af 	. 
	add a,a			;980e	87 	. 
	ld d,b			;980f	50 	P 
	add a,d			;9810	82 	. 
	ld b,b			;9811	40 	@ 
	add a,a			;9812	87 	. 
	ld a,d			;9813	7a 	z 
l9814h:
	add a,b			;9814	80 	. 
	inc (hl)			;9815	34 	4 
l9816h:
	dec b			;9816	05 	. 
	ld a,h			;9817	7c 	| 
	add a,b			;9818	80 	. 
	ld (hl),b			;9819	70 	p 
	add a,d			;981a	82 	. 
	ld a,b			;981b	78 	x 
	add a,b			;981c	80 	. 
	ld a,(hl)			;981d	7e 	~ 
l981eh:
	add a,b			;981e	80 	. 
	nop			;981f	00 	. 
	dec b			;9820	05 	. 
	ld e,a			;9821	5f 	_ 
	add a,b			;9822	80 	. 
	ld c,a			;9823	4f 	O 
	add a,b			;9824	80 	. 
l9825h:
	add a,b			;9825	80 	. 
	add a,b			;9826	80 	. 
	scf			;9827	37 	7 
	inc b			;9828	04 	. 
	ld d,a			;9829	57 	W 
	add a,b			;982a	80 	. 
	ld b,b			;982b	40 	@ 
	cp b			;982c	b8 	. 
	add a,a			;982d	87 	. 
	sub a			;982e	97 	. 
	xor l			;982f	ad 	. 
	ld b,d			;9830	42 	B 
	sub b			;9831	90 	. 
	ld (hl),043h		;9832	36 43 	6 C 
	and b			;9834	a0 	. 
	ld b,b			;9835	40 	@ 
	xor b			;9836	a8 	. 
	xor b			;9837	a8 	. 
	ld b,d			;9838	42 	B 
	and b			;9839	a0 	. 
	ld b,c			;983a	41 	A 
	add a,b			;983b	80 	. 
	ld b,b			;983c	40 	@ 
	cp l			;983d	bd 	. 
	cp h			;983e	bc 	. 
	cp c			;983f	b9 	. 
	cp h			;9840	bc 	. 
	sub l			;9841	95 	. 
	ld b,e			;9842	43 	C 
	and b			;9843	a0 	. 
l9844h:
	ld b,b			;9844	40 	@ 
	xor b			;9845	a8 	. 
	xor b			;9846	a8 	. 
	ld b,d			;9847	42 	B 
	and b			;9848	a0 	. 
	ld l,e			;9849	6b 	k 
	add a,b			;984a	80 	. 
	ld sp,l8a40h		;984b	31 40 8a 	1 @ . 
	cp (hl)			;984e	be 	. 
	cp (hl)			;984f	be 	. 
	add a,(hl)			;9850	86 	. 
	add a,b			;9851	80 	. 
	adc a,d			;9852	8a 	. 
l9853h:
	sub l			;9853	95 	. 
	add a,b			;9854	80 	. 
	sbc a,a			;9855	9f 	. 
	add a,b			;9856	80 	. 
	add a,d			;9857	82 	. 
l9858h:
	xor (hl)			;9858	ae 	. 
	cp (hl)			;9859	be 	. 
	sbc a,(hl)			;985a	9e 	. 
	ld l,d			;985b	6a 	j 
	add a,b			;985c	80 	. 
	ld sp,l8055h		;985d	31 55 80 	1 U . 
	ld b,b			;9860	40 	@ 
	cp a			;9861	bf 	. 
l9862h:
	cp a			;9862	bf 	. 
	sub b			;9863	90 	. 
	and b			;9864	a0 	. 
	or b			;9865	b0 	. 
	cp e			;9866	bb 	. 
	cp a			;9867	bf 	. 
	or c			;9868	b1 	. 
	or b			;9869	b0 	. 
	add a,b			;986a	80 	. 
	cp d			;986b	ba 	. 
	cp a			;986c	bf 	. 
	sub l			;986d	95 	. 
	ld (l8055h),a		;986e	32 55 80 	2 U . 
	ld b,b			;9871	40 	@ 
	xor a			;9872	af 	. 
	cp a			;9873	bf 	. 
	cp a			;9874	bf 	. 
	cp a			;9875	bf 	. 
	cp a			;9876	bf 	. 
	cp a			;9877	bf 	. 
	cp a			;9878	bf 	. 
	cp a			;9879	bf 	. 
	cp a			;987a	bf 	. 
	cp a			;987b	bf 	. 
	cp a			;987c	bf 	. 
	cp a			;987d	bf 	. 
	add a,l			;987e	85 	. 
	ld (07401h),a		;987f	32 01 74 	2 . t 
	add a,b			;9882	80 	. 
	ld b,b			;9883	40 	@ 
	adc a,e			;9884	8b 	. 
	cp a			;9885	bf 	. 
	cp a			;9886	bf 	. 
	cp a			;9887	bf 	. 
	cp a			;9888	bf 	. 
	cp a			;9889	bf 	. 
	cp a			;988a	bf 	. 
	cp a			;988b	bf 	. 
	cp a			;988c	bf 	. 
	sbc a,a			;988d	9f 	. 
	ld h,b			;988e	60 	` 
	add a,c			;988f	81 	. 
	ld a,(hl)			;9890	7e 	~ 
	add a,b			;9891	80 	. 
	ld (l7d02h),a		;9892	32 02 7d 	2 . } 
	add a,b			;9895	80 	. 
	ld b,b			;9896	40 	@ 
	xor d			;9897	aa 	. 
	cp a			;9898	bf 	. 
	cp a			;9899	bf 	. 
	cp a			;989a	bf 	. 
	cp a			;989b	bf 	. 
	cp a			;989c	bf 	. 
	cp a			;989d	bf 	. 
	cp a			;989e	bf 	. 
	ld l,b			;989f	68 	h 
	add a,b			;98a0	80 	. 
	inc (hl)			;98a1	34 	4 
	inc bc			;98a2	03 	. 
	ld b,b			;98a3	40 	@ 
	xor d			;98a4	aa 	. 
	cp a			;98a5	bf 	. 
	cp a			;98a6	bf 	. 
	cp a			;98a7	bf 	. 
	cp a			;98a8	bf 	. 
	cp a			;98a9	bf 	. 
	cp a			;98aa	bf 	. 
	cp a			;98ab	bf 	. 
	ld l,d			;98ac	6a 	j 
	add a,b			;98ad	80 	. 
	inc (hl)			;98ae	34 	4 
	inc bc			;98af	03 	. 
	ld b,b			;98b0	40 	@ 
	xor d			;98b1	aa 	. 
	cp a			;98b2	bf 	. 
	cp a			;98b3	bf 	. 
	cp a			;98b4	bf 	. 
	cp a			;98b5	bf 	. 
	cp a			;98b6	bf 	. 
	cp a			;98b7	bf 	. 
	cp a			;98b8	bf 	. 
	ld l,d			;98b9	6a 	j 
	add a,b			;98ba	80 	. 
	inc (hl)			;98bb	34 	4 
	inc bc			;98bc	03 	. 
	ld b,b			;98bd	40 	@ 
	xor d			;98be	aa 	. 
	cp a			;98bf	bf 	. 
	cp a			;98c0	bf 	. 
	cp a			;98c1	bf 	. 
	cp a			;98c2	bf 	. 
	cp a			;98c3	bf 	. 
	cp a			;98c4	bf 	. 
	cp a			;98c5	bf 	. 
	ld l,d			;98c6	6a 	j 
	add a,b			;98c7	80 	. 
	inc (hl)			;98c8	34 	4 
	inc bc			;98c9	03 	. 
	ld b,b			;98ca	40 	@ 
	xor d			;98cb	aa 	. 
	cp a			;98cc	bf 	. 
	cp a			;98cd	bf 	. 
	cp a			;98ce	bf 	. 
	cp a			;98cf	bf 	. 
	cp a			;98d0	bf 	. 
	cp a			;98d1	bf 	. 
	cp a			;98d2	bf 	. 
	ld l,d			;98d3	6a 	j 
	add a,b			;98d4	80 	. 
	inc (hl)			;98d5	34 	4 
	inc bc			;98d6	03 	. 
	ld d,b			;98d7	50 	P 
	add a,d			;98d8	82 	. 
	ld b,b			;98d9	40 	@ 
	add a,a			;98da	87 	. 
l98dbh:
	xor a			;98db	af 	. 
	cp a			;98dc	bf 	. 
	cp a			;98dd	bf 	. 
	sbc a,a			;98de	9f 	. 
	adc a,e			;98df	8b 	. 
	sbc a,a			;98e0	9f 	. 
	ld l,d			;98e1	6a 	j 
	add a,b			;98e2	80 	. 
	inc (hl)			;98e3	34 	4 
	dec b			;98e4	05 	. 
	ld (hl),b			;98e5	70 	p 
	add a,d			;98e6	82 	. 
	ld b,b			;98e7	40 	@ 
	adc a,d			;98e8	8a 	. 
	ld h,b			;98e9	60 	` 
	add a,d			;98ea	82 	. 
	ld a,b			;98eb	78 	x 
	add a,b			;98ec	80 	. 
	ld a,l			;98ed	7d 	} 
	add a,b			;98ee	80 	. 
	ld a,h			;98ef	7c 	| 
	add a,b			;98f0	80 	. 
	nop			;98f1	00 	. 
	inc b			;98f2	04 	. 
	ld e,a			;98f3	5f 	_ 
	add a,b			;98f4	80 	. 
	ld b,c			;98f5	41 	A 
	and b			;98f6	a0 	. 
	ld b,b			;98f7	40 	@ 
	sbc a,h			;98f8	9c 	. 
	sbc a,h			;98f9	9c 	. 
	or h			;98fa	b4 	. 
	ld c,e			;98fb	4b 	K 
	add a,b			;98fc	80 	. 
	ld (hl),043h		;98fd	36 43 	6 C 
	and b			;98ff	a0 	. 
	ld b,b			;9900	40 	@ 
l9901h:
	xor b			;9901	a8 	. 
	xor b			;9902	a8 	. 
	ld b,d			;9903	42 	B 
	and b			;9904	a0 	. 
	ld b,c			;9905	41 	A 
	add a,b			;9906	80 	. 
	ld b,b			;9907	40 	@ 
	or a			;9908	b7 	. 
	or h			;9909	b4 	. 
	and l			;990a	a5 	. 
	or (hl)			;990b	b6 	. 
	sub l			;990c	95 	. 
	ld b,e			;990d	43 	C 
	and b			;990e	a0 	. 
	ld b,b			;990f	40 	@ 
	xor b			;9910	a8 	. 
	xor b			;9911	a8 	. 
	and b			;9912	a0 	. 
	ld l,e			;9913	6b 	k 
	add a,b			;9914	80 	. 
	ld sp,l8a40h		;9915	31 40 8a 	1 @ . 
	cp (hl)			;9918	be 	. 
	cp (hl)			;9919	be 	. 
	add a,(hl)			;991a	86 	. 
	add a,b			;991b	80 	. 
	xor e			;991c	ab 	. 
	sub a			;991d	97 	. 
	add a,e			;991e	83 	. 
	cp a			;991f	bf 	. 
	add a,c			;9920	81 	. 
	add a,d			;9921	82 	. 
	xor (hl)			;9922	ae 	. 
	cp (hl)			;9923	be 	. 
	sbc a,(hl)			;9924	9e 	. 
	ld l,d			;9925	6a 	j 
	add a,b			;9926	80 	. 
	ld sp,l8055h		;9927	31 55 80 	1 U . 
	ld b,b			;992a	40 	@ 
	cp a			;992b	bf 	. 
	cp a			;992c	bf 	. 
	add a,b			;992d	80 	. 
	add a,b			;992e	80 	. 
	add a,b			;992f	80 	. 
	xor l			;9930	ad 	. 
	cp h			;9931	bc 	. 
	add a,l			;9932	85 	. 
	add a,b			;9933	80 	. 
	add a,b			;9934	80 	. 
	xor d			;9935	aa 	. 
	cp a			;9936	bf 	. 
	sub l			;9937	95 	. 
	ld (l8055h),a		;9938	32 55 80 	2 U . 
	ld b,b			;993b	40 	@ 
	xor a			;993c	af 	. 
	cp a			;993d	bf 	. 
	cp l			;993e	bd 	. 
	cp (hl)			;993f	be 	. 
	cp a			;9940	bf 	. 
	cp a			;9941	bf 	. 
	cp a			;9942	bf 	. 
	cp a			;9943	bf 	. 
	cp a			;9944	bf 	. 
	cp h			;9945	bc 	. 
	cp a			;9946	bf 	. 
	cp a			;9947	bf 	. 
	add a,l			;9948	85 	. 
	ld (05001h),a		;9949	32 01 50 	2 . P 
	add a,d			;994c	82 	. 
	ld b,b			;994d	40 	@ 
	xor a			;994e	af 	. 
	cp a			;994f	bf 	. 
	cp a			;9950	bf 	. 
	cp a			;9951	bf 	. 
	cp a			;9952	bf 	. 
	cp a			;9953	bf 	. 
	cp a			;9954	bf 	. 
	cp a			;9955	bf 	. 
	cp a			;9956	bf 	. 
	cp a			;9957	bf 	. 
	add a,a			;9958	87 	. 
	ld a,d			;9959	7a 	z 
	add a,b			;995a	80 	. 
	ld (l7402h),a		;995b	32 02 74 	2 . t 
	add a,b			;995e	80 	. 
	ld b,b			;995f	40 	@ 
	xor e			;9960	ab 	. 
	cp a			;9961	bf 	. 
	cp a			;9962	bf 	. 
	cp a			;9963	bf 	. 
	cp a			;9964	bf 	. 
	cp a			;9965	bf 	. 
	cp a			;9966	bf 	. 
	cp a			;9967	bf 	. 
	ld h,b			;9968	60 	` 
	add a,c			;9969	81 	. 
	ld a,(hl)			;996a	7e 	~ 
	add a,b			;996b	80 	. 
	inc sp			;996c	33 	3 
	inc bc			;996d	03 	. 
	ld b,b			;996e	40 	@ 
	xor d			;996f	aa 	. 
	cp a			;9970	bf 	. 
	cp a			;9971	bf 	. 
	cp a			;9972	bf 	. 
	cp a			;9973	bf 	. 
	cp a			;9974	bf 	. 
	cp a			;9975	bf 	. 
	cp a			;9976	bf 	. 
	ld l,d			;9977	6a 	j 
	add a,b			;9978	80 	. 
	inc (hl)			;9979	34 	4 
	inc bc			;997a	03 	. 
	ld b,b			;997b	40 	@ 
	xor d			;997c	aa 	. 
	cp a			;997d	bf 	. 
	cp a			;997e	bf 	. 
	cp a			;997f	bf 	. 
	cp a			;9980	bf 	. 
	cp a			;9981	bf 	. 
	cp a			;9982	bf 	. 
	cp a			;9983	bf 	. 
	ld l,d			;9984	6a 	j 
	add a,b			;9985	80 	. 
	inc (hl)			;9986	34 	4 
	inc bc			;9987	03 	. 
	ld b,b			;9988	40 	@ 
	xor d			;9989	aa 	. 
	cp a			;998a	bf 	. 
	cp a			;998b	bf 	. 
	cp a			;998c	bf 	. 
	cp a			;998d	bf 	. 
	cp a			;998e	bf 	. 
	cp a			;998f	bf 	. 
	cp a			;9990	bf 	. 
	ld l,d			;9991	6a 	j 
	add a,b			;9992	80 	. 
	inc (hl)			;9993	34 	4 
	inc bc			;9994	03 	. 
	ld b,b			;9995	40 	@ 
	xor d			;9996	aa 	. 
	cp a			;9997	bf 	. 
	cp a			;9998	bf 	. 
	cp a			;9999	bf 	. 
	cp a			;999a	bf 	. 
	cp a			;999b	bf 	. 
	cp a			;999c	bf 	. 
	cp a			;999d	bf 	. 
	ld l,d			;999e	6a 	j 
	add a,b			;999f	80 	. 
	inc (hl)			;99a0	34 	4 
	inc bc			;99a1	03 	. 
	ld b,b			;99a2	40 	@ 
	adc a,d			;99a3	8a 	. 
	sbc a,a			;99a4	9f 	. 
	cp a			;99a5	bf 	. 
	cp a			;99a6	bf 	. 
	cp a			;99a7	bf 	. 
	cp a			;99a8	bf 	. 
	xor a			;99a9	af 	. 
	cp a			;99aa	bf 	. 
	ld l,d			;99ab	6a 	j 
	add a,b			;99ac	80 	. 
	inc (hl)			;99ad	34 	4 
	inc bc			;99ae	03 	. 
	ld a,l			;99af	7d 	} 
	add a,b			;99b0	80 	. 
	ld a,h			;99b1	7c 	| 
	add a,b			;99b2	80 	. 
	ld b,b			;99b3	40 	@ 
	adc a,d			;99b4	8a 	. 
	xor e			;99b5	ab 	. 
	adc a,e			;99b6	8b 	. 
	ld h,b			;99b7	60 	` 
	add a,c			;99b8	81 	. 
	ld (hl),h			;99b9	74 	t 
	add a,b			;99ba	80 	. 
	ld (hl),b			;99bb	70 	p 
	add a,c			;99bc	81 	. 
	ld a,(hl)			;99bd	7e 	~ 
	add a,b			;99be	80 	. 
	inc (hl)			;99bf	34 	4 
	ld b,07ch		;99c0	06 7c 	. | 
	add a,b			;99c2	80 	. 
	ld a,(hl)			;99c3	7e 	~ 
	add a,b			;99c4	80 	. 
	nop			;99c5	00 	. 
	dec b			;99c6	05 	. 
	ld b,a			;99c7	47 	G 
	add a,b			;99c8	80 	. 
	ld b,e			;99c9	43 	C 
	or b			;99ca	b0 	. 
	or b			;99cb	b0 	. 
	sub b			;99cc	90 	. 
	ld l,a			;99cd	6f 	o 
	add a,b			;99ce	80 	. 
	ld (hl),04fh		;99cf	36 4f 	6 O 
	add a,b			;99d1	80 	. 
	ld b,e			;99d2	43 	C 
	and b			;99d3	a0 	. 
	and b			;99d4	a0 	. 
	ld c,e			;99d5	4b 	K 
	add a,b			;99d6	80 	. 
	ld b,l			;99d7	45 	E 
	add a,b			;99d8	80 	. 
	ld b,b			;99d9	40 	@ 
	sbc a,(hl)			;99da	9e 	. 
	sub c			;99db	91 	. 
	sub l			;99dc	95 	. 
	sbc a,e			;99dd	9b 	. 
	sub h			;99de	94 	. 
	ld c,a			;99df	4f 	O 
	add a,b			;99e0	80 	. 
	ld b,e			;99e1	43 	C 
	and b			;99e2	a0 	. 
	and b			;99e3	a0 	. 
	add a,b			;99e4	80 	. 
	ld l,a			;99e5	6f 	o 
	add a,b			;99e6	80 	. 
	ld sp,0aa40h		;99e7	31 40 aa 	1 @ . 
	cp d			;99ea	ba 	. 
	cp d			;99eb	ba 	. 
	sbc a,d			;99ec	9a 	. 
	add a,b			;99ed	80 	. 
	xor a			;99ee	af 	. 
	sbc a,a			;99ef	9f 	. 
	adc a,(hl)			;99f0	8e 	. 
	cp a			;99f1	bf 	. 
	add a,l			;99f2	85 	. 
	adc a,d			;99f3	8a 	. 
	cp d			;99f4	ba 	. 
	cp d			;99f5	ba 	. 
	cp d			;99f6	ba 	. 
	ld l,d			;99f7	6a 	j 
	add a,b			;99f8	80 	. 
	ld sp,l8054h		;99f9	31 54 80 	1 T . 
	ld b,b			;99fc	40 	@ 
	cp a			;99fd	bf 	. 
	cp a			;99fe	bf 	. 
	add a,b			;99ff	80 	. 
	add a,b			;9a00	80 	. 
	add a,d			;9a01	82 	. 
	or l			;9a02	b5 	. 
	or b			;9a03	b0 	. 
	sub a			;9a04	97 	. 
	add a,b			;9a05	80 	. 
	add a,b			;9a06	80 	. 
	xor d			;9a07	aa 	. 
	cp a			;9a08	bf 	. 
	sub l			;9a09	95 	. 
	ld a,(hl)			;9a0a	7e 	~ 
	add a,b			;9a0b	80 	. 
	ld sp,l8055h		;9a0c	31 55 80 	1 U . 
	ld b,b			;9a0f	40 	@ 
	cp a			;9a10	bf 	. 
	cp a			;9a11	bf 	. 
	or h			;9a12	b4 	. 
	cp b			;9a13	b8 	. 
	cp h			;9a14	bc 	. 
	cp (hl)			;9a15	be 	. 
	cp a			;9a16	bf 	. 
	cp h			;9a17	bc 	. 
	cp h			;9a18	bc 	. 
	or b			;9a19	b0 	. 
	cp (hl)			;9a1a	be 	. 
	cp a			;9a1b	bf 	. 
	sub l			;9a1c	95 	. 
	ld (l807dh),a		;9a1d	32 7d 80 	2 } . 
	ld b,b			;9a20	40 	@ 
	adc a,d			;9a21	8a 	. 
	cp a			;9a22	bf 	. 
	cp a			;9a23	bf 	. 
	cp a			;9a24	bf 	. 
	cp a			;9a25	bf 	. 
	cp a			;9a26	bf 	. 
	cp a			;9a27	bf 	. 
	cp a			;9a28	bf 	. 
	cp a			;9a29	bf 	. 
	cp a			;9a2a	bf 	. 
	cp a			;9a2b	bf 	. 
	sbc a,a			;9a2c	9f 	. 
	ld l,b			;9a2d	68 	h 
	add a,b			;9a2e	80 	. 
	ld (l7d01h),a		;9a2f	32 01 7d 	2 . } 
	add a,b			;9a32	80 	. 
	ld d,b			;9a33	50 	P 
	add a,d			;9a34	82 	. 
	ld b,b			;9a35	40 	@ 
	xor a			;9a36	af 	. 
	cp a			;9a37	bf 	. 
	cp a			;9a38	bf 	. 
	cp a			;9a39	bf 	. 
	cp a			;9a3a	bf 	. 
	cp a			;9a3b	bf 	. 
	cp a			;9a3c	bf 	. 
	cp a			;9a3d	bf 	. 
	add a,a			;9a3e	87 	. 
	ld a,b			;9a3f	78 	x 
	add a,b			;9a40	80 	. 
	inc sp			;9a41	33 	3 
	inc bc			;9a42	03 	. 
	ld b,b			;9a43	40 	@ 
	xor d			;9a44	aa 	. 
	cp a			;9a45	bf 	. 
	cp a			;9a46	bf 	. 
	cp a			;9a47	bf 	. 
	cp a			;9a48	bf 	. 
	cp a			;9a49	bf 	. 
	cp a			;9a4a	bf 	. 
	cp a			;9a4b	bf 	. 
	ld l,d			;9a4c	6a 	j 
	add a,b			;9a4d	80 	. 
	inc (hl)			;9a4e	34 	4 
	inc bc			;9a4f	03 	. 
	ld b,b			;9a50	40 	@ 
	xor d			;9a51	aa 	. 
	cp a			;9a52	bf 	. 
	cp a			;9a53	bf 	. 
	cp a			;9a54	bf 	. 
	cp a			;9a55	bf 	. 
	cp a			;9a56	bf 	. 
	cp a			;9a57	bf 	. 
	cp a			;9a58	bf 	. 
	ld l,d			;9a59	6a 	j 
	add a,b			;9a5a	80 	. 
	inc (hl)			;9a5b	34 	4 
	inc bc			;9a5c	03 	. 
	ld b,b			;9a5d	40 	@ 
	xor d			;9a5e	aa 	. 
	cp a			;9a5f	bf 	. 
	cp a			;9a60	bf 	. 
	cp a			;9a61	bf 	. 
l9a62h:
	cp a			;9a62	bf 	. 
	cp a			;9a63	bf 	. 
	cp a			;9a64	bf 	. 
	cp a			;9a65	bf 	. 
	ld l,d			;9a66	6a 	j 
	add a,b			;9a67	80 	. 
	inc (hl)			;9a68	34 	4 
	inc bc			;9a69	03 	. 
	ld b,b			;9a6a	40 	@ 
	xor d			;9a6b	aa 	. 
	cp a			;9a6c	bf 	. 
	cp a			;9a6d	bf 	. 
	cp a			;9a6e	bf 	. 
	cp a			;9a6f	bf 	. 
	cp a			;9a70	bf 	. 
	cp a			;9a71	bf 	. 
	cp a			;9a72	bf 	. 
	ld l,d			;9a73	6a 	j 
	add a,b			;9a74	80 	. 
	inc (hl)			;9a75	34 	4 
	inc bc			;9a76	03 	. 
	ld b,b			;9a77	40 	@ 
	xor d			;9a78	aa 	. 
	cp a			;9a79	bf 	. 
	cp a			;9a7a	bf 	. 
	cp a			;9a7b	bf 	. 
	cp a			;9a7c	bf 	. 
	cp a			;9a7d	bf 	. 
	cp a			;9a7e	bf 	. 
	cp a			;9a7f	bf 	. 
	ld l,d			;9a80	6a 	j 
	add a,b			;9a81	80 	. 
	inc (hl)			;9a82	34 	4 
	inc bc			;9a83	03 	. 
	ld (hl),h			;9a84	74 	t 
	add a,b			;9a85	80 	. 
	ld (hl),b			;9a86	70 	p 
	add a,c			;9a87	81 	. 
	ld b,b			;9a88	40 	@ 
	xor e			;9a89	ab 	. 
	xor a			;9a8a	af 	. 
	xor a			;9a8b	af 	. 
	add a,a			;9a8c	87 	. 
	ld d,b			;9a8d	50 	P 
	add a,d			;9a8e	82 	. 
	ld b,b			;9a8f	40 	@ 
	add a,a			;9a90	87 	. 
	ld a,d			;9a91	7a 	z 
	add a,b			;9a92	80 	. 
	inc (hl)			;9a93	34 	4 
l9a94h:
	dec b			;9a94	05 	. 
	ld a,h			;9a95	7c 	| 
	add a,b			;9a96	80 	. 
	ld (hl),b			;9a97	70 	p 
	add a,d			;9a98	82 	. 
	ld a,b			;9a99	78 	x 
	add a,b			;9a9a	80 	. 
	ld a,(hl)			;9a9b	7e 	~ 
	add a,b			;9a9c	80 	. 
	nop			;9a9d	00 	. 
	dec b			;9a9e	05 	. 
	ld e,a			;9a9f	5f 	_ 
	add a,b			;9aa0	80 	. 
	ld c,a			;9aa1	4f 	O 
l9aa2h:
	add a,b			;9aa2	80 	. 
	add a,b			;9aa3	80 	. 
	add a,b			;9aa4	80 	. 
	scf			;9aa5	37 	7 
l9aa6h:
	ld bc,l8080h		;9aa6	01 80 80 	. . . 
	ld l,a			;9aa9	6f 	o 
	add a,b			;9aaa	80 	. 
	ld d,a			;9aab	57 	W 
	add a,b			;9aac	80 	. 
	ld b,b			;9aad	40 	@ 
	cp b			;9aae	b8 	. 
	add a,a			;9aaf	87 	. 
	sub a			;9ab0	97 	. 
	xor l			;9ab1	ad 	. 
	ld b,d			;9ab2	42 	B 
	sub b			;9ab3	90 	. 
	ld a,a			;9ab4	7f 	 
	add a,b			;9ab5	80 	. 
	ld c,a			;9ab6	4f 	O 
	add a,b			;9ab7	80 	. 
	add a,b			;9ab8	80 	. 
	add a,b			;9ab9	80 	. 
	ld (la840h),a		;9aba	32 40 a8 	2 @ . 
	xor d			;9abd	aa 	. 
	xor d			;9abe	aa 	. 
	xor b			;9abf	a8 	. 
	add a,b			;9ac0	80 	. 
	cp l			;9ac1	bd 	. 
	cp l			;9ac2	bd 	. 
	cp c			;9ac3	b9 	. 
	cp l			;9ac4	bd 	. 
	sub l			;9ac5	95 	. 
	xor b			;9ac6	a8 	. 
	xor d			;9ac7	aa 	. 
	xor d			;9ac8	aa 	. 
	xor b			;9ac9	a8 	. 
	ld l,d			;9aca	6a 	j 
	add a,b			;9acb	80 	. 
	ld sp,l8250h		;9acc	31 50 82 	1 P . 
	ld b,b			;9acf	40 	@ 
	cp a			;9ad0	bf 	. 
	cp a			;9ad1	bf 	. 
	add a,c			;9ad2	81 	. 
	add a,b			;9ad3	80 	. 
	adc a,d			;9ad4	8a 	. 
	sub l			;9ad5	95 	. 
	add a,b			;9ad6	80 	. 
	sbc a,a			;9ad7	9f 	. 
	add a,b			;9ad8	80 	. 
	add a,b			;9ad9	80 	. 
	xor e			;9ada	ab 	. 
	cp a			;9adb	bf 	. 
	sub a			;9adc	97 	. 
	ld a,d			;9add	7a 	z 
	add a,b			;9ade	80 	. 
	ld sp,l8055h		;9adf	31 55 80 	1 U . 
	ld b,b			;9ae2	40 	@ 
	cp a			;9ae3	bf 	. 
	cp a			;9ae4	bf 	. 
	sub b			;9ae5	90 	. 
	and b			;9ae6	a0 	. 
	or b			;9ae7	b0 	. 
	cp e			;9ae8	bb 	. 
	cp a			;9ae9	bf 	. 
	or c			;9aea	b1 	. 
	or b			;9aeb	b0 	. 
	add a,b			;9aec	80 	. 
	cp d			;9aed	ba 	. 
	cp a			;9aee	bf 	. 
	sub l			;9aef	95 	. 
	ld (l8075h),a		;9af0	32 75 80 	2 u . 
	ld b,b			;9af3	40 	@ 
	xor e			;9af4	ab 	. 
	cp a			;9af5	bf 	. 
	cp a			;9af6	bf 	. 
	cp a			;9af7	bf 	. 
	cp a			;9af8	bf 	. 
	cp a			;9af9	bf 	. 
	cp a			;9afa	bf 	. 
	cp a			;9afb	bf 	. 
	cp a			;9afc	bf 	. 
	cp a			;9afd	bf 	. 
	cp a			;9afe	bf 	. 
	cp a			;9aff	bf 	. 
	ld h,b			;9b00	60 	` 
	add a,c			;9b01	81 	. 
	ld (07401h),a		;9b02	32 01 74 	2 . t 
	add a,b			;9b05	80 	. 
	ld b,b			;9b06	40 	@ 
	adc a,e			;9b07	8b 	. 
	cp a			;9b08	bf 	. 
	cp a			;9b09	bf 	. 
	cp a			;9b0a	bf 	. 
	cp a			;9b0b	bf 	. 
	cp a			;9b0c	bf 	. 
	cp a			;9b0d	bf 	. 
	cp a			;9b0e	bf 	. 
	cp a			;9b0f	bf 	. 
	sbc a,a			;9b10	9f 	. 
	ld h,b			;9b11	60 	` 
	add a,c			;9b12	81 	. 
	ld a,(hl)			;9b13	7e 	~ 
	add a,b			;9b14	80 	. 
	ld (l7d02h),a		;9b15	32 02 7d 	2 . } 
	add a,b			;9b18	80 	. 
	ld b,b			;9b19	40 	@ 
	xor d			;9b1a	aa 	. 
	cp a			;9b1b	bf 	. 
	cp a			;9b1c	bf 	. 
	cp a			;9b1d	bf 	. 
	cp a			;9b1e	bf 	. 
	cp a			;9b1f	bf 	. 
	cp a			;9b20	bf 	. 
	cp a			;9b21	bf 	. 
	ld l,b			;9b22	68 	h 
	add a,b			;9b23	80 	. 
	inc (hl)			;9b24	34 	4 
	inc bc			;9b25	03 	. 
	ld b,b			;9b26	40 	@ 
	xor d			;9b27	aa 	. 
	cp a			;9b28	bf 	. 
	cp a			;9b29	bf 	. 
	cp a			;9b2a	bf 	. 
	cp a			;9b2b	bf 	. 
	cp a			;9b2c	bf 	. 
	cp a			;9b2d	bf 	. 
	cp a			;9b2e	bf 	. 
	ld l,d			;9b2f	6a 	j 
	add a,b			;9b30	80 	. 
	inc (hl)			;9b31	34 	4 
	inc bc			;9b32	03 	. 
	ld b,b			;9b33	40 	@ 
	xor d			;9b34	aa 	. 
	cp a			;9b35	bf 	. 
	cp a			;9b36	bf 	. 
	cp a			;9b37	bf 	. 
	cp a			;9b38	bf 	. 
	cp a			;9b39	bf 	. 
	cp a			;9b3a	bf 	. 
	cp a			;9b3b	bf 	. 
	ld l,d			;9b3c	6a 	j 
	add a,b			;9b3d	80 	. 
	inc (hl)			;9b3e	34 	4 
	inc bc			;9b3f	03 	. 
	ld b,b			;9b40	40 	@ 
	xor d			;9b41	aa 	. 
	cp a			;9b42	bf 	. 
	cp a			;9b43	bf 	. 
	cp a			;9b44	bf 	. 
	cp a			;9b45	bf 	. 
	cp a			;9b46	bf 	. 
	cp a			;9b47	bf 	. 
	cp a			;9b48	bf 	. 
	ld l,d			;9b49	6a 	j 
	add a,b			;9b4a	80 	. 
	inc (hl)			;9b4b	34 	4 
	inc bc			;9b4c	03 	. 
	ld b,b			;9b4d	40 	@ 
	xor d			;9b4e	aa 	. 
	cp a			;9b4f	bf 	. 
	cp a			;9b50	bf 	. 
	cp a			;9b51	bf 	. 
	cp a			;9b52	bf 	. 
	cp a			;9b53	bf 	. 
	cp a			;9b54	bf 	. 
	cp a			;9b55	bf 	. 
	ld l,d			;9b56	6a 	j 
	add a,b			;9b57	80 	. 
	inc (hl)			;9b58	34 	4 
	inc bc			;9b59	03 	. 
	ld d,b			;9b5a	50 	P 
	add a,d			;9b5b	82 	. 
	ld b,b			;9b5c	40 	@ 
	add a,a			;9b5d	87 	. 
	xor a			;9b5e	af 	. 
	cp a			;9b5f	bf 	. 
	cp a			;9b60	bf 	. 
	sbc a,a			;9b61	9f 	. 
	adc a,e			;9b62	8b 	. 
	sbc a,a			;9b63	9f 	. 
	ld l,d			;9b64	6a 	j 
	add a,b			;9b65	80 	. 
	inc (hl)			;9b66	34 	4 
	dec b			;9b67	05 	. 
	ld (hl),b			;9b68	70 	p 
	add a,d			;9b69	82 	. 
	ld b,b			;9b6a	40 	@ 
	adc a,d			;9b6b	8a 	. 
	ld h,b			;9b6c	60 	` 
	add a,d			;9b6d	82 	. 
	ld a,b			;9b6e	78 	x 
	add a,b			;9b6f	80 	. 
	ld a,l			;9b70	7d 	} 
	add a,b			;9b71	80 	. 
	ld a,h			;9b72	7c 	| 
	add a,b			;9b73	80 	. 
	nop			;9b74	00 	. 
	ld bc,l9b78h		;9b75	01 78 9b 	. x . 
l9b78h:
	add a,h			;9b78	84 	. 
	sbc a,e			;9b79	9b 	. 
	add a,h			;9b7a	84 	. 
	sbc a,e			;9b7b	9b 	. 
	cp c			;9b7c	b9 	. 
	sbc a,h			;9b7d	9c 	. 
	cp c			;9b7e	b9 	. 
	sbc a,h			;9b7f	9c 	. 
	rst 18h			;9b80	df 	. 
	sbc a,l			;9b81	9d 	. 
	rst 18h			;9b82	df 	. 
	sbc a,l			;9b83	9d 	. 
	ld b,0a8h		;9b84	06 a8 	. . 
	sbc a,h			;9b86	9c 	. 
	adc a,h			;9b87	8c 	. 
	adc a,h			;9b88	8c 	. 
	sbc a,h			;9b89	9c 	. 
	adc a,h			;9b8a	8c 	. 
	adc a,h			;9b8b	8c 	. 
	cp h			;9b8c	bc 	. 
	ld l,d			;9b8d	6a 	j 
	add a,b			;9b8e	80 	. 
	ld sp,04006h		;9b8f	31 06 40 	1 . @ 
	xor d			;9b92	aa 	. 
	sub l			;9b93	95 	. 
	or a			;9b94	b7 	. 
	sub l			;9b95	95 	. 
	sub l			;9b96	95 	. 
	or a			;9b97	b7 	. 
	sub l			;9b98	95 	. 
	cp a			;9b99	bf 	. 
	ld l,d			;9b9a	6a 	j 
	add a,b			;9b9b	80 	. 
	ld sp,04f01h		;9b9c	31 01 4f 	1 . O 
	add a,b			;9b9f	80 	. 
	add a,b			;9ba0	80 	. 
	add a,b			;9ba1	80 	. 
	ld l,a			;9ba2	6f 	o 
	add a,b			;9ba3	80 	. 
	ld a,a			;9ba4	7f 	 
	add a,b			;9ba5	80 	. 
	ld b,b			;9ba6	40 	@ 
	xor d			;9ba7	aa 	. 
	cp l			;9ba8	bd 	. 
	cp h			;9ba9	bc 	. 
	sbc a,h			;9baa	9c 	. 
	sbc a,l			;9bab	9d 	. 
	cp h			;9bac	bc 	. 
	cp h			;9bad	bc 	. 
	cp a			;9bae	bf 	. 
	ld l,d			;9baf	6a 	j 
	add a,b			;9bb0	80 	. 
	ld a,a			;9bb1	7f 	 
	add a,b			;9bb2	80 	. 
	ld c,a			;9bb3	4f 	O 
	add a,b			;9bb4	80 	. 
	add a,b			;9bb5	80 	. 
	add a,b			;9bb6	80 	. 
	ld l,a			;9bb7	6f 	o 
	add a,b			;9bb8	80 	. 
	inc l			;9bb9	2c 	, 
	ld b,b			;9bba	40 	@ 
	xor b			;9bbb	a8 	. 
	xor d			;9bbc	aa 	. 
	xor d			;9bbd	aa 	. 
	xor d			;9bbe	aa 	. 
	ld c,d			;9bbf	4a 	J 
	add a,b			;9bc0	80 	. 
	ld l,a			;9bc1	6f 	o 
	add a,b			;9bc2	80 	. 
	ld b,b			;9bc3	40 	@ 
	xor d			;9bc4	aa 	. 
	sub a			;9bc5	97 	. 
	add a,a			;9bc6	87 	. 
	adc a,e			;9bc7	8b 	. 
	adc a,e			;9bc8	8b 	. 
	adc a,e			;9bc9	8b 	. 
	add a,e			;9bca	83 	. 
	cp a			;9bcb	bf 	. 
	ld l,d			;9bcc	6a 	j 
	add a,b			;9bcd	80 	. 
	ld c,a			;9bce	4f 	O 
	add a,b			;9bcf	80 	. 
	ld b,b			;9bd0	40 	@ 
	xor d			;9bd1	aa 	. 
	xor d			;9bd2	aa 	. 
	xor d			;9bd3	aa 	. 
	xor b			;9bd4	a8 	. 
	ld l,d			;9bd5	6a 	j 
	add a,b			;9bd6	80 	. 
	dec hl			;9bd7	2b 	+ 
	ld b,b			;9bd8	40 	@ 
	xor d			;9bd9	aa 	. 
	cp a			;9bda	bf 	. 
	cp a			;9bdb	bf 	. 
	cp a			;9bdc	bf 	. 
	cp d			;9bdd	ba 	. 
	ld l,d			;9bde	6a 	j 
	add a,b			;9bdf	80 	. 
	ld b,b			;9be0	40 	@ 
	xor d			;9be1	aa 	. 
	sub l			;9be2	95 	. 
	add a,b			;9be3	80 	. 
	add a,b			;9be4	80 	. 
	add a,b			;9be5	80 	. 
	add a,b			;9be6	80 	. 
	add a,b			;9be7	80 	. 
	cp a			;9be8	bf 	. 
	ld l,d			;9be9	6a 	j 
	add a,b			;9bea	80 	. 
	ld b,b			;9beb	40 	@ 
	xor d			;9bec	aa 	. 
	cp d			;9bed	ba 	. 
	cp a			;9bee	bf 	. 
	cp a			;9bef	bf 	. 
	cp a			;9bf0	bf 	. 
	ld l,d			;9bf1	6a 	j 
	add a,b			;9bf2	80 	. 
	dec hl			;9bf3	2b 	+ 
	ld d,h			;9bf4	54 	T 
	add a,b			;9bf5	80 	. 
	ld b,b			;9bf6	40 	@ 
	cp a			;9bf7	bf 	. 
	cp a			;9bf8	bf 	. 
	cp a			;9bf9	bf 	. 
	ld h,b			;9bfa	60 	` 
	add a,c			;9bfb	81 	. 
	ld a,(hl)			;9bfc	7e 	~ 
	add a,b			;9bfd	80 	. 
	ld b,b			;9bfe	40 	@ 
	xor d			;9bff	aa 	. 
	or l			;9c00	b5 	. 
	cp b			;9c01	b8 	. 
	or b			;9c02	b0 	. 
	or h			;9c03	b4 	. 
	or h			;9c04	b4 	. 
	or b			;9c05	b0 	. 
	cp a			;9c06	bf 	. 
	ld l,d			;9c07	6a 	j 
l9c08h:
	add a,b			;9c08	80 	. 
	ld (hl),h			;9c09	74 	t 
	add a,b			;9c0a	80 	. 
	ld b,b			;9c0b	40 	@ 
	xor e			;9c0c	ab 	. 
	cp a			;9c0d	bf 	. 
	cp a			;9c0e	bf 	. 
l9c0fh:
	sub l			;9c0f	95 	. 
	ld a,(hl)			;9c10	7e 	~ 
	add a,b			;9c11	80 	. 
	dec hl			;9c12	2b 	+ 
	ld d,l			;9c13	55 	U 
	add a,b			;9c14	80 	. 
	ld b,b			;9c15	40 	@ 
	cp a			;9c16	bf 	. 
	cp a			;9c17	bf 	. 
	cp a			;9c18	bf 	. 
	ld c,d			;9c19	4a 	J 
	add a,b			;9c1a	80 	. 
	ld c,a			;9c1b	4f 	O 
	add a,b			;9c1c	80 	. 
	ld b,b			;9c1d	40 	@ 
	xor d			;9c1e	aa 	. 
	cp a			;9c1f	bf 	. 
	cp a			;9c20	bf 	. 
	cp a			;9c21	bf 	. 
	cp a			;9c22	bf 	. 
	cp a			;9c23	bf 	. 
	cp a			;9c24	bf 	. 
l9c25h:
	cp a			;9c25	bf 	. 
	ld c,d			;9c26	4a 	J 
	add a,b			;9c27	80 	. 
	ld c,a			;9c28	4f 	O 
	add a,b			;9c29	80 	. 
	ld b,b			;9c2a	40 	@ 
	xor d			;9c2b	aa 	. 
	cp a			;9c2c	bf 	. 
	cp a			;9c2d	bf 	. 
	sub l			;9c2e	95 	. 
	inc l			;9c2f	2c 	, 
	ld d,l			;9c30	55 	U 
	add a,b			;9c31	80 	. 
	ld b,b			;9c32	40 	@ 
	cp a			;9c33	bf 	. 
	cp a			;9c34	bf 	. 
	cp a			;9c35	bf 	. 
	cp a			;9c36	bf 	. 
	cp a			;9c37	bf 	. 
	cp a			;9c38	bf 	. 
	cp a			;9c39	bf 	. 
	cp a			;9c3a	bf 	. 
	cp a			;9c3b	bf 	. 
	cp a			;9c3c	bf 	. 
	cp a			;9c3d	bf 	. 
	cp a			;9c3e	bf 	. 
	cp a			;9c3f	bf 	. 
	cp a			;9c40	bf 	. 
	cp a			;9c41	bf 	. 
	cp a			;9c42	bf 	. 
	cp a			;9c43	bf 	. 
	cp a			;9c44	bf 	. 
	sub l			;9c45	95 	. 
	inc l			;9c46	2c 	, 
	ld a,l			;9c47	7d 	} 
	add a,b			;9c48	80 	. 
	ld d,b			;9c49	50 	P 
	add a,d			;9c4a	82 	. 
l9c4bh:
	ld b,b			;9c4b	40 	@ 
	sbc a,a			;9c4c	9f 	. 
	adc a,e			;9c4d	8b 	. 
	sbc a,a			;9c4e	9f 	. 
l9c4fh:
	ld h,b			;9c4f	60 	` 
	add a,c			;9c50	81 	. 
	ld b,b			;9c51	40 	@ 
l9c52h:
	xor e			;9c52	ab 	. 
	cp a			;9c53	bf 	. 
	cp a			;9c54	bf 	. 
	cp a			;9c55	bf 	. 
	cp a			;9c56	bf 	. 
	cp a			;9c57	bf 	. 
	cp a			;9c58	bf 	. 
	cp a			;9c59	bf 	. 
	add a,a			;9c5a	87 	. 
	add a,l			;9c5b	85 	. 
	adc a,e			;9c5c	8b 	. 
	adc a,e			;9c5d	8b 	. 
	sub a			;9c5e	97 	. 
	ld a,b			;9c5f	78 	x 
	add a,b			;9c60	80 	. 
	inc l			;9c61	2c 	, 
	ld bc,l807dh		;9c62	01 7d 80 	. } . 
	ld a,h			;9c65	7c 	| 
	add a,b			;9c66	80 	. 
	ld a,l			;9c67	7d 	} 
	add a,b			;9c68	80 	. 
l9c69h:
	ld a,h			;9c69	7c 	| 
	add a,b			;9c6a	80 	. 
	ld a,a			;9c6b	7f 	 
	add a,b			;9c6c	80 	. 
l9c6dh:
	ld b,b			;9c6d	40 	@ 
	xor d			;9c6e	aa 	. 
	cp a			;9c6f	bf 	. 
	cp a			;9c70	bf 	. 
	cp a			;9c71	bf 	. 
	cp a			;9c72	bf 	. 
	cp a			;9c73	bf 	. 
	cp a			;9c74	bf 	. 
	cp a			;9c75	bf 	. 
	ld l,d			;9c76	6a 	j 
	add a,b			;9c77	80 	. 
	ld a,a			;9c78	7f 	 
	add a,b			;9c79	80 	. 
	add a,b			;9c7a	80 	. 
	ld a,l			;9c7b	7d 	} 
	add a,b			;9c7c	80 	. 
	ld a,h			;9c7d	7c 	| 
	add a,b			;9c7e	80 	. 
	dec l			;9c7f	2d 	- 
	ld b,040h		;9c80	06 40 	. @ 
	xor d			;9c82	aa 	. 
	cp a			;9c83	bf 	. 
	cp a			;9c84	bf 	. 
	cp a			;9c85	bf 	. 
	cp a			;9c86	bf 	. 
	cp a			;9c87	bf 	. 
	cp a			;9c88	bf 	. 
	cp a			;9c89	bf 	. 
	ld l,d			;9c8a	6a 	j 
	add a,b			;9c8b	80 	. 
	ld sp,04006h		;9c8c	31 06 40 	1 . @ 
	xor d			;9c8f	aa 	. 
	cp a			;9c90	bf 	. 
	cp a			;9c91	bf 	. 
	cp a			;9c92	bf 	. 
	cp a			;9c93	bf 	. 
	cp a			;9c94	bf 	. 
	cp a			;9c95	bf 	. 
	cp a			;9c96	bf 	. 
	ld l,d			;9c97	6a 	j 
	add a,b			;9c98	80 	. 
	ld sp,04006h		;9c99	31 06 40 	1 . @ 
	adc a,d			;9c9c	8a 	. 
	adc a,e			;9c9d	8b 	. 
	sub a			;9c9e	97 	. 
	ld d,b			;9c9f	50 	P 
	add a,d			;9ca0	82 	. 
	ld b,b			;9ca1	40 	@ 
	xor a			;9ca2	af 	. 
	add a,a			;9ca3	87 	. 
	adc a,d			;9ca4	8a 	. 
	sbc a,a			;9ca5	9f 	. 
	ld l,d			;9ca6	6a 	j 
	add a,b			;9ca7	80 	. 
	ld sp,l7d07h		;9ca8	31 07 7d 	1 . } 
	add a,b			;9cab	80 	. 
	ld a,h			;9cac	7c 	| 
	add a,b			;9cad	80 	. 
	ld a,a			;9cae	7f 	 
	add a,b			;9caf	80 	. 
	ld a,h			;9cb0	7c 	| 
	add a,b			;9cb1	80 	. 
	ld a,(hl)			;9cb2	7e 	~ 
	add a,b			;9cb3	80 	. 
	ld a,l			;9cb4	7d 	} 
	add a,b			;9cb5	80 	. 
	ld a,h			;9cb6	7c 	| 
	add a,b			;9cb7	80 	. 
	nop			;9cb8	00 	. 
	ld b,043h		;9cb9	06 43 	. C 
	and b			;9cbb	a0 	. 
	or b			;9cbc	b0 	. 
	or b			;9cbd	b0 	. 
	or b			;9cbe	b0 	. 
	or b			;9cbf	b0 	. 
	or b			;9cc0	b0 	. 
	or b			;9cc1	b0 	. 
	or b			;9cc2	b0 	. 
	ld l,e			;9cc3	6b 	k 
	add a,b			;9cc4	80 	. 
	ld sp,04006h		;9cc5	31 06 40 	1 . @ 
	xor d			;9cc8	aa 	. 
	sub l			;9cc9	95 	. 
	sbc a,h			;9cca	9c 	. 
	sub h			;9ccb	94 	. 
	sub l			;9ccc	95 	. 
	sbc a,h			;9ccd	9c 	. 
	sub h			;9cce	94 	. 
	cp a			;9ccf	bf 	. 
	ld l,d			;9cd0	6a 	j 
	add a,b			;9cd1	80 	. 
	ld sp,04006h		;9cd2	31 06 40 	1 . @ 
	xor d			;9cd5	aa 	. 
	or l			;9cd6	b5 	. 
	or e			;9cd7	b3 	. 
	or c			;9cd8	b1 	. 
	or l			;9cd9	b5 	. 
	or e			;9cda	b3 	. 
	or c			;9cdb	b1 	. 
	cp a			;9cdc	bf 	. 
	ld l,d			;9cdd	6a 	j 
	add a,b			;9cde	80 	. 
	ld sp,la043h		;9cdf	31 43 a0 	1 C . 
	ld b,b			;9ce2	40 	@ 
	xor b			;9ce3	a8 	. 
	xor b			;9ce4	a8 	. 
	xor b			;9ce5	a8 	. 
	ld l,d			;9ce6	6a 	j 
	add a,b			;9ce7	80 	. 
	ld a,a			;9ce8	7f 	 
	add a,b			;9ce9	80 	. 
	ld b,b			;9cea	40 	@ 
	xor d			;9ceb	aa 	. 
	sbc a,a			;9cec	9f 	. 
	sbc a,a			;9ced	9f 	. 
	xor l			;9cee	ad 	. 
	xor l			;9cef	ad 	. 
	xor a			;9cf0	af 	. 
	adc a,a			;9cf1	8f 	. 
	cp a			;9cf2	bf 	. 
	ld l,d			;9cf3	6a 	j 
	add a,b			;9cf4	80 	. 
	ld a,a			;9cf5	7f 	 
	add a,b			;9cf6	80 	. 
	ld b,b			;9cf7	40 	@ 
	xor b			;9cf8	a8 	. 
	xor b			;9cf9	a8 	. 
	xor b			;9cfa	a8 	. 
	ld b,d			;9cfb	42 	B 
	and b			;9cfc	a0 	. 
l9cfdh:
	ld l,e			;9cfd	6b 	k 
	add a,b			;9cfe	80 	. 
	dec hl			;9cff	2b 	+ 
	ld b,b			;9d00	40 	@ 
	xor d			;9d01	aa 	. 
	cp (hl)			;9d02	be 	. 
l9d03h:
	cp (hl)			;9d03	be 	. 
	cp (hl)			;9d04	be 	. 
	xor b			;9d05	a8 	. 
	ld l,d			;9d06	6a 	j 
	add a,b			;9d07	80 	. 
	ld b,b			;9d08	40 	@ 
	xor d			;9d09	aa 	. 
	sub l			;9d0a	95 	. 
	add a,b			;9d0b	80 	. 
	add a,b			;9d0c	80 	. 
	add a,b			;9d0d	80 	. 
	add a,b			;9d0e	80 	. 
	add a,b			;9d0f	80 	. 
	cp a			;9d10	bf 	. 
	ld l,d			;9d11	6a 	j 
	add a,b			;9d12	80 	. 
	ld b,b			;9d13	40 	@ 
	xor b			;9d14	a8 	. 
	xor d			;9d15	aa 	. 
	cp (hl)			;9d16	be 	. 
	cp (hl)			;9d17	be 	. 
	cp (hl)			;9d18	be 	. 
	ld l,d			;9d19	6a 	j 
l9d1ah:
	add a,b			;9d1a	80 	. 
	dec hl			;9d1b	2b 	+ 
	ld d,b			;9d1c	50 	P 
	add a,d			;9d1d	82 	. 
	ld b,b			;9d1e	40 	@ 
	cp a			;9d1f	bf 	. 
	cp a			;9d20	bf 	. 
	cp a			;9d21	bf 	. 
	add a,a			;9d22	87 	. 
	ld a,d			;9d23	7a 	z 
	add a,b			;9d24	80 	. 
	ld b,b			;9d25	40 	@ 
	xor d			;9d26	aa 	. 
	sub l			;9d27	95 	. 
	and b			;9d28	a0 	. 
	add a,b			;9d29	80 	. 
	sub b			;9d2a	90 	. 
	sub b			;9d2b	90 	. 
	add a,b			;9d2c	80 	. 
	cp a			;9d2d	bf 	. 
	ld l,d			;9d2e	6a 	j 
l9d2fh:
	add a,b			;9d2f	80 	. 
	ld d,b			;9d30	50 	P 
	add a,d			;9d31	82 	. 
	ld b,b			;9d32	40 	@ 
	xor a			;9d33	af 	. 
	cp a			;9d34	bf 	. 
	cp a			;9d35	bf 	. 
	sub a			;9d36	97 	. 
	ld a,d			;9d37	7a 	z 
	add a,b			;9d38	80 	. 
	dec hl			;9d39	2b 	+ 
	ld d,l			;9d3a	55 	U 
	add a,b			;9d3b	80 	. 
	ld b,b			;9d3c	40 	@ 
	cp a			;9d3d	bf 	. 
	cp a			;9d3e	bf 	. 
	cp a			;9d3f	bf 	. 
	ld l,d			;9d40	6a 	j 
	add a,b			;9d41	80 	. 
	ld a,a			;9d42	7f 	 
	add a,b			;9d43	80 	. 
	ld b,b			;9d44	40 	@ 
	xor d			;9d45	aa 	. 
	cp a			;9d46	bf 	. 
	cp a			;9d47	bf 	. 
	cp a			;9d48	bf 	. 
	cp a			;9d49	bf 	. 
	cp a			;9d4a	bf 	. 
	cp a			;9d4b	bf 	. 
	cp a			;9d4c	bf 	. 
	ld l,d			;9d4d	6a 	j 
	add a,b			;9d4e	80 	. 
	ld a,a			;9d4f	7f 	 
	add a,b			;9d50	80 	. 
	ld b,b			;9d51	40 	@ 
	xor d			;9d52	aa 	. 
	cp a			;9d53	bf 	. 
	cp a			;9d54	bf 	. 
	sub l			;9d55	95 	. 
	inc l			;9d56	2c 	, 
	ld d,l			;9d57	55 	U 
	add a,b			;9d58	80 	. 
	ld b,b			;9d59	40 	@ 
	cp a			;9d5a	bf 	. 
	cp a			;9d5b	bf 	. 
	cp a			;9d5c	bf 	. 
	cp h			;9d5d	bc 	. 
	cp h			;9d5e	bc 	. 
	cp (hl)			;9d5f	be 	. 
	cp a			;9d60	bf 	. 
	cp a			;9d61	bf 	. 
	cp a			;9d62	bf 	. 
	cp a			;9d63	bf 	. 
	cp a			;9d64	bf 	. 
	cp a			;9d65	bf 	. 
	cp a			;9d66	bf 	. 
	cp h			;9d67	bc 	. 
	cp h			;9d68	bc 	. 
	cp (hl)			;9d69	be 	. 
	cp a			;9d6a	bf 	. 
	cp a			;9d6b	bf 	. 
	sub l			;9d6c	95 	. 
	inc l			;9d6d	2c 	, 
	ld (hl),l			;9d6e	75 	u 
	add a,b			;9d6f	80 	. 
	ld b,b			;9d70	40 	@ 
	adc a,e			;9d71	8b 	. 
	cp a			;9d72	bf 	. 
	xor a			;9d73	af 	. 
	cp a			;9d74	bf 	. 
	add a,a			;9d75	87 	. 
	xor a			;9d76	af 	. 
	cp a			;9d77	bf 	. 
	cp a			;9d78	bf 	. 
	cp a			;9d79	bf 	. 
	cp a			;9d7a	bf 	. 
	cp a			;9d7b	bf 	. 
	cp a			;9d7c	bf 	. 
	cp a			;9d7d	bf 	. 
	sbc a,a			;9d7e	9f 	. 
	sub a			;9d7f	97 	. 
	xor a			;9d80	af 	. 
	xor a			;9d81	af 	. 
	sbc a,a			;9d82	9f 	. 
	ld h,b			;9d83	60 	` 
	add a,c			;9d84	81 	. 
	inc l			;9d85	2c 	, 
	ld bc,l8075h		;9d86	01 75 80 	. u . 
	ld (hl),b			;9d89	70 	p 
	add a,c			;9d8a	81 	. 
	ld (hl),h			;9d8b	74 	t 
	add a,b			;9d8c	80 	. 
l9d8dh:
	ld (hl),b			;9d8d	70 	p 
	add a,c			;9d8e	81 	. 
	ld a,(hl)			;9d8f	7e 	~ 
	add a,b			;9d90	80 	. 
	ld b,b			;9d91	40 	@ 
	xor d			;9d92	aa 	. 
	cp a			;9d93	bf 	. 
	cp a			;9d94	bf 	. 
	cp a			;9d95	bf 	. 
	cp a			;9d96	bf 	. 
	cp a			;9d97	bf 	. 
	cp a			;9d98	bf 	. 
	cp a			;9d99	bf 	. 
l9d9ah:
	ld l,b			;9d9a	68 	h 
	add a,b			;9d9b	80 	. 
	ld a,h			;9d9c	7c 	| 
	add a,b			;9d9d	80 	. 
	add a,b			;9d9e	80 	. 
	ld (hl),h			;9d9f	74 	t 
	add a,b			;9da0	80 	. 
	ld (hl),b			;9da1	70 	p 
	add a,c			;9da2	81 	. 
	dec l			;9da3	2d 	- 
	ld b,040h		;9da4	06 40 	. @ 
	xor d			;9da6	aa 	. 
	cp a			;9da7	bf 	. 
	cp a			;9da8	bf 	. 
	cp a			;9da9	bf 	. 
	cp a			;9daa	bf 	. 
	cp a			;9dab	bf 	. 
	cp a			;9dac	bf 	. 
	cp a			;9dad	bf 	. 
	ld l,d			;9dae	6a 	j 
	add a,b			;9daf	80 	. 
	ld sp,04006h		;9db0	31 06 40 	1 . @ 
	xor d			;9db3	aa 	. 
	cp a			;9db4	bf 	. 
	cp a			;9db5	bf 	. 
	cp a			;9db6	bf 	. 
	cp a			;9db7	bf 	. 
	cp a			;9db8	bf 	. 
	cp a			;9db9	bf 	. 
	cp a			;9dba	bf 	. 
	ld l,d			;9dbb	6a 	j 
	add a,b			;9dbc	80 	. 
	ld sp,04006h		;9dbd	31 06 40 	1 . @ 
	xor d			;9dc0	aa 	. 
	xor a			;9dc1	af 	. 
	sbc a,a			;9dc2	9f 	. 
	adc a,e			;9dc3	8b 	. 
	cp a			;9dc4	bf 	. 
	sbc a,a			;9dc5	9f 	. 
	xor e			;9dc6	ab 	. 
	cp a			;9dc7	bf 	. 
	ld l,d			;9dc8	6a 	j 
	add a,b			;9dc9	80 	. 
	ld sp,l7c06h		;9dca	31 06 7c 	1 . | 
	add a,b			;9dcd	80 	. 
	ld (hl),h			;9dce	74 	t 
l9dcfh:
	add a,b			;9dcf	80 	. 
	ld (hl),b			;9dd0	70 	p 
	add a,c			;9dd1	81 	. 
	ld a,l			;9dd2	7d 	} 
	add a,b			;9dd3	80 	. 
	ld (hl),b			;9dd4	70 	p 
	add a,d			;9dd5	82 	. 
	ld a,b			;9dd6	78 	x 
	add a,b			;9dd7	80 	. 
	ld (hl),h			;9dd8	74 	t 
	add a,b			;9dd9	80 	. 
	ld (hl),b			;9dda	70 	p 
	add a,c			;9ddb	81 	. 
	ld a,(hl)			;9ddc	7e 	~ 
	add a,b			;9ddd	80 	. 
	nop			;9dde	00 	. 
	ld b,04fh		;9ddf	06 4f 	. O 
	add a,b			;9de1	80 	. 
	add a,b			;9de2	80 	. 
	add a,b			;9de3	80 	. 
	add a,b			;9de4	80 	. 
	add a,b			;9de5	80 	. 
	add a,b			;9de6	80 	. 
	add a,b			;9de7	80 	. 
	add a,b			;9de8	80 	. 
l9de9h:
	ld l,a			;9de9	6f 	o 
	add a,b			;9dea	80 	. 
	ld sp,04006h		;9deb	31 06 40 	1 . @ 
	xor d			;9dee	aa 	. 
	sub a			;9def	97 	. 
	or e			;9df0	b3 	. 
	sub e			;9df1	93 	. 
	sub a			;9df2	97 	. 
	or e			;9df3	b3 	. 
	sub e			;9df4	93 	. 
	cp a			;9df5	bf 	. 
	ld l,d			;9df6	6a 	j 
	add a,b			;9df7	80 	. 
	ld sp,04006h		;9df8	31 06 40 	1 . @ 
	xor d			;9dfb	aa 	. 
	sub l			;9dfc	95 	. 
	adc a,l			;9dfd	8d 	. 
	add a,l			;9dfe	85 	. 
	sub l			;9dff	95 	. 
	adc a,l			;9e00	8d 	. 
	add a,l			;9e01	85 	. 
	cp a			;9e02	bf 	. 
	ld l,d			;9e03	6a 	j 
	add a,b			;9e04	80 	. 
	ld sp,l804fh		;9e05	31 4f 80 	1 O . 
	ld b,e			;9e08	43 	C 
	and b			;9e09	a0 	. 
	and b			;9e0a	a0 	. 
	and b			;9e0b	a0 	. 
	ld l,e			;9e0c	6b 	k 
	add a,b			;9e0d	80 	. 
	ld a,a			;9e0e	7f 	 
	add a,b			;9e0f	80 	. 
	ld b,b			;9e10	40 	@ 
	xor d			;9e11	aa 	. 
	cp a			;9e12	bf 	. 
	cp a			;9e13	bf 	. 
	or a			;9e14	b7 	. 
	or a			;9e15	b7 	. 
	cp a			;9e16	bf 	. 
	cp a			;9e17	bf 	. 
	cp a			;9e18	bf 	. 
	ld l,d			;9e19	6a 	j 
	add a,b			;9e1a	80 	. 
	ld a,a			;9e1b	7f 	 
	add a,b			;9e1c	80 	. 
	ld b,e			;9e1d	43 	C 
	and b			;9e1e	a0 	. 
	and b			;9e1f	a0 	. 
	and b			;9e20	a0 	. 
	ld c,e			;9e21	4b 	K 
	add a,b			;9e22	80 	. 
	ld l,a			;9e23	6f 	o 
	add a,b			;9e24	80 	. 
	dec hl			;9e25	2b 	+ 
	ld b,b			;9e26	40 	@ 
	xor d			;9e27	aa 	. 
	cp d			;9e28	ba 	. 
	cp d			;9e29	ba 	. 
	cp d			;9e2a	ba 	. 
	ld b,d			;9e2b	42 	B 
	and b			;9e2c	a0 	. 
	ld l,e			;9e2d	6b 	k 
	add a,b			;9e2e	80 	. 
	ld b,b			;9e2f	40 	@ 
	xor d			;9e30	aa 	. 
	sub l			;9e31	95 	. 
	add a,c			;9e32	81 	. 
	add a,d			;9e33	82 	. 
	add a,d			;9e34	82 	. 
	add a,d			;9e35	82 	. 
	add a,b			;9e36	80 	. 
	cp a			;9e37	bf 	. 
	ld l,d			;9e38	6a 	j 
	add a,b			;9e39	80 	. 
	ld b,e			;9e3a	43 	C 
	and b			;9e3b	a0 	. 
	ld b,b			;9e3c	40 	@ 
	xor d			;9e3d	aa 	. 
	cp d			;9e3e	ba 	. 
	cp d			;9e3f	ba 	. 
	cp d			;9e40	ba 	. 
	ld l,d			;9e41	6a 	j 
	add a,b			;9e42	80 	. 
	dec hl			;9e43	2b 	+ 
	ld b,b			;9e44	40 	@ 
	adc a,d			;9e45	8a 	. 
	cp a			;9e46	bf 	. 
	cp a			;9e47	bf 	. 
	cp a			;9e48	bf 	. 
	sbc a,(hl)			;9e49	9e 	. 
	ld l,d			;9e4a	6a 	j 
	add a,b			;9e4b	80 	. 
	ld b,b			;9e4c	40 	@ 
	xor d			;9e4d	aa 	. 
	sub l			;9e4e	95 	. 
	add a,b			;9e4f	80 	. 
	add a,b			;9e50	80 	. 
	add a,b			;9e51	80 	. 
	add a,b			;9e52	80 	. 
	add a,b			;9e53	80 	. 
	cp a			;9e54	bf 	. 
	ld l,d			;9e55	6a 	j 
	add a,b			;9e56	80 	. 
	ld b,b			;9e57	40 	@ 
	adc a,d			;9e58	8a 	. 
	cp (hl)			;9e59	be 	. 
	cp a			;9e5a	bf 	. 
	cp a			;9e5b	bf 	. 
	sbc a,a			;9e5c	9f 	. 
	ld l,d			;9e5d	6a 	j 
	add a,b			;9e5e	80 	. 
	dec hl			;9e5f	2b 	+ 
	ld d,l			;9e60	55 	U 
	add a,b			;9e61	80 	. 
	ld b,b			;9e62	40 	@ 
	cp a			;9e63	bf 	. 
	cp a			;9e64	bf 	. 
	cp a			;9e65	bf 	. 
	ld l,b			;9e66	68 	h 
	add a,b			;9e67	80 	. 
	ld a,a			;9e68	7f 	 
	add a,b			;9e69	80 	. 
	ld b,b			;9e6a	40 	@ 
	xor d			;9e6b	aa 	. 
	cp l			;9e6c	bd 	. 
	cp (hl)			;9e6d	be 	. 
	cp h			;9e6e	bc 	. 
	cp l			;9e6f	bd 	. 
	cp l			;9e70	bd 	. 
	cp h			;9e71	bc 	. 
	cp a			;9e72	bf 	. 
	ld l,d			;9e73	6a 	j 
	add a,b			;9e74	80 	. 
	ld a,l			;9e75	7d 	} 
	add a,b			;9e76	80 	. 
	ld b,b			;9e77	40 	@ 
	xor d			;9e78	aa 	. 
	cp a			;9e79	bf 	. 
	cp a			;9e7a	bf 	. 
	sub l			;9e7b	95 	. 
	inc l			;9e7c	2c 	, 
	ld d,l			;9e7d	55 	U 
	add a,b			;9e7e	80 	. 
	ld b,b			;9e7f	40 	@ 
	cp a			;9e80	bf 	. 
	cp a			;9e81	bf 	. 
	cp a			;9e82	bf 	. 
	ld b,d			;9e83	42 	B 
	or b			;9e84	b0 	. 
	ld b,e			;9e85	43 	C 
	or b			;9e86	b0 	. 
	ld b,b			;9e87	40 	@ 
	cp d			;9e88	ba 	. 
	cp a			;9e89	bf 	. 
	cp a			;9e8a	bf 	. 
	cp a			;9e8b	bf 	. 
	cp a			;9e8c	bf 	. 
	cp a			;9e8d	bf 	. 
	cp a			;9e8e	bf 	. 
	cp a			;9e8f	bf 	. 
	ld b,d			;9e90	42 	B 
	or b			;9e91	b0 	. 
	ld b,e			;9e92	43 	C 
	or b			;9e93	b0 	. 
	ld b,b			;9e94	40 	@ 
	cp d			;9e95	ba 	. 
	cp a			;9e96	bf 	. 
	cp a			;9e97	bf 	. 
	sub l			;9e98	95 	. 
	inc l			;9e99	2c 	, 
	ld d,l			;9e9a	55 	U 
	add a,b			;9e9b	80 	. 
	ld b,b			;9e9c	40 	@ 
	xor a			;9e9d	af 	. 
	cp a			;9e9e	bf 	. 
	cp a			;9e9f	bf 	. 
	cp a			;9ea0	bf 	. 
	sbc a,a			;9ea1	9f 	. 
	cp a			;9ea2	bf 	. 
	cp a			;9ea3	bf 	. 
	cp a			;9ea4	bf 	. 
	cp a			;9ea5	bf 	. 
	cp a			;9ea6	bf 	. 
	cp a			;9ea7	bf 	. 
	cp a			;9ea8	bf 	. 
	cp a			;9ea9	bf 	. 
	cp a			;9eaa	bf 	. 
	sbc a,a			;9eab	9f 	. 
	cp a			;9eac	bf 	. 
	cp a			;9ead	bf 	. 
	cp a			;9eae	bf 	. 
	add a,l			;9eaf	85 	. 
	inc l			;9eb0	2c 	, 
	ld bc,l8054h		;9eb1	01 54 80 	. T . 
	ld b,b			;9eb4	40 	@ 
	add a,a			;9eb5	87 	. 
	ld d,b			;9eb6	50 	P 
	add a,d			;9eb7	82 	. 
	ld b,b			;9eb8	40 	@ 
	add a,a			;9eb9	87 	. 
	ld a,b			;9eba	78 	x 
	add a,b			;9ebb	80 	. 
	ld b,b			;9ebc	40 	@ 
	xor d			;9ebd	aa 	. 
	cp a			;9ebe	bf 	. 
	cp a			;9ebf	bf 	. 
	cp a			;9ec0	bf 	. 
	cp a			;9ec1	bf 	. 
	cp a			;9ec2	bf 	. 
	cp a			;9ec3	bf 	. 
	cp a			;9ec4	bf 	. 
	ld h,b			;9ec5	60 	` 
	add a,c			;9ec6	81 	. 
	ld (hl),b			;9ec7	70 	p 
	add a,c			;9ec8	81 	. 
	add a,d			;9ec9	82 	. 
	ld d,b			;9eca	50 	P 
	add a,d			;9ecb	82 	. 
	ld b,b			;9ecc	40 	@ 
	add a,l			;9ecd	85 	. 
	ld a,(hl)			;9ece	7e 	~ 
	add a,b			;9ecf	80 	. 
	inc l			;9ed0	2c 	, 
	ld b,040h		;9ed1	06 40 	. @ 
	xor d			;9ed3	aa 	. 
	cp a			;9ed4	bf 	. 
	cp a			;9ed5	bf 	. 
	cp a			;9ed6	bf 	. 
	cp a			;9ed7	bf 	. 
	cp a			;9ed8	bf 	. 
	cp a			;9ed9	bf 	. 
	cp a			;9eda	bf 	. 
	ld l,d			;9edb	6a 	j 
	add a,b			;9edc	80 	. 
	ld sp,04006h		;9edd	31 06 40 	1 . @ 
	xor d			;9ee0	aa 	. 
	cp a			;9ee1	bf 	. 
	cp a			;9ee2	bf 	. 
	cp a			;9ee3	bf 	. 
	cp a			;9ee4	bf 	. 
	cp a			;9ee5	bf 	. 
	cp a			;9ee6	bf 	. 
	cp a			;9ee7	bf 	. 
	ld l,d			;9ee8	6a 	j 
	add a,b			;9ee9	80 	. 
	ld sp,04006h		;9eea	31 06 40 	1 . @ 
	xor d			;9eed	aa 	. 
	cp a			;9eee	bf 	. 
	cp a			;9eef	bf 	. 
	xor a			;9ef0	af 	. 
	cp a			;9ef1	bf 	. 
	cp a			;9ef2	bf 	. 
	xor a			;9ef3	af 	. 
	cp a			;9ef4	bf 	. 
	ld l,d			;9ef5	6a 	j 
	add a,b			;9ef6	80 	. 
	ld sp,l7006h		;9ef7	31 06 70 	1 . p 
	add a,d			;9efa	82 	. 
	ld d,b			;9efb	50 	P 
	add a,d			;9efc	82 	. 
	ld b,b			;9efd	40 	@ 
	add a,l			;9efe	85 	. 
	ld (hl),h			;9eff	74 	t 
	add a,b			;9f00	80 	. 
	ld b,b			;9f01	40 	@ 
	adc a,e			;9f02	8b 	. 
	ld h,b			;9f03	60 	` 
	add a,c			;9f04	81 	. 
	ld d,b			;9f05	50 	P 
	add a,d			;9f06	82 	. 
	ld b,b			;9f07	40 	@ 
	add a,a			;9f08	87 	. 
	ld a,d			;9f09	7a 	z 
	add a,b			;9f0a	80 	. 
	nop			;9f0b	00 	. 
	rlca			;9f0c	07 	. 
	dec de			;9f0d	1b 	. 
	sbc a,a			;9f0e	9f 	. 
	dec de			;9f0f	1b 	. 
	sbc a,a			;9f10	9f 	. 
	dec de			;9f11	1b 	. 
	sbc a,a			;9f12	9f 	. 
	daa			;9f13	27 	' 
	sbc a,a			;9f14	9f 	. 
	inc sp			;9f15	33 	3 
	sbc a,a			;9f16	9f 	. 
	inc sp			;9f17	33 	3 
	sbc a,a			;9f18	9f 	. 
	inc sp			;9f19	33 	3 
	sbc a,a			;9f1a	9f 	. 
	ccf			;9f1b	3f 	? 
	sbc a,a			;9f1c	9f 	. 
	ccf			;9f1d	3f 	? 
	sbc a,a			;9f1e	9f 	. 
	ret z			;9f1f	c8 	. 
	sbc a,a			;9f20	9f 	. 
	ret z			;9f21	c8 	. 
	sbc a,a			;9f22	9f 	. 
	ld d,a			;9f23	57 	W 
	and b			;9f24	a0 	. 
	ld d,a			;9f25	57 	W 
	and b			;9f26	a0 	. 
	jp (hl)			;9f27	e9 	. 
	and b			;9f28	a0 	. 
	jp (hl)			;9f29	e9 	. 
	and b			;9f2a	a0 	. 
	ld (hl),d			;9f2b	72 	r 
	and c			;9f2c	a1 	. 
	ld (hl),d			;9f2d	72 	r 
	and c			;9f2e	a1 	. 
	ld bc,001a2h		;9f2f	01 a2 01 	. . . 
	and d			;9f32	a2 	. 
	sub e			;9f33	93 	. 
	and d			;9f34	a2 	. 
	sub e			;9f35	93 	. 
	and d			;9f36	a2 	. 
	inc e			;9f37	1c 	. 
	and e			;9f38	a3 	. 
	inc e			;9f39	1c 	. 
	and e			;9f3a	a3 	. 
	xor e			;9f3b	ab 	. 
	and e			;9f3c	a3 	. 
	xor e			;9f3d	ab 	. 
	and e			;9f3e	a3 	. 
	ld b,c			;9f3f	41 	A 
	and b			;9f40	a0 	. 
	ld b,b			;9f41	40 	@ 
	cp h			;9f42	bc 	. 
	cp h			;9f43	bc 	. 
	cp h			;9f44	bc 	. 
	cp h			;9f45	bc 	. 
	cp h			;9f46	bc 	. 
	cp h			;9f47	bc 	. 
	or h			;9f48	b4 	. 
	ld l,e			;9f49	6b 	k 
	add a,b			;9f4a	80 	. 
	scf			;9f4b	37 	7 
	ld b,b			;9f4c	40 	@ 
	xor d			;9f4d	aa 	. 
	cp a			;9f4e	bf 	. 
	sbc a,h			;9f4f	9c 	. 
	sub h			;9f50	94 	. 
	cp a			;9f51	bf 	. 
	cp l			;9f52	bd 	. 
	xor h			;9f53	ac 	. 
	xor d			;9f54	aa 	. 
	ld l,d			;9f55	6a 	j 
	add a,b			;9f56	80 	. 
	scf			;9f57	37 	7 
	ld b,b			;9f58	40 	@ 
	xor d			;9f59	aa 	. 
	cp a			;9f5a	bf 	. 
	cp a			;9f5b	bf 	. 
	cp a			;9f5c	bf 	. 
	or e			;9f5d	b3 	. 
	cp e			;9f5e	bb 	. 
	cp a			;9f5f	bf 	. 
	cp a			;9f60	bf 	. 
	ld l,d			;9f61	6a 	j 
	add a,b			;9f62	80 	. 
	scf			;9f63	37 	7 
l9f64h:
	ld b,b			;9f64	40 	@ 
	xor d			;9f65	aa 	. 
	cp a			;9f66	bf 	. 
	sub a			;9f67	97 	. 
	add a,e			;9f68	83 	. 
	add a,e			;9f69	83 	. 
	add a,e			;9f6a	83 	. 
	add a,e			;9f6b	83 	. 
	cp a			;9f6c	bf 	. 
	ld l,d			;9f6d	6a 	j 
	add a,b			;9f6e	80 	. 
	scf			;9f6f	37 	7 
	ld b,b			;9f70	40 	@ 
l9f71h:
	xor d			;9f71	aa 	. 
	cp a			;9f72	bf 	. 
	or l			;9f73	b5 	. 
	cp h			;9f74	bc 	. 
	cp h			;9f75	bc 	. 
	cp h			;9f76	bc 	. 
	or h			;9f77	b4 	. 
	cp a			;9f78	bf 	. 
	ld l,d			;9f79	6a 	j 
	add a,b			;9f7a	80 	. 
	scf			;9f7b	37 	7 
	ld b,b			;9f7c	40 	@ 
	xor d			;9f7d	aa 	. 
	cp a			;9f7e	bf 	. 
	cp a			;9f7f	bf 	. 
	cp a			;9f80	bf 	. 
	cp a			;9f81	bf 	. 
	cp a			;9f82	bf 	. 
	cp a			;9f83	bf 	. 
	cp a			;9f84	bf 	. 
	ld l,d			;9f85	6a 	j 
	add a,b			;9f86	80 	. 
	scf			;9f87	37 	7 
	ld b,b			;9f88	40 	@ 
	xor d			;9f89	aa 	. 
	cp a			;9f8a	bf 	. 
	cp a			;9f8b	bf 	. 
	cp a			;9f8c	bf 	. 
	cp a			;9f8d	bf 	. 
	cp a			;9f8e	bf 	. 
	cp a			;9f8f	bf 	. 
	cp a			;9f90	bf 	. 
	ld l,d			;9f91	6a 	j 
	add a,b			;9f92	80 	. 
	scf			;9f93	37 	7 
	ld b,b			;9f94	40 	@ 
	xor d			;9f95	aa 	. 
	cp a			;9f96	bf 	. 
	cp a			;9f97	bf 	. 
	cp a			;9f98	bf 	. 
	cp a			;9f99	bf 	. 
	cp a			;9f9a	bf 	. 
	cp a			;9f9b	bf 	. 
	cp a			;9f9c	bf 	. 
	ld l,d			;9f9d	6a 	j 
	add a,b			;9f9e	80 	. 
	scf			;9f9f	37 	7 
	ld b,b			;9fa0	40 	@ 
	xor d			;9fa1	aa 	. 
	cp a			;9fa2	bf 	. 
	cp a			;9fa3	bf 	. 
	cp a			;9fa4	bf 	. 
	cp a			;9fa5	bf 	. 
	cp a			;9fa6	bf 	. 
	cp a			;9fa7	bf 	. 
	cp a			;9fa8	bf 	. 
	ld l,d			;9fa9	6a 	j 
sub_9faah:
	add a,b			;9faa	80 	. 
	scf			;9fab	37 	7 
	ld b,b			;9fac	40 	@ 
	adc a,d			;9fad	8a 	. 
	xor e			;9fae	ab 	. 
	cp a			;9faf	bf 	. 
	cp a			;9fb0	bf 	. 
	cp a			;9fb1	bf 	. 
	cp a			;9fb2	bf 	. 
	sbc a,a			;9fb3	9f 	. 
	sbc a,a			;9fb4	9f 	. 
	ld l,d			;9fb5	6a 	j 
	add a,b			;9fb6	80 	. 
	scf			;9fb7	37 	7 
	ld bc,l8074h		;9fb8	01 74 80 	. t . 
	ld (hl),b			;9fbb	70 	p 
	add a,c			;9fbc	81 	. 
	ld b,b			;9fbd	40 	@ 
	adc a,e			;9fbe	8b 	. 
	ld h,b			;9fbf	60 	` 
	add a,e			;9fc0	83 	. 
	ld (hl),b			;9fc1	70 	p 
	add a,d			;9fc2	82 	. 
	ld a,b			;9fc3	78 	x 
	add a,b			;9fc4	80 	. 
	ld a,h			;9fc5	7c 	| 
	add a,b			;9fc6	80 	. 
	nop			;9fc7	00 	. 
	ld b,a			;9fc8	47 	G 
	add a,b			;9fc9	80 	. 
	ld b,e			;9fca	43 	C 
	or b			;9fcb	b0 	. 
	or b			;9fcc	b0 	. 
	or b			;9fcd	b0 	. 
	or b			;9fce	b0 	. 
	or b			;9fcf	b0 	. 
	or b			;9fd0	b0 	. 
	sub b			;9fd1	90 	. 
	ld l,a			;9fd2	6f 	o 
	add a,b			;9fd3	80 	. 
	scf			;9fd4	37 	7 
	ld b,b			;9fd5	40 	@ 
	xor d			;9fd6	aa 	. 
	cp a			;9fd7	bf 	. 
	or e			;9fd8	b3 	. 
	sub e			;9fd9	93 	. 
	cp a			;9fda	bf 	. 
	or a			;9fdb	b7 	. 
	or e			;9fdc	b3 	. 
	xor e			;9fdd	ab 	. 
	ld l,d			;9fde	6a 	j 
	add a,b			;9fdf	80 	. 
	scf			;9fe0	37 	7 
	ld b,b			;9fe1	40 	@ 
	xor d			;9fe2	aa 	. 
	cp a			;9fe3	bf 	. 
	cp l			;9fe4	bd 	. 
	cp l			;9fe5	bd 	. 
	adc a,a			;9fe6	8f 	. 
	xor a			;9fe7	af 	. 
	cp (hl)			;9fe8	be 	. 
	cp (hl)			;9fe9	be 	. 
	ld l,d			;9fea	6a 	j 
	add a,b			;9feb	80 	. 
	scf			;9fec	37 	7 
	ld b,b			;9fed	40 	@ 
	xor d			;9fee	aa 	. 
	cp a			;9fef	bf 	. 
	sbc a,a			;9ff0	9f 	. 
	adc a,a			;9ff1	8f 	. 
	adc a,a			;9ff2	8f 	. 
	adc a,a			;9ff3	8f 	. 
	adc a,a			;9ff4	8f 	. 
	cp a			;9ff5	bf 	. 
	ld l,d			;9ff6	6a 	j 
	add a,b			;9ff7	80 	. 
	scf			;9ff8	37 	7 
	ld b,b			;9ff9	40 	@ 
	xor d			;9ffa	aa 	. 
	cp a			;9ffb	bf 	. 
	sub l			;9ffc	95 	. 
	or b			;9ffd	b0 	. 
	or b			;9ffe	b0 	. 
	or b			;9fff	b0 	. 
	sub b			;a000	90 	. 
la001h:
	cp a			;a001	bf 	. 
la002h:
	ld l,d			;a002	6a 	j 
la003h:
	add a,b			;a003	80 	. 
	scf			;a004	37 	7 
	ld b,b			;a005	40 	@ 
la006h:
	xor d			;a006	aa 	. 
	cp a			;a007	bf 	. 
	cp a			;a008	bf 	. 
	cp a			;a009	bf 	. 
	cp a			;a00a	bf 	. 
	cp a			;a00b	bf 	. 
	cp a			;a00c	bf 	. 
	cp a			;a00d	bf 	. 
	ld l,d			;a00e	6a 	j 
	add a,b			;a00f	80 	. 
	scf			;a010	37 	7 
	ld b,b			;a011	40 	@ 
	xor d			;a012	aa 	. 
	cp a			;a013	bf 	. 
	cp a			;a014	bf 	. 
	cp a			;a015	bf 	. 
la016h:
	cp a			;a016	bf 	. 
	cp a			;a017	bf 	. 
	cp a			;a018	bf 	. 
	cp a			;a019	bf 	. 
	ld l,d			;a01a	6a 	j 
	add a,b			;a01b	80 	. 
	scf			;a01c	37 	7 
la01dh:
	ld b,b			;a01d	40 	@ 
	xor d			;a01e	aa 	. 
	cp a			;a01f	bf 	. 
	cp a			;a020	bf 	. 
la021h:
	cp a			;a021	bf 	. 
	cp a			;a022	bf 	. 
	cp a			;a023	bf 	. 
	cp a			;a024	bf 	. 
	cp a			;a025	bf 	. 
	ld l,d			;a026	6a 	j 
	add a,b			;a027	80 	. 
	scf			;a028	37 	7 
	ld b,b			;a029	40 	@ 
	xor d			;a02a	aa 	. 
	cp a			;a02b	bf 	. 
	cp a			;a02c	bf 	. 
	cp a			;a02d	bf 	. 
	cp a			;a02e	bf 	. 
	cp a			;a02f	bf 	. 
la030h:
	cp a			;a030	bf 	. 
	cp a			;a031	bf 	. 
	ld l,d			;a032	6a 	j 
	add a,b			;a033	80 	. 
	scf			;a034	37 	7 
	ld b,b			;a035	40 	@ 
	xor d			;a036	aa 	. 
	xor a			;a037	af 	. 
	cp a			;a038	bf 	. 
	cp a			;a039	bf 	. 
	cp a			;a03a	bf 	. 
	cp a			;a03b	bf 	. 
	cp a			;a03c	bf 	. 
	cp a			;a03d	bf 	. 
	ld l,d			;a03e	6a 	j 
	add a,b			;a03f	80 	. 
la040h:
	scf			;a040	37 	7 
la041h:
	ld a,h			;a041	7c 	| 
	add a,b			;a042	80 	. 
la043h:
	ld d,b			;a043	50 	P 
	add a,d			;a044	82 	. 
	ld b,b			;a045	40 	@ 
	add a,a			;a046	87 	. 
la047h:
	xor a			;a047	af 	. 
	adc a,a			;a048	8f 	. 
	adc a,e			;a049	8b 	. 
	ld h,b			;a04a	60 	` 
	add a,c			;a04b	81 	. 
	ld (hl),b			;a04c	70 	p 
la04dh:
	add a,c			;a04d	81 	. 
	ld a,(hl)			;a04e	7e 	~ 
	add a,b			;a04f	80 	. 
	scf			;a050	37 	7 
	inc bc			;a051	03 	. 
	ld a,h			;a052	7c 	| 
	add a,b			;a053	80 	. 
	ld a,(hl)			;a054	7e 	~ 
	add a,b			;a055	80 	. 
	nop			;a056	00 	. 
la057h:
	ld e,a			;a057	5f 	_ 
	add a,b			;a058	80 	. 
la059h:
	ld c,a			;a059	4f 	O 
	add a,b			;a05a	80 	. 
	add a,b			;a05b	80 	. 
	add a,b			;a05c	80 	. 
la05dh:
	add a,b			;a05d	80 	. 
	add a,b			;a05e	80 	. 
	add a,b			;a05f	80 	. 
	add a,b			;a060	80 	. 
	jr c,la0a3h		;a061	38 40 	8 @ 
	xor b			;a063	a8 	. 
	cp a			;a064	bf 	. 
la065h:
	adc a,a			;a065	8f 	. 
	adc a,a			;a066	8f 	. 
	cp a			;a067	bf 	. 
	sbc a,a			;a068	9f 	. 
	adc a,a			;a069	8f 	. 
	xor l			;a06a	ad 	. 
	ld l,d			;a06b	6a 	j 
	add a,b			;a06c	80 	. 
	scf			;a06d	37 	7 
	ld b,b			;a06e	40 	@ 
	xor d			;a06f	aa 	. 
	cp a			;a070	bf 	. 
	or a			;a071	b7 	. 
	or l			;a072	b5 	. 
	cp a			;a073	bf 	. 
	cp a			;a074	bf 	. 
	cp e			;a075	bb 	. 
	cp d			;a076	ba 	. 
	ld l,d			;a077	6a 	j 
	add a,b			;a078	80 	. 
	scf			;a079	37 	7 
	ld b,b			;a07a	40 	@ 
	xor d			;a07b	aa 	. 
	cp a			;a07c	bf 	. 
	cp a			;a07d	bf 	. 
	cp a			;a07e	bf 	. 
	cp h			;a07f	bc 	. 
	cp (hl)			;a080	be 	. 
	cp a			;a081	bf 	. 
	cp a			;a082	bf 	. 
la083h:
	ld l,d			;a083	6a 	j 
	add a,b			;a084	80 	. 
	scf			;a085	37 	7 
	ld b,b			;a086	40 	@ 
	xor d			;a087	aa 	. 
la088h:
	cp a			;a088	bf 	. 
	sub l			;a089	95 	. 
	add a,b			;a08a	80 	. 
	add a,b			;a08b	80 	. 
	add a,b			;a08c	80 	. 
	add a,b			;a08d	80 	. 
	cp a			;a08e	bf 	. 
	ld l,d			;a08f	6a 	j 
	add a,b			;a090	80 	. 
	scf			;a091	37 	7 
	ld b,b			;a092	40 	@ 
	xor d			;a093	aa 	. 
la094h:
	cp a			;a094	bf 	. 
	cp l			;a095	bd 	. 
	cp a			;a096	bf 	. 
	cp a			;a097	bf 	. 
	cp a			;a098	bf 	. 
	cp l			;a099	bd 	. 
la09ah:
	cp a			;a09a	bf 	. 
la09bh:
	ld l,d			;a09b	6a 	j 
	add a,b			;a09c	80 	. 
la09dh:
	scf			;a09d	37 	7 
	ld b,b			;a09e	40 	@ 
	xor d			;a09f	aa 	. 
la0a0h:
	cp a			;a0a0	bf 	. 
	cp a			;a0a1	bf 	. 
	cp a			;a0a2	bf 	. 
la0a3h:
	cp a			;a0a3	bf 	. 
	cp a			;a0a4	bf 	. 
	cp a			;a0a5	bf 	. 
	cp a			;a0a6	bf 	. 
	ld l,d			;a0a7	6a 	j 
la0a8h:
	add a,b			;a0a8	80 	. 
	scf			;a0a9	37 	7 
	ld b,b			;a0aa	40 	@ 
	xor d			;a0ab	aa 	. 
	cp a			;a0ac	bf 	. 
	cp a			;a0ad	bf 	. 
	cp a			;a0ae	bf 	. 
	cp a			;a0af	bf 	. 
	cp a			;a0b0	bf 	. 
	cp a			;a0b1	bf 	. 
	cp a			;a0b2	bf 	. 
	ld l,d			;a0b3	6a 	j 
	add a,b			;a0b4	80 	. 
	scf			;a0b5	37 	7 
	ld b,b			;a0b6	40 	@ 
	xor d			;a0b7	aa 	. 
	cp a			;a0b8	bf 	. 
	cp a			;a0b9	bf 	. 
	cp a			;a0ba	bf 	. 
	cp a			;a0bb	bf 	. 
	cp a			;a0bc	bf 	. 
	cp a			;a0bd	bf 	. 
	cp a			;a0be	bf 	. 
	ld l,d			;a0bf	6a 	j 
	add a,b			;a0c0	80 	. 
	scf			;a0c1	37 	7 
	ld b,b			;a0c2	40 	@ 
	xor d			;a0c3	aa 	. 
	cp a			;a0c4	bf 	. 
	cp a			;a0c5	bf 	. 
	cp a			;a0c6	bf 	. 
	cp a			;a0c7	bf 	. 
	cp a			;a0c8	bf 	. 
	cp a			;a0c9	bf 	. 
	cp a			;a0ca	bf 	. 
	ld l,d			;a0cb	6a 	j 
	add a,b			;a0cc	80 	. 
	scf			;a0cd	37 	7 
	ld (hl),b			;a0ce	70 	p 
	add a,d			;a0cf	82 	. 
la0d0h:
	ld b,b			;a0d0	40 	@ 
la0d1h:
	adc a,d			;a0d1	8a 	. 
la0d2h:
	sbc a,a			;a0d2	9f 	. 
	cp a			;a0d3	bf 	. 
la0d4h:
	cp a			;a0d4	bf 	. 
la0d5h:
	xor a			;a0d5	af 	. 
	add a,a			;a0d6	87 	. 
	add a,a			;a0d7	87 	. 
la0d8h:
	ld a,d			;a0d8	7a 	z 
	add a,b			;a0d9	80 	. 
	scf			;a0da	37 	7 
	ld bc,l807dh		;a0db	01 7d 80 	. } . 
	ld a,h			;a0de	7c 	| 
	add a,b			;a0df	80 	. 
	ld (hl),b			;a0e0	70 	p 
	add a,d			;a0e1	82 	. 
	ld a,b			;a0e2	78 	x 
	add a,b			;a0e3	80 	. 
	ld a,h			;a0e4	7c 	| 
	add a,b			;a0e5	80 	. 
la0e6h:
	ld a,(hl)			;a0e6	7e 	~ 
	add a,b			;a0e7	80 	. 
	nop			;a0e8	00 	. 
	ld b,c			;a0e9	41 	A 
	and b			;a0ea	a0 	. 
	ld b,b			;a0eb	40 	@ 
	cp h			;a0ec	bc 	. 
	cp h			;a0ed	bc 	. 
	cp h			;a0ee	bc 	. 
	cp h			;a0ef	bc 	. 
	cp h			;a0f0	bc 	. 
	cp h			;a0f1	bc 	. 
	or h			;a0f2	b4 	. 
	ld l,e			;a0f3	6b 	k 
	add a,b			;a0f4	80 	. 
	scf			;a0f5	37 	7 
	ld b,b			;a0f6	40 	@ 
	xor d			;a0f7	aa 	. 
	xor b			;a0f8	a8 	. 
	xor h			;a0f9	ac 	. 
	xor d			;a0fa	aa 	. 
	cp a			;a0fb	bf 	. 
	xor b			;a0fc	a8 	. 
	xor h			;a0fd	ac 	. 
	xor d			;a0fe	aa 	. 
	ld l,d			;a0ff	6a 	j 
	add a,b			;a100	80 	. 
	scf			;a101	37 	7 
	ld b,b			;a102	40 	@ 
	xor d			;a103	aa 	. 
	xor a			;a104	af 	. 
	cp a			;a105	bf 	. 
	or a			;a106	b7 	. 
	or e			;a107	b3 	. 
	cp a			;a108	bf 	. 
	cp a			;a109	bf 	. 
	xor a			;a10a	af 	. 
	ld l,d			;a10b	6a 	j 
	add a,b			;a10c	80 	. 
	scf			;a10d	37 	7 
	ld b,b			;a10e	40 	@ 
	xor d			;a10f	aa 	. 
	add a,b			;a110	80 	. 
	add a,c			;a111	81 	. 
	add a,c			;a112	81 	. 
	add a,c			;a113	81 	. 
	add a,c			;a114	81 	. 
	add a,c			;a115	81 	. 
	xor d			;a116	aa 	. 
	ld l,d			;a117	6a 	j 
	add a,b			;a118	80 	. 
	scf			;a119	37 	7 
	ld b,b			;a11a	40 	@ 
	xor d			;a11b	aa 	. 
	sub b			;a11c	90 	. 
	add a,b			;a11d	80 	. 
	add a,b			;a11e	80 	. 
	add a,b			;a11f	80 	. 
	add a,b			;a120	80 	. 
	add a,b			;a121	80 	. 
	cp d			;a122	ba 	. 
	ld l,d			;a123	6a 	j 
	add a,b			;a124	80 	. 
	scf			;a125	37 	7 
	ld b,b			;a126	40 	@ 
	xor d			;a127	aa 	. 
	cp a			;a128	bf 	. 
	cp (hl)			;a129	be 	. 
	cp (hl)			;a12a	be 	. 
	cp (hl)			;a12b	be 	. 
	cp (hl)			;a12c	be 	. 
	cp (hl)			;a12d	be 	. 
	cp a			;a12e	bf 	. 
	ld l,d			;a12f	6a 	j 
	add a,b			;a130	80 	. 
	scf			;a131	37 	7 
	ld b,b			;a132	40 	@ 
	xor d			;a133	aa 	. 
	cp a			;a134	bf 	. 
	cp a			;a135	bf 	. 
	cp a			;a136	bf 	. 
	cp a			;a137	bf 	. 
	cp a			;a138	bf 	. 
	cp a			;a139	bf 	. 
	cp a			;a13a	bf 	. 
	ld l,d			;a13b	6a 	j 
	add a,b			;a13c	80 	. 
	scf			;a13d	37 	7 
	ld b,b			;a13e	40 	@ 
	xor d			;a13f	aa 	. 
	cp a			;a140	bf 	. 
	cp a			;a141	bf 	. 
	cp a			;a142	bf 	. 
	cp a			;a143	bf 	. 
	cp a			;a144	bf 	. 
	cp a			;a145	bf 	. 
	cp a			;a146	bf 	. 
	ld l,d			;a147	6a 	j 
	add a,b			;a148	80 	. 
	scf			;a149	37 	7 
	ld b,b			;a14a	40 	@ 
	xor d			;a14b	aa 	. 
	cp a			;a14c	bf 	. 
	cp a			;a14d	bf 	. 
	cp a			;a14e	bf 	. 
	cp a			;a14f	bf 	. 
la150h:
	cp a			;a150	bf 	. 
	cp a			;a151	bf 	. 
	cp a			;a152	bf 	. 
	ld l,d			;a153	6a 	j 
	add a,b			;a154	80 	. 
	scf			;a155	37 	7 
	ld b,b			;a156	40 	@ 
	adc a,d			;a157	8a 	. 
	xor e			;a158	ab 	. 
	cp a			;a159	bf 	. 
	cp a			;a15a	bf 	. 
	cp a			;a15b	bf 	. 
	cp a			;a15c	bf 	. 
	sbc a,a			;a15d	9f 	. 
	sbc a,a			;a15e	9f 	. 
	ld l,d			;a15f	6a 	j 
	add a,b			;a160	80 	. 
	scf			;a161	37 	7 
	ld bc,l8074h		;a162	01 74 80 	. t . 
	ld (hl),b			;a165	70 	p 
	add a,c			;a166	81 	. 
	ld b,b			;a167	40 	@ 
	adc a,e			;a168	8b 	. 
	ld h,b			;a169	60 	` 
	add a,e			;a16a	83 	. 
	ld (hl),b			;a16b	70 	p 
	add a,d			;a16c	82 	. 
	ld a,b			;a16d	78 	x 
	add a,b			;a16e	80 	. 
	ld a,h			;a16f	7c 	| 
	add a,b			;a170	80 	. 
	nop			;a171	00 	. 
	ld b,a			;a172	47 	G 
	add a,b			;a173	80 	. 
	ld b,e			;a174	43 	C 
	or b			;a175	b0 	. 
	or b			;a176	b0 	. 
	or b			;a177	b0 	. 
	or b			;a178	b0 	. 
	or b			;a179	b0 	. 
	or b			;a17a	b0 	. 
	sub b			;a17b	90 	. 
	ld l,a			;a17c	6f 	o 
	add a,b			;a17d	80 	. 
	scf			;a17e	37 	7 
	ld b,b			;a17f	40 	@ 
	xor d			;a180	aa 	. 
	and e			;a181	a3 	. 
	or e			;a182	b3 	. 
	xor e			;a183	ab 	. 
	cp a			;a184	bf 	. 
	and e			;a185	a3 	. 
	or e			;a186	b3 	. 
	xor e			;a187	ab 	. 
	ld l,d			;a188	6a 	j 
	add a,b			;a189	80 	. 
	scf			;a18a	37 	7 
	ld b,b			;a18b	40 	@ 
	xor d			;a18c	aa 	. 
	cp (hl)			;a18d	be 	. 
	cp (hl)			;a18e	be 	. 
	sbc a,(hl)			;a18f	9e 	. 
	adc a,a			;a190	8f 	. 
	cp (hl)			;a191	be 	. 
	cp (hl)			;a192	be 	. 
	cp (hl)			;a193	be 	. 
	ld l,d			;a194	6a 	j 
	add a,b			;a195	80 	. 
	scf			;a196	37 	7 
	ld b,b			;a197	40 	@ 
	xor d			;a198	aa 	. 
	add a,d			;a199	82 	. 
	add a,a			;a19a	87 	. 
	add a,a			;a19b	87 	. 
	add a,a			;a19c	87 	. 
	add a,a			;a19d	87 	. 
	add a,a			;a19e	87 	. 
	xor d			;a19f	aa 	. 
	ld l,d			;a1a0	6a 	j 
	add a,b			;a1a1	80 	. 
	scf			;a1a2	37 	7 
	ld b,b			;a1a3	40 	@ 
	xor d			;a1a4	aa 	. 
	add a,b			;a1a5	80 	. 
	add a,b			;a1a6	80 	. 
	add a,b			;a1a7	80 	. 
	add a,b			;a1a8	80 	. 
	add a,b			;a1a9	80 	. 
	add a,b			;a1aa	80 	. 
	xor d			;a1ab	aa 	. 
	ld l,d			;a1ac	6a 	j 
	add a,b			;a1ad	80 	. 
	scf			;a1ae	37 	7 
	ld b,b			;a1af	40 	@ 
	xor d			;a1b0	aa 	. 
	cp l			;a1b1	bd 	. 
	cp b			;a1b2	b8 	. 
	cp b			;a1b3	b8 	. 
	cp b			;a1b4	b8 	. 
	cp b			;a1b5	b8 	. 
	cp b			;a1b6	b8 	. 
	cp a			;a1b7	bf 	. 
	ld l,d			;a1b8	6a 	j 
	add a,b			;a1b9	80 	. 
	scf			;a1ba	37 	7 
	ld b,b			;a1bb	40 	@ 
	xor d			;a1bc	aa 	. 
	cp a			;a1bd	bf 	. 
	cp a			;a1be	bf 	. 
	cp a			;a1bf	bf 	. 
	cp a			;a1c0	bf 	. 
	cp a			;a1c1	bf 	. 
	cp a			;a1c2	bf 	. 
	cp a			;a1c3	bf 	. 
	ld l,d			;a1c4	6a 	j 
	add a,b			;a1c5	80 	. 
	scf			;a1c6	37 	7 
	ld b,b			;a1c7	40 	@ 
	xor d			;a1c8	aa 	. 
	cp a			;a1c9	bf 	. 
	cp a			;a1ca	bf 	. 
	cp a			;a1cb	bf 	. 
	cp a			;a1cc	bf 	. 
	cp a			;a1cd	bf 	. 
	cp a			;a1ce	bf 	. 
	cp a			;a1cf	bf 	. 
	ld l,d			;a1d0	6a 	j 
	add a,b			;a1d1	80 	. 
	scf			;a1d2	37 	7 
	ld b,b			;a1d3	40 	@ 
	xor d			;a1d4	aa 	. 
	cp a			;a1d5	bf 	. 
	cp a			;a1d6	bf 	. 
	cp a			;a1d7	bf 	. 
	cp a			;a1d8	bf 	. 
	cp a			;a1d9	bf 	. 
	cp a			;a1da	bf 	. 
	cp a			;a1db	bf 	. 
	ld l,d			;a1dc	6a 	j 
	add a,b			;a1dd	80 	. 
	scf			;a1de	37 	7 
	ld b,b			;a1df	40 	@ 
	xor d			;a1e0	aa 	. 
	xor a			;a1e1	af 	. 
	cp a			;a1e2	bf 	. 
	cp a			;a1e3	bf 	. 
	cp a			;a1e4	bf 	. 
	cp a			;a1e5	bf 	. 
	cp a			;a1e6	bf 	. 
	cp a			;a1e7	bf 	. 
	ld l,d			;a1e8	6a 	j 
	add a,b			;a1e9	80 	. 
	scf			;a1ea	37 	7 
	ld a,h			;a1eb	7c 	| 
	add a,b			;a1ec	80 	. 
	ld d,b			;a1ed	50 	P 
	add a,d			;a1ee	82 	. 
	ld b,b			;a1ef	40 	@ 
	add a,a			;a1f0	87 	. 
	xor a			;a1f1	af 	. 
	adc a,a			;a1f2	8f 	. 
	adc a,e			;a1f3	8b 	. 
	ld h,b			;a1f4	60 	` 
	add a,c			;a1f5	81 	. 
	ld (hl),b			;a1f6	70 	p 
	add a,c			;a1f7	81 	. 
	ld a,(hl)			;a1f8	7e 	~ 
	add a,b			;a1f9	80 	. 
	scf			;a1fa	37 	7 
	inc bc			;a1fb	03 	. 
	ld a,h			;a1fc	7c 	| 
	add a,b			;a1fd	80 	. 
	ld a,(hl)			;a1fe	7e 	~ 
	add a,b			;a1ff	80 	. 
	nop			;a200	00 	. 
	ld e,a			;a201	5f 	_ 
	add a,b			;a202	80 	. 
	ld c,a			;a203	4f 	O 
	add a,b			;a204	80 	. 
	add a,b			;a205	80 	. 
	add a,b			;a206	80 	. 
	add a,b			;a207	80 	. 
	add a,b			;a208	80 	. 
	add a,b			;a209	80 	. 
	add a,b			;a20a	80 	. 
	jr c,la24dh		;a20b	38 40 	8 @ 
	xor b			;a20d	a8 	. 
	adc a,a			;a20e	8f 	. 
	adc a,a			;a20f	8f 	. 
	xor a			;a210	af 	. 
	cp a			;a211	bf 	. 
	adc a,a			;a212	8f 	. 
	adc a,a			;a213	8f 	. 
	xor l			;a214	ad 	. 
	ld l,d			;a215	6a 	j 
	add a,b			;a216	80 	. 
	scf			;a217	37 	7 
	ld b,b			;a218	40 	@ 
	xor d			;a219	aa 	. 
	cp d			;a21a	ba 	. 
	cp e			;a21b	bb 	. 
	cp d			;a21c	ba 	. 
	cp a			;a21d	bf 	. 
	cp d			;a21e	ba 	. 
	cp e			;a21f	bb 	. 
	cp d			;a220	ba 	. 
	ld l,d			;a221	6a 	j 
	add a,b			;a222	80 	. 
	scf			;a223	37 	7 
	ld b,b			;a224	40 	@ 
	xor d			;a225	aa 	. 
	adc a,e			;a226	8b 	. 
	sbc a,a			;a227	9f 	. 
	sbc a,l			;a228	9d 	. 
	sbc a,h			;a229	9c 	. 
	sbc a,a			;a22a	9f 	. 
	sbc a,a			;a22b	9f 	. 
	xor e			;a22c	ab 	. 
	ld l,d			;a22d	6a 	j 
	add a,b			;a22e	80 	. 
	scf			;a22f	37 	7 
	ld b,b			;a230	40 	@ 
	xor d			;a231	aa 	. 
	add a,b			;a232	80 	. 
	add a,b			;a233	80 	. 
	add a,b			;a234	80 	. 
	add a,b			;a235	80 	. 
	add a,b			;a236	80 	. 
	add a,b			;a237	80 	. 
	xor d			;a238	aa 	. 
	ld l,d			;a239	6a 	j 
	add a,b			;a23a	80 	. 
	scf			;a23b	37 	7 
	ld b,b			;a23c	40 	@ 
	xor d			;a23d	aa 	. 
	or h			;a23e	b4 	. 
	and b			;a23f	a0 	. 
	and b			;a240	a0 	. 
	and b			;a241	a0 	. 
	and b			;a242	a0 	. 
	and b			;a243	a0 	. 
	cp (hl)			;a244	be 	. 
	ld l,d			;a245	6a 	j 
	add a,b			;a246	80 	. 
	scf			;a247	37 	7 
	ld b,b			;a248	40 	@ 
	xor d			;a249	aa 	. 
	cp a			;a24a	bf 	. 
	cp a			;a24b	bf 	. 
	cp a			;a24c	bf 	. 
la24dh:
	cp a			;a24d	bf 	. 
	cp a			;a24e	bf 	. 
	cp a			;a24f	bf 	. 
	cp a			;a250	bf 	. 
	ld l,d			;a251	6a 	j 
	add a,b			;a252	80 	. 
	scf			;a253	37 	7 
	ld b,b			;a254	40 	@ 
	xor d			;a255	aa 	. 
	cp a			;a256	bf 	. 
	cp a			;a257	bf 	. 
	cp a			;a258	bf 	. 
	cp a			;a259	bf 	. 
	cp a			;a25a	bf 	. 
	cp a			;a25b	bf 	. 
	cp a			;a25c	bf 	. 
	ld l,d			;a25d	6a 	j 
	add a,b			;a25e	80 	. 
	scf			;a25f	37 	7 
	ld b,b			;a260	40 	@ 
	xor d			;a261	aa 	. 
	cp a			;a262	bf 	. 
	cp a			;a263	bf 	. 
	cp a			;a264	bf 	. 
	cp a			;a265	bf 	. 
	cp a			;a266	bf 	. 
	cp a			;a267	bf 	. 
	cp a			;a268	bf 	. 
	ld l,d			;a269	6a 	j 
	add a,b			;a26a	80 	. 
	scf			;a26b	37 	7 
	ld b,b			;a26c	40 	@ 
	xor d			;a26d	aa 	. 
	cp a			;a26e	bf 	. 
	cp a			;a26f	bf 	. 
	cp a			;a270	bf 	. 
	cp a			;a271	bf 	. 
	cp a			;a272	bf 	. 
	cp a			;a273	bf 	. 
	cp a			;a274	bf 	. 
	ld l,d			;a275	6a 	j 
	add a,b			;a276	80 	. 
	scf			;a277	37 	7 
	ld (hl),b			;a278	70 	p 
	add a,d			;a279	82 	. 
	ld b,b			;a27a	40 	@ 
	adc a,d			;a27b	8a 	. 
	sbc a,a			;a27c	9f 	. 
	cp a			;a27d	bf 	. 
	cp a			;a27e	bf 	. 
	xor a			;a27f	af 	. 
	add a,a			;a280	87 	. 
	add a,a			;a281	87 	. 
	ld a,d			;a282	7a 	z 
	add a,b			;a283	80 	. 
	scf			;a284	37 	7 
	ld bc,l807dh		;a285	01 7d 80 	. } . 
	ld a,h			;a288	7c 	| 
	add a,b			;a289	80 	. 
	ld (hl),b			;a28a	70 	p 
	add a,d			;a28b	82 	. 
	ld a,b			;a28c	78 	x 
	add a,b			;a28d	80 	. 
	ld a,h			;a28e	7c 	| 
	add a,b			;a28f	80 	. 
	ld a,(hl)			;a290	7e 	~ 
	add a,b			;a291	80 	. 
	nop			;a292	00 	. 
	ld b,c			;a293	41 	A 
	and b			;a294	a0 	. 
	ld b,b			;a295	40 	@ 
	cp h			;a296	bc 	. 
	cp h			;a297	bc 	. 
	cp h			;a298	bc 	. 
	cp h			;a299	bc 	. 
	cp h			;a29a	bc 	. 
	cp h			;a29b	bc 	. 
	or h			;a29c	b4 	. 
	ld l,e			;a29d	6b 	k 
	add a,b			;a29e	80 	. 
	scf			;a29f	37 	7 
	ld b,b			;a2a0	40 	@ 
	xor d			;a2a1	aa 	. 
	xor b			;a2a2	a8 	. 
	xor h			;a2a3	ac 	. 
	cp a			;a2a4	bf 	. 
	sub l			;a2a5	95 	. 
	sbc a,h			;a2a6	9c 	. 
	cp (hl)			;a2a7	be 	. 
	cp a			;a2a8	bf 	. 
	ld l,d			;a2a9	6a 	j 
	add a,b			;a2aa	80 	. 
	scf			;a2ab	37 	7 
	ld b,b			;a2ac	40 	@ 
	xor d			;a2ad	aa 	. 
	cp a			;a2ae	bf 	. 
	cp a			;a2af	bf 	. 
	or e			;a2b0	b3 	. 
	cp e			;a2b1	bb 	. 
	cp a			;a2b2	bf 	. 
	cp a			;a2b3	bf 	. 
	cp a			;a2b4	bf 	. 
	ld l,d			;a2b5	6a 	j 
	add a,b			;a2b6	80 	. 
	scf			;a2b7	37 	7 
	ld b,b			;a2b8	40 	@ 
	xor d			;a2b9	aa 	. 
	sub a			;a2ba	97 	. 
	add a,e			;a2bb	83 	. 
	add a,e			;a2bc	83 	. 
	add a,e			;a2bd	83 	. 
	add a,e			;a2be	83 	. 
	cp a			;a2bf	bf 	. 
	cp a			;a2c0	bf 	. 
	ld l,d			;a2c1	6a 	j 
	add a,b			;a2c2	80 	. 
	scf			;a2c3	37 	7 
	ld b,b			;a2c4	40 	@ 
	xor d			;a2c5	aa 	. 
	or l			;a2c6	b5 	. 
	cp h			;a2c7	bc 	. 
	cp h			;a2c8	bc 	. 
	cp h			;a2c9	bc 	. 
	or h			;a2ca	b4 	. 
	cp a			;a2cb	bf 	. 
	cp a			;a2cc	bf 	. 
	ld l,d			;a2cd	6a 	j 
	add a,b			;a2ce	80 	. 
	scf			;a2cf	37 	7 
	ld b,b			;a2d0	40 	@ 
	xor d			;a2d1	aa 	. 
	cp a			;a2d2	bf 	. 
	cp a			;a2d3	bf 	. 
	cp a			;a2d4	bf 	. 
	cp a			;a2d5	bf 	. 
	cp a			;a2d6	bf 	. 
	cp a			;a2d7	bf 	. 
	cp a			;a2d8	bf 	. 
	ld l,d			;a2d9	6a 	j 
	add a,b			;a2da	80 	. 
	scf			;a2db	37 	7 
	ld b,b			;a2dc	40 	@ 
	xor d			;a2dd	aa 	. 
	cp a			;a2de	bf 	. 
	cp a			;a2df	bf 	. 
	cp a			;a2e0	bf 	. 
	cp a			;a2e1	bf 	. 
	cp a			;a2e2	bf 	. 
	cp a			;a2e3	bf 	. 
	cp a			;a2e4	bf 	. 
	ld l,d			;a2e5	6a 	j 
	add a,b			;a2e6	80 	. 
	scf			;a2e7	37 	7 
	ld b,b			;a2e8	40 	@ 
	xor d			;a2e9	aa 	. 
	cp a			;a2ea	bf 	. 
	cp a			;a2eb	bf 	. 
	cp a			;a2ec	bf 	. 
	cp a			;a2ed	bf 	. 
	cp a			;a2ee	bf 	. 
	cp a			;a2ef	bf 	. 
	cp a			;a2f0	bf 	. 
	ld l,d			;a2f1	6a 	j 
	add a,b			;a2f2	80 	. 
	scf			;a2f3	37 	7 
	ld b,b			;a2f4	40 	@ 
	xor d			;a2f5	aa 	. 
	cp a			;a2f6	bf 	. 
	cp a			;a2f7	bf 	. 
	cp a			;a2f8	bf 	. 
	cp a			;a2f9	bf 	. 
	cp a			;a2fa	bf 	. 
	cp a			;a2fb	bf 	. 
	cp a			;a2fc	bf 	. 
	ld l,d			;a2fd	6a 	j 
	add a,b			;a2fe	80 	. 
	scf			;a2ff	37 	7 
	ld b,b			;a300	40 	@ 
la301h:
	adc a,d			;a301	8a 	. 
	xor e			;a302	ab 	. 
	cp a			;a303	bf 	. 
	cp a			;a304	bf 	. 
	cp a			;a305	bf 	. 
	cp a			;a306	bf 	. 
	sbc a,a			;a307	9f 	. 
	sbc a,a			;a308	9f 	. 
	ld l,d			;a309	6a 	j 
	add a,b			;a30a	80 	. 
	scf			;a30b	37 	7 
	ld bc,l8074h		;a30c	01 74 80 	. t . 
	ld (hl),b			;a30f	70 	p 
	add a,c			;a310	81 	. 
	ld b,b			;a311	40 	@ 
	adc a,e			;a312	8b 	. 
	ld h,b			;a313	60 	` 
	add a,e			;a314	83 	. 
	ld (hl),b			;a315	70 	p 
	add a,d			;a316	82 	. 
	ld a,b			;a317	78 	x 
	add a,b			;a318	80 	. 
	ld a,h			;a319	7c 	| 
	add a,b			;a31a	80 	. 
	nop			;a31b	00 	. 
	ld b,a			;a31c	47 	G 
	add a,b			;a31d	80 	. 
	ld b,e			;a31e	43 	C 
	or b			;a31f	b0 	. 
	or b			;a320	b0 	. 
	or b			;a321	b0 	. 
	or b			;a322	b0 	. 
	or b			;a323	b0 	. 
	or b			;a324	b0 	. 
	sub b			;a325	90 	. 
	ld l,a			;a326	6f 	o 
la327h:
	add a,b			;a327	80 	. 
	scf			;a328	37 	7 
	ld b,b			;a329	40 	@ 
	xor d			;a32a	aa 	. 
	and e			;a32b	a3 	. 
	or e			;a32c	b3 	. 
	cp a			;a32d	bf 	. 
	sub a			;a32e	97 	. 
	or e			;a32f	b3 	. 
	cp e			;a330	bb 	. 
	cp a			;a331	bf 	. 
	ld l,d			;a332	6a 	j 
	add a,b			;a333	80 	. 
	scf			;a334	37 	7 
	ld b,b			;a335	40 	@ 
	xor d			;a336	aa 	. 
	cp (hl)			;a337	be 	. 
	cp (hl)			;a338	be 	. 
	adc a,a			;a339	8f 	. 
	xor l			;a33a	ad 	. 
	cp l			;a33b	bd 	. 
	cp a			;a33c	bf 	. 
	cp a			;a33d	bf 	. 
	ld l,d			;a33e	6a 	j 
	add a,b			;a33f	80 	. 
	scf			;a340	37 	7 
	ld b,b			;a341	40 	@ 
	xor d			;a342	aa 	. 
	sbc a,a			;a343	9f 	. 
	adc a,a			;a344	8f 	. 
	adc a,a			;a345	8f 	. 
	adc a,a			;a346	8f 	. 
	adc a,a			;a347	8f 	. 
	cp a			;a348	bf 	. 
	cp a			;a349	bf 	. 
	ld l,d			;a34a	6a 	j 
	add a,b			;a34b	80 	. 
	scf			;a34c	37 	7 
	ld b,b			;a34d	40 	@ 
	xor d			;a34e	aa 	. 
	sub l			;a34f	95 	. 
	or b			;a350	b0 	. 
	or b			;a351	b0 	. 
	or b			;a352	b0 	. 
	sub b			;a353	90 	. 
	cp a			;a354	bf 	. 
	cp a			;a355	bf 	. 
	ld l,d			;a356	6a 	j 
	add a,b			;a357	80 	. 
	scf			;a358	37 	7 
	ld b,b			;a359	40 	@ 
	xor d			;a35a	aa 	. 
	cp a			;a35b	bf 	. 
	cp a			;a35c	bf 	. 
	cp a			;a35d	bf 	. 
	cp a			;a35e	bf 	. 
	cp a			;a35f	bf 	. 
	cp a			;a360	bf 	. 
	cp a			;a361	bf 	. 
	ld l,d			;a362	6a 	j 
	add a,b			;a363	80 	. 
	scf			;a364	37 	7 
	ld b,b			;a365	40 	@ 
	xor d			;a366	aa 	. 
	cp a			;a367	bf 	. 
	cp a			;a368	bf 	. 
	cp a			;a369	bf 	. 
	cp a			;a36a	bf 	. 
	cp a			;a36b	bf 	. 
	cp a			;a36c	bf 	. 
	cp a			;a36d	bf 	. 
	ld l,d			;a36e	6a 	j 
	add a,b			;a36f	80 	. 
	scf			;a370	37 	7 
	ld b,b			;a371	40 	@ 
	xor d			;a372	aa 	. 
	cp a			;a373	bf 	. 
	cp a			;a374	bf 	. 
	cp a			;a375	bf 	. 
	cp a			;a376	bf 	. 
	cp a			;a377	bf 	. 
	cp a			;a378	bf 	. 
	cp a			;a379	bf 	. 
	ld l,d			;a37a	6a 	j 
	add a,b			;a37b	80 	. 
	scf			;a37c	37 	7 
	ld b,b			;a37d	40 	@ 
	xor d			;a37e	aa 	. 
	cp a			;a37f	bf 	. 
	cp a			;a380	bf 	. 
	cp a			;a381	bf 	. 
	cp a			;a382	bf 	. 
	cp a			;a383	bf 	. 
	cp a			;a384	bf 	. 
	cp a			;a385	bf 	. 
	ld l,d			;a386	6a 	j 
	add a,b			;a387	80 	. 
	scf			;a388	37 	7 
	ld b,b			;a389	40 	@ 
	xor d			;a38a	aa 	. 
	xor a			;a38b	af 	. 
	cp a			;a38c	bf 	. 
	cp a			;a38d	bf 	. 
	cp a			;a38e	bf 	. 
	cp a			;a38f	bf 	. 
	cp a			;a390	bf 	. 
	cp a			;a391	bf 	. 
	ld l,d			;a392	6a 	j 
	add a,b			;a393	80 	. 
	scf			;a394	37 	7 
	ld a,h			;a395	7c 	| 
	add a,b			;a396	80 	. 
la397h:
	ld d,b			;a397	50 	P 
	add a,d			;a398	82 	. 
	ld b,b			;a399	40 	@ 
	add a,a			;a39a	87 	. 
	xor a			;a39b	af 	. 
	adc a,a			;a39c	8f 	. 
	adc a,e			;a39d	8b 	. 
	ld h,b			;a39e	60 	` 
	add a,c			;a39f	81 	. 
	ld (hl),b			;a3a0	70 	p 
	add a,c			;a3a1	81 	. 
	ld a,(hl)			;a3a2	7e 	~ 
	add a,b			;a3a3	80 	. 
	scf			;a3a4	37 	7 
	inc bc			;a3a5	03 	. 
	ld a,h			;a3a6	7c 	| 
	add a,b			;a3a7	80 	. 
	ld a,(hl)			;a3a8	7e 	~ 
	add a,b			;a3a9	80 	. 
	nop			;a3aa	00 	. 
	ld e,a			;a3ab	5f 	_ 
	add a,b			;a3ac	80 	. 
	ld c,a			;a3ad	4f 	O 
	add a,b			;a3ae	80 	. 
	add a,b			;a3af	80 	. 
	add a,b			;a3b0	80 	. 
	add a,b			;a3b1	80 	. 
	add a,b			;a3b2	80 	. 
	add a,b			;a3b3	80 	. 
	add a,b			;a3b4	80 	. 
	jr c,la3f7h		;a3b5	38 40 	8 @ 
	xor b			;a3b7	a8 	. 
	adc a,a			;a3b8	8f 	. 
	adc a,a			;a3b9	8f 	. 
	cp a			;a3ba	bf 	. 
	sbc a,a			;a3bb	9f 	. 
	adc a,a			;a3bc	8f 	. 
	xor a			;a3bd	af 	. 
	cp l			;a3be	bd 	. 
	ld l,d			;a3bf	6a 	j 
	add a,b			;a3c0	80 	. 
	scf			;a3c1	37 	7 
	ld b,b			;a3c2	40 	@ 
	xor d			;a3c3	aa 	. 
	cp d			;a3c4	ba 	. 
	cp e			;a3c5	bb 	. 
	cp a			;a3c6	bf 	. 
	or l			;a3c7	b5 	. 
	or a			;a3c8	b7 	. 
	cp a			;a3c9	bf 	. 
	cp a			;a3ca	bf 	. 
	ld l,d			;a3cb	6a 	j 
	add a,b			;a3cc	80 	. 
	scf			;a3cd	37 	7 
	ld b,b			;a3ce	40 	@ 
	xor d			;a3cf	aa 	. 
	cp a			;a3d0	bf 	. 
	cp a			;a3d1	bf 	. 
	cp h			;a3d2	bc 	. 
	cp (hl)			;a3d3	be 	. 
	cp a			;a3d4	bf 	. 
	cp a			;a3d5	bf 	. 
	cp a			;a3d6	bf 	. 
	ld l,d			;a3d7	6a 	j 
	add a,b			;a3d8	80 	. 
	scf			;a3d9	37 	7 
	ld b,b			;a3da	40 	@ 
	xor d			;a3db	aa 	. 
	sub l			;a3dc	95 	. 
	add a,b			;a3dd	80 	. 
	add a,b			;a3de	80 	. 
	add a,b			;a3df	80 	. 
	add a,b			;a3e0	80 	. 
	cp a			;a3e1	bf 	. 
	cp a			;a3e2	bf 	. 
	ld l,d			;a3e3	6a 	j 
	add a,b			;a3e4	80 	. 
	scf			;a3e5	37 	7 
	ld b,b			;a3e6	40 	@ 
	xor d			;a3e7	aa 	. 
	cp l			;a3e8	bd 	. 
	cp a			;a3e9	bf 	. 
	cp a			;a3ea	bf 	. 
	cp a			;a3eb	bf 	. 
	cp l			;a3ec	bd 	. 
	cp a			;a3ed	bf 	. 
	cp a			;a3ee	bf 	. 
	ld l,d			;a3ef	6a 	j 
	add a,b			;a3f0	80 	. 
	scf			;a3f1	37 	7 
	ld b,b			;a3f2	40 	@ 
	xor d			;a3f3	aa 	. 
	cp a			;a3f4	bf 	. 
	cp a			;a3f5	bf 	. 
	cp a			;a3f6	bf 	. 
la3f7h:
	cp a			;a3f7	bf 	. 
	cp a			;a3f8	bf 	. 
	cp a			;a3f9	bf 	. 
	cp a			;a3fa	bf 	. 
	ld l,d			;a3fb	6a 	j 
	add a,b			;a3fc	80 	. 
	scf			;a3fd	37 	7 
	ld b,b			;a3fe	40 	@ 
	xor d			;a3ff	aa 	. 
	cp a			;a400	bf 	. 
	cp a			;a401	bf 	. 
	cp a			;a402	bf 	. 
	cp a			;a403	bf 	. 
	cp a			;a404	bf 	. 
	cp a			;a405	bf 	. 
	cp a			;a406	bf 	. 
	ld l,d			;a407	6a 	j 
	add a,b			;a408	80 	. 
	scf			;a409	37 	7 
	ld b,b			;a40a	40 	@ 
	xor d			;a40b	aa 	. 
	cp a			;a40c	bf 	. 
	cp a			;a40d	bf 	. 
	cp a			;a40e	bf 	. 
	cp a			;a40f	bf 	. 
	cp a			;a410	bf 	. 
	cp a			;a411	bf 	. 
	cp a			;a412	bf 	. 
	ld l,d			;a413	6a 	j 
	add a,b			;a414	80 	. 
	scf			;a415	37 	7 
	ld b,b			;a416	40 	@ 
	xor d			;a417	aa 	. 
	cp a			;a418	bf 	. 
	cp a			;a419	bf 	. 
	cp a			;a41a	bf 	. 
	cp a			;a41b	bf 	. 
	cp a			;a41c	bf 	. 
	cp a			;a41d	bf 	. 
	cp a			;a41e	bf 	. 
	ld l,d			;a41f	6a 	j 
	add a,b			;a420	80 	. 
	scf			;a421	37 	7 
	ld (hl),b			;a422	70 	p 
	add a,d			;a423	82 	. 
	ld b,b			;a424	40 	@ 
	adc a,d			;a425	8a 	. 
	sbc a,a			;a426	9f 	. 
	cp a			;a427	bf 	. 
	cp a			;a428	bf 	. 
	xor a			;a429	af 	. 
	add a,a			;a42a	87 	. 
	add a,a			;a42b	87 	. 
	ld a,d			;a42c	7a 	z 
	add a,b			;a42d	80 	. 
	scf			;a42e	37 	7 
	ld bc,l807dh		;a42f	01 7d 80 	. } . 
	ld a,h			;a432	7c 	| 
	add a,b			;a433	80 	. 
	ld (hl),b			;a434	70 	p 
	add a,d			;a435	82 	. 
	ld a,b			;a436	78 	x 
	add a,b			;a437	80 	. 
	ld a,h			;a438	7c 	| 
	add a,b			;a439	80 	. 
	ld a,(hl)			;a43a	7e 	~ 
	add a,b			;a43b	80 	. 
	nop			;a43c	00 	. 
	rrca			;a43d	0f 	. 
	ld e,h			;a43e	5c 	\ 
	and h			;a43f	a4 	. 
	ld e,h			;a440	5c 	\ 
	and h			;a441	a4 	. 
	ld e,h			;a442	5c 	\ 
	and h			;a443	a4 	. 
	ld e,h			;a444	5c 	\ 
	and h			;a445	a4 	. 
	ld e,h			;a446	5c 	\ 
	and h			;a447	a4 	. 
	ld e,h			;a448	5c 	\ 
	and h			;a449	a4 	. 
	ld l,b			;a44a	68 	h 
	and h			;a44b	a4 	. 
	ld (hl),h			;a44c	74 	t 
	and h			;a44d	a4 	. 
	add a,b			;a44e	80 	. 
	and h			;a44f	a4 	. 
	add a,b			;a450	80 	. 
	and h			;a451	a4 	. 
	adc a,h			;a452	8c 	. 
	and h			;a453	a4 	. 
	adc a,h			;a454	8c 	. 
	and h			;a455	a4 	. 
	add a,b			;a456	80 	. 
	and h			;a457	a4 	. 
	ld (hl),h			;a458	74 	t 
	and h			;a459	a4 	. 
	ld l,b			;a45a	68 	h 
	and h			;a45b	a4 	. 
	sbc a,b			;a45c	98 	. 
	and h			;a45d	a4 	. 
	sbc a,b			;a45e	98 	. 
	and h			;a45f	a4 	. 
la460h:
	xor 0a4h		;a460	ee a4 	. . 
	xor 0a4h		;a462	ee a4 	. . 
	ld c,e			;a464	4b 	K 
	and l			;a465	a5 	. 
	ld c,e			;a466	4b 	K 
	and l			;a467	a5 	. 
	xor e			;a468	ab 	. 
	and l			;a469	a5 	. 
	xor e			;a46a	ab 	. 
	and l			;a46b	a5 	. 
	ld bc,001a6h		;a46c	01 a6 01 	. . . 
	and (hl)			;a46f	a6 	. 
	ld e,(hl)			;a470	5e 	^ 
	and (hl)			;a471	a6 	. 
	ld e,(hl)			;a472	5e 	^ 
	and (hl)			;a473	a6 	. 
	cp (hl)			;a474	be 	. 
	and (hl)			;a475	a6 	. 
	cp (hl)			;a476	be 	. 
	and (hl)			;a477	a6 	. 
	inc d			;a478	14 	. 
	and a			;a479	a7 	. 
	inc d			;a47a	14 	. 
	and a			;a47b	a7 	. 
	ld (hl),c			;a47c	71 	q 
	and a			;a47d	a7 	. 
	ld (hl),c			;a47e	71 	q 
	and a			;a47f	a7 	. 
	pop de			;a480	d1 	. 
	and a			;a481	a7 	. 
	pop de			;a482	d1 	. 
	and a			;a483	a7 	. 
	daa			;a484	27 	' 
	xor b			;a485	a8 	. 
	daa			;a486	27 	' 
	xor b			;a487	a8 	. 
	add a,h			;a488	84 	. 
	xor b			;a489	a8 	. 
	add a,h			;a48a	84 	. 
	xor b			;a48b	a8 	. 
	call po,0e4a8h		;a48c	e4 a8 e4 	. . . 
	xor b			;a48f	a8 	. 
	ld a,(03aa9h)		;a490	3a a9 3a 	: . : 
	xor c			;a493	a9 	. 
	sub a			;a494	97 	. 
	xor c			;a495	a9 	. 
	sub a			;a496	97 	. 
	xor c			;a497	a9 	. 
	xor b			;a498	a8 	. 
	adc a,h			;a499	8c 	. 
	adc a,h			;a49a	8c 	. 
	cp h			;a49b	bc 	. 
	adc a,h			;a49c	8c 	. 
	adc a,h			;a49d	8c 	. 
	sub h			;a49e	94 	. 
	add hl,sp			;a49f	39 	9 
	xor d			;a4a0	aa 	. 
	adc a,b			;a4a1	88 	. 
	sub h			;a4a2	94 	. 
	cp a			;a4a3	bf 	. 
la4a4h:
	adc a,b			;a4a4	88 	. 
	sub h			;a4a5	94 	. 
	sub l			;a4a6	95 	. 
	add hl,sp			;a4a7	39 	9 
	xor d			;a4a8	aa 	. 
	or d			;a4a9	b2 	. 
	or c			;a4aa	b1 	. 
	cp a			;a4ab	bf 	. 
	or d			;a4ac	b2 	. 
	or c			;a4ad	b1 	. 
	sub l			;a4ae	95 	. 
	add hl,sp			;a4af	39 	9 
	xor d			;a4b0	aa 	. 
	adc a,e			;a4b1	8b 	. 
	sbc a,a			;a4b2	9f 	. 
	sbc a,h			;a4b3	9c 	. 
	xor a			;a4b4	af 	. 
	add a,a			;a4b5	87 	. 
	sub l			;a4b6	95 	. 
	add hl,sp			;a4b7	39 	9 
	xor d			;a4b8	aa 	. 
	add a,b			;a4b9	80 	. 
	add a,b			;a4ba	80 	. 
	add a,b			;a4bb	80 	. 
	add a,b			;a4bc	80 	. 
	add a,b			;a4bd	80 	. 
	sub l			;a4be	95 	. 
	add hl,sp			;a4bf	39 	9 
	xor d			;a4c0	aa 	. 
	cp l			;a4c1	bd 	. 
	cp (hl)			;a4c2	be 	. 
	cp h			;a4c3	bc 	. 
	cp l			;a4c4	bd 	. 
	cp (hl)			;a4c5	be 	. 
	sub l			;a4c6	95 	. 
	add hl,sp			;a4c7	39 	9 
	xor d			;a4c8	aa 	. 
	cp a			;a4c9	bf 	. 
	cp a			;a4ca	bf 	. 
	cp a			;a4cb	bf 	. 
	cp a			;a4cc	bf 	. 
	cp a			;a4cd	bf 	. 
	sub l			;a4ce	95 	. 
	add hl,sp			;a4cf	39 	9 
	xor d			;a4d0	aa 	. 
	cp a			;a4d1	bf 	. 
	cp a			;a4d2	bf 	. 
	cp a			;a4d3	bf 	. 
	cp a			;a4d4	bf 	. 
	cp a			;a4d5	bf 	. 
	sub l			;a4d6	95 	. 
	add hl,sp			;a4d7	39 	9 
	xor d			;a4d8	aa 	. 
	cp a			;a4d9	bf 	. 
	cp a			;a4da	bf 	. 
	cp a			;a4db	bf 	. 
	cp a			;a4dc	bf 	. 
	cp a			;a4dd	bf 	. 
	sub l			;a4de	95 	. 
	add hl,sp			;a4df	39 	9 
	ld (hl),b			;a4e0	70 	p 
	add a,d			;a4e1	82 	. 
	ld b,b			;a4e2	40 	@ 
	adc a,d			;a4e3	8a 	. 
	adc a,e			;a4e4	8b 	. 
	ld h,b			;a4e5	60 	` 
	add a,d			;a4e6	82 	. 
	ld b,b			;a4e7	40 	@ 
	adc a,d			;a4e8	8a 	. 
	ld h,b			;a4e9	60 	` 
	add a,c			;a4ea	81 	. 
	ld (hl),b			;a4eb	70 	p 
	add a,c			;a4ec	81 	. 
	nop			;a4ed	00 	. 
	ld b,e			;a4ee	43 	C 
	and b			;a4ef	a0 	. 
	or b			;a4f0	b0 	. 
	or b			;a4f1	b0 	. 
	or b			;a4f2	b0 	. 
	or b			;a4f3	b0 	. 
	or b			;a4f4	b0 	. 
	sub b			;a4f5	90 	. 
	add hl,sp			;a4f6	39 	9 
	ld b,b			;a4f7	40 	@ 
	xor d			;a4f8	aa 	. 
	and b			;a4f9	a0 	. 
	sub b			;a4fa	90 	. 
	cp a			;a4fb	bf 	. 
	and b			;a4fc	a0 	. 
	sub b			;a4fd	90 	. 
	sub l			;a4fe	95 	. 
	add hl,sp			;a4ff	39 	9 
	xor d			;a500	aa 	. 
	adc a,b			;a501	88 	. 
	add a,l			;a502	85 	. 
	cp a			;a503	bf 	. 
	adc a,b			;a504	88 	. 
	add a,l			;a505	85 	. 
	sub l			;a506	95 	. 
	add hl,sp			;a507	39 	9 
	xor d			;a508	aa 	. 
	xor a			;a509	af 	. 
	cp a			;a50a	bf 	. 
	or e			;a50b	b3 	. 
	cp a			;a50c	bf 	. 
	sbc a,a			;a50d	9f 	. 
	sub l			;a50e	95 	. 
	add hl,sp			;a50f	39 	9 
	xor d			;a510	aa 	. 
	add a,b			;a511	80 	. 
	add a,c			;a512	81 	. 
	add a,c			;a513	81 	. 
	add a,d			;a514	82 	. 
	add a,b			;a515	80 	. 
	sub l			;a516	95 	. 
	add hl,sp			;a517	39 	9 
	xor d			;a518	aa 	. 
	or h			;a519	b4 	. 
	cp b			;a51a	b8 	. 
	or b			;a51b	b0 	. 
	or h			;a51c	b4 	. 
	cp b			;a51d	b8 	. 
	sub l			;a51e	95 	. 
	add hl,sp			;a51f	39 	9 
	xor d			;a520	aa 	. 
	cp a			;a521	bf 	. 
	cp a			;a522	bf 	. 
	cp a			;a523	bf 	. 
	cp a			;a524	bf 	. 
	cp a			;a525	bf 	. 
	sub l			;a526	95 	. 
	add hl,sp			;a527	39 	9 
	xor d			;a528	aa 	. 
	cp a			;a529	bf 	. 
	cp a			;a52a	bf 	. 
	cp a			;a52b	bf 	. 
	cp a			;a52c	bf 	. 
	cp a			;a52d	bf 	. 
	sub l			;a52e	95 	. 
	add hl,sp			;a52f	39 	9 
	xor d			;a530	aa 	. 
	cp a			;a531	bf 	. 
	cp a			;a532	bf 	. 
	cp a			;a533	bf 	. 
	cp a			;a534	bf 	. 
	cp a			;a535	bf 	. 
	sub l			;a536	95 	. 
	add hl,sp			;a537	39 	9 
	adc a,d			;a538	8a 	. 
	xor e			;a539	ab 	. 
	xor a			;a53a	af 	. 
	adc a,e			;a53b	8b 	. 
	xor e			;a53c	ab 	. 
	add a,a			;a53d	87 	. 
	add a,l			;a53e	85 	. 
	add hl,sp			;a53f	39 	9 
	ld bc,l807ch		;a540	01 7c 80 	. | . 
	add a,b			;a543	80 	. 
	ld a,(hl)			;a544	7e 	~ 
	add a,b			;a545	80 	. 
	ld a,h			;a546	7c 	| 
	add a,b			;a547	80 	. 
	ld a,(hl)			;a548	7e 	~ 
	add a,b			;a549	80 	. 
	nop			;a54a	00 	. 
	ld c,a			;a54b	4f 	O 
	add a,b			;a54c	80 	. 
	add a,b			;a54d	80 	. 
	add a,b			;a54e	80 	. 
	add a,b			;a54f	80 	. 
	add a,b			;a550	80 	. 
	add a,b			;a551	80 	. 
	add a,b			;a552	80 	. 
	add hl,sp			;a553	39 	9 
	ld b,b			;a554	40 	@ 
	xor d			;a555	aa 	. 
	add a,e			;a556	83 	. 
	add a,e			;a557	83 	. 
	cp a			;a558	bf 	. 
	add a,e			;a559	83 	. 
	add a,e			;a55a	83 	. 
	sub l			;a55b	95 	. 
	add hl,sp			;a55c	39 	9 
la55dh:
	xor d			;a55d	aa 	. 
	and d			;a55e	a2 	. 
	sub l			;a55f	95 	. 
	cp a			;a560	bf 	. 
	and d			;a561	a2 	. 
	sub l			;a562	95 	. 
	sub l			;a563	95 	. 
	add hl,sp			;a564	39 	9 
	xor d			;a565	aa 	. 
	cp h			;a566	bc 	. 
	cp h			;a567	bc 	. 
	adc a,a			;a568	8f 	. 
	cp h			;a569	bc 	. 
	cp h			;a56a	bc 	. 
	sub l			;a56b	95 	. 
	add hl,sp			;a56c	39 	9 
	xor d			;a56d	aa 	. 
	add a,d			;a56e	82 	. 
	add a,a			;a56f	87 	. 
la570h:
	add a,a			;a570	87 	. 
	adc a,e			;a571	8b 	. 
	add a,c			;a572	81 	. 
	sub l			;a573	95 	. 
	add hl,sp			;a574	39 	9 
	xor d			;a575	aa 	. 
	sub b			;a576	90 	. 
	and b			;a577	a0 	. 
	add a,b			;a578	80 	. 
	sub b			;a579	90 	. 
	and b			;a57a	a0 	. 
	sub l			;a57b	95 	. 
	add hl,sp			;a57c	39 	9 
	xor d			;a57d	aa 	. 
	cp a			;a57e	bf 	. 
	cp a			;a57f	bf 	. 
	cp a			;a580	bf 	. 
	cp a			;a581	bf 	. 
	cp a			;a582	bf 	. 
	sub l			;a583	95 	. 
	add hl,sp			;a584	39 	9 
	xor d			;a585	aa 	. 
	cp a			;a586	bf 	. 
	cp a			;a587	bf 	. 
	cp a			;a588	bf 	. 
	cp a			;a589	bf 	. 
	cp a			;a58a	bf 	. 
	sub l			;a58b	95 	. 
	add hl,sp			;a58c	39 	9 
	xor d			;a58d	aa 	. 
	cp a			;a58e	bf 	. 
	cp a			;a58f	bf 	. 
	cp a			;a590	bf 	. 
	cp a			;a591	bf 	. 
	cp a			;a592	bf 	. 
	sub l			;a593	95 	. 
	add hl,sp			;a594	39 	9 
	xor d			;a595	aa 	. 
	xor a			;a596	af 	. 
	cp a			;a597	bf 	. 
la598h:
	xor a			;a598	af 	. 
	xor a			;a599	af 	. 
	sbc a,a			;a59a	9f 	. 
	sub l			;a59b	95 	. 
	add hl,sp			;a59c	39 	9 
	ld a,h			;a59d	7c 	| 
	add a,b			;a59e	80 	. 
	ld (hl),b			;a59f	70 	p 
la5a0h:
	add a,d			;a5a0	82 	. 
	add a,d			;a5a1	82 	. 
	ld a,b			;a5a2	78 	x 
	add a,b			;a5a3	80 	. 
	ld (hl),b			;a5a4	70 	p 
	add a,d			;a5a5	82 	. 
	ld a,b			;a5a6	78 	x 
	add a,b			;a5a7	80 	. 
	ld a,h			;a5a8	7c 	| 
	add a,b			;a5a9	80 	. 
	nop			;a5aa	00 	. 
	xor b			;a5ab	a8 	. 
	adc a,h			;a5ac	8c 	. 
	adc a,h			;a5ad	8c 	. 
	cp h			;a5ae	bc 	. 
	adc a,h			;a5af	8c 	. 
	adc a,h			;a5b0	8c 	. 
	sub h			;a5b1	94 	. 
	add hl,sp			;a5b2	39 	9 
	xor d			;a5b3	aa 	. 
	xor b			;a5b4	a8 	. 
	add a,h			;a5b5	84 	. 
	cp a			;a5b6	bf 	. 
	xor b			;a5b7	a8 	. 
	add a,h			;a5b8	84 	. 
	sub l			;a5b9	95 	. 
	add hl,sp			;a5ba	39 	9 
	xor d			;a5bb	aa 	. 
	or d			;a5bc	b2 	. 
	or c			;a5bd	b1 	. 
	cp a			;a5be	bf 	. 
	or d			;a5bf	b2 	. 
	or c			;a5c0	b1 	. 
	sub l			;a5c1	95 	. 
	add hl,sp			;a5c2	39 	9 
	xor d			;a5c3	aa 	. 
	sbc a,a			;a5c4	9f 	. 
	sbc a,a			;a5c5	9f 	. 
	sbc a,h			;a5c6	9c 	. 
	xor a			;a5c7	af 	. 
	xor a			;a5c8	af 	. 
	sub l			;a5c9	95 	. 
	add hl,sp			;a5ca	39 	9 
	xor d			;a5cb	aa 	. 
	sub l			;a5cc	95 	. 
	add a,b			;a5cd	80 	. 
	add a,b			;a5ce	80 	. 
	add a,b			;a5cf	80 	. 
	xor d			;a5d0	aa 	. 
	sub l			;a5d1	95 	. 
	add hl,sp			;a5d2	39 	9 
	xor d			;a5d3	aa 	. 
	or l			;a5d4	b5 	. 
	cp b			;a5d5	b8 	. 
	or b			;a5d6	b0 	. 
	or h			;a5d7	b4 	. 
	cp d			;a5d8	ba 	. 
	sub l			;a5d9	95 	. 
	add hl,sp			;a5da	39 	9 
	xor d			;a5db	aa 	. 
	cp a			;a5dc	bf 	. 
	cp a			;a5dd	bf 	. 
	cp a			;a5de	bf 	. 
	cp a			;a5df	bf 	. 
	cp a			;a5e0	bf 	. 
	sub l			;a5e1	95 	. 
	add hl,sp			;a5e2	39 	9 
	xor d			;a5e3	aa 	. 
la5e4h:
	cp a			;a5e4	bf 	. 
	cp a			;a5e5	bf 	. 
	cp a			;a5e6	bf 	. 
	cp a			;a5e7	bf 	. 
	cp a			;a5e8	bf 	. 
	sub l			;a5e9	95 	. 
	add hl,sp			;a5ea	39 	9 
	xor d			;a5eb	aa 	. 
	cp a			;a5ec	bf 	. 
	cp a			;a5ed	bf 	. 
	cp a			;a5ee	bf 	. 
	cp a			;a5ef	bf 	. 
	cp a			;a5f0	bf 	. 
	sub l			;a5f1	95 	. 
	add hl,sp			;a5f2	39 	9 
	ld (hl),b			;a5f3	70 	p 
	add a,d			;a5f4	82 	. 
	ld b,b			;a5f5	40 	@ 
	adc a,d			;a5f6	8a 	. 
	adc a,e			;a5f7	8b 	. 
	ld h,b			;a5f8	60 	` 
	add a,d			;a5f9	82 	. 
	ld b,b			;a5fa	40 	@ 
	adc a,d			;a5fb	8a 	. 
	ld h,b			;a5fc	60 	` 
	add a,c			;a5fd	81 	. 
	ld (hl),b			;a5fe	70 	p 
	add a,c			;a5ff	81 	. 
	nop			;a600	00 	. 
	ld b,e			;a601	43 	C 
	and b			;a602	a0 	. 
	or b			;a603	b0 	. 
	or b			;a604	b0 	. 
	or b			;a605	b0 	. 
	or b			;a606	b0 	. 
	or b			;a607	b0 	. 
	sub b			;a608	90 	. 
	add hl,sp			;a609	39 	9 
	ld b,b			;a60a	40 	@ 
	xor d			;a60b	aa 	. 
	and b			;a60c	a0 	. 
	sub b			;a60d	90 	. 
	cp a			;a60e	bf 	. 
	and b			;a60f	a0 	. 
	sub b			;a610	90 	. 
	sub l			;a611	95 	. 
	add hl,sp			;a612	39 	9 
	xor d			;a613	aa 	. 
	adc a,d			;a614	8a 	. 
	add a,h			;a615	84 	. 
	cp a			;a616	bf 	. 
	adc a,d			;a617	8a 	. 
	add a,h			;a618	84 	. 
	sub l			;a619	95 	. 
	add hl,sp			;a61a	39 	9 
	xor d			;a61b	aa 	. 
	cp a			;a61c	bf 	. 
	cp a			;a61d	bf 	. 
	or e			;a61e	b3 	. 
	cp a			;a61f	bf 	. 
	cp a			;a620	bf 	. 
	sub l			;a621	95 	. 
	add hl,sp			;a622	39 	9 
	xor d			;a623	aa 	. 
	sub l			;a624	95 	. 
	add a,c			;a625	81 	. 
	add a,c			;a626	81 	. 
	add a,d			;a627	82 	. 
	xor d			;a628	aa 	. 
	sub l			;a629	95 	. 
	add hl,sp			;a62a	39 	9 
	xor d			;a62b	aa 	. 
	sub l			;a62c	95 	. 
	and b			;a62d	a0 	. 
	add a,b			;a62e	80 	. 
	sub b			;a62f	90 	. 
	xor d			;a630	aa 	. 
	sub l			;a631	95 	. 
	add hl,sp			;a632	39 	9 
	xor d			;a633	aa 	. 
	cp a			;a634	bf 	. 
	cp a			;a635	bf 	. 
	cp a			;a636	bf 	. 
	cp a			;a637	bf 	. 
	cp a			;a638	bf 	. 
	sub l			;a639	95 	. 
	add hl,sp			;a63a	39 	9 
	xor d			;a63b	aa 	. 
	cp a			;a63c	bf 	. 
	cp a			;a63d	bf 	. 
	cp a			;a63e	bf 	. 
	cp a			;a63f	bf 	. 
	cp a			;a640	bf 	. 
	sub l			;a641	95 	. 
	add hl,sp			;a642	39 	9 
	xor d			;a643	aa 	. 
	cp a			;a644	bf 	. 
	cp a			;a645	bf 	. 
	cp a			;a646	bf 	. 
	cp a			;a647	bf 	. 
	cp a			;a648	bf 	. 
	sub l			;a649	95 	. 
	add hl,sp			;a64a	39 	9 
	adc a,d			;a64b	8a 	. 
	xor e			;a64c	ab 	. 
	xor a			;a64d	af 	. 
	adc a,e			;a64e	8b 	. 
	xor e			;a64f	ab 	. 
	add a,a			;a650	87 	. 
	add a,l			;a651	85 	. 
	add hl,sp			;a652	39 	9 
	ld bc,l807ch		;a653	01 7c 80 	. | . 
	add a,b			;a656	80 	. 
	ld a,(hl)			;a657	7e 	~ 
	add a,b			;a658	80 	. 
	ld a,h			;a659	7c 	| 
	add a,b			;a65a	80 	. 
	ld a,(hl)			;a65b	7e 	~ 
	add a,b			;a65c	80 	. 
	nop			;a65d	00 	. 
	ld c,a			;a65e	4f 	O 
	add a,b			;a65f	80 	. 
	add a,b			;a660	80 	. 
	add a,b			;a661	80 	. 
	add a,b			;a662	80 	. 
	add a,b			;a663	80 	. 
	add a,b			;a664	80 	. 
	add a,b			;a665	80 	. 
	add hl,sp			;a666	39 	9 
	ld b,b			;a667	40 	@ 
	xor d			;a668	aa 	. 
	add a,e			;a669	83 	. 
	add a,e			;a66a	83 	. 
	cp a			;a66b	bf 	. 
	add a,e			;a66c	83 	. 
	add a,e			;a66d	83 	. 
	sub l			;a66e	95 	. 
	add hl,sp			;a66f	39 	9 
	xor d			;a670	aa 	. 
	xor d			;a671	aa 	. 
	sub c			;a672	91 	. 
	cp a			;a673	bf 	. 
	xor d			;a674	aa 	. 
	sub c			;a675	91 	. 
	sub l			;a676	95 	. 
	add hl,sp			;a677	39 	9 
	xor d			;a678	aa 	. 
	cp h			;a679	bc 	. 
	cp h			;a67a	bc 	. 
	adc a,a			;a67b	8f 	. 
	cp h			;a67c	bc 	. 
	cp h			;a67d	bc 	. 
	sub l			;a67e	95 	. 
	add hl,sp			;a67f	39 	9 
	xor d			;a680	aa 	. 
	sub a			;a681	97 	. 
	add a,a			;a682	87 	. 
	add a,a			;a683	87 	. 
	adc a,e			;a684	8b 	. 
	xor e			;a685	ab 	. 
	sub l			;a686	95 	. 
	add hl,sp			;a687	39 	9 
	xor d			;a688	aa 	. 
	sub l			;a689	95 	. 
	add a,b			;a68a	80 	. 
	add a,b			;a68b	80 	. 
	add a,b			;a68c	80 	. 
	xor d			;a68d	aa 	. 
	sub l			;a68e	95 	. 
	add hl,sp			;a68f	39 	9 
	xor d			;a690	aa 	. 
	cp l			;a691	bd 	. 
	cp (hl)			;a692	be 	. 
	cp h			;a693	bc 	. 
	cp l			;a694	bd 	. 
	cp (hl)			;a695	be 	. 
	sub l			;a696	95 	. 
	add hl,sp			;a697	39 	9 
	xor d			;a698	aa 	. 
	cp a			;a699	bf 	. 
	cp a			;a69a	bf 	. 
	cp a			;a69b	bf 	. 
	cp a			;a69c	bf 	. 
	cp a			;a69d	bf 	. 
	sub l			;a69e	95 	. 
	add hl,sp			;a69f	39 	9 
	xor d			;a6a0	aa 	. 
	cp a			;a6a1	bf 	. 
	cp a			;a6a2	bf 	. 
	cp a			;a6a3	bf 	. 
	cp a			;a6a4	bf 	. 
	cp a			;a6a5	bf 	. 
	sub l			;a6a6	95 	. 
	add hl,sp			;a6a7	39 	9 
	xor d			;a6a8	aa 	. 
	xor a			;a6a9	af 	. 
	cp a			;a6aa	bf 	. 
	xor a			;a6ab	af 	. 
	xor a			;a6ac	af 	. 
	sbc a,a			;a6ad	9f 	. 
	sub l			;a6ae	95 	. 
	add hl,sp			;a6af	39 	9 
	ld a,h			;a6b0	7c 	| 
	add a,b			;a6b1	80 	. 
	ld (hl),b			;a6b2	70 	p 
	add a,d			;a6b3	82 	. 
	add a,d			;a6b4	82 	. 
	ld a,b			;a6b5	78 	x 
	add a,b			;a6b6	80 	. 
	ld (hl),b			;a6b7	70 	p 
	add a,d			;a6b8	82 	. 
	ld a,b			;a6b9	78 	x 
	add a,b			;a6ba	80 	. 
	ld a,h			;a6bb	7c 	| 
	add a,b			;a6bc	80 	. 
	nop			;a6bd	00 	. 
	xor b			;a6be	a8 	. 
	adc a,h			;a6bf	8c 	. 
	adc a,h			;a6c0	8c 	. 
	cp h			;a6c1	bc 	. 
	adc a,h			;a6c2	8c 	. 
	adc a,h			;a6c3	8c 	. 
	sub h			;a6c4	94 	. 
	add hl,sp			;a6c5	39 	9 
	xor d			;a6c6	aa 	. 
	add a,b			;a6c7	80 	. 
	or a			;a6c8	b7 	. 
	cp a			;a6c9	bf 	. 
	add a,b			;a6ca	80 	. 
	or a			;a6cb	b7 	. 
	sub l			;a6cc	95 	. 
	add hl,sp			;a6cd	39 	9 
	xor d			;a6ce	aa 	. 
	or b			;a6cf	b0 	. 
	or b			;a6d0	b0 	. 
	cp a			;a6d1	bf 	. 
	or b			;a6d2	b0 	. 
	or b			;a6d3	b0 	. 
	sub l			;a6d4	95 	. 
	add hl,sp			;a6d5	39 	9 
	xor d			;a6d6	aa 	. 
	sbc a,a			;a6d7	9f 	. 
	sbc a,a			;a6d8	9f 	. 
	sbc a,h			;a6d9	9c 	. 
	xor a			;a6da	af 	. 
	xor a			;a6db	af 	. 
	sub l			;a6dc	95 	. 
	add hl,sp			;a6dd	39 	9 
	xor d			;a6de	aa 	. 
	sub l			;a6df	95 	. 
	add a,b			;a6e0	80 	. 
	add a,b			;a6e1	80 	. 
	add a,b			;a6e2	80 	. 
	xor d			;a6e3	aa 	. 
	sub l			;a6e4	95 	. 
	add hl,sp			;a6e5	39 	9 
	xor d			;a6e6	aa 	. 
	sub l			;a6e7	95 	. 
	and b			;a6e8	a0 	. 
	add a,b			;a6e9	80 	. 
	sub b			;a6ea	90 	. 
	xor d			;a6eb	aa 	. 
	sub l			;a6ec	95 	. 
	add hl,sp			;a6ed	39 	9 
	xor d			;a6ee	aa 	. 
	cp a			;a6ef	bf 	. 
	cp a			;a6f0	bf 	. 
	cp a			;a6f1	bf 	. 
	cp a			;a6f2	bf 	. 
	cp a			;a6f3	bf 	. 
	sub l			;a6f4	95 	. 
	add hl,sp			;a6f5	39 	9 
	xor d			;a6f6	aa 	. 
	cp a			;a6f7	bf 	. 
	cp a			;a6f8	bf 	. 
	cp a			;a6f9	bf 	. 
	cp a			;a6fa	bf 	. 
	cp a			;a6fb	bf 	. 
	sub l			;a6fc	95 	. 
	add hl,sp			;a6fd	39 	9 
	xor d			;a6fe	aa 	. 
	cp a			;a6ff	bf 	. 
	cp a			;a700	bf 	. 
	cp a			;a701	bf 	. 
	cp a			;a702	bf 	. 
	cp a			;a703	bf 	. 
	sub l			;a704	95 	. 
	add hl,sp			;a705	39 	9 
	ld (hl),b			;a706	70 	p 
	add a,d			;a707	82 	. 
	ld b,b			;a708	40 	@ 
	adc a,d			;a709	8a 	. 
	adc a,e			;a70a	8b 	. 
	ld h,b			;a70b	60 	` 
	add a,d			;a70c	82 	. 
	ld b,b			;a70d	40 	@ 
	adc a,d			;a70e	8a 	. 
	ld h,b			;a70f	60 	` 
	add a,c			;a710	81 	. 
	ld (hl),b			;a711	70 	p 
	add a,c			;a712	81 	. 
	nop			;a713	00 	. 
	ld b,e			;a714	43 	C 
	and b			;a715	a0 	. 
	or b			;a716	b0 	. 
	or b			;a717	b0 	. 
	or b			;a718	b0 	. 
	or b			;a719	b0 	. 
	or b			;a71a	b0 	. 
	sub b			;a71b	90 	. 
	add hl,sp			;a71c	39 	9 
	ld b,b			;a71d	40 	@ 
	xor d			;a71e	aa 	. 
	add a,b			;a71f	80 	. 
	sbc a,h			;a720	9c 	. 
	cp a			;a721	bf 	. 
	add a,b			;a722	80 	. 
	sbc a,h			;a723	9c 	. 
	sub l			;a724	95 	. 
	add hl,sp			;a725	39 	9 
	xor d			;a726	aa 	. 
	add a,b			;a727	80 	. 
	add a,e			;a728	83 	. 
	cp a			;a729	bf 	. 
	add a,b			;a72a	80 	. 
	add a,e			;a72b	83 	. 
	sub l			;a72c	95 	. 
	add hl,sp			;a72d	39 	9 
	xor d			;a72e	aa 	. 
	cp a			;a72f	bf 	. 
	cp a			;a730	bf 	. 
	or e			;a731	b3 	. 
	cp a			;a732	bf 	. 
	cp a			;a733	bf 	. 
	sub l			;a734	95 	. 
	add hl,sp			;a735	39 	9 
	xor d			;a736	aa 	. 
	sub l			;a737	95 	. 
	add a,c			;a738	81 	. 
	add a,c			;a739	81 	. 
	add a,d			;a73a	82 	. 
	xor d			;a73b	aa 	. 
	sub l			;a73c	95 	. 
	add hl,sp			;a73d	39 	9 
	xor d			;a73e	aa 	. 
	sub l			;a73f	95 	. 
	add a,b			;a740	80 	. 
	add a,b			;a741	80 	. 
	add a,b			;a742	80 	. 
	xor d			;a743	aa 	. 
	sub l			;a744	95 	. 
	add hl,sp			;a745	39 	9 
	xor d			;a746	aa 	. 
	cp l			;a747	bd 	. 
	cp (hl)			;a748	be 	. 
	cp h			;a749	bc 	. 
	cp l			;a74a	bd 	. 
	cp (hl)			;a74b	be 	. 
	sub l			;a74c	95 	. 
	add hl,sp			;a74d	39 	9 
	xor d			;a74e	aa 	. 
	cp a			;a74f	bf 	. 
	cp a			;a750	bf 	. 
	cp a			;a751	bf 	. 
	cp a			;a752	bf 	. 
	cp a			;a753	bf 	. 
	sub l			;a754	95 	. 
	add hl,sp			;a755	39 	9 
	xor d			;a756	aa 	. 
	cp a			;a757	bf 	. 
	cp a			;a758	bf 	. 
	cp a			;a759	bf 	. 
	cp a			;a75a	bf 	. 
	cp a			;a75b	bf 	. 
	sub l			;a75c	95 	. 
	add hl,sp			;a75d	39 	9 
	adc a,d			;a75e	8a 	. 
	xor e			;a75f	ab 	. 
	xor a			;a760	af 	. 
	adc a,e			;a761	8b 	. 
	xor e			;a762	ab 	. 
	add a,a			;a763	87 	. 
	add a,l			;a764	85 	. 
	add hl,sp			;a765	39 	9 
	ld bc,l807ch		;a766	01 7c 80 	. | . 
	add a,b			;a769	80 	. 
	ld a,(hl)			;a76a	7e 	~ 
	add a,b			;a76b	80 	. 
	ld a,h			;a76c	7c 	| 
	add a,b			;a76d	80 	. 
	ld a,(hl)			;a76e	7e 	~ 
	add a,b			;a76f	80 	. 
	nop			;a770	00 	. 
	ld c,a			;a771	4f 	O 
	add a,b			;a772	80 	. 
	add a,b			;a773	80 	. 
	add a,b			;a774	80 	. 
	add a,b			;a775	80 	. 
	add a,b			;a776	80 	. 
	add a,b			;a777	80 	. 
	add a,b			;a778	80 	. 
	add hl,sp			;a779	39 	9 
	ld b,b			;a77a	40 	@ 
	xor d			;a77b	aa 	. 
	add a,e			;a77c	83 	. 
	or e			;a77d	b3 	. 
	cp a			;a77e	bf 	. 
	add a,e			;a77f	83 	. 
	or e			;a780	b3 	. 
	sub l			;a781	95 	. 
	add hl,sp			;a782	39 	9 
	xor d			;a783	aa 	. 
	add a,b			;a784	80 	. 
	adc a,l			;a785	8d 	. 
	cp a			;a786	bf 	. 
	add a,b			;a787	80 	. 
	adc a,l			;a788	8d 	. 
	sub l			;a789	95 	. 
	add hl,sp			;a78a	39 	9 
	xor d			;a78b	aa 	. 
	cp h			;a78c	bc 	. 
	cp h			;a78d	bc 	. 
	adc a,a			;a78e	8f 	. 
	cp h			;a78f	bc 	. 
	cp h			;a790	bc 	. 
	sub l			;a791	95 	. 
	add hl,sp			;a792	39 	9 
	xor d			;a793	aa 	. 
	sub a			;a794	97 	. 
	add a,a			;a795	87 	. 
	add a,a			;a796	87 	. 
	adc a,e			;a797	8b 	. 
	xor e			;a798	ab 	. 
	sub l			;a799	95 	. 
	add hl,sp			;a79a	39 	9 
	xor d			;a79b	aa 	. 
	sub l			;a79c	95 	. 
	add a,b			;a79d	80 	. 
	add a,b			;a79e	80 	. 
	add a,b			;a79f	80 	. 
	xor d			;a7a0	aa 	. 
	sub l			;a7a1	95 	. 
	add hl,sp			;a7a2	39 	9 
	xor d			;a7a3	aa 	. 
	or l			;a7a4	b5 	. 
	cp b			;a7a5	b8 	. 
	or b			;a7a6	b0 	. 
	or h			;a7a7	b4 	. 
	cp d			;a7a8	ba 	. 
	sub l			;a7a9	95 	. 
	add hl,sp			;a7aa	39 	9 
	xor d			;a7ab	aa 	. 
	cp a			;a7ac	bf 	. 
	cp a			;a7ad	bf 	. 
	cp a			;a7ae	bf 	. 
	cp a			;a7af	bf 	. 
	cp a			;a7b0	bf 	. 
	sub l			;a7b1	95 	. 
	add hl,sp			;a7b2	39 	9 
	xor d			;a7b3	aa 	. 
	cp a			;a7b4	bf 	. 
	cp a			;a7b5	bf 	. 
	cp a			;a7b6	bf 	. 
	cp a			;a7b7	bf 	. 
	cp a			;a7b8	bf 	. 
	sub l			;a7b9	95 	. 
	add hl,sp			;a7ba	39 	9 
	xor d			;a7bb	aa 	. 
	xor a			;a7bc	af 	. 
	cp a			;a7bd	bf 	. 
	xor a			;a7be	af 	. 
	xor a			;a7bf	af 	. 
	sbc a,a			;a7c0	9f 	. 
	sub l			;a7c1	95 	. 
	add hl,sp			;a7c2	39 	9 
	ld a,h			;a7c3	7c 	| 
	add a,b			;a7c4	80 	. 
	ld (hl),b			;a7c5	70 	p 
	add a,d			;a7c6	82 	. 
	add a,d			;a7c7	82 	. 
	ld a,b			;a7c8	78 	x 
	add a,b			;a7c9	80 	. 
	ld (hl),b			;a7ca	70 	p 
	add a,d			;a7cb	82 	. 
	ld a,b			;a7cc	78 	x 
	add a,b			;a7cd	80 	. 
	ld a,h			;a7ce	7c 	| 
	add a,b			;a7cf	80 	. 
	nop			;a7d0	00 	. 
	xor b			;a7d1	a8 	. 
	adc a,h			;a7d2	8c 	. 
	adc a,h			;a7d3	8c 	. 
	cp h			;a7d4	bc 	. 
	adc a,h			;a7d5	8c 	. 
	adc a,h			;a7d6	8c 	. 
	sub h			;a7d7	94 	. 
	add hl,sp			;a7d8	39 	9 
	xor d			;a7d9	aa 	. 
	xor d			;a7da	aa 	. 
	sub c			;a7db	91 	. 
	cp a			;a7dc	bf 	. 
	xor d			;a7dd	aa 	. 
	sub c			;a7de	91 	. 
	sub l			;a7df	95 	. 
	add hl,sp			;a7e0	39 	9 
	xor d			;a7e1	aa 	. 
	or b			;a7e2	b0 	. 
	or b			;a7e3	b0 	. 
	cp a			;a7e4	bf 	. 
	or b			;a7e5	b0 	. 
	or b			;a7e6	b0 	. 
	sub l			;a7e7	95 	. 
	add hl,sp			;a7e8	39 	9 
	xor d			;a7e9	aa 	. 
	sbc a,a			;a7ea	9f 	. 
	sbc a,a			;a7eb	9f 	. 
	sbc a,h			;a7ec	9c 	. 
	xor a			;a7ed	af 	. 
	xor a			;a7ee	af 	. 
	sub l			;a7ef	95 	. 
	add hl,sp			;a7f0	39 	9 
	xor d			;a7f1	aa 	. 
	sub l			;a7f2	95 	. 
	add a,b			;a7f3	80 	. 
	add a,b			;a7f4	80 	. 
	add a,b			;a7f5	80 	. 
	xor d			;a7f6	aa 	. 
	sub l			;a7f7	95 	. 
	add hl,sp			;a7f8	39 	9 
	xor d			;a7f9	aa 	. 
	sub l			;a7fa	95 	. 
	add a,b			;a7fb	80 	. 
	add a,b			;a7fc	80 	. 
	add a,b			;a7fd	80 	. 
	xor d			;a7fe	aa 	. 
	sub l			;a7ff	95 	. 
	add hl,sp			;a800	39 	9 
	xor d			;a801	aa 	. 
	cp l			;a802	bd 	. 
	cp (hl)			;a803	be 	. 
	cp h			;a804	bc 	. 
	cp l			;a805	bd 	. 
	cp (hl)			;a806	be 	. 
	sub l			;a807	95 	. 
	add hl,sp			;a808	39 	9 
	xor d			;a809	aa 	. 
la80ah:
	cp a			;a80a	bf 	. 
	cp a			;a80b	bf 	. 
	cp a			;a80c	bf 	. 
	cp a			;a80d	bf 	. 
	cp a			;a80e	bf 	. 
la80fh:
	sub l			;a80f	95 	. 
	add hl,sp			;a810	39 	9 
la811h:
	xor d			;a811	aa 	. 
	cp a			;a812	bf 	. 
	cp a			;a813	bf 	. 
	cp a			;a814	bf 	. 
	cp a			;a815	bf 	. 
	cp a			;a816	bf 	. 
	sub l			;a817	95 	. 
la818h:
	add hl,sp			;a818	39 	9 
	ld (hl),b			;a819	70 	p 
	add a,d			;a81a	82 	. 
	ld b,b			;a81b	40 	@ 
	adc a,d			;a81c	8a 	. 
la81dh:
	adc a,e			;a81d	8b 	. 
la81eh:
	ld h,b			;a81e	60 	` 
	add a,d			;a81f	82 	. 
	ld b,b			;a820	40 	@ 
	adc a,d			;a821	8a 	. 
	ld h,b			;a822	60 	` 
	add a,c			;a823	81 	. 
	ld (hl),b			;a824	70 	p 
	add a,c			;a825	81 	. 
	nop			;a826	00 	. 
	ld b,e			;a827	43 	C 
la828h:
	and b			;a828	a0 	. 
	or b			;a829	b0 	. 
la82ah:
	or b			;a82a	b0 	. 
	or b			;a82b	b0 	. 
la82ch:
	or b			;a82c	b0 	. 
	or b			;a82d	b0 	. 
	sub b			;a82e	90 	. 
	add hl,sp			;a82f	39 	9 
	ld b,b			;a830	40 	@ 
	xor d			;a831	aa 	. 
	xor b			;a832	a8 	. 
	add a,h			;a833	84 	. 
	cp a			;a834	bf 	. 
	xor b			;a835	a8 	. 
	add a,h			;a836	84 	. 
	sub l			;a837	95 	. 
	add hl,sp			;a838	39 	9 
	xor d			;a839	aa 	. 
	add a,d			;a83a	82 	. 
	add a,c			;a83b	81 	. 
	cp a			;a83c	bf 	. 
	add a,d			;a83d	82 	. 
	add a,c			;a83e	81 	. 
	sub l			;a83f	95 	. 
la840h:
	add hl,sp			;a840	39 	9 
	xor d			;a841	aa 	. 
	cp a			;a842	bf 	. 
	cp a			;a843	bf 	. 
	or e			;a844	b3 	. 
	cp a			;a845	bf 	. 
	cp a			;a846	bf 	. 
	sub l			;a847	95 	. 
	add hl,sp			;a848	39 	9 
	xor d			;a849	aa 	. 
la84ah:
	sub l			;a84a	95 	. 
	add a,c			;a84b	81 	. 
la84ch:
	add a,c			;a84c	81 	. 
	add a,d			;a84d	82 	. 
	xor d			;a84e	aa 	. 
	sub l			;a84f	95 	. 
	add hl,sp			;a850	39 	9 
	xor d			;a851	aa 	. 
	sub l			;a852	95 	. 
	add a,b			;a853	80 	. 
	add a,b			;a854	80 	. 
	add a,b			;a855	80 	. 
la856h:
	xor d			;a856	aa 	. 
	sub l			;a857	95 	. 
	add hl,sp			;a858	39 	9 
	xor d			;a859	aa 	. 
	or l			;a85a	b5 	. 
	cp b			;a85b	b8 	. 
	or b			;a85c	b0 	. 
	or h			;a85d	b4 	. 
	cp d			;a85e	ba 	. 
	sub l			;a85f	95 	. 
la860h:
	add hl,sp			;a860	39 	9 
	xor d			;a861	aa 	. 
	cp a			;a862	bf 	. 
	cp a			;a863	bf 	. 
	cp a			;a864	bf 	. 
	cp a			;a865	bf 	. 
	cp a			;a866	bf 	. 
	sub l			;a867	95 	. 
	add hl,sp			;a868	39 	9 
	xor d			;a869	aa 	. 
	cp a			;a86a	bf 	. 
	cp a			;a86b	bf 	. 
	cp a			;a86c	bf 	. 
	cp a			;a86d	bf 	. 
	cp a			;a86e	bf 	. 
	sub l			;a86f	95 	. 
	add hl,sp			;a870	39 	9 
la871h:
	adc a,d			;a871	8a 	. 
	xor e			;a872	ab 	. 
	xor a			;a873	af 	. 
	adc a,e			;a874	8b 	. 
	xor e			;a875	ab 	. 
	add a,a			;a876	87 	. 
	add a,l			;a877	85 	. 
	add hl,sp			;a878	39 	9 
	ld bc,l807ch		;a879	01 7c 80 	. | . 
	add a,b			;a87c	80 	. 
	ld a,(hl)			;a87d	7e 	~ 
	add a,b			;a87e	80 	. 
	ld a,h			;a87f	7c 	| 
	add a,b			;a880	80 	. 
	ld a,(hl)			;a881	7e 	~ 
	add a,b			;a882	80 	. 
	nop			;a883	00 	. 
	ld c,a			;a884	4f 	O 
	add a,b			;a885	80 	. 
	add a,b			;a886	80 	. 
	add a,b			;a887	80 	. 
	add a,b			;a888	80 	. 
	add a,b			;a889	80 	. 
	add a,b			;a88a	80 	. 
	add a,b			;a88b	80 	. 
	add hl,sp			;a88c	39 	9 
	ld b,b			;a88d	40 	@ 
	xor d			;a88e	aa 	. 
	and e			;a88f	a3 	. 
	sub e			;a890	93 	. 
	cp a			;a891	bf 	. 
	and e			;a892	a3 	. 
	sub e			;a893	93 	. 
la894h:
	sub l			;a894	95 	. 
	add hl,sp			;a895	39 	9 
	xor d			;a896	aa 	. 
	adc a,d			;a897	8a 	. 
	add a,h			;a898	84 	. 
	cp a			;a899	bf 	. 
la89ah:
	adc a,d			;a89a	8a 	. 
	add a,h			;a89b	84 	. 
	sub l			;a89c	95 	. 
la89dh:
	add hl,sp			;a89d	39 	9 
	xor d			;a89e	aa 	. 
	cp h			;a89f	bc 	. 
	cp h			;a8a0	bc 	. 
	adc a,a			;a8a1	8f 	. 
	cp h			;a8a2	bc 	. 
	cp h			;a8a3	bc 	. 
	sub l			;a8a4	95 	. 
	add hl,sp			;a8a5	39 	9 
	xor d			;a8a6	aa 	. 
	sub a			;a8a7	97 	. 
	add a,a			;a8a8	87 	. 
	add a,a			;a8a9	87 	. 
	adc a,e			;a8aa	8b 	. 
	xor e			;a8ab	ab 	. 
	sub l			;a8ac	95 	. 
	add hl,sp			;a8ad	39 	9 
	xor d			;a8ae	aa 	. 
	sub l			;a8af	95 	. 
	add a,b			;a8b0	80 	. 
	add a,b			;a8b1	80 	. 
	add a,b			;a8b2	80 	. 
	xor d			;a8b3	aa 	. 
	sub l			;a8b4	95 	. 
	add hl,sp			;a8b5	39 	9 
	xor d			;a8b6	aa 	. 
	sub l			;a8b7	95 	. 
	and b			;a8b8	a0 	. 
	add a,b			;a8b9	80 	. 
	sub b			;a8ba	90 	. 
	xor d			;a8bb	aa 	. 
	sub l			;a8bc	95 	. 
	add hl,sp			;a8bd	39 	9 
	xor d			;a8be	aa 	. 
	cp a			;a8bf	bf 	. 
	cp a			;a8c0	bf 	. 
	cp a			;a8c1	bf 	. 
	cp a			;a8c2	bf 	. 
	cp a			;a8c3	bf 	. 
	sub l			;a8c4	95 	. 
	add hl,sp			;a8c5	39 	9 
	xor d			;a8c6	aa 	. 
	cp a			;a8c7	bf 	. 
	cp a			;a8c8	bf 	. 
	cp a			;a8c9	bf 	. 
	cp a			;a8ca	bf 	. 
	cp a			;a8cb	bf 	. 
	sub l			;a8cc	95 	. 
	add hl,sp			;a8cd	39 	9 
	xor d			;a8ce	aa 	. 
	xor a			;a8cf	af 	. 
	cp a			;a8d0	bf 	. 
	xor a			;a8d1	af 	. 
	xor a			;a8d2	af 	. 
	sbc a,a			;a8d3	9f 	. 
	sub l			;a8d4	95 	. 
	add hl,sp			;a8d5	39 	9 
	ld a,h			;a8d6	7c 	| 
	add a,b			;a8d7	80 	. 
	ld (hl),b			;a8d8	70 	p 
	add a,d			;a8d9	82 	. 
	add a,d			;a8da	82 	. 
	ld a,b			;a8db	78 	x 
	add a,b			;a8dc	80 	. 
	ld (hl),b			;a8dd	70 	p 
	add a,d			;a8de	82 	. 
	ld a,b			;a8df	78 	x 
	add a,b			;a8e0	80 	. 
	ld a,h			;a8e1	7c 	| 
	add a,b			;a8e2	80 	. 
	nop			;a8e3	00 	. 
	xor b			;a8e4	a8 	. 
	adc a,h			;a8e5	8c 	. 
	adc a,h			;a8e6	8c 	. 
	cp h			;a8e7	bc 	. 
	adc a,h			;a8e8	8c 	. 
	adc a,h			;a8e9	8c 	. 
	sub h			;a8ea	94 	. 
	add hl,sp			;a8eb	39 	9 
	xor d			;a8ec	aa 	. 
	and d			;a8ed	a2 	. 
	sub l			;a8ee	95 	. 
	cp a			;a8ef	bf 	. 
	and d			;a8f0	a2 	. 
	sub l			;a8f1	95 	. 
	sub l			;a8f2	95 	. 
	add hl,sp			;a8f3	39 	9 
	xor d			;a8f4	aa 	. 
	or b			;a8f5	b0 	. 
	or b			;a8f6	b0 	. 
	cp a			;a8f7	bf 	. 
	or b			;a8f8	b0 	. 
	or b			;a8f9	b0 	. 
	sub l			;a8fa	95 	. 
	add hl,sp			;a8fb	39 	9 
	xor d			;a8fc	aa 	. 
	sbc a,a			;a8fd	9f 	. 
	sbc a,a			;a8fe	9f 	. 
	sbc a,h			;a8ff	9c 	. 
	xor a			;a900	af 	. 
	xor a			;a901	af 	. 
	sub l			;a902	95 	. 
	add hl,sp			;a903	39 	9 
	xor d			;a904	aa 	. 
	sub l			;a905	95 	. 
	add a,b			;a906	80 	. 
	add a,b			;a907	80 	. 
	add a,b			;a908	80 	. 
	xor d			;a909	aa 	. 
	sub l			;a90a	95 	. 
	add hl,sp			;a90b	39 	9 
	xor d			;a90c	aa 	. 
	sub l			;a90d	95 	. 
	add a,b			;a90e	80 	. 
	add a,b			;a90f	80 	. 
	add a,b			;a910	80 	. 
	xor d			;a911	aa 	. 
	sub l			;a912	95 	. 
	add hl,sp			;a913	39 	9 
la914h:
	xor d			;a914	aa 	. 
	cp l			;a915	bd 	. 
	cp (hl)			;a916	be 	. 
	cp h			;a917	bc 	. 
	cp l			;a918	bd 	. 
	cp (hl)			;a919	be 	. 
	sub l			;a91a	95 	. 
	add hl,sp			;a91b	39 	9 
	xor d			;a91c	aa 	. 
	cp a			;a91d	bf 	. 
	cp a			;a91e	bf 	. 
	cp a			;a91f	bf 	. 
	cp a			;a920	bf 	. 
	cp a			;a921	bf 	. 
la922h:
	sub l			;a922	95 	. 
	add hl,sp			;a923	39 	9 
	xor d			;a924	aa 	. 
	cp a			;a925	bf 	. 
	cp a			;a926	bf 	. 
	cp a			;a927	bf 	. 
	cp a			;a928	bf 	. 
	cp a			;a929	bf 	. 
	sub l			;a92a	95 	. 
	add hl,sp			;a92b	39 	9 
	ld (hl),b			;a92c	70 	p 
	add a,d			;a92d	82 	. 
	ld b,b			;a92e	40 	@ 
	adc a,d			;a92f	8a 	. 
	adc a,e			;a930	8b 	. 
	ld h,b			;a931	60 	` 
	add a,d			;a932	82 	. 
	ld b,b			;a933	40 	@ 
	adc a,d			;a934	8a 	. 
	ld h,b			;a935	60 	` 
	add a,c			;a936	81 	. 
	ld (hl),b			;a937	70 	p 
	add a,c			;a938	81 	. 
	nop			;a939	00 	. 
	ld b,e			;a93a	43 	C 
	and b			;a93b	a0 	. 
	or b			;a93c	b0 	. 
	or b			;a93d	b0 	. 
	or b			;a93e	b0 	. 
	or b			;a93f	b0 	. 
	or b			;a940	b0 	. 
	sub b			;a941	90 	. 
	add hl,sp			;a942	39 	9 
	ld b,b			;a943	40 	@ 
	xor d			;a944	aa 	. 
	adc a,b			;a945	88 	. 
	sub h			;a946	94 	. 
	cp a			;a947	bf 	. 
	adc a,b			;a948	88 	. 
	sub h			;a949	94 	. 
la94ah:
	sub l			;a94a	95 	. 
	add hl,sp			;a94b	39 	9 
	xor d			;a94c	aa 	. 
	add a,d			;a94d	82 	. 
	add a,c			;a94e	81 	. 
	cp a			;a94f	bf 	. 
	add a,d			;a950	82 	. 
	add a,c			;a951	81 	. 
	sub l			;a952	95 	. 
	add hl,sp			;a953	39 	9 
	xor d			;a954	aa 	. 
	cp a			;a955	bf 	. 
	cp a			;a956	bf 	. 
	or e			;a957	b3 	. 
	cp a			;a958	bf 	. 
	cp a			;a959	bf 	. 
	sub l			;a95a	95 	. 
	add hl,sp			;a95b	39 	9 
	xor d			;a95c	aa 	. 
	sub l			;a95d	95 	. 
	add a,c			;a95e	81 	. 
	add a,c			;a95f	81 	. 
	add a,d			;a960	82 	. 
	xor d			;a961	aa 	. 
	sub l			;a962	95 	. 
	add hl,sp			;a963	39 	9 
	xor d			;a964	aa 	. 
	sub l			;a965	95 	. 
	add a,b			;a966	80 	. 
	add a,b			;a967	80 	. 
	add a,b			;a968	80 	. 
	xor d			;a969	aa 	. 
	sub l			;a96a	95 	. 
	add hl,sp			;a96b	39 	9 
	xor d			;a96c	aa 	. 
	or l			;a96d	b5 	. 
	cp b			;a96e	b8 	. 
	or b			;a96f	b0 	. 
	or h			;a970	b4 	. 
	cp d			;a971	ba 	. 
	sub l			;a972	95 	. 
	add hl,sp			;a973	39 	9 
	xor d			;a974	aa 	. 
	cp a			;a975	bf 	. 
	cp a			;a976	bf 	. 
	cp a			;a977	bf 	. 
	cp a			;a978	bf 	. 
	cp a			;a979	bf 	. 
	sub l			;a97a	95 	. 
	add hl,sp			;a97b	39 	9 
	xor d			;a97c	aa 	. 
	cp a			;a97d	bf 	. 
	cp a			;a97e	bf 	. 
	cp a			;a97f	bf 	. 
	cp a			;a980	bf 	. 
	cp a			;a981	bf 	. 
	sub l			;a982	95 	. 
	add hl,sp			;a983	39 	9 
	adc a,d			;a984	8a 	. 
	xor e			;a985	ab 	. 
	xor a			;a986	af 	. 
	adc a,e			;a987	8b 	. 
	xor e			;a988	ab 	. 
	add a,a			;a989	87 	. 
	add a,l			;a98a	85 	. 
	add hl,sp			;a98b	39 	9 
	ld bc,l807ch		;a98c	01 7c 80 	. | . 
	add a,b			;a98f	80 	. 
	ld a,(hl)			;a990	7e 	~ 
	add a,b			;a991	80 	. 
	ld a,h			;a992	7c 	| 
	add a,b			;a993	80 	. 
	ld a,(hl)			;a994	7e 	~ 
	add a,b			;a995	80 	. 
	nop			;a996	00 	. 
	ld c,a			;a997	4f 	O 
	add a,b			;a998	80 	. 
	add a,b			;a999	80 	. 
	add a,b			;a99a	80 	. 
	add a,b			;a99b	80 	. 
	add a,b			;a99c	80 	. 
	add a,b			;a99d	80 	. 
	add a,b			;a99e	80 	. 
	add hl,sp			;a99f	39 	9 
	ld b,b			;a9a0	40 	@ 
	xor d			;a9a1	aa 	. 
	and e			;a9a2	a3 	. 
	sub e			;a9a3	93 	. 
	cp a			;a9a4	bf 	. 
	and e			;a9a5	a3 	. 
	sub e			;a9a6	93 	. 
	sub l			;a9a7	95 	. 
	add hl,sp			;a9a8	39 	9 
	xor d			;a9a9	aa 	. 
	adc a,b			;a9aa	88 	. 
	add a,l			;a9ab	85 	. 
	cp a			;a9ac	bf 	. 
	adc a,b			;a9ad	88 	. 
	add a,l			;a9ae	85 	. 
	sub l			;a9af	95 	. 
	add hl,sp			;a9b0	39 	9 
	xor d			;a9b1	aa 	. 
	cp h			;a9b2	bc 	. 
	cp h			;a9b3	bc 	. 
	adc a,a			;a9b4	8f 	. 
	cp h			;a9b5	bc 	. 
	cp h			;a9b6	bc 	. 
	sub l			;a9b7	95 	. 
	add hl,sp			;a9b8	39 	9 
	xor d			;a9b9	aa 	. 
	sub a			;a9ba	97 	. 
	add a,a			;a9bb	87 	. 
	add a,a			;a9bc	87 	. 
	adc a,e			;a9bd	8b 	. 
	xor e			;a9be	ab 	. 
	sub l			;a9bf	95 	. 
	add hl,sp			;a9c0	39 	9 
	xor d			;a9c1	aa 	. 
	sub l			;a9c2	95 	. 
	add a,b			;a9c3	80 	. 
	add a,b			;a9c4	80 	. 
	add a,b			;a9c5	80 	. 
	xor d			;a9c6	aa 	. 
	sub l			;a9c7	95 	. 
	add hl,sp			;a9c8	39 	9 
	xor d			;a9c9	aa 	. 
	sub l			;a9ca	95 	. 
	and b			;a9cb	a0 	. 
	add a,b			;a9cc	80 	. 
	sub b			;a9cd	90 	. 
	xor d			;a9ce	aa 	. 
	sub l			;a9cf	95 	. 
	add hl,sp			;a9d0	39 	9 
	xor d			;a9d1	aa 	. 
	cp a			;a9d2	bf 	. 
	cp a			;a9d3	bf 	. 
	cp a			;a9d4	bf 	. 
	cp a			;a9d5	bf 	. 
	cp a			;a9d6	bf 	. 
	sub l			;a9d7	95 	. 
	add hl,sp			;a9d8	39 	9 
	xor d			;a9d9	aa 	. 
	cp a			;a9da	bf 	. 
	cp a			;a9db	bf 	. 
	cp a			;a9dc	bf 	. 
	cp a			;a9dd	bf 	. 
	cp a			;a9de	bf 	. 
	sub l			;a9df	95 	. 
	add hl,sp			;a9e0	39 	9 
	xor d			;a9e1	aa 	. 
	xor a			;a9e2	af 	. 
	cp a			;a9e3	bf 	. 
	xor a			;a9e4	af 	. 
	xor a			;a9e5	af 	. 
	sbc a,a			;a9e6	9f 	. 
	sub l			;a9e7	95 	. 
	add hl,sp			;a9e8	39 	9 
	ld a,h			;a9e9	7c 	| 
	add a,b			;a9ea	80 	. 
	ld (hl),b			;a9eb	70 	p 
	add a,d			;a9ec	82 	. 
	add a,d			;a9ed	82 	. 
	ld a,b			;a9ee	78 	x 
	add a,b			;a9ef	80 	. 
	ld (hl),b			;a9f0	70 	p 
	add a,d			;a9f1	82 	. 
	ld a,b			;a9f2	78 	x 
	add a,b			;a9f3	80 	. 
	ld a,h			;a9f4	7c 	| 
	add a,b			;a9f5	80 	. 
	nop			;a9f6	00 	. 
	ld bc,la9fah		;a9f7	01 fa a9 	. . . 
la9fah:
	ld b,0aah		;a9fa	06 aa 	. . 
	ld b,0aah		;a9fc	06 aa 	. . 
	ld a,0aah		;a9fe	3e aa 	> . 
	ld a,0aah		;aa00	3e aa 	> . 
	ld (hl),d			;aa02	72 	r 
	xor d			;aa03	aa 	. 
	ld (hl),d			;aa04	72 	r 
	xor d			;aa05	aa 	. 
laa06h:
	ld bc,l804fh		;aa06	01 4f 80 	. O . 
	add a,b			;aa09	80 	. 
	add a,b			;aa0a	80 	. 
	ld l,a			;aa0b	6f 	o 
	add a,b			;aa0c	80 	. 
	dec sp			;aa0d	3b 	; 
laa0eh:
	ld b,e			;aa0e	43 	C 
	and b			;aa0f	a0 	. 
	ld b,b			;aa10	40 	@ 
	xor d			;aa11	aa 	. 
laa12h:
	cp e			;aa12	bb 	. 
	cp e			;aa13	bb 	. 
	ld b,d			;aa14	42 	B 
	and b			;aa15	a0 	. 
	ld l,e			;aa16	6b 	k 
laa17h:
	add a,b			;aa17	80 	. 
laa18h:
	ld a,(0aa40h)		;aa18	3a 40 aa 	: @ . 
	or h			;aa1b	b4 	. 
	cp l			;aa1c	bd 	. 
	or l			;aa1d	b5 	. 
laa1eh:
	cp (hl)			;aa1e	be 	. 
	ld l,d			;aa1f	6a 	j 
	add a,b			;aa20	80 	. 
	ld a,(l8250h)		;aa21	3a 50 82 	: P . 
	cp a			;aa24	bf 	. 
laa25h:
	cp a			;aa25	bf 	. 
laa26h:
	cp a			;aa26	bf 	. 
	sub a			;aa27	97 	. 
laa28h:
	ld a,d			;aa28	7a 	z 
	add a,b			;aa29	80 	. 
	ld a,(l8075h)		;aa2a	3a 75 80 	: u . 
laa2dh:
	ld b,b			;aa2d	40 	@ 
laa2eh:
	xor e			;aa2e	ab 	. 
	cp a			;aa2f	bf 	. 
laa30h:
	cp a			;aa30	bf 	. 
	ld h,b			;aa31	60 	` 
	add a,c			;aa32	81 	. 
	dec sp			;aa33	3b 	; 
	ld bc,l8074h		;aa34	01 74 80 	. t . 
	ld b,b			;aa37	40 	@ 
	adc a,e			;aa38	8b 	. 
	ld h,b			;aa39	60 	` 
	add a,c			;aa3a	81 	. 
	ld a,(hl)			;aa3b	7e 	~ 
	add a,b			;aa3c	80 	. 
	nop			;aa3d	00 	. 
	ccf			;aa3e	3f 	? 
	ld bc,l804fh		;aa3f	01 4f 80 	. O . 
	ld b,b			;aa42	40 	@ 
	xor b			;aa43	a8 	. 
	xor h			;aa44	ac 	. 
	xor h			;aa45	ac 	. 
laa46h:
	ld c,d			;aa46	4a 	J 
	add a,b			;aa47	80 	. 
	ld l,a			;aa48	6f 	o 
laa49h:
	add a,b			;aa49	80 	. 
	ld a,(0aa40h)		;aa4a	3a 40 aa 	: @ . 
	sub d			;aa4d	92 	. 
	or a			;aa4e	b7 	. 
laa4fh:
	sub a			;aa4f	97 	. 
	cp d			;aa50	ba 	. 
laa51h:
	ld l,d			;aa51	6a 	j 
	add a,b			;aa52	80 	. 
laa53h:
	ld a,(l8a40h)		;aa53	3a 40 8a 	: @ . 
laa56h:
	cp a			;aa56	bf 	. 
laa57h:
	cp a			;aa57	bf 	. 
laa58h:
	cp a			;aa58	bf 	. 
laa59h:
	sbc a,a			;aa59	9f 	. 
	ld l,d			;aa5a	6a 	j 
laa5bh:
	add a,b			;aa5b	80 	. 
	ld a,(l8055h)		;aa5c	3a 55 80 	: U . 
	ld b,b			;aa5f	40 	@ 
	xor a			;aa60	af 	. 
	cp a			;aa61	bf 	. 
laa62h:
	cp a			;aa62	bf 	. 
	add a,l			;aa63	85 	. 
laa64h:
	inc a			;aa64	3c 	< 
	ld d,b			;aa65	50 	P 
laa66h:
	add a,d			;aa66	82 	. 
	ld b,b			;aa67	40 	@ 
laa68h:
	xor a			;aa68	af 	. 
	add a,a			;aa69	87 	. 
	ld a,d			;aa6a	7a 	z 
	add a,b			;aa6b	80 	. 
laa6ch:
	dec a			;aa6c	3d 	= 
	ld a,h			;aa6d	7c 	| 
	add a,b			;aa6e	80 	. 
	ld a,(hl)			;aa6f	7e 	~ 
laa70h:
	add a,b			;aa70	80 	. 
	nop			;aa71	00 	. 
	ccf			;aa72	3f 	? 
	ld (bc),a			;aa73	02 	. 
	ld b,e			;aa74	43 	C 
	and b			;aa75	a0 	. 
	or b			;aa76	b0 	. 
	or b			;aa77	b0 	. 
	ld l,e			;aa78	6b 	k 
	add a,b			;aa79	80 	. 
	dec sp			;aa7a	3b 	; 
	ld b,b			;aa7b	40 	@ 
laa7ch:
	xor b			;aa7c	a8 	. 
	adc a,d			;aa7d	8a 	. 
laa7eh:
	sbc a,(hl)			;aa7e	9e 	. 
	sbc a,(hl)			;aa7f	9e 	. 
	xor b			;aa80	a8 	. 
	ld l,d			;aa81	6a 	j 
	add a,b			;aa82	80 	. 
laa83h:
	ld a,(0aa40h)		;aa83	3a 40 aa 	: @ . 
laa86h:
	cp l			;aa86	bd 	. 
	cp a			;aa87	bf 	. 
	cp l			;aa88	bd 	. 
	cp a			;aa89	bf 	. 
laa8ah:
	ld l,d			;aa8a	6a 	j 
	add a,b			;aa8b	80 	. 
laa8ch:
	ld a,(l8054h)		;aa8c	3a 54 80 	: T . 
laa8fh:
	ld b,b			;aa8f	40 	@ 
	cp a			;aa90	bf 	. 
laa91h:
	cp a			;aa91	bf 	. 
laa92h:
	cp a			;aa92	bf 	. 
laa93h:
	sub l			;aa93	95 	. 
	ld a,(hl)			;aa94	7e 	~ 
laa95h:
	add a,b			;aa95	80 	. 
laa96h:
	ld a,(l807dh)		;aa96	3a 7d 80 	: } . 
laa99h:
	ld b,b			;aa99	40 	@ 
laa9ah:
	adc a,d			;aa9a	8a 	. 
	cp a			;aa9b	bf 	. 
laa9ch:
	sbc a,a			;aa9c	9f 	. 
laa9dh:
	ld l,b			;aa9d	68 	h 
laa9eh:
	add a,b			;aa9e	80 	. 
	inc a			;aa9f	3c 	< 
laaa0h:
	ld a,l			;aaa0	7d 	} 
	add a,b			;aaa1	80 	. 
	ld (hl),b			;aaa2	70 	p 
	add a,d			;aaa3	82 	. 
laaa4h:
	ld a,b			;aaa4	78 	x 
	add a,b			;aaa5	80 	. 
laaa6h:
	nop			;aaa6	00 	. 
laaa7h:
	dec c			;aaa7	0d 	. 
laaa8h:
	jp nz,lc2aah		;aaa8	c2 aa c2 	. . . 
laaabh:
	xor d			;aaab	aa 	. 
laaach:
	jp nz,lc2aah		;aaac	c2 aa c2 	. . . 
	xor d			;aaaf	aa 	. 
	adc a,0aah		;aab0	ce aa 	. . 
	jp c,0e6aah		;aab2	da aa e6 	. . . 
laab5h:
	xor d			;aab5	aa 	. 
	jp p,0f2aah		;aab6	f2 aa f2 	. . . 
	xor d			;aab9	aa 	. 
	jp p,0e6aah		;aaba	f2 aa e6 	. . . 
	xor d			;aabd	aa 	. 
	jp c,0ceaah		;aabe	da aa ce 	. . . 
	xor d			;aac1	aa 	. 
	cp 0aah		;aac2	fe aa 	. . 
	cp 0aah		;aac4	fe aa 	. . 
laac6h:
	ld d,l			;aac6	55 	U 
	xor e			;aac7	ab 	. 
laac8h:
	ld d,l			;aac8	55 	U 
	xor e			;aac9	ab 	. 
	or c			;aaca	b1 	. 
	xor e			;aacb	ab 	. 
	or c			;aacc	b1 	. 
laacdh:
	xor e			;aacd	ab 	. 
	djnz laa7ch		;aace	10 ac 	. . 
	djnz laa7eh		;aad0	10 ac 	. . 
laad2h:
	ld l,e			;aad2	6b 	k 
	xor h			;aad3	ac 	. 
	ld l,e			;aad4	6b 	k 
	xor h			;aad5	ac 	. 
laad6h:
	ret			;aad6	c9 	. 
laad7h:
	xor h			;aad7	ac 	. 
	ret			;aad8	c9 	. 
laad9h:
	xor h			;aad9	ac 	. 
laadah:
	ld hl,(02aadh)		;aada	2a ad 2a 	* . * 
	xor l			;aadd	ad 	. 
	add a,l			;aade	85 	. 
	xor l			;aadf	ad 	. 
	add a,l			;aae0	85 	. 
	xor l			;aae1	ad 	. 
	ex (sp),hl			;aae2	e3 	. 
	xor l			;aae3	ad 	. 
	ex (sp),hl			;aae4	e3 	. 
	xor l			;aae5	ad 	. 
laae6h:
	ld b,h			;aae6	44 	D 
laae7h:
	xor (hl)			;aae7	ae 	. 
	ld b,h			;aae8	44 	D 
	xor (hl)			;aae9	ae 	. 
	sbc a,a			;aaea	9f 	. 
	xor (hl)			;aaeb	ae 	. 
	sbc a,a			;aaec	9f 	. 
	xor (hl)			;aaed	ae 	. 
laaeeh:
	xor (iy-003h)		;aaee	fd ae fd 	. . . 
laaf1h:
	xor (hl)			;aaf1	ae 	. 
	ld e,(hl)			;aaf2	5e 	^ 
	xor a			;aaf3	af 	. 
	ld e,(hl)			;aaf4	5e 	^ 
	xor a			;aaf5	af 	. 
	cp c			;aaf6	b9 	. 
	xor a			;aaf7	af 	. 
	cp c			;aaf8	b9 	. 
	xor a			;aaf9	af 	. 
	rla			;aafa	17 	. 
	or b			;aafb	b0 	. 
	rla			;aafc	17 	. 
	or b			;aafd	b0 	. 
	xor b			;aafe	a8 	. 
	sbc a,h			;aaff	9c 	. 
	adc a,h			;ab00	8c 	. 
	cp h			;ab01	bc 	. 
	adc a,h			;ab02	8c 	. 
	xor h			;ab03	ac 	. 
	sub h			;ab04	94 	. 
	add hl,sp			;ab05	39 	9 
	xor d			;ab06	aa 	. 
	sub l			;ab07	95 	. 
	add a,b			;ab08	80 	. 
	cp a			;ab09	bf 	. 
	add a,b			;ab0a	80 	. 
	xor d			;ab0b	aa 	. 
	sub l			;ab0c	95 	. 
	add hl,sp			;ab0d	39 	9 
	xor d			;ab0e	aa 	. 
lab0fh:
	cp l			;ab0f	bd 	. 
	cp h			;ab10	bc 	. 
	adc a,a			;ab11	8f 	. 
	cp h			;ab12	bc 	. 
	cp (hl)			;ab13	be 	. 
	sub l			;ab14	95 	. 
	add hl,sp			;ab15	39 	9 
	xor d			;ab16	aa 	. 
	cp a			;ab17	bf 	. 
	sub a			;ab18	97 	. 
	add a,e			;ab19	83 	. 
	xor e			;ab1a	ab 	. 
	cp a			;ab1b	bf 	. 
	sub l			;ab1c	95 	. 
	add hl,sp			;ab1d	39 	9 
	xor d			;ab1e	aa 	. 
	cp a			;ab1f	bf 	. 
	cp l			;ab20	bd 	. 
	cp h			;ab21	bc 	. 
	cp (hl)			;ab22	be 	. 
lab23h:
	cp a			;ab23	bf 	. 
	sub l			;ab24	95 	. 
	add hl,sp			;ab25	39 	9 
	xor d			;ab26	aa 	. 
	cp a			;ab27	bf 	. 
	cp a			;ab28	bf 	. 
	cp a			;ab29	bf 	. 
	cp a			;ab2a	bf 	. 
	cp a			;ab2b	bf 	. 
	sub l			;ab2c	95 	. 
	add hl,sp			;ab2d	39 	9 
	xor d			;ab2e	aa 	. 
	cp a			;ab2f	bf 	. 
	cp a			;ab30	bf 	. 
	cp a			;ab31	bf 	. 
	cp a			;ab32	bf 	. 
	cp a			;ab33	bf 	. 
	sub l			;ab34	95 	. 
	add hl,sp			;ab35	39 	9 
	xor d			;ab36	aa 	. 
	cp a			;ab37	bf 	. 
	cp a			;ab38	bf 	. 
	cp a			;ab39	bf 	. 
	cp a			;ab3a	bf 	. 
	cp a			;ab3b	bf 	. 
	sub l			;ab3c	95 	. 
	add hl,sp			;ab3d	39 	9 
	xor d			;ab3e	aa 	. 
	cp a			;ab3f	bf 	. 
	xor a			;ab40	af 	. 
lab41h:
	sbc a,a			;ab41	9f 	. 
	cp a			;ab42	bf 	. 
	sbc a,a			;ab43	9f 	. 
	sub l			;ab44	95 	. 
	add hl,sp			;ab45	39 	9 
lab46h:
	ld d,b			;ab46	50 	P 
	add a,d			;ab47	82 	. 
	ld b,b			;ab48	40 	@ 
	add a,l			;ab49	85 	. 
	ld (hl),h			;ab4a	74 	t 
	add a,b			;ab4b	80 	. 
	ld (hl),b			;ab4c	70 	p 
	add a,c			;ab4d	81 	. 
	ld (hl),h			;ab4e	74 	t 
	add a,b			;ab4f	80 	. 
	ld (hl),b			;ab50	70 	p 
	add a,c			;ab51	81 	. 
	ld a,h			;ab52	7c 	| 
	add a,b			;ab53	80 	. 
	nop			;ab54	00 	. 
lab55h:
	ld b,e			;ab55	43 	C 
	and b			;ab56	a0 	. 
	or b			;ab57	b0 	. 
	or b			;ab58	b0 	. 
	or b			;ab59	b0 	. 
	or b			;ab5a	b0 	. 
	or b			;ab5b	b0 	. 
	sub b			;ab5c	90 	. 
	add hl,sp			;ab5d	39 	9 
	ld b,b			;ab5e	40 	@ 
	xor d			;ab5f	aa 	. 
	sub l			;ab60	95 	. 
	add a,b			;ab61	80 	. 
	cp a			;ab62	bf 	. 
	add a,b			;ab63	80 	. 
	xor d			;ab64	aa 	. 
	sub l			;ab65	95 	. 
	add hl,sp			;ab66	39 	9 
	xor d			;ab67	aa 	. 
	or l			;ab68	b5 	. 
	or b			;ab69	b0 	. 
	cp a			;ab6a	bf 	. 
	or b			;ab6b	b0 	. 
	cp d			;ab6c	ba 	. 
	sub l			;ab6d	95 	. 
	add hl,sp			;ab6e	39 	9 
	xor d			;ab6f	aa 	. 
	cp a			;ab70	bf 	. 
	sbc a,a			;ab71	9f 	. 
	adc a,h			;ab72	8c 	. 
	xor a			;ab73	af 	. 
	cp a			;ab74	bf 	. 
	sub l			;ab75	95 	. 
	add hl,sp			;ab76	39 	9 
	xor d			;ab77	aa 	. 
	cp a			;ab78	bf 	. 
	or l			;ab79	b5 	. 
	or b			;ab7a	b0 	. 
	cp d			;ab7b	ba 	. 
	cp a			;ab7c	bf 	. 
	sub l			;ab7d	95 	. 
	add hl,sp			;ab7e	39 	9 
	xor d			;ab7f	aa 	. 
	cp a			;ab80	bf 	. 
	cp a			;ab81	bf 	. 
	cp a			;ab82	bf 	. 
	cp a			;ab83	bf 	. 
	cp a			;ab84	bf 	. 
	sub l			;ab85	95 	. 
	add hl,sp			;ab86	39 	9 
	xor d			;ab87	aa 	. 
	cp a			;ab88	bf 	. 
	cp a			;ab89	bf 	. 
	cp a			;ab8a	bf 	. 
	cp a			;ab8b	bf 	. 
	cp a			;ab8c	bf 	. 
	sub l			;ab8d	95 	. 
	add hl,sp			;ab8e	39 	9 
	xor d			;ab8f	aa 	. 
	cp a			;ab90	bf 	. 
	cp a			;ab91	bf 	. 
	cp a			;ab92	bf 	. 
	cp a			;ab93	bf 	. 
	cp a			;ab94	bf 	. 
	sub l			;ab95	95 	. 
	add hl,sp			;ab96	39 	9 
lab97h:
	xor d			;ab97	aa 	. 
	cp a			;ab98	bf 	. 
	cp a			;ab99	bf 	. 
	cp a			;ab9a	bf 	. 
	cp a			;ab9b	bf 	. 
	cp a			;ab9c	bf 	. 
	sub l			;ab9d	95 	. 
	add hl,sp			;ab9e	39 	9 
	adc a,d			;ab9f	8a 	. 
	sub a			;aba0	97 	. 
	ld d,b			;aba1	50 	P 
	add a,d			;aba2	82 	. 
	ld b,b			;aba3	40 	@ 
	add a,l			;aba4	85 	. 
	ld d,b			;aba5	50 	P 
	add a,e			;aba6	83 	. 
	ld b,b			;aba7	40 	@ 
	add a,l			;aba8	85 	. 
	ld (hl),b			;aba9	70 	p 
	add a,c			;abaa	81 	. 
	add hl,sp			;abab	39 	9 
	ld a,l			;abac	7d 	} 
	add a,b			;abad	80 	. 
	ld a,h			;abae	7c 	| 
	add a,b			;abaf	80 	. 
	nop			;abb0	00 	. 
	ld c,a			;abb1	4f 	O 
	add a,b			;abb2	80 	. 
	add a,b			;abb3	80 	. 
	add a,b			;abb4	80 	. 
	add a,b			;abb5	80 	. 
	add a,b			;abb6	80 	. 
	add a,b			;abb7	80 	. 
	add a,b			;abb8	80 	. 
	add hl,sp			;abb9	39 	9 
	ld b,b			;abba	40 	@ 
	xor d			;abbb	aa 	. 
	sub a			;abbc	97 	. 
	add a,e			;abbd	83 	. 
	cp a			;abbe	bf 	. 
	add a,e			;abbf	83 	. 
	xor e			;abc0	ab 	. 
	sub l			;abc1	95 	. 
	add hl,sp			;abc2	39 	9 
	xor d			;abc3	aa 	. 
	sub l			;abc4	95 	. 
	add a,b			;abc5	80 	. 
	cp a			;abc6	bf 	. 
	add a,b			;abc7	80 	. 
	xor d			;abc8	aa 	. 
	sub l			;abc9	95 	. 
	add hl,sp			;abca	39 	9 
	xor d			;abcb	aa 	. 
labcch:
	cp a			;abcc	bf 	. 
	cp a			;abcd	bf 	. 
	or e			;abce	b3 	. 
	cp a			;abcf	bf 	. 
	cp a			;abd0	bf 	. 
	sub l			;abd1	95 	. 
	add hl,sp			;abd2	39 	9 
	xor d			;abd3	aa 	. 
	cp a			;abd4	bf 	. 
	sub l			;abd5	95 	. 
	add a,b			;abd6	80 	. 
	xor d			;abd7	aa 	. 
	cp a			;abd8	bf 	. 
	sub l			;abd9	95 	. 
	add hl,sp			;abda	39 	9 
	xor d			;abdb	aa 	. 
labdch:
	cp a			;abdc	bf 	. 
	cp a			;abdd	bf 	. 
	cp a			;abde	bf 	. 
	cp a			;abdf	bf 	. 
	cp a			;abe0	bf 	. 
	sub l			;abe1	95 	. 
	add hl,sp			;abe2	39 	9 
	xor d			;abe3	aa 	. 
	cp a			;abe4	bf 	. 
	cp a			;abe5	bf 	. 
	cp a			;abe6	bf 	. 
	cp a			;abe7	bf 	. 
labe8h:
	cp a			;abe8	bf 	. 
	sub l			;abe9	95 	. 
	add hl,sp			;abea	39 	9 
	xor d			;abeb	aa 	. 
	cp a			;abec	bf 	. 
	cp a			;abed	bf 	. 
	cp a			;abee	bf 	. 
	cp a			;abef	bf 	. 
	cp a			;abf0	bf 	. 
	sub l			;abf1	95 	. 
	add hl,sp			;abf2	39 	9 
	xor d			;abf3	aa 	. 
	cp a			;abf4	bf 	. 
	cp a			;abf5	bf 	. 
	cp a			;abf6	bf 	. 
	cp a			;abf7	bf 	. 
	cp a			;abf8	bf 	. 
	sub l			;abf9	95 	. 
	add hl,sp			;abfa	39 	9 
	xor d			;abfb	aa 	. 
	sbc a,a			;abfc	9f 	. 
	adc a,e			;abfd	8b 	. 
	sub a			;abfe	97 	. 
	adc a,a			;abff	8f 	. 
	sub a			;ac00	97 	. 
	add a,l			;ac01	85 	. 
	add hl,sp			;ac02	39 	9 
	ld (hl),h			;ac03	74 	t 
	add a,b			;ac04	80 	. 
	ld (hl),b			;ac05	70 	p 
	add a,c			;ac06	81 	. 
	ld a,l			;ac07	7d 	} 
	add a,b			;ac08	80 	. 
	ld a,h			;ac09	7c 	| 
	add a,b			;ac0a	80 	. 
	ld a,l			;ac0b	7d 	} 
	add a,b			;ac0c	80 	. 
	ld a,h			;ac0d	7c 	| 
	add a,b			;ac0e	80 	. 
	nop			;ac0f	00 	. 
	ld b,c			;ac10	41 	A 
	and b			;ac11	a0 	. 
	ld b,b			;ac12	40 	@ 
	sbc a,h			;ac13	9c 	. 
	xor h			;ac14	ac 	. 
	cp h			;ac15	bc 	. 
	sbc a,h			;ac16	9c 	. 
	xor h			;ac17	ac 	. 
	ld b,d			;ac18	42 	B 
	sub b			;ac19	90 	. 
	add hl,sp			;ac1a	39 	9 
	ld b,b			;ac1b	40 	@ 
	xor d			;ac1c	aa 	. 
	add a,b			;ac1d	80 	. 
	add a,b			;ac1e	80 	. 
	cp a			;ac1f	bf 	. 
	add a,b			;ac20	80 	. 
	add a,b			;ac21	80 	. 
	sub l			;ac22	95 	. 
	add hl,sp			;ac23	39 	9 
	xor d			;ac24	aa 	. 
	cp h			;ac25	bc 	. 
	cp h			;ac26	bc 	. 
	adc a,a			;ac27	8f 	. 
	cp h			;ac28	bc 	. 
	cp h			;ac29	bc 	. 
	sub l			;ac2a	95 	. 
	add hl,sp			;ac2b	39 	9 
	xor d			;ac2c	aa 	. 
	cp a			;ac2d	bf 	. 
	add a,e			;ac2e	83 	. 
	add a,e			;ac2f	83 	. 
	add a,e			;ac30	83 	. 
	cp a			;ac31	bf 	. 
	sub l			;ac32	95 	. 
	add hl,sp			;ac33	39 	9 
	xor d			;ac34	aa 	. 
	cp a			;ac35	bf 	. 
	cp h			;ac36	bc 	. 
	cp h			;ac37	bc 	. 
	cp h			;ac38	bc 	. 
	cp a			;ac39	bf 	. 
	sub l			;ac3a	95 	. 
	add hl,sp			;ac3b	39 	9 
	xor d			;ac3c	aa 	. 
	cp a			;ac3d	bf 	. 
	cp a			;ac3e	bf 	. 
	cp a			;ac3f	bf 	. 
	cp a			;ac40	bf 	. 
	cp a			;ac41	bf 	. 
	sub l			;ac42	95 	. 
	add hl,sp			;ac43	39 	9 
	xor d			;ac44	aa 	. 
	cp a			;ac45	bf 	. 
	cp a			;ac46	bf 	. 
	cp a			;ac47	bf 	. 
	cp a			;ac48	bf 	. 
	cp a			;ac49	bf 	. 
	sub l			;ac4a	95 	. 
	add hl,sp			;ac4b	39 	9 
	xor d			;ac4c	aa 	. 
	cp a			;ac4d	bf 	. 
	cp a			;ac4e	bf 	. 
	cp a			;ac4f	bf 	. 
	cp a			;ac50	bf 	. 
	cp a			;ac51	bf 	. 
	sub l			;ac52	95 	. 
	add hl,sp			;ac53	39 	9 
	xor d			;ac54	aa 	. 
	cp a			;ac55	bf 	. 
	xor a			;ac56	af 	. 
	sbc a,a			;ac57	9f 	. 
	cp a			;ac58	bf 	. 
	sbc a,a			;ac59	9f 	. 
	sub l			;ac5a	95 	. 
	add hl,sp			;ac5b	39 	9 
lac5ch:
	ld d,b			;ac5c	50 	P 
	add a,d			;ac5d	82 	. 
	ld b,b			;ac5e	40 	@ 
	add a,l			;ac5f	85 	. 
	ld (hl),h			;ac60	74 	t 
	add a,b			;ac61	80 	. 
	ld (hl),b			;ac62	70 	p 
	add a,c			;ac63	81 	. 
	ld (hl),h			;ac64	74 	t 
	add a,b			;ac65	80 	. 
	ld (hl),b			;ac66	70 	p 
	add a,c			;ac67	81 	. 
	ld a,h			;ac68	7c 	| 
	add a,b			;ac69	80 	. 
	nop			;ac6a	00 	. 
	ld b,a			;ac6b	47 	G 
	add a,b			;ac6c	80 	. 
	ld b,e			;ac6d	43 	C 
	or b			;ac6e	b0 	. 
	or b			;ac6f	b0 	. 
	or b			;ac70	b0 	. 
	or b			;ac71	b0 	. 
	or b			;ac72	b0 	. 
	ld c,e			;ac73	4b 	K 
	add a,b			;ac74	80 	. 
	add hl,sp			;ac75	39 	9 
	ld b,b			;ac76	40 	@ 
	xor d			;ac77	aa 	. 
	add a,c			;ac78	81 	. 
	add a,d			;ac79	82 	. 
	cp a			;ac7a	bf 	. 
	add a,c			;ac7b	81 	. 
	add a,d			;ac7c	82 	. 
	sub l			;ac7d	95 	. 
	add hl,sp			;ac7e	39 	9 
	xor d			;ac7f	aa 	. 
	or b			;ac80	b0 	. 
	or b			;ac81	b0 	. 
	cp a			;ac82	bf 	. 
	or b			;ac83	b0 	. 
	or b			;ac84	b0 	. 
	sub l			;ac85	95 	. 
	add hl,sp			;ac86	39 	9 
	xor d			;ac87	aa 	. 
	cp a			;ac88	bf 	. 
	adc a,a			;ac89	8f 	. 
	adc a,h			;ac8a	8c 	. 
	adc a,a			;ac8b	8f 	. 
	cp a			;ac8c	bf 	. 
	sub l			;ac8d	95 	. 
	add hl,sp			;ac8e	39 	9 
	xor d			;ac8f	aa 	. 
	cp a			;ac90	bf 	. 
	or b			;ac91	b0 	. 
	or b			;ac92	b0 	. 
	or b			;ac93	b0 	. 
	cp a			;ac94	bf 	. 
	sub l			;ac95	95 	. 
	add hl,sp			;ac96	39 	9 
	xor d			;ac97	aa 	. 
	cp a			;ac98	bf 	. 
	cp a			;ac99	bf 	. 
	cp a			;ac9a	bf 	. 
	cp a			;ac9b	bf 	. 
	cp a			;ac9c	bf 	. 
	sub l			;ac9d	95 	. 
	add hl,sp			;ac9e	39 	9 
	xor d			;ac9f	aa 	. 
	cp a			;aca0	bf 	. 
	cp a			;aca1	bf 	. 
	cp a			;aca2	bf 	. 
	cp a			;aca3	bf 	. 
	cp a			;aca4	bf 	. 
	sub l			;aca5	95 	. 
	add hl,sp			;aca6	39 	9 
	xor d			;aca7	aa 	. 
	cp a			;aca8	bf 	. 
	cp a			;aca9	bf 	. 
	cp a			;acaa	bf 	. 
	cp a			;acab	bf 	. 
	cp a			;acac	bf 	. 
	sub l			;acad	95 	. 
	add hl,sp			;acae	39 	9 
	xor d			;acaf	aa 	. 
	cp a			;acb0	bf 	. 
	cp a			;acb1	bf 	. 
	cp a			;acb2	bf 	. 
	cp a			;acb3	bf 	. 
	cp a			;acb4	bf 	. 
	sub l			;acb5	95 	. 
	add hl,sp			;acb6	39 	9 
	adc a,d			;acb7	8a 	. 
	sub a			;acb8	97 	. 
	ld d,b			;acb9	50 	P 
	add a,d			;acba	82 	. 
	ld b,b			;acbb	40 	@ 
	add a,l			;acbc	85 	. 
	ld d,b			;acbd	50 	P 
	add a,e			;acbe	83 	. 
	ld b,b			;acbf	40 	@ 
	add a,l			;acc0	85 	. 
	ld (hl),b			;acc1	70 	p 
	add a,c			;acc2	81 	. 
	add hl,sp			;acc3	39 	9 
	ld a,l			;acc4	7d 	} 
	add a,b			;acc5	80 	. 
	ld a,h			;acc6	7c 	| 
	add a,b			;acc7	80 	. 
	nop			;acc8	00 	. 
	ld e,a			;acc9	5f 	_ 
	add a,b			;acca	80 	. 
	ld c,a			;accb	4f 	O 
	add a,b			;accc	80 	. 
	add a,b			;accd	80 	. 
	add a,b			;acce	80 	. 
	add a,b			;accf	80 	. 
	add a,b			;acd0	80 	. 
	ld l,a			;acd1	6f 	o 
	add a,b			;acd2	80 	. 
	add hl,sp			;acd3	39 	9 
	ld b,b			;acd4	40 	@ 
	xor b			;acd5	a8 	. 
	add a,a			;acd6	87 	. 
	adc a,e			;acd7	8b 	. 
	cp a			;acd8	bf 	. 
	add a,a			;acd9	87 	. 
	adc a,e			;acda	8b 	. 
	sub h			;acdb	94 	. 
	add hl,sp			;acdc	39 	9 
	xor d			;acdd	aa 	. 
	add a,b			;acde	80 	. 
	add a,b			;acdf	80 	. 
	cp a			;ace0	bf 	. 
	add a,b			;ace1	80 	. 
	add a,b			;ace2	80 	. 
	sub l			;ace3	95 	. 
	add hl,sp			;ace4	39 	9 
	xor d			;ace5	aa 	. 
	cp a			;ace6	bf 	. 
	cp a			;ace7	bf 	. 
	or e			;ace8	b3 	. 
	cp a			;ace9	bf 	. 
	cp a			;acea	bf 	. 
	sub l			;aceb	95 	. 
	add hl,sp			;acec	39 	9 
	xor d			;aced	aa 	. 
	cp a			;acee	bf 	. 
	add a,b			;acef	80 	. 
	add a,b			;acf0	80 	. 
	add a,b			;acf1	80 	. 
	cp a			;acf2	bf 	. 
	sub l			;acf3	95 	. 
	add hl,sp			;acf4	39 	9 
	xor d			;acf5	aa 	. 
	cp a			;acf6	bf 	. 
	cp a			;acf7	bf 	. 
	cp a			;acf8	bf 	. 
	cp a			;acf9	bf 	. 
	cp a			;acfa	bf 	. 
	sub l			;acfb	95 	. 
	add hl,sp			;acfc	39 	9 
	xor d			;acfd	aa 	. 
	cp a			;acfe	bf 	. 
	cp a			;acff	bf 	. 
	cp a			;ad00	bf 	. 
	cp a			;ad01	bf 	. 
	cp a			;ad02	bf 	. 
	sub l			;ad03	95 	. 
	add hl,sp			;ad04	39 	9 
	xor d			;ad05	aa 	. 
	cp a			;ad06	bf 	. 
	cp a			;ad07	bf 	. 
	cp a			;ad08	bf 	. 
	cp a			;ad09	bf 	. 
	cp a			;ad0a	bf 	. 
	sub l			;ad0b	95 	. 
	add hl,sp			;ad0c	39 	9 
	xor d			;ad0d	aa 	. 
	cp a			;ad0e	bf 	. 
	cp a			;ad0f	bf 	. 
	cp a			;ad10	bf 	. 
	cp a			;ad11	bf 	. 
	cp a			;ad12	bf 	. 
	sub l			;ad13	95 	. 
	add hl,sp			;ad14	39 	9 
	xor d			;ad15	aa 	. 
	sbc a,a			;ad16	9f 	. 
	adc a,e			;ad17	8b 	. 
	sub a			;ad18	97 	. 
	adc a,a			;ad19	8f 	. 
	sub a			;ad1a	97 	. 
	add a,l			;ad1b	85 	. 
	add hl,sp			;ad1c	39 	9 
lad1dh:
	ld (hl),h			;ad1d	74 	t 
	add a,b			;ad1e	80 	. 
	ld (hl),b			;ad1f	70 	p 
	add a,c			;ad20	81 	. 
	ld a,l			;ad21	7d 	} 
	add a,b			;ad22	80 	. 
	ld a,h			;ad23	7c 	| 
	add a,b			;ad24	80 	. 
	ld a,l			;ad25	7d 	} 
	add a,b			;ad26	80 	. 
	ld a,h			;ad27	7c 	| 
	add a,b			;ad28	80 	. 
	nop			;ad29	00 	. 
	ld b,c			;ad2a	41 	A 
	and b			;ad2b	a0 	. 
	ld b,b			;ad2c	40 	@ 
	sbc a,h			;ad2d	9c 	. 
	cp h			;ad2e	bc 	. 
	cp h			;ad2f	bc 	. 
	cp h			;ad30	bc 	. 
	xor h			;ad31	ac 	. 
	ld b,d			;ad32	42 	B 
	sub b			;ad33	90 	. 
	add hl,sp			;ad34	39 	9 
	ld b,b			;ad35	40 	@ 
	xor d			;ad36	aa 	. 
	add a,b			;ad37	80 	. 
	add a,d			;ad38	82 	. 
	cp a			;ad39	bf 	. 
	add a,c			;ad3a	81 	. 
	add a,b			;ad3b	80 	. 
	sub l			;ad3c	95 	. 
	add hl,sp			;ad3d	39 	9 
	xor d			;ad3e	aa 	. 
	cp h			;ad3f	bc 	. 
	cp h			;ad40	bc 	. 
	adc a,a			;ad41	8f 	. 
	cp h			;ad42	bc 	. 
	cp h			;ad43	bc 	. 
	sub l			;ad44	95 	. 
	add hl,sp			;ad45	39 	9 
	xor d			;ad46	aa 	. 
	cp a			;ad47	bf 	. 
	add a,e			;ad48	83 	. 
	add a,e			;ad49	83 	. 
	add a,e			;ad4a	83 	. 
	cp a			;ad4b	bf 	. 
	sub l			;ad4c	95 	. 
	add hl,sp			;ad4d	39 	9 
	xor d			;ad4e	aa 	. 
	cp a			;ad4f	bf 	. 
	cp b			;ad50	b8 	. 
	cp h			;ad51	bc 	. 
	or h			;ad52	b4 	. 
	cp a			;ad53	bf 	. 
	sub l			;ad54	95 	. 
	add hl,sp			;ad55	39 	9 
	xor d			;ad56	aa 	. 
	cp a			;ad57	bf 	. 
	cp a			;ad58	bf 	. 
	cp a			;ad59	bf 	. 
	cp a			;ad5a	bf 	. 
	cp a			;ad5b	bf 	. 
	sub l			;ad5c	95 	. 
	add hl,sp			;ad5d	39 	9 
	xor d			;ad5e	aa 	. 
	cp a			;ad5f	bf 	. 
	cp a			;ad60	bf 	. 
	cp a			;ad61	bf 	. 
	cp a			;ad62	bf 	. 
	cp a			;ad63	bf 	. 
	sub l			;ad64	95 	. 
	add hl,sp			;ad65	39 	9 
	xor d			;ad66	aa 	. 
	cp a			;ad67	bf 	. 
	cp a			;ad68	bf 	. 
	cp a			;ad69	bf 	. 
	cp a			;ad6a	bf 	. 
	cp a			;ad6b	bf 	. 
	sub l			;ad6c	95 	. 
	add hl,sp			;ad6d	39 	9 
	xor d			;ad6e	aa 	. 
	cp a			;ad6f	bf 	. 
	xor a			;ad70	af 	. 
	sbc a,a			;ad71	9f 	. 
	cp a			;ad72	bf 	. 
	sbc a,a			;ad73	9f 	. 
	sub l			;ad74	95 	. 
	add hl,sp			;ad75	39 	9 
	ld d,b			;ad76	50 	P 
	add a,d			;ad77	82 	. 
	ld b,b			;ad78	40 	@ 
	add a,l			;ad79	85 	. 
	ld (hl),h			;ad7a	74 	t 
	add a,b			;ad7b	80 	. 
	ld (hl),b			;ad7c	70 	p 
	add a,c			;ad7d	81 	. 
	ld (hl),h			;ad7e	74 	t 
	add a,b			;ad7f	80 	. 
	ld (hl),b			;ad80	70 	p 
	add a,c			;ad81	81 	. 
	ld a,h			;ad82	7c 	| 
	add a,b			;ad83	80 	. 
	nop			;ad84	00 	. 
	ld b,a			;ad85	47 	G 
	add a,b			;ad86	80 	. 
	ld b,e			;ad87	43 	C 
	or b			;ad88	b0 	. 
	or b			;ad89	b0 	. 
	or b			;ad8a	b0 	. 
	or b			;ad8b	b0 	. 
	or b			;ad8c	b0 	. 
	ld c,e			;ad8d	4b 	K 
	add a,b			;ad8e	80 	. 
	add hl,sp			;ad8f	39 	9 
	ld b,b			;ad90	40 	@ 
	xor d			;ad91	aa 	. 
	add a,c			;ad92	81 	. 
	adc a,e			;ad93	8b 	. 
	cp a			;ad94	bf 	. 
	add a,a			;ad95	87 	. 
	add a,d			;ad96	82 	. 
	sub l			;ad97	95 	. 
	add hl,sp			;ad98	39 	9 
	xor d			;ad99	aa 	. 
lad9ah:
	or b			;ad9a	b0 	. 
	or b			;ad9b	b0 	. 
	cp a			;ad9c	bf 	. 
	or b			;ad9d	b0 	. 
	or b			;ad9e	b0 	. 
	sub l			;ad9f	95 	. 
	add hl,sp			;ada0	39 	9 
	xor d			;ada1	aa 	. 
	cp a			;ada2	bf 	. 
	adc a,a			;ada3	8f 	. 
	adc a,h			;ada4	8c 	. 
	adc a,a			;ada5	8f 	. 
	cp a			;ada6	bf 	. 
	sub l			;ada7	95 	. 
	add hl,sp			;ada8	39 	9 
	xor d			;ada9	aa 	. 
	cp a			;adaa	bf 	. 
	and b			;adab	a0 	. 
	or b			;adac	b0 	. 
	sub b			;adad	90 	. 
	cp a			;adae	bf 	. 
	sub l			;adaf	95 	. 
	add hl,sp			;adb0	39 	9 
	xor d			;adb1	aa 	. 
	cp a			;adb2	bf 	. 
	cp a			;adb3	bf 	. 
	cp a			;adb4	bf 	. 
	cp a			;adb5	bf 	. 
	cp a			;adb6	bf 	. 
	sub l			;adb7	95 	. 
	add hl,sp			;adb8	39 	9 
	xor d			;adb9	aa 	. 
	cp a			;adba	bf 	. 
	cp a			;adbb	bf 	. 
	cp a			;adbc	bf 	. 
	cp a			;adbd	bf 	. 
	cp a			;adbe	bf 	. 
	sub l			;adbf	95 	. 
	add hl,sp			;adc0	39 	9 
	xor d			;adc1	aa 	. 
	cp a			;adc2	bf 	. 
	cp a			;adc3	bf 	. 
	cp a			;adc4	bf 	. 
	cp a			;adc5	bf 	. 
	cp a			;adc6	bf 	. 
	sub l			;adc7	95 	. 
	add hl,sp			;adc8	39 	9 
	xor d			;adc9	aa 	. 
	cp a			;adca	bf 	. 
	cp a			;adcb	bf 	. 
	cp a			;adcc	bf 	. 
	cp a			;adcd	bf 	. 
	cp a			;adce	bf 	. 
	sub l			;adcf	95 	. 
	add hl,sp			;add0	39 	9 
	adc a,d			;add1	8a 	. 
	sub a			;add2	97 	. 
	ld d,b			;add3	50 	P 
	add a,d			;add4	82 	. 
	ld b,b			;add5	40 	@ 
	add a,l			;add6	85 	. 
	ld d,b			;add7	50 	P 
	add a,e			;add8	83 	. 
	ld b,b			;add9	40 	@ 
	add a,l			;adda	85 	. 
laddbh:
	ld (hl),b			;addb	70 	p 
	add a,c			;addc	81 	. 
	add hl,sp			;addd	39 	9 
	ld a,l			;adde	7d 	} 
	add a,b			;addf	80 	. 
	ld a,h			;ade0	7c 	| 
	add a,b			;ade1	80 	. 
	nop			;ade2	00 	. 
	ld e,a			;ade3	5f 	_ 
	add a,b			;ade4	80 	. 
	ld c,a			;ade5	4f 	O 
	add a,b			;ade6	80 	. 
	add a,b			;ade7	80 	. 
	add a,b			;ade8	80 	. 
	add a,b			;ade9	80 	. 
	add a,b			;adea	80 	. 
	ld l,a			;adeb	6f 	o 
	add a,b			;adec	80 	. 
	add hl,sp			;aded	39 	9 
	ld b,b			;adee	40 	@ 
	xor b			;adef	a8 	. 
	add a,a			;adf0	87 	. 
	xor a			;adf1	af 	. 
	cp a			;adf2	bf 	. 
	sbc a,a			;adf3	9f 	. 
	adc a,e			;adf4	8b 	. 
	sub h			;adf5	94 	. 
	add hl,sp			;adf6	39 	9 
	xor d			;adf7	aa 	. 
	add a,b			;adf8	80 	. 
	add a,b			;adf9	80 	. 
	cp a			;adfa	bf 	. 
	add a,b			;adfb	80 	. 
	add a,b			;adfc	80 	. 
	sub l			;adfd	95 	. 
	add hl,sp			;adfe	39 	9 
	xor d			;adff	aa 	. 
	cp a			;ae00	bf 	. 
	cp a			;ae01	bf 	. 
	or e			;ae02	b3 	. 
	cp a			;ae03	bf 	. 
	cp a			;ae04	bf 	. 
	sub l			;ae05	95 	. 
	add hl,sp			;ae06	39 	9 
	xor d			;ae07	aa 	. 
	cp a			;ae08	bf 	. 
	add a,b			;ae09	80 	. 
	add a,b			;ae0a	80 	. 
	add a,b			;ae0b	80 	. 
	cp a			;ae0c	bf 	. 
	sub l			;ae0d	95 	. 
	add hl,sp			;ae0e	39 	9 
	xor d			;ae0f	aa 	. 
	cp a			;ae10	bf 	. 
	cp (hl)			;ae11	be 	. 
	cp a			;ae12	bf 	. 
	cp l			;ae13	bd 	. 
	cp a			;ae14	bf 	. 
	sub l			;ae15	95 	. 
	add hl,sp			;ae16	39 	9 
	xor d			;ae17	aa 	. 
	cp a			;ae18	bf 	. 
	cp a			;ae19	bf 	. 
	cp a			;ae1a	bf 	. 
	cp a			;ae1b	bf 	. 
	cp a			;ae1c	bf 	. 
	sub l			;ae1d	95 	. 
	add hl,sp			;ae1e	39 	9 
	xor d			;ae1f	aa 	. 
	cp a			;ae20	bf 	. 
	cp a			;ae21	bf 	. 
	cp a			;ae22	bf 	. 
	cp a			;ae23	bf 	. 
	cp a			;ae24	bf 	. 
	sub l			;ae25	95 	. 
	add hl,sp			;ae26	39 	9 
	xor d			;ae27	aa 	. 
	cp a			;ae28	bf 	. 
	cp a			;ae29	bf 	. 
	cp a			;ae2a	bf 	. 
	cp a			;ae2b	bf 	. 
	cp a			;ae2c	bf 	. 
	sub l			;ae2d	95 	. 
	add hl,sp			;ae2e	39 	9 
	xor d			;ae2f	aa 	. 
	sbc a,a			;ae30	9f 	. 
	adc a,e			;ae31	8b 	. 
	sub a			;ae32	97 	. 
	adc a,a			;ae33	8f 	. 
	sub a			;ae34	97 	. 
	add a,l			;ae35	85 	. 
	add hl,sp			;ae36	39 	9 
	ld (hl),h			;ae37	74 	t 
	add a,b			;ae38	80 	. 
	ld (hl),b			;ae39	70 	p 
	add a,c			;ae3a	81 	. 
	ld a,l			;ae3b	7d 	} 
	add a,b			;ae3c	80 	. 
	ld a,h			;ae3d	7c 	| 
	add a,b			;ae3e	80 	. 
	ld a,l			;ae3f	7d 	} 
	add a,b			;ae40	80 	. 
	ld a,h			;ae41	7c 	| 
	add a,b			;ae42	80 	. 
	nop			;ae43	00 	. 
	ld b,c			;ae44	41 	A 
	and b			;ae45	a0 	. 
	ld b,b			;ae46	40 	@ 
	sbc a,h			;ae47	9c 	. 
	cp h			;ae48	bc 	. 
	cp h			;ae49	bc 	. 
	cp h			;ae4a	bc 	. 
	xor h			;ae4b	ac 	. 
	ld b,d			;ae4c	42 	B 
	sub b			;ae4d	90 	. 
	add hl,sp			;ae4e	39 	9 
	ld b,b			;ae4f	40 	@ 
	xor d			;ae50	aa 	. 
	add a,b			;ae51	80 	. 
	add a,d			;ae52	82 	. 
	cp a			;ae53	bf 	. 
	add a,c			;ae54	81 	. 
	add a,b			;ae55	80 	. 
	sub l			;ae56	95 	. 
	add hl,sp			;ae57	39 	9 
	xor d			;ae58	aa 	. 
	cp h			;ae59	bc 	. 
	cp h			;ae5a	bc 	. 
	adc a,a			;ae5b	8f 	. 
	cp h			;ae5c	bc 	. 
lae5dh:
	cp h			;ae5d	bc 	. 
	sub l			;ae5e	95 	. 
	add hl,sp			;ae5f	39 	9 
	xor d			;ae60	aa 	. 
	sub a			;ae61	97 	. 
	add a,e			;ae62	83 	. 
	add a,e			;ae63	83 	. 
	add a,e			;ae64	83 	. 
	xor e			;ae65	ab 	. 
	sub l			;ae66	95 	. 
	add hl,sp			;ae67	39 	9 
	xor d			;ae68	aa 	. 
	sub l			;ae69	95 	. 
	cp b			;ae6a	b8 	. 
	cp h			;ae6b	bc 	. 
	or h			;ae6c	b4 	. 
	xor d			;ae6d	aa 	. 
	sub l			;ae6e	95 	. 
	add hl,sp			;ae6f	39 	9 
	xor d			;ae70	aa 	. 
	cp a			;ae71	bf 	. 
	cp a			;ae72	bf 	. 
	cp a			;ae73	bf 	. 
	cp a			;ae74	bf 	. 
	cp a			;ae75	bf 	. 
	sub l			;ae76	95 	. 
	add hl,sp			;ae77	39 	9 
	xor d			;ae78	aa 	. 
	cp a			;ae79	bf 	. 
	cp a			;ae7a	bf 	. 
	cp a			;ae7b	bf 	. 
	cp a			;ae7c	bf 	. 
	cp a			;ae7d	bf 	. 
	sub l			;ae7e	95 	. 
	add hl,sp			;ae7f	39 	9 
	xor d			;ae80	aa 	. 
	cp a			;ae81	bf 	. 
	cp a			;ae82	bf 	. 
	cp a			;ae83	bf 	. 
	cp a			;ae84	bf 	. 
	cp a			;ae85	bf 	. 
	sub l			;ae86	95 	. 
	add hl,sp			;ae87	39 	9 
	xor d			;ae88	aa 	. 
	cp a			;ae89	bf 	. 
	xor a			;ae8a	af 	. 
	sbc a,a			;ae8b	9f 	. 
	cp a			;ae8c	bf 	. 
	sbc a,a			;ae8d	9f 	. 
	sub l			;ae8e	95 	. 
	add hl,sp			;ae8f	39 	9 
	ld d,b			;ae90	50 	P 
	add a,d			;ae91	82 	. 
sub_ae92h:
	ld b,b			;ae92	40 	@ 
	add a,l			;ae93	85 	. 
	ld (hl),h			;ae94	74 	t 
	add a,b			;ae95	80 	. 
	ld (hl),b			;ae96	70 	p 
	add a,c			;ae97	81 	. 
	ld (hl),h			;ae98	74 	t 
	add a,b			;ae99	80 	. 
	ld (hl),b			;ae9a	70 	p 
	add a,c			;ae9b	81 	. 
	ld a,h			;ae9c	7c 	| 
	add a,b			;ae9d	80 	. 
	nop			;ae9e	00 	. 
	ld b,a			;ae9f	47 	G 
	add a,b			;aea0	80 	. 
	ld b,e			;aea1	43 	C 
	or b			;aea2	b0 	. 
	or b			;aea3	b0 	. 
	or b			;aea4	b0 	. 
	or b			;aea5	b0 	. 
	or b			;aea6	b0 	. 
	ld c,e			;aea7	4b 	K 
	add a,b			;aea8	80 	. 
	add hl,sp			;aea9	39 	9 
	ld b,b			;aeaa	40 	@ 
	xor d			;aeab	aa 	. 
	add a,c			;aeac	81 	. 
	adc a,e			;aead	8b 	. 
	cp a			;aeae	bf 	. 
	add a,a			;aeaf	87 	. 
	add a,d			;aeb0	82 	. 
	sub l			;aeb1	95 	. 
	add hl,sp			;aeb2	39 	9 
	xor d			;aeb3	aa 	. 
	or b			;aeb4	b0 	. 
	or b			;aeb5	b0 	. 
	cp a			;aeb6	bf 	. 
	or b			;aeb7	b0 	. 
	or b			;aeb8	b0 	. 
	sub l			;aeb9	95 	. 
	add hl,sp			;aeba	39 	9 
	xor d			;aebb	aa 	. 
	sbc a,a			;aebc	9f 	. 
	adc a,a			;aebd	8f 	. 
	adc a,h			;aebe	8c 	. 
	adc a,a			;aebf	8f 	. 
	xor a			;aec0	af 	. 
	sub l			;aec1	95 	. 
	add hl,sp			;aec2	39 	9 
	xor d			;aec3	aa 	. 
	sub l			;aec4	95 	. 
	and b			;aec5	a0 	. 
	or b			;aec6	b0 	. 
	sub b			;aec7	90 	. 
	xor d			;aec8	aa 	. 
	sub l			;aec9	95 	. 
	add hl,sp			;aeca	39 	9 
	xor d			;aecb	aa 	. 
laecch:
	cp l			;aecc	bd 	. 
	cp a			;aecd	bf 	. 
	cp a			;aece	bf 	. 
	cp a			;aecf	bf 	. 
	cp (hl)			;aed0	be 	. 
	sub l			;aed1	95 	. 
	add hl,sp			;aed2	39 	9 
	xor d			;aed3	aa 	. 
	cp a			;aed4	bf 	. 
	cp a			;aed5	bf 	. 
	cp a			;aed6	bf 	. 
	cp a			;aed7	bf 	. 
	cp a			;aed8	bf 	. 
	sub l			;aed9	95 	. 
	add hl,sp			;aeda	39 	9 
	xor d			;aedb	aa 	. 
	cp a			;aedc	bf 	. 
	cp a			;aedd	bf 	. 
	cp a			;aede	bf 	. 
	cp a			;aedf	bf 	. 
	cp a			;aee0	bf 	. 
	sub l			;aee1	95 	. 
	add hl,sp			;aee2	39 	9 
	xor d			;aee3	aa 	. 
	cp a			;aee4	bf 	. 
	cp a			;aee5	bf 	. 
	cp a			;aee6	bf 	. 
	cp a			;aee7	bf 	. 
	cp a			;aee8	bf 	. 
	sub l			;aee9	95 	. 
	add hl,sp			;aeea	39 	9 
	adc a,d			;aeeb	8a 	. 
	sub a			;aeec	97 	. 
	ld d,b			;aeed	50 	P 
	add a,d			;aeee	82 	. 
	ld b,b			;aeef	40 	@ 
	add a,l			;aef0	85 	. 
	ld d,b			;aef1	50 	P 
	add a,e			;aef2	83 	. 
	ld b,b			;aef3	40 	@ 
	add a,l			;aef4	85 	. 
	ld (hl),b			;aef5	70 	p 
	add a,c			;aef6	81 	. 
	add hl,sp			;aef7	39 	9 
	ld a,l			;aef8	7d 	} 
	add a,b			;aef9	80 	. 
	ld a,h			;aefa	7c 	| 
	add a,b			;aefb	80 	. 
	nop			;aefc	00 	. 
	ld e,a			;aefd	5f 	_ 
	add a,b			;aefe	80 	. 
	ld c,a			;aeff	4f 	O 
	add a,b			;af00	80 	. 
	add a,b			;af01	80 	. 
	add a,b			;af02	80 	. 
	add a,b			;af03	80 	. 
	add a,b			;af04	80 	. 
	ld l,a			;af05	6f 	o 
	add a,b			;af06	80 	. 
	add hl,sp			;af07	39 	9 
	ld b,b			;af08	40 	@ 
	xor b			;af09	a8 	. 
	add a,a			;af0a	87 	. 
	xor a			;af0b	af 	. 
	cp a			;af0c	bf 	. 
	sbc a,a			;af0d	9f 	. 
	adc a,e			;af0e	8b 	. 
	sub h			;af0f	94 	. 
	add hl,sp			;af10	39 	9 
	xor d			;af11	aa 	. 
	add a,b			;af12	80 	. 
	add a,b			;af13	80 	. 
	cp a			;af14	bf 	. 
	add a,b			;af15	80 	. 
	add a,b			;af16	80 	. 
	sub l			;af17	95 	. 
	add hl,sp			;af18	39 	9 
	xor d			;af19	aa 	. 
	cp a			;af1a	bf 	. 
	cp a			;af1b	bf 	. 
	or e			;af1c	b3 	. 
	cp a			;af1d	bf 	. 
	cp a			;af1e	bf 	. 
	sub l			;af1f	95 	. 
	add hl,sp			;af20	39 	9 
	xor d			;af21	aa 	. 
	sub l			;af22	95 	. 
	add a,b			;af23	80 	. 
	add a,b			;af24	80 	. 
	add a,b			;af25	80 	. 
	xor d			;af26	aa 	. 
	sub l			;af27	95 	. 
	add hl,sp			;af28	39 	9 
	xor d			;af29	aa 	. 
	or l			;af2a	b5 	. 
	cp (hl)			;af2b	be 	. 
	cp a			;af2c	bf 	. 
	cp l			;af2d	bd 	. 
	cp d			;af2e	ba 	. 
	sub l			;af2f	95 	. 
	add hl,sp			;af30	39 	9 
	xor d			;af31	aa 	. 
	cp a			;af32	bf 	. 
	cp a			;af33	bf 	. 
	cp a			;af34	bf 	. 
	cp a			;af35	bf 	. 
	cp a			;af36	bf 	. 
	sub l			;af37	95 	. 
	add hl,sp			;af38	39 	9 
	xor d			;af39	aa 	. 
	cp a			;af3a	bf 	. 
	cp a			;af3b	bf 	. 
	cp a			;af3c	bf 	. 
	cp a			;af3d	bf 	. 
	cp a			;af3e	bf 	. 
	sub l			;af3f	95 	. 
	add hl,sp			;af40	39 	9 
	xor d			;af41	aa 	. 
	cp a			;af42	bf 	. 
	cp a			;af43	bf 	. 
	cp a			;af44	bf 	. 
	cp a			;af45	bf 	. 
	cp a			;af46	bf 	. 
	sub l			;af47	95 	. 
	add hl,sp			;af48	39 	9 
	xor d			;af49	aa 	. 
	sbc a,a			;af4a	9f 	. 
	adc a,e			;af4b	8b 	. 
	sub a			;af4c	97 	. 
	adc a,a			;af4d	8f 	. 
	sub a			;af4e	97 	. 
	add a,l			;af4f	85 	. 
	add hl,sp			;af50	39 	9 
	ld (hl),h			;af51	74 	t 
	add a,b			;af52	80 	. 
	ld (hl),b			;af53	70 	p 
	add a,c			;af54	81 	. 
	ld a,l			;af55	7d 	} 
	add a,b			;af56	80 	. 
	ld a,h			;af57	7c 	| 
	add a,b			;af58	80 	. 
	ld a,l			;af59	7d 	} 
laf5ah:
	add a,b			;af5a	80 	. 
	ld a,h			;af5b	7c 	| 
	add a,b			;af5c	80 	. 
	nop			;af5d	00 	. 
	ld b,c			;af5e	41 	A 
	and b			;af5f	a0 	. 
	ld b,b			;af60	40 	@ 
	sbc a,h			;af61	9c 	. 
	cp h			;af62	bc 	. 
	cp h			;af63	bc 	. 
	cp h			;af64	bc 	. 
	xor h			;af65	ac 	. 
	ld b,d			;af66	42 	B 
	sub b			;af67	90 	. 
	add hl,sp			;af68	39 	9 
	ld b,b			;af69	40 	@ 
	xor d			;af6a	aa 	. 
	add a,b			;af6b	80 	. 
	add a,d			;af6c	82 	. 
	cp a			;af6d	bf 	. 
	add a,c			;af6e	81 	. 
	add a,b			;af6f	80 	. 
	sub l			;af70	95 	. 
	add hl,sp			;af71	39 	9 
	xor d			;af72	aa 	. 
	cp h			;af73	bc 	. 
	cp h			;af74	bc 	. 
	adc a,a			;af75	8f 	. 
	cp h			;af76	bc 	. 
	cp h			;af77	bc 	. 
	sub l			;af78	95 	. 
	add hl,sp			;af79	39 	9 
	xor d			;af7a	aa 	. 
	sub a			;af7b	97 	. 
	add a,e			;af7c	83 	. 
	add a,e			;af7d	83 	. 
	add a,e			;af7e	83 	. 
	xor e			;af7f	ab 	. 
	sub l			;af80	95 	. 
	add hl,sp			;af81	39 	9 
	xor d			;af82	aa 	. 
	sub l			;af83	95 	. 
	and b			;af84	a0 	. 
	or b			;af85	b0 	. 
	sub b			;af86	90 	. 
	xor d			;af87	aa 	. 
	sub l			;af88	95 	. 
	add hl,sp			;af89	39 	9 
	xor d			;af8a	aa 	. 
	cp l			;af8b	bd 	. 
	cp a			;af8c	bf 	. 
	cp a			;af8d	bf 	. 
	cp a			;af8e	bf 	. 
	cp (hl)			;af8f	be 	. 
	sub l			;af90	95 	. 
	add hl,sp			;af91	39 	9 
	xor d			;af92	aa 	. 
	cp a			;af93	bf 	. 
	cp a			;af94	bf 	. 
	cp a			;af95	bf 	. 
	cp a			;af96	bf 	. 
laf97h:
	cp a			;af97	bf 	. 
	sub l			;af98	95 	. 
	add hl,sp			;af99	39 	9 
	xor d			;af9a	aa 	. 
	cp a			;af9b	bf 	. 
	cp a			;af9c	bf 	. 
	cp a			;af9d	bf 	. 
	cp a			;af9e	bf 	. 
	cp a			;af9f	bf 	. 
	sub l			;afa0	95 	. 
	add hl,sp			;afa1	39 	9 
	xor d			;afa2	aa 	. 
	cp a			;afa3	bf 	. 
	xor a			;afa4	af 	. 
	sbc a,a			;afa5	9f 	. 
	cp a			;afa6	bf 	. 
	sbc a,a			;afa7	9f 	. 
	sub l			;afa8	95 	. 
	add hl,sp			;afa9	39 	9 
	ld d,b			;afaa	50 	P 
	add a,d			;afab	82 	. 
	ld b,b			;afac	40 	@ 
	add a,l			;afad	85 	. 
	ld (hl),h			;afae	74 	t 
	add a,b			;afaf	80 	. 
	ld (hl),b			;afb0	70 	p 
	add a,c			;afb1	81 	. 
	ld (hl),h			;afb2	74 	t 
	add a,b			;afb3	80 	. 
	ld (hl),b			;afb4	70 	p 
	add a,c			;afb5	81 	. 
	ld a,h			;afb6	7c 	| 
	add a,b			;afb7	80 	. 
	nop			;afb8	00 	. 
	ld b,a			;afb9	47 	G 
	add a,b			;afba	80 	. 
	ld b,e			;afbb	43 	C 
	or b			;afbc	b0 	. 
	or b			;afbd	b0 	. 
	or b			;afbe	b0 	. 
	or b			;afbf	b0 	. 
	or b			;afc0	b0 	. 
	ld c,e			;afc1	4b 	K 
	add a,b			;afc2	80 	. 
	add hl,sp			;afc3	39 	9 
	ld b,b			;afc4	40 	@ 
	xor d			;afc5	aa 	. 
	add a,c			;afc6	81 	. 
	adc a,e			;afc7	8b 	. 
	cp a			;afc8	bf 	. 
	add a,a			;afc9	87 	. 
	add a,d			;afca	82 	. 
	sub l			;afcb	95 	. 
	add hl,sp			;afcc	39 	9 
	xor d			;afcd	aa 	. 
	or b			;afce	b0 	. 
	or b			;afcf	b0 	. 
	cp a			;afd0	bf 	. 
	or b			;afd1	b0 	. 
	or b			;afd2	b0 	. 
	sub l			;afd3	95 	. 
	add hl,sp			;afd4	39 	9 
	xor d			;afd5	aa 	. 
	sbc a,a			;afd6	9f 	. 
	adc a,a			;afd7	8f 	. 
	adc a,h			;afd8	8c 	. 
	adc a,a			;afd9	8f 	. 
	xor a			;afda	af 	. 
	sub l			;afdb	95 	. 
	add hl,sp			;afdc	39 	9 
	xor d			;afdd	aa 	. 
	sub l			;afde	95 	. 
	add a,b			;afdf	80 	. 
	add a,b			;afe0	80 	. 
	add a,b			;afe1	80 	. 
	xor d			;afe2	aa 	. 
	sub l			;afe3	95 	. 
	add hl,sp			;afe4	39 	9 
	xor d			;afe5	aa 	. 
	or l			;afe6	b5 	. 
	cp (hl)			;afe7	be 	. 
	cp a			;afe8	bf 	. 
	cp l			;afe9	bd 	. 
	cp d			;afea	ba 	. 
	sub l			;afeb	95 	. 
	add hl,sp			;afec	39 	9 
	xor d			;afed	aa 	. 
	cp a			;afee	bf 	. 
	cp a			;afef	bf 	. 
	cp a			;aff0	bf 	. 
	cp a			;aff1	bf 	. 
	cp a			;aff2	bf 	. 
	sub l			;aff3	95 	. 
	add hl,sp			;aff4	39 	9 
	xor d			;aff5	aa 	. 
	cp a			;aff6	bf 	. 
	cp a			;aff7	bf 	. 
	cp a			;aff8	bf 	. 
	cp a			;aff9	bf 	. 
	cp a			;affa	bf 	. 
	sub l			;affb	95 	. 
	add hl,sp			;affc	39 	9 
	xor d			;affd	aa 	. 
	cp a			;affe	bf 	. 
	cp a			;afff	bf 	. 
	cp a			;b000	bf 	. 
	cp a			;b001	bf 	. 
	cp a			;b002	bf 	. 
	sub l			;b003	95 	. 
	add hl,sp			;b004	39 	9 
	adc a,d			;b005	8a 	. 
	sub a			;b006	97 	. 
	ld d,b			;b007	50 	P 
	add a,d			;b008	82 	. 
	ld b,b			;b009	40 	@ 
	add a,l			;b00a	85 	. 
	ld d,b			;b00b	50 	P 
	add a,e			;b00c	83 	. 
	ld b,b			;b00d	40 	@ 
	add a,l			;b00e	85 	. 
	ld (hl),b			;b00f	70 	p 
	add a,c			;b010	81 	. 
	add hl,sp			;b011	39 	9 
	ld a,l			;b012	7d 	} 
lb013h:
	add a,b			;b013	80 	. 
	ld a,h			;b014	7c 	| 
	add a,b			;b015	80 	. 
	nop			;b016	00 	. 
	ld e,a			;b017	5f 	_ 
	add a,b			;b018	80 	. 
	ld c,a			;b019	4f 	O 
	add a,b			;b01a	80 	. 
	add a,b			;b01b	80 	. 
	add a,b			;b01c	80 	. 
	add a,b			;b01d	80 	. 
	add a,b			;b01e	80 	. 
	ld l,a			;b01f	6f 	o 
	add a,b			;b020	80 	. 
	add hl,sp			;b021	39 	9 
	ld b,b			;b022	40 	@ 
	xor b			;b023	a8 	. 
	add a,a			;b024	87 	. 
	xor a			;b025	af 	. 
	cp a			;b026	bf 	. 
	sbc a,a			;b027	9f 	. 
	adc a,e			;b028	8b 	. 
	sub h			;b029	94 	. 
	add hl,sp			;b02a	39 	9 
	xor d			;b02b	aa 	. 
	add a,b			;b02c	80 	. 
	add a,b			;b02d	80 	. 
	cp a			;b02e	bf 	. 
	add a,b			;b02f	80 	. 
	add a,b			;b030	80 	. 
	sub l			;b031	95 	. 
	add hl,sp			;b032	39 	9 
	xor d			;b033	aa 	. 
	cp a			;b034	bf 	. 
	cp a			;b035	bf 	. 
lb036h:
	or e			;b036	b3 	. 
	cp a			;b037	bf 	. 
	cp a			;b038	bf 	. 
	sub l			;b039	95 	. 
	add hl,sp			;b03a	39 	9 
	xor d			;b03b	aa 	. 
	sub l			;b03c	95 	. 
	add a,b			;b03d	80 	. 
	add a,b			;b03e	80 	. 
	add a,b			;b03f	80 	. 
	xor d			;b040	aa 	. 
	sub l			;b041	95 	. 
	add hl,sp			;b042	39 	9 
	xor d			;b043	aa 	. 
	sub l			;b044	95 	. 
	cp b			;b045	b8 	. 
	cp h			;b046	bc 	. 
	or h			;b047	b4 	. 
	xor d			;b048	aa 	. 
	sub l			;b049	95 	. 
	add hl,sp			;b04a	39 	9 
	xor d			;b04b	aa 	. 
	cp a			;b04c	bf 	. 
	cp a			;b04d	bf 	. 
	cp a			;b04e	bf 	. 
	cp a			;b04f	bf 	. 
	cp a			;b050	bf 	. 
	sub l			;b051	95 	. 
	add hl,sp			;b052	39 	9 
	xor d			;b053	aa 	. 
	cp a			;b054	bf 	. 
	cp a			;b055	bf 	. 
	cp a			;b056	bf 	. 
	cp a			;b057	bf 	. 
	cp a			;b058	bf 	. 
	sub l			;b059	95 	. 
	add hl,sp			;b05a	39 	9 
	xor d			;b05b	aa 	. 
	cp a			;b05c	bf 	. 
	cp a			;b05d	bf 	. 
	cp a			;b05e	bf 	. 
	cp a			;b05f	bf 	. 
	cp a			;b060	bf 	. 
	sub l			;b061	95 	. 
	add hl,sp			;b062	39 	9 
	xor d			;b063	aa 	. 
	sbc a,a			;b064	9f 	. 
	adc a,e			;b065	8b 	. 
	sub a			;b066	97 	. 
	adc a,a			;b067	8f 	. 
	sub a			;b068	97 	. 
	add a,l			;b069	85 	. 
	add hl,sp			;b06a	39 	9 
	ld (hl),h			;b06b	74 	t 
	add a,b			;b06c	80 	. 
	ld (hl),b			;b06d	70 	p 
	add a,c			;b06e	81 	. 
	ld a,l			;b06f	7d 	} 
	add a,b			;b070	80 	. 
	ld a,h			;b071	7c 	| 
	add a,b			;b072	80 	. 
	ld a,l			;b073	7d 	} 
lb074h:
	add a,b			;b074	80 	. 
	ld a,h			;b075	7c 	| 
	add a,b			;b076	80 	. 
	nop			;b077	00 	. 
	ld a,(bc)			;b078	0a 	. 
	adc a,l			;b079	8d 	. 
	or b			;b07a	b0 	. 
	sbc a,c			;b07b	99 	. 
	or b			;b07c	b0 	. 
	and l			;b07d	a5 	. 
	or b			;b07e	b0 	. 
	and l			;b07f	a5 	. 
	or b			;b080	b0 	. 
	or c			;b081	b1 	. 
	or b			;b082	b0 	. 
	cp l			;b083	bd 	. 
	or b			;b084	b0 	. 
	or c			;b085	b1 	. 
	or b			;b086	b0 	. 
	and l			;b087	a5 	. 
	or b			;b088	b0 	. 
	and l			;b089	a5 	. 
	or b			;b08a	b0 	. 
	sbc a,c			;b08b	99 	. 
	or b			;b08c	b0 	. 
	ret			;b08d	c9 	. 
lb08eh:
	or b			;b08e	b0 	. 
	ret			;b08f	c9 	. 
	or b			;b090	b0 	. 
	push af			;b091	f5 	. 
	or b			;b092	b0 	. 
	push af			;b093	f5 	. 
	or b			;b094	b0 	. 
	inc hl			;b095	23 	# 
	or c			;b096	b1 	. 
	inc hl			;b097	23 	# 
	or c			;b098	b1 	. 
	ld d,c			;b099	51 	Q 
	or c			;b09a	b1 	. 
	ld d,c			;b09b	51 	Q 
	or c			;b09c	b1 	. 
	ld a,l			;b09d	7d 	} 
	or c			;b09e	b1 	. 
	ld a,l			;b09f	7d 	} 
sub_b0a0h:
	or c			;b0a0	b1 	. 
	xor e			;b0a1	ab 	. 
	or c			;b0a2	b1 	. 
lb0a3h:
	xor e			;b0a3	ab 	. 
lb0a4h:
	or c			;b0a4	b1 	. 
	exx			;b0a5	d9 	. 
	or c			;b0a6	b1 	. 
	exx			;b0a7	d9 	. 
	or c			;b0a8	b1 	. 
	dec b			;b0a9	05 	. 
	or d			;b0aa	b2 	. 
	dec b			;b0ab	05 	. 
	or d			;b0ac	b2 	. 
	inc sp			;b0ad	33 	3 
	or d			;b0ae	b2 	. 
	inc sp			;b0af	33 	3 
	or d			;b0b0	b2 	. 
	ld h,c			;b0b1	61 	a 
	or d			;b0b2	b2 	. 
	ld h,c			;b0b3	61 	a 
	or d			;b0b4	b2 	. 
	adc a,l			;b0b5	8d 	. 
	or d			;b0b6	b2 	. 
	adc a,l			;b0b7	8d 	. 
	or d			;b0b8	b2 	. 
	cp e			;b0b9	bb 	. 
	or d			;b0ba	b2 	. 
	cp e			;b0bb	bb 	. 
	or d			;b0bc	b2 	. 
	jp (hl)			;b0bd	e9 	. 
	or d			;b0be	b2 	. 
	jp (hl)			;b0bf	e9 	. 
lb0c0h:
	or d			;b0c0	b2 	. 
	dec d			;b0c1	15 	. 
	or e			;b0c2	b3 	. 
lb0c3h:
	dec d			;b0c3	15 	. 
	or e			;b0c4	b3 	. 
	ld b,e			;b0c5	43 	C 
	or e			;b0c6	b3 	. 
	ld b,e			;b0c7	43 	C 
	or e			;b0c8	b3 	. 
	xor b			;b0c9	a8 	. 
	sbc a,h			;b0ca	9c 	. 
	sbc a,h			;b0cb	9c 	. 
	sub h			;b0cc	94 	. 
	inc a			;b0cd	3c 	< 
	xor d			;b0ce	aa 	. 
	sub l			;b0cf	95 	. 
	sub l			;b0d0	95 	. 
	sub l			;b0d1	95 	. 
	inc a			;b0d2	3c 	< 
	xor d			;b0d3	aa 	. 
lb0d4h:
	cp a			;b0d4	bf 	. 
	cp e			;b0d5	bb 	. 
	sub l			;b0d6	95 	. 
	inc a			;b0d7	3c 	< 
	xor d			;b0d8	aa 	. 
	sub l			;b0d9	95 	. 
	sub b			;b0da	90 	. 
	sub l			;b0db	95 	. 
lb0dch:
	inc a			;b0dc	3c 	< 
	xor d			;b0dd	aa 	. 
	cp a			;b0de	bf 	. 
	cp a			;b0df	bf 	. 
	sub l			;b0e0	95 	. 
	inc a			;b0e1	3c 	< 
	xor d			;b0e2	aa 	. 
	cp a			;b0e3	bf 	. 
	cp a			;b0e4	bf 	. 
	sub l			;b0e5	95 	. 
	inc a			;b0e6	3c 	< 
	ld d,b			;b0e7	50 	P 
	add a,d			;b0e8	82 	. 
	ld b,b			;b0e9	40 	@ 
	adc a,a			;b0ea	8f 	. 
	sbc a,a			;b0eb	9f 	. 
	ld h,b			;b0ec	60 	` 
	add a,c			;b0ed	81 	. 
	inc a			;b0ee	3c 	< 
	ld bc,l807dh		;b0ef	01 7d 80 	. } . 
	ld a,h			;b0f2	7c 	| 
	add a,b			;b0f3	80 	. 
	nop			;b0f4	00 	. 
	ld b,e			;b0f5	43 	C 
	and b			;b0f6	a0 	. 
	or b			;b0f7	b0 	. 
	or b			;b0f8	b0 	. 
	sub b			;b0f9	90 	. 
	inc a			;b0fa	3c 	< 
	ld b,b			;b0fb	40 	@ 
	xor d			;b0fc	aa 	. 
	sub l			;b0fd	95 	. 
	sub l			;b0fe	95 	. 
	sub l			;b0ff	95 	. 
	inc a			;b100	3c 	< 
	xor d			;b101	aa 	. 
	cp l			;b102	bd 	. 
	xor l			;b103	ad 	. 
	sub l			;b104	95 	. 
	inc a			;b105	3c 	< 
	xor d			;b106	aa 	. 
	sub a			;b107	97 	. 
	add a,e			;b108	83 	. 
	sub l			;b109	95 	. 
	inc a			;b10a	3c 	< 
	xor d			;b10b	aa 	. 
	cp l			;b10c	bd 	. 
	cp l			;b10d	bd 	. 
	sub l			;b10e	95 	. 
	inc a			;b10f	3c 	< 
	xor d			;b110	aa 	. 
	cp a			;b111	bf 	. 
	cp a			;b112	bf 	. 
	sub l			;b113	95 	. 
	inc a			;b114	3c 	< 
	adc a,d			;b115	8a 	. 
	cp a			;b116	bf 	. 
	cp a			;b117	bf 	. 
	add a,l			;b118	85 	. 
	inc a			;b119	3c 	< 
	ld a,l			;b11a	7d 	} 
	add a,b			;b11b	80 	. 
	ld (hl),h			;b11c	74 	t 
	add a,b			;b11d	80 	. 
	ld (hl),b			;b11e	70 	p 
	add a,c			;b11f	81 	. 
	ld a,(hl)			;b120	7e 	~ 
	add a,b			;b121	80 	. 
	nop			;b122	00 	. 
	ld c,a			;b123	4f 	O 
	add a,b			;b124	80 	. 
	add a,b			;b125	80 	. 
	add a,b			;b126	80 	. 
	add a,b			;b127	80 	. 
	inc a			;b128	3c 	< 
	ld b,b			;b129	40 	@ 
	xor d			;b12a	aa 	. 
	sub a			;b12b	97 	. 
	sub a			;b12c	97 	. 
	sub l			;b12d	95 	. 
	inc a			;b12e	3c 	< 
	xor d			;b12f	aa 	. 
	or l			;b130	b5 	. 
	or l			;b131	b5 	. 
	sub l			;b132	95 	. 
	inc a			;b133	3c 	< 
	xor d			;b134	aa 	. 
	sbc a,a			;b135	9f 	. 
	adc a,(hl)			;b136	8e 	. 
	sub l			;b137	95 	. 
	inc a			;b138	3c 	< 
	xor d			;b139	aa 	. 
	or l			;b13a	b5 	. 
	or h			;b13b	b4 	. 
	sub l			;b13c	95 	. 
	inc a			;b13d	3c 	< 
	xor d			;b13e	aa 	. 
	cp a			;b13f	bf 	. 
	cp a			;b140	bf 	. 
	sub l			;b141	95 	. 
	inc a			;b142	3c 	< 
	xor d			;b143	aa 	. 
	cp a			;b144	bf 	. 
	cp a			;b145	bf 	. 
	sub l			;b146	95 	. 
	inc a			;b147	3c 	< 
	ld (hl),h			;b148	74 	t 
	add a,b			;b149	80 	. 
	ld d,b			;b14a	50 	P 
	add a,e			;b14b	83 	. 
	ld b,b			;b14c	40 	@ 
	add a,a			;b14d	87 	. 
	ld a,b			;b14e	78 	x 
	add a,b			;b14f	80 	. 
	nop			;b150	00 	. 
	xor b			;b151	a8 	. 
	xor h			;b152	ac 	. 
	sbc a,h			;b153	9c 	. 
	sub h			;b154	94 	. 
	inc a			;b155	3c 	< 
	xor d			;b156	aa 	. 
	xor d			;b157	aa 	. 
	sub l			;b158	95 	. 
	sub l			;b159	95 	. 
	inc a			;b15a	3c 	< 
	xor d			;b15b	aa 	. 
	or a			;b15c	b7 	. 
	cp e			;b15d	bb 	. 
	sub l			;b15e	95 	. 
	inc a			;b15f	3c 	< 
	xor d			;b160	aa 	. 
	add a,b			;b161	80 	. 
	add a,b			;b162	80 	. 
	sub l			;b163	95 	. 
	inc a			;b164	3c 	< 
	xor d			;b165	aa 	. 
	cp b			;b166	b8 	. 
	or h			;b167	b4 	. 
	sub l			;b168	95 	. 
	inc a			;b169	3c 	< 
	xor d			;b16a	aa 	. 
	cp a			;b16b	bf 	. 
	cp a			;b16c	bf 	. 
	sub l			;b16d	95 	. 
	inc a			;b16e	3c 	< 
	ld d,b			;b16f	50 	P 
	add a,d			;b170	82 	. 
	ld b,b			;b171	40 	@ 
	adc a,a			;b172	8f 	. 
	sbc a,a			;b173	9f 	. 
	ld h,b			;b174	60 	` 
	add a,c			;b175	81 	. 
	inc a			;b176	3c 	< 
	ld bc,l807dh		;b177	01 7d 80 	. } . 
	ld a,h			;b17a	7c 	| 
	add a,b			;b17b	80 	. 
	nop			;b17c	00 	. 
	ld b,e			;b17d	43 	C 
	and b			;b17e	a0 	. 
	or b			;b17f	b0 	. 
	or b			;b180	b0 	. 
	sub b			;b181	90 	. 
	inc a			;b182	3c 	< 
	ld b,b			;b183	40 	@ 
	xor d			;b184	aa 	. 
	xor d			;b185	aa 	. 
	sub l			;b186	95 	. 
	sub l			;b187	95 	. 
	inc a			;b188	3c 	< 
	xor d			;b189	aa 	. 
	sbc a,(hl)			;b18a	9e 	. 
	xor l			;b18b	ad 	. 
	sub l			;b18c	95 	. 
	inc a			;b18d	3c 	< 
	xor d			;b18e	aa 	. 
	add a,e			;b18f	83 	. 
	add a,e			;b190	83 	. 
	sub l			;b191	95 	. 
	inc a			;b192	3c 	< 
	xor d			;b193	aa 	. 
	and b			;b194	a0 	. 
	sub b			;b195	90 	. 
	sub l			;b196	95 	. 
	inc a			;b197	3c 	< 
	xor d			;b198	aa 	. 
	cp a			;b199	bf 	. 
	cp a			;b19a	bf 	. 
	sub l			;b19b	95 	. 
	inc a			;b19c	3c 	< 
	adc a,d			;b19d	8a 	. 
	cp a			;b19e	bf 	. 
	cp a			;b19f	bf 	. 
	add a,l			;b1a0	85 	. 
	inc a			;b1a1	3c 	< 
	ld a,l			;b1a2	7d 	} 
	add a,b			;b1a3	80 	. 
	ld (hl),h			;b1a4	74 	t 
	add a,b			;b1a5	80 	. 
	ld (hl),b			;b1a6	70 	p 
	add a,c			;b1a7	81 	. 
	ld a,(hl)			;b1a8	7e 	~ 
	add a,b			;b1a9	80 	. 
	nop			;b1aa	00 	. 
	ld c,a			;b1ab	4f 	O 
	add a,b			;b1ac	80 	. 
	add a,b			;b1ad	80 	. 
	add a,b			;b1ae	80 	. 
	add a,b			;b1af	80 	. 
	inc a			;b1b0	3c 	< 
	ld b,b			;b1b1	40 	@ 
	xor d			;b1b2	aa 	. 
	xor e			;b1b3	ab 	. 
	sub a			;b1b4	97 	. 
	sub l			;b1b5	95 	. 
	inc a			;b1b6	3c 	< 
	xor d			;b1b7	aa 	. 
	cp d			;b1b8	ba 	. 
	or l			;b1b9	b5 	. 
	sub l			;b1ba	95 	. 
	inc a			;b1bb	3c 	< 
	xor d			;b1bc	aa 	. 
	adc a,l			;b1bd	8d 	. 
	adc a,(hl)			;b1be	8e 	. 
	sub l			;b1bf	95 	. 
	inc a			;b1c0	3c 	< 
	xor d			;b1c1	aa 	. 
	add a,b			;b1c2	80 	. 
	add a,b			;b1c3	80 	. 
	sub l			;b1c4	95 	. 
	inc a			;b1c5	3c 	< 
	xor d			;b1c6	aa 	. 
	cp (hl)			;b1c7	be 	. 
	cp l			;b1c8	bd 	. 
	sub l			;b1c9	95 	. 
	inc a			;b1ca	3c 	< 
	xor d			;b1cb	aa 	. 
	cp a			;b1cc	bf 	. 
	cp a			;b1cd	bf 	. 
	sub l			;b1ce	95 	. 
	inc a			;b1cf	3c 	< 
	ld (hl),h			;b1d0	74 	t 
	add a,b			;b1d1	80 	. 
	ld d,b			;b1d2	50 	P 
	add a,e			;b1d3	83 	. 
	ld b,b			;b1d4	40 	@ 
	add a,a			;b1d5	87 	. 
	ld a,b			;b1d6	78 	x 
	add a,b			;b1d7	80 	. 
	nop			;b1d8	00 	. 
	xor b			;b1d9	a8 	. 
	xor h			;b1da	ac 	. 
	sbc a,h			;b1db	9c 	. 
	sub h			;b1dc	94 	. 
	inc a			;b1dd	3c 	< 
	xor d			;b1de	aa 	. 
	xor d			;b1df	aa 	. 
	sub l			;b1e0	95 	. 
	sub l			;b1e1	95 	. 
	inc a			;b1e2	3c 	< 
	xor d			;b1e3	aa 	. 
	or a			;b1e4	b7 	. 
	cp e			;b1e5	bb 	. 
	sub l			;b1e6	95 	. 
	inc a			;b1e7	3c 	< 
	xor d			;b1e8	aa 	. 
	add a,b			;b1e9	80 	. 
	add a,b			;b1ea	80 	. 
	sub l			;b1eb	95 	. 
	inc a			;b1ec	3c 	< 
	xor d			;b1ed	aa 	. 
	add a,b			;b1ee	80 	. 
	add a,b			;b1ef	80 	. 
	sub l			;b1f0	95 	. 
	inc a			;b1f1	3c 	< 
	xor d			;b1f2	aa 	. 
	cp (hl)			;b1f3	be 	. 
	cp l			;b1f4	bd 	. 
	sub l			;b1f5	95 	. 
	inc a			;b1f6	3c 	< 
	ld d,b			;b1f7	50 	P 
	add a,d			;b1f8	82 	. 
	ld b,b			;b1f9	40 	@ 
	adc a,a			;b1fa	8f 	. 
	sbc a,a			;b1fb	9f 	. 
	ld h,b			;b1fc	60 	` 
	add a,c			;b1fd	81 	. 
	inc a			;b1fe	3c 	< 
	ld bc,l807dh		;b1ff	01 7d 80 	. } . 
	ld a,h			;b202	7c 	| 
	add a,b			;b203	80 	. 
	nop			;b204	00 	. 
	ld b,e			;b205	43 	C 
	and b			;b206	a0 	. 
	or b			;b207	b0 	. 
	or b			;b208	b0 	. 
	sub b			;b209	90 	. 
	inc a			;b20a	3c 	< 
	ld b,b			;b20b	40 	@ 
	xor d			;b20c	aa 	. 
	xor d			;b20d	aa 	. 
	sub l			;b20e	95 	. 
	sub l			;b20f	95 	. 
	inc a			;b210	3c 	< 
	xor d			;b211	aa 	. 
	sbc a,(hl)			;b212	9e 	. 
	xor l			;b213	ad 	. 
	sub l			;b214	95 	. 
	inc a			;b215	3c 	< 
	xor d			;b216	aa 	. 
	add a,e			;b217	83 	. 
	add a,e			;b218	83 	. 
	sub l			;b219	95 	. 
	inc a			;b21a	3c 	< 
	xor d			;b21b	aa 	. 
	add a,b			;b21c	80 	. 
	add a,b			;b21d	80 	. 
	sub l			;b21e	95 	. 
	inc a			;b21f	3c 	< 
	xor d			;b220	aa 	. 
	cp b			;b221	b8 	. 
	or h			;b222	b4 	. 
	sub l			;b223	95 	. 
	inc a			;b224	3c 	< 
	adc a,d			;b225	8a 	. 
	cp a			;b226	bf 	. 
	cp a			;b227	bf 	. 
	add a,l			;b228	85 	. 
	inc a			;b229	3c 	< 
	ld a,l			;b22a	7d 	} 
	add a,b			;b22b	80 	. 
	ld (hl),h			;b22c	74 	t 
	add a,b			;b22d	80 	. 
	ld (hl),b			;b22e	70 	p 
	add a,c			;b22f	81 	. 
	ld a,(hl)			;b230	7e 	~ 
	add a,b			;b231	80 	. 
	nop			;b232	00 	. 
	ld c,a			;b233	4f 	O 
	add a,b			;b234	80 	. 
	add a,b			;b235	80 	. 
	add a,b			;b236	80 	. 
	add a,b			;b237	80 	. 
	inc a			;b238	3c 	< 
	ld b,b			;b239	40 	@ 
	xor d			;b23a	aa 	. 
	xor e			;b23b	ab 	. 
	sub a			;b23c	97 	. 
	sub l			;b23d	95 	. 
	inc a			;b23e	3c 	< 
	xor d			;b23f	aa 	. 
	cp d			;b240	ba 	. 
	or l			;b241	b5 	. 
	sub l			;b242	95 	. 
	inc a			;b243	3c 	< 
	xor d			;b244	aa 	. 
	adc a,l			;b245	8d 	. 
	adc a,(hl)			;b246	8e 	. 
	sub l			;b247	95 	. 
	inc a			;b248	3c 	< 
	xor d			;b249	aa 	. 
	add a,b			;b24a	80 	. 
	add a,b			;b24b	80 	. 
	sub l			;b24c	95 	. 
	inc a			;b24d	3c 	< 
	xor d			;b24e	aa 	. 
	and b			;b24f	a0 	. 
	sub b			;b250	90 	. 
	sub l			;b251	95 	. 
	inc a			;b252	3c 	< 
	xor d			;b253	aa 	. 
	cp a			;b254	bf 	. 
	cp a			;b255	bf 	. 
	sub l			;b256	95 	. 
	inc a			;b257	3c 	< 
	ld (hl),h			;b258	74 	t 
	add a,b			;b259	80 	. 
	ld d,b			;b25a	50 	P 
	add a,e			;b25b	83 	. 
	ld b,b			;b25c	40 	@ 
	add a,a			;b25d	87 	. 
	ld a,b			;b25e	78 	x 
	add a,b			;b25f	80 	. 
	nop			;b260	00 	. 
	xor b			;b261	a8 	. 
	xor h			;b262	ac 	. 
	xor h			;b263	ac 	. 
	sub h			;b264	94 	. 
	inc a			;b265	3c 	< 
	xor d			;b266	aa 	. 
	xor d			;b267	aa 	. 
	xor d			;b268	aa 	. 
	sub l			;b269	95 	. 
	inc a			;b26a	3c 	< 
	xor d			;b26b	aa 	. 
	or a			;b26c	b7 	. 
	cp a			;b26d	bf 	. 
	sub l			;b26e	95 	. 
	inc a			;b26f	3c 	< 
	xor d			;b270	aa 	. 
	add a,b			;b271	80 	. 
	xor d			;b272	aa 	. 
	sub l			;b273	95 	. 
	inc a			;b274	3c 	< 
	xor d			;b275	aa 	. 
	cp b			;b276	b8 	. 
	cp d			;b277	ba 	. 
	sub l			;b278	95 	. 
	inc a			;b279	3c 	< 
	xor d			;b27a	aa 	. 
	cp a			;b27b	bf 	. 
	cp a			;b27c	bf 	. 
	sub l			;b27d	95 	. 
	inc a			;b27e	3c 	< 
	ld d,b			;b27f	50 	P 
	add a,d			;b280	82 	. 
	ld b,b			;b281	40 	@ 
	xor a			;b282	af 	. 
	adc a,a			;b283	8f 	. 
	ld h,b			;b284	60 	` 
	add a,c			;b285	81 	. 
	inc a			;b286	3c 	< 
	ld bc,l807ch		;b287	01 7c 80 	. | . 
	ld a,(hl)			;b28a	7e 	~ 
	add a,b			;b28b	80 	. 
	nop			;b28c	00 	. 
	ld b,e			;b28d	43 	C 
	and b			;b28e	a0 	. 
	or b			;b28f	b0 	. 
	or b			;b290	b0 	. 
	sub b			;b291	90 	. 
	inc a			;b292	3c 	< 
	ld b,b			;b293	40 	@ 
	xor d			;b294	aa 	. 
	xor d			;b295	aa 	. 
	xor d			;b296	aa 	. 
	sub l			;b297	95 	. 
	inc a			;b298	3c 	< 
	xor d			;b299	aa 	. 
	sbc a,(hl)			;b29a	9e 	. 
	cp (hl)			;b29b	be 	. 
	sub l			;b29c	95 	. 
	inc a			;b29d	3c 	< 
	xor d			;b29e	aa 	. 
	add a,e			;b29f	83 	. 
	xor e			;b2a0	ab 	. 
	sub l			;b2a1	95 	. 
	inc a			;b2a2	3c 	< 
	xor d			;b2a3	aa 	. 
	and b			;b2a4	a0 	. 
	xor d			;b2a5	aa 	. 
	sub l			;b2a6	95 	. 
	inc a			;b2a7	3c 	< 
	xor d			;b2a8	aa 	. 
	cp a			;b2a9	bf 	. 
	cp a			;b2aa	bf 	. 
	sub l			;b2ab	95 	. 
	inc a			;b2ac	3c 	< 
	adc a,d			;b2ad	8a 	. 
	cp a			;b2ae	bf 	. 
	cp a			;b2af	bf 	. 
	add a,l			;b2b0	85 	. 
	inc a			;b2b1	3c 	< 
	ld a,l			;b2b2	7d 	} 
	add a,b			;b2b3	80 	. 
	ld (hl),b			;b2b4	70 	p 
	add a,d			;b2b5	82 	. 
	ld a,b			;b2b6	78 	x 
	add a,b			;b2b7	80 	. 
	ld a,(hl)			;b2b8	7e 	~ 
	add a,b			;b2b9	80 	. 
	nop			;b2ba	00 	. 
	ld c,a			;b2bb	4f 	O 
	add a,b			;b2bc	80 	. 
	add a,b			;b2bd	80 	. 
	add a,b			;b2be	80 	. 
	add a,b			;b2bf	80 	. 
	inc a			;b2c0	3c 	< 
	ld b,b			;b2c1	40 	@ 
	xor d			;b2c2	aa 	. 
	xor e			;b2c3	ab 	. 
	xor e			;b2c4	ab 	. 
	sub l			;b2c5	95 	. 
	inc a			;b2c6	3c 	< 
	xor d			;b2c7	aa 	. 
	cp d			;b2c8	ba 	. 
	cp d			;b2c9	ba 	. 
	sub l			;b2ca	95 	. 
	inc a			;b2cb	3c 	< 
	xor d			;b2cc	aa 	. 
	adc a,l			;b2cd	8d 	. 
	xor a			;b2ce	af 	. 
	sub l			;b2cf	95 	. 
	inc a			;b2d0	3c 	< 
	xor d			;b2d1	aa 	. 
	add a,b			;b2d2	80 	. 
	xor d			;b2d3	aa 	. 
	sub l			;b2d4	95 	. 
	inc a			;b2d5	3c 	< 
	xor d			;b2d6	aa 	. 
lb2d7h:
	cp (hl)			;b2d7	be 	. 
	cp (hl)			;b2d8	be 	. 
	sub l			;b2d9	95 	. 
	inc a			;b2da	3c 	< 
	xor d			;b2db	aa 	. 
	cp a			;b2dc	bf 	. 
	cp a			;b2dd	bf 	. 
	sub l			;b2de	95 	. 
	inc a			;b2df	3c 	< 
	ld (hl),h			;b2e0	74 	t 
	add a,b			;b2e1	80 	. 
	ld b,b			;b2e2	40 	@ 
	adc a,e			;b2e3	8b 	. 
	ld h,b			;b2e4	60 	` 
	add a,e			;b2e5	83 	. 
	ld a,b			;b2e6	78 	x 
	add a,b			;b2e7	80 	. 
	nop			;b2e8	00 	. 
	xor b			;b2e9	a8 	. 
	xor h			;b2ea	ac 	. 
	xor h			;b2eb	ac 	. 
	sub h			;b2ec	94 	. 
	inc a			;b2ed	3c 	< 
	xor d			;b2ee	aa 	. 
	xor d			;b2ef	aa 	. 
	xor d			;b2f0	aa 	. 
	sub l			;b2f1	95 	. 
	inc a			;b2f2	3c 	< 
	xor d			;b2f3	aa 	. 
	or a			;b2f4	b7 	. 
	cp a			;b2f5	bf 	. 
	sub l			;b2f6	95 	. 
	inc a			;b2f7	3c 	< 
	xor d			;b2f8	aa 	. 
	and b			;b2f9	a0 	. 
	xor d			;b2fa	aa 	. 
	sub l			;b2fb	95 	. 
	inc a			;b2fc	3c 	< 
	xor d			;b2fd	aa 	. 
	cp a			;b2fe	bf 	. 
	cp a			;b2ff	bf 	. 
	sub l			;b300	95 	. 
	inc a			;b301	3c 	< 
	xor d			;b302	aa 	. 
	cp a			;b303	bf 	. 
	cp a			;b304	bf 	. 
	sub l			;b305	95 	. 
	inc a			;b306	3c 	< 
	ld d,b			;b307	50 	P 
	add a,d			;b308	82 	. 
	ld b,b			;b309	40 	@ 
	xor a			;b30a	af 	. 
	adc a,a			;b30b	8f 	. 
	ld h,b			;b30c	60 	` 
	add a,c			;b30d	81 	. 
	inc a			;b30e	3c 	< 
	ld bc,l807ch		;b30f	01 7c 80 	. | . 
lb312h:
	ld a,(hl)			;b312	7e 	~ 
	add a,b			;b313	80 	. 
	nop			;b314	00 	. 
	ld b,e			;b315	43 	C 
	and b			;b316	a0 	. 
	or b			;b317	b0 	. 
	or b			;b318	b0 	. 
	sub b			;b319	90 	. 
	inc a			;b31a	3c 	< 
	ld b,b			;b31b	40 	@ 
	xor d			;b31c	aa 	. 
	xor d			;b31d	aa 	. 
	xor d			;b31e	aa 	. 
	sub l			;b31f	95 	. 
	inc a			;b320	3c 	< 
	xor d			;b321	aa 	. 
	sbc a,(hl)			;b322	9e 	. 
	cp (hl)			;b323	be 	. 
	sub l			;b324	95 	. 
	inc a			;b325	3c 	< 
	xor d			;b326	aa 	. 
	add a,e			;b327	83 	. 
	xor e			;b328	ab 	. 
	sub l			;b329	95 	. 
	inc a			;b32a	3c 	< 
	xor d			;b32b	aa 	. 
	cp (hl)			;b32c	be 	. 
	cp (hl)			;b32d	be 	. 
	sub l			;b32e	95 	. 
	inc a			;b32f	3c 	< 
	xor d			;b330	aa 	. 
	cp a			;b331	bf 	. 
	cp a			;b332	bf 	. 
	sub l			;b333	95 	. 
	inc a			;b334	3c 	< 
	adc a,d			;b335	8a 	. 
	cp a			;b336	bf 	. 
	cp a			;b337	bf 	. 
	add a,l			;b338	85 	. 
	inc a			;b339	3c 	< 
	ld a,l			;b33a	7d 	} 
	add a,b			;b33b	80 	. 
	ld (hl),b			;b33c	70 	p 
	add a,d			;b33d	82 	. 
	ld a,b			;b33e	78 	x 
	add a,b			;b33f	80 	. 
	ld a,(hl)			;b340	7e 	~ 
	add a,b			;b341	80 	. 
	nop			;b342	00 	. 
	ld c,a			;b343	4f 	O 
	add a,b			;b344	80 	. 
	add a,b			;b345	80 	. 
	add a,b			;b346	80 	. 
	add a,b			;b347	80 	. 
	inc a			;b348	3c 	< 
	ld b,b			;b349	40 	@ 
	xor d			;b34a	aa 	. 
	xor e			;b34b	ab 	. 
	xor e			;b34c	ab 	. 
	sub l			;b34d	95 	. 
	inc a			;b34e	3c 	< 
	xor d			;b34f	aa 	. 
	cp d			;b350	ba 	. 
	cp d			;b351	ba 	. 
	sub l			;b352	95 	. 
	inc a			;b353	3c 	< 
	xor d			;b354	aa 	. 
	adc a,l			;b355	8d 	. 
	xor a			;b356	af 	. 
	sub l			;b357	95 	. 
	inc a			;b358	3c 	< 
	xor d			;b359	aa 	. 
	cp b			;b35a	b8 	. 
	cp d			;b35b	ba 	. 
	sub l			;b35c	95 	. 
	inc a			;b35d	3c 	< 
	xor d			;b35e	aa 	. 
	cp a			;b35f	bf 	. 
	cp a			;b360	bf 	. 
	sub l			;b361	95 	. 
	inc a			;b362	3c 	< 
	xor d			;b363	aa 	. 
	cp a			;b364	bf 	. 
	cp a			;b365	bf 	. 
	sub l			;b366	95 	. 
	inc a			;b367	3c 	< 
	ld (hl),h			;b368	74 	t 
	add a,b			;b369	80 	. 
	ld b,b			;b36a	40 	@ 
	adc a,e			;b36b	8b 	. 
	ld h,b			;b36c	60 	` 
	add a,e			;b36d	83 	. 
	ld a,b			;b36e	78 	x 
	add a,b			;b36f	80 	. 
	nop			;b370	00 	. 
	ld bc,lb374h		;b371	01 74 b3 	. t . 
lb374h:
	add a,b			;b374	80 	. 
	or e			;b375	b3 	. 
	add a,b			;b376	80 	. 
	or e			;b377	b3 	. 
	ret z			;b378	c8 	. 
	or e			;b379	b3 	. 
	ret z			;b37a	c8 	. 
	or e			;b37b	b3 	. 
	inc e			;b37c	1c 	. 
	or h			;b37d	b4 	. 
	inc e			;b37e	1c 	. 
	or h			;b37f	b4 	. 
	xor b			;b380	a8 	. 
	ld b,d			;b381	42 	B 
	sub b			;b382	90 	. 
	ld l,a			;b383	6f 	o 
	add a,b			;b384	80 	. 
	ld d,l			;b385	55 	U 
	add a,b			;b386	80 	. 
	ld b,b			;b387	40 	@ 
	sbc a,h			;b388	9c 	. 
	sbc a,h			;b389	9c 	. 
	sub h			;b38a	94 	. 
	ld a,a			;b38b	7f 	 
	add a,b			;b38c	80 	. 
	ld b,a			;b38d	47 	G 
	add a,b			;b38e	80 	. 
	ld b,b			;b38f	40 	@ 
	cp b			;b390	b8 	. 
	ld l,d			;b391	6a 	j 
	add a,b			;b392	80 	. 
	dec (hl)			;b393	35 	5 
lb394h:
	ld d,b			;b394	50 	P 
	add a,d			;b395	82 	. 
	ld b,b			;b396	40 	@ 
	xor a			;b397	af 	. 
	cp h			;b398	bc 	. 
	cp h			;b399	bc 	. 
	cp a			;b39a	bf 	. 
	cp e			;b39b	bb 	. 
	cp l			;b39c	bd 	. 
	cp h			;b39d	bc 	. 
	cp (hl)			;b39e	be 	. 
	add a,a			;b39f	87 	. 
	ld a,d			;b3a0	7a 	z 
	add a,b			;b3a1	80 	. 
	dec (hl)			;b3a2	35 	5 
	ld bc,l8074h		;b3a3	01 74 80 	. t . 
	ld b,b			;b3a6	40 	@ 
	adc a,e			;b3a7	8b 	. 
	cp a			;b3a8	bf 	. 
	cp a			;b3a9	bf 	. 
lb3aah:
	cp a			;b3aa	bf 	. 
	cp a			;b3ab	bf 	. 
	sbc a,a			;b3ac	9f 	. 
	ld h,b			;b3ad	60 	` 
	add a,c			;b3ae	81 	. 
	ld a,(hl)			;b3af	7e 	~ 
	add a,b			;b3b0	80 	. 
	ld (hl),002h		;b3b1	36 02 	6 . 
	ld (hl),l			;b3b3	75 	u 
	add a,b			;b3b4	80 	. 
	ld b,b			;b3b5	40 	@ 
	xor e			;b3b6	ab 	. 
lb3b7h:
	cp a			;b3b7	bf 	. 
	cp a			;b3b8	bf 	. 
	cp a			;b3b9	bf 	. 
	ld h,b			;b3ba	60 	` 
	add a,c			;b3bb	81 	. 
	jr c,lb3c1h		;b3bc	38 03 	8 . 
	ld (hl),h			;b3be	74 	t 
	add a,b			;b3bf	80 	. 
	ld b,b			;b3c0	40 	@ 
lb3c1h:
	adc a,e			;b3c1	8b 	. 
	adc a,e			;b3c2	8b 	. 
	ld h,b			;b3c3	60 	` 
	add a,c			;b3c4	81 	. 
	ld a,(hl)			;b3c5	7e 	~ 
	add a,b			;b3c6	80 	. 
	nop			;b3c7	00 	. 
	ld b,e			;b3c8	43 	C 
	and b			;b3c9	a0 	. 
	ld c,e			;b3ca	4b 	K 
	add a,b			;b3cb	80 	. 
	ld a,a			;b3cc	7f 	 
	add a,b			;b3cd	80 	. 
	ld d,a			;b3ce	57 	W 
	add a,b			;b3cf	80 	. 
	ld b,e			;b3d0	43 	C 
	or b			;b3d1	b0 	. 
	or b			;b3d2	b0 	. 
	sub b			;b3d3	90 	. 
	ld a,a			;b3d4	7f 	 
	add a,b			;b3d5	80 	. 
	ld e,a			;b3d6	5f 	_ 
	add a,b			;b3d7	80 	. 
	ld b,e			;b3d8	43 	C 
	and b			;b3d9	a0 	. 
	ld l,e			;b3da	6b 	k 
	add a,b			;b3db	80 	. 
	dec (hl)			;b3dc	35 	5 
	ld b,b			;b3dd	40 	@ 
	adc a,d			;b3de	8a 	. 
	cp l			;b3df	bd 	. 
	ld b,d			;b3e0	42 	B 
	or b			;b3e1	b0 	. 
	ld b,c			;b3e2	41 	A 
	or b			;b3e3	b0 	. 
	ld b,b			;b3e4	40 	@ 
	cp l			;b3e5	bd 	. 
	xor l			;b3e6	ad 	. 
	or l			;b3e7	b5 	. 
	ld b,e			;b3e8	43 	C 
	or b			;b3e9	b0 	. 
	ld b,b			;b3ea	40 	@ 
	cp b			;b3eb	b8 	. 
	sbc a,a			;b3ec	9f 	. 
	ld l,d			;b3ed	6a 	j 
	add a,b			;b3ee	80 	. 
	dec (hl)			;b3ef	35 	5 
	ld a,l			;b3f0	7d 	} 
	add a,b			;b3f1	80 	. 
	ld d,b			;b3f2	50 	P 
	add a,d			;b3f3	82 	. 
	ld b,b			;b3f4	40 	@ 
	xor a			;b3f5	af 	. 
	cp a			;b3f6	bf 	. 
	cp a			;b3f7	bf 	. 
	cp a			;b3f8	bf 	. 
	cp a			;b3f9	bf 	. 
	cp a			;b3fa	bf 	. 
	add a,a			;b3fb	87 	. 
	ld a,b			;b3fc	78 	x 
	add a,b			;b3fd	80 	. 
	ld (hl),002h		;b3fe	36 02 	6 . 
	ld d,h			;b400	54 	T 
	add a,b			;b401	80 	. 
	ld b,b			;b402	40 	@ 
	xor a			;b403	af 	. 
	cp a			;b404	bf 	. 
	cp a			;b405	bf 	. 
	cp a			;b406	bf 	. 
	add a,l			;b407	85 	. 
	ld a,(hl)			;b408	7e 	~ 
	add a,b			;b409	80 	. 
	scf			;b40a	37 	7 
	inc bc			;b40b	03 	. 
	ld d,b			;b40c	50 	P 
	add a,d			;b40d	82 	. 
	ld b,b			;b40e	40 	@ 
	xor a			;b40f	af 	. 
	xor a			;b410	af 	. 
	add a,a			;b411	87 	. 
	ld a,d			;b412	7a 	z 
	add a,b			;b413	80 	. 
	jr c,lb41ah		;b414	38 04 	8 . 
	ld a,h			;b416	7c 	| 
	add a,b			;b417	80 	. 
	add a,b			;b418	80 	. 
	ld a,(hl)			;b419	7e 	~ 
lb41ah:
	add a,b			;b41a	80 	. 
	nop			;b41b	00 	. 
	ld c,a			;b41c	4f 	O 
	add a,b			;b41d	80 	. 
	ld l,a			;b41e	6f 	o 
	add a,b			;b41f	80 	. 
	ld a,a			;b420	7f 	 
	add a,b			;b421	80 	. 
	ld e,a			;b422	5f 	_ 
	add a,b			;b423	80 	. 
	ld c,a			;b424	4f 	O 
	add a,b			;b425	80 	. 
	add a,b			;b426	80 	. 
	add a,b			;b427	80 	. 
	ld a,a			;b428	7f 	 
	add a,b			;b429	80 	. 
	add a,b			;b42a	80 	. 
	ld c,a			;b42b	4f 	O 
	add a,b			;b42c	80 	. 
	ld l,a			;b42d	6f 	o 
	add a,b			;b42e	80 	. 
	dec (hl)			;b42f	35 	5 
	ld b,b			;b430	40 	@ 
	xor d			;b431	aa 	. 
	or h			;b432	b4 	. 
	ld c,e			;b433	4b 	K 
	add a,b			;b434	80 	. 
	ld b,l			;b435	45 	E 
	add a,b			;b436	80 	. 
	ld b,b			;b437	40 	@ 
	or a			;b438	b7 	. 
	or a			;b439	b7 	. 
	sub l			;b43a	95 	. 
	ld c,a			;b43b	4f 	O 
	add a,b			;b43c	80 	. 
	ld b,c			;b43d	41 	A 
	and b			;b43e	a0 	. 
	ld b,b			;b43f	40 	@ 
	cp (hl)			;b440	be 	. 
	ld l,d			;b441	6a 	j 
	add a,b			;b442	80 	. 
	dec (hl)			;b443	35 	5 
	ld (hl),h			;b444	74 	t 
	add a,b			;b445	80 	. 
	ld b,b			;b446	40 	@ 
	adc a,e			;b447	8b 	. 
	cp a			;b448	bf 	. 
	cp a			;b449	bf 	. 
	cp a			;b44a	bf 	. 
	cp (hl)			;b44b	be 	. 
	cp a			;b44c	bf 	. 
	cp a			;b44d	bf 	. 
	sbc a,a			;b44e	9f 	. 
	ld h,b			;b44f	60 	` 
	add a,c			;b450	81 	. 
	ld a,(hl)			;b451	7e 	~ 
	add a,b			;b452	80 	. 
	dec (hl)			;b453	35 	5 
	ld bc,l807dh		;b454	01 7d 80 	. } . 
	ld d,b			;b457	50 	P 
	add a,d			;b458	82 	. 
	ld b,b			;b459	40 	@ 
	cp a			;b45a	bf 	. 
	cp a			;b45b	bf 	. 
	cp a			;b45c	bf 	. 
	cp a			;b45d	bf 	. 
	sub a			;b45e	97 	. 
	ld a,b			;b45f	78 	x 
	add a,b			;b460	80 	. 
	scf			;b461	37 	7 
	ld (bc),a			;b462	02 	. 
	ld a,l			;b463	7d 	} 
	add a,b			;b464	80 	. 
	ld b,b			;b465	40 	@ 
	adc a,d			;b466	8a 	. 
	cp a			;b467	bf 	. 
	cp a			;b468	bf 	. 
	sbc a,a			;b469	9f 	. 
	ld l,b			;b46a	68 	h 
	add a,b			;b46b	80 	. 
	jr c,lb471h		;b46c	38 03 	8 . 
	ld a,l			;b46e	7d 	} 
	add a,b			;b46f	80 	. 
	ld (hl),b			;b470	70 	p 
lb471h:
	add a,d			;b471	82 	. 
	add a,d			;b472	82 	. 
	ld a,b			;b473	78 	x 
	add a,b			;b474	80 	. 
	nop			;b475	00 	. 
	ld a,(bc)			;b476	0a 	. 
	adc a,e			;b477	8b 	. 
	or h			;b478	b4 	. 
	adc a,e			;b479	8b 	. 
	or h			;b47a	b4 	. 
	adc a,e			;b47b	8b 	. 
	or h			;b47c	b4 	. 
	sub a			;b47d	97 	. 
	or h			;b47e	b4 	. 
	and e			;b47f	a3 	. 
	or h			;b480	b4 	. 
	xor a			;b481	af 	. 
	or h			;b482	b4 	. 
	xor a			;b483	af 	. 
	or h			;b484	b4 	. 
	xor a			;b485	af 	. 
	or h			;b486	b4 	. 
	and e			;b487	a3 	. 
	or h			;b488	b4 	. 
	sub a			;b489	97 	. 
	or h			;b48a	b4 	. 
	cp e			;b48b	bb 	. 
	or h			;b48c	b4 	. 
	cp e			;b48d	bb 	. 
	or h			;b48e	b4 	. 
	ex de,hl			;b48f	eb 	. 
	or h			;b490	b4 	. 
	ex de,hl			;b491	eb 	. 
	or h			;b492	b4 	. 
	inc e			;b493	1c 	. 
	or l			;b494	b5 	. 
	inc e			;b495	1c 	. 
	or l			;b496	b5 	. 
	ld c,a			;b497	4f 	O 
	or l			;b498	b5 	. 
	ld c,a			;b499	4f 	O 
	or l			;b49a	b5 	. 
	ld a,a			;b49b	7f 	 
	or l			;b49c	b5 	. 
	ld a,a			;b49d	7f 	 
	or l			;b49e	b5 	. 
	or b			;b49f	b0 	. 
	or l			;b4a0	b5 	. 
	or b			;b4a1	b0 	. 
	or l			;b4a2	b5 	. 
	ex (sp),hl			;b4a3	e3 	. 
	or l			;b4a4	b5 	. 
	ex (sp),hl			;b4a5	e3 	. 
	or l			;b4a6	b5 	. 
	inc de			;b4a7	13 	. 
	or (hl)			;b4a8	b6 	. 
	inc de			;b4a9	13 	. 
	or (hl)			;b4aa	b6 	. 
	ld b,h			;b4ab	44 	D 
	or (hl)			;b4ac	b6 	. 
	ld b,h			;b4ad	44 	D 
	or (hl)			;b4ae	b6 	. 
	ld (hl),a			;b4af	77 	w 
	or (hl)			;b4b0	b6 	. 
	ld (hl),a			;b4b1	77 	w 
	or (hl)			;b4b2	b6 	. 
	and a			;b4b3	a7 	. 
	or (hl)			;b4b4	b6 	. 
	and a			;b4b5	a7 	. 
	or (hl)			;b4b6	b6 	. 
	ret c			;b4b7	d8 	. 
	or (hl)			;b4b8	b6 	. 
	ret c			;b4b9	d8 	. 
	or (hl)			;b4ba	b6 	. 
	xor b			;b4bb	a8 	. 
	xor h			;b4bc	ac 	. 
	xor h			;b4bd	ac 	. 
	ld l,d			;b4be	6a 	j 
	add a,b			;b4bf	80 	. 
	inc a			;b4c0	3c 	< 
	ld b,b			;b4c1	40 	@ 
	xor d			;b4c2	aa 	. 
	cp d			;b4c3	ba 	. 
	cp d			;b4c4	ba 	. 
	ld l,d			;b4c5	6a 	j 
	add a,b			;b4c6	80 	. 
	inc a			;b4c7	3c 	< 
	ld b,b			;b4c8	40 	@ 
	xor d			;b4c9	aa 	. 
	cp l			;b4ca	bd 	. 
	cp a			;b4cb	bf 	. 
	ld l,d			;b4cc	6a 	j 
	add a,b			;b4cd	80 	. 
	inc a			;b4ce	3c 	< 
	ld b,b			;b4cf	40 	@ 
	xor d			;b4d0	aa 	. 
	cp b			;b4d1	b8 	. 
	cp d			;b4d2	ba 	. 
	ld l,d			;b4d3	6a 	j 
	add a,b			;b4d4	80 	. 
	inc a			;b4d5	3c 	< 
	ld b,b			;b4d6	40 	@ 
	xor d			;b4d7	aa 	. 
	cp a			;b4d8	bf 	. 
	cp a			;b4d9	bf 	. 
	ld l,d			;b4da	6a 	j 
	add a,b			;b4db	80 	. 
	inc a			;b4dc	3c 	< 
	ld d,b			;b4dd	50 	P 
	add a,d			;b4de	82 	. 
	ld b,b			;b4df	40 	@ 
	xor a			;b4e0	af 	. 
	add a,a			;b4e1	87 	. 
	ld a,d			;b4e2	7a 	z 
	add a,b			;b4e3	80 	. 
	inc a			;b4e4	3c 	< 
	ld bc,l807ch		;b4e5	01 7c 80 	. | . 
	ld a,(hl)			;b4e8	7e 	~ 
	add a,b			;b4e9	80 	. 
	nop			;b4ea	00 	. 
	ld b,e			;b4eb	43 	C 
	and b			;b4ec	a0 	. 
	or b			;b4ed	b0 	. 
	or b			;b4ee	b0 	. 
	ld l,e			;b4ef	6b 	k 
	add a,b			;b4f0	80 	. 
	inc a			;b4f1	3c 	< 
	ld b,b			;b4f2	40 	@ 
	xor d			;b4f3	aa 	. 
	xor d			;b4f4	aa 	. 
	xor d			;b4f5	aa 	. 
	ld l,d			;b4f6	6a 	j 
	add a,b			;b4f7	80 	. 
	inc a			;b4f8	3c 	< 
	ld b,b			;b4f9	40 	@ 
	xor d			;b4fa	aa 	. 
	or a			;b4fb	b7 	. 
	cp a			;b4fc	bf 	. 
	ld l,d			;b4fd	6a 	j 
	add a,b			;b4fe	80 	. 
	inc a			;b4ff	3c 	< 
	ld b,b			;b500	40 	@ 
	xor d			;b501	aa 	. 
	and e			;b502	a3 	. 
	xor e			;b503	ab 	. 
	ld l,d			;b504	6a 	j 
	add a,b			;b505	80 	. 
	inc a			;b506	3c 	< 
	ld b,b			;b507	40 	@ 
	xor d			;b508	aa 	. 
	cp a			;b509	bf 	. 
	cp a			;b50a	bf 	. 
	ld l,d			;b50b	6a 	j 
	add a,b			;b50c	80 	. 
	inc a			;b50d	3c 	< 
	ld b,b			;b50e	40 	@ 
	adc a,d			;b50f	8a 	. 
	cp a			;b510	bf 	. 
	sbc a,a			;b511	9f 	. 
	ld l,d			;b512	6a 	j 
	add a,b			;b513	80 	. 
	inc a			;b514	3c 	< 
	ld a,l			;b515	7d 	} 
	add a,b			;b516	80 	. 
	ld (hl),b			;b517	70 	p 
	add a,d			;b518	82 	. 
	ld a,b			;b519	78 	x 
	add a,b			;b51a	80 	. 
	nop			;b51b	00 	. 
	ld c,a			;b51c	4f 	O 
	add a,b			;b51d	80 	. 
	add a,b			;b51e	80 	. 
	add a,b			;b51f	80 	. 
	ld l,a			;b520	6f 	o 
	add a,b			;b521	80 	. 
	inc a			;b522	3c 	< 
	ld b,b			;b523	40 	@ 
	xor d			;b524	aa 	. 
	xor e			;b525	ab 	. 
	xor e			;b526	ab 	. 
	ld l,d			;b527	6a 	j 
	add a,b			;b528	80 	. 
	inc a			;b529	3c 	< 
	ld b,b			;b52a	40 	@ 
	xor d			;b52b	aa 	. 
	sbc a,(hl)			;b52c	9e 	. 
	cp (hl)			;b52d	be 	. 
	ld l,d			;b52e	6a 	j 
	add a,b			;b52f	80 	. 
	inc a			;b530	3c 	< 
	ld b,b			;b531	40 	@ 
	xor d			;b532	aa 	. 
	adc a,a			;b533	8f 	. 
	xor a			;b534	af 	. 
	ld l,d			;b535	6a 	j 
	add a,b			;b536	80 	. 
	inc a			;b537	3c 	< 
	ld b,b			;b538	40 	@ 
	xor d			;b539	aa 	. 
	cp (hl)			;b53a	be 	. 
	cp (hl)			;b53b	be 	. 
	ld l,d			;b53c	6a 	j 
	add a,b			;b53d	80 	. 
	inc a			;b53e	3c 	< 
	ld b,b			;b53f	40 	@ 
	xor d			;b540	aa 	. 
	cp a			;b541	bf 	. 
	cp a			;b542	bf 	. 
	ld l,d			;b543	6a 	j 
	add a,b			;b544	80 	. 
	inc a			;b545	3c 	< 
	ld (hl),h			;b546	74 	t 
	add a,b			;b547	80 	. 
	ld b,b			;b548	40 	@ 
	adc a,e			;b549	8b 	. 
	ld h,b			;b54a	60 	` 
	add a,c			;b54b	81 	. 
	ld a,(hl)			;b54c	7e 	~ 
	add a,b			;b54d	80 	. 
	nop			;b54e	00 	. 
	xor b			;b54f	a8 	. 
	xor h			;b550	ac 	. 
	xor h			;b551	ac 	. 
	ld l,d			;b552	6a 	j 
	add a,b			;b553	80 	. 
	inc a			;b554	3c 	< 
	ld b,b			;b555	40 	@ 
	xor d			;b556	aa 	. 
	cp d			;b557	ba 	. 
	cp d			;b558	ba 	. 
	ld l,d			;b559	6a 	j 
	add a,b			;b55a	80 	. 
	inc a			;b55b	3c 	< 
lb55ch:
	ld b,b			;b55c	40 	@ 
	xor d			;b55d	aa 	. 
	cp l			;b55e	bd 	. 
	cp a			;b55f	bf 	. 
	ld l,d			;b560	6a 	j 
	add a,b			;b561	80 	. 
	inc a			;b562	3c 	< 
	ld b,b			;b563	40 	@ 
	xor d			;b564	aa 	. 
	and b			;b565	a0 	. 
	xor d			;b566	aa 	. 
	ld l,d			;b567	6a 	j 
	add a,b			;b568	80 	. 
	inc a			;b569	3c 	< 
	ld b,b			;b56a	40 	@ 
	xor d			;b56b	aa 	. 
	cp a			;b56c	bf 	. 
	cp a			;b56d	bf 	. 
	ld l,d			;b56e	6a 	j 
	add a,b			;b56f	80 	. 
	inc a			;b570	3c 	< 
	ld d,b			;b571	50 	P 
	add a,d			;b572	82 	. 
	ld b,b			;b573	40 	@ 
	xor a			;b574	af 	. 
	add a,a			;b575	87 	. 
	ld a,d			;b576	7a 	z 
	add a,b			;b577	80 	. 
	inc a			;b578	3c 	< 
	ld bc,l807ch		;b579	01 7c 80 	. | . 
	ld a,(hl)			;b57c	7e 	~ 
	add a,b			;b57d	80 	. 
	nop			;b57e	00 	. 
	ld b,e			;b57f	43 	C 
	and b			;b580	a0 	. 
	or b			;b581	b0 	. 
	or b			;b582	b0 	. 
	ld l,e			;b583	6b 	k 
	add a,b			;b584	80 	. 
	inc a			;b585	3c 	< 
	ld b,b			;b586	40 	@ 
	xor d			;b587	aa 	. 
	xor d			;b588	aa 	. 
	xor d			;b589	aa 	. 
	ld l,d			;b58a	6a 	j 
	add a,b			;b58b	80 	. 
	inc a			;b58c	3c 	< 
	ld b,b			;b58d	40 	@ 
	xor d			;b58e	aa 	. 
	or a			;b58f	b7 	. 
	cp a			;b590	bf 	. 
	ld l,d			;b591	6a 	j 
	add a,b			;b592	80 	. 
	inc a			;b593	3c 	< 
	ld b,b			;b594	40 	@ 
	xor d			;b595	aa 	. 
	add a,e			;b596	83 	. 
	xor e			;b597	ab 	. 
	ld l,d			;b598	6a 	j 
	add a,b			;b599	80 	. 
	inc a			;b59a	3c 	< 
	ld b,b			;b59b	40 	@ 
	xor d			;b59c	aa 	. 
	cp (hl)			;b59d	be 	. 
	cp (hl)			;b59e	be 	. 
	ld l,d			;b59f	6a 	j 
	add a,b			;b5a0	80 	. 
	inc a			;b5a1	3c 	< 
	ld b,b			;b5a2	40 	@ 
	adc a,d			;b5a3	8a 	. 
	cp a			;b5a4	bf 	. 
	sbc a,a			;b5a5	9f 	. 
	ld l,d			;b5a6	6a 	j 
	add a,b			;b5a7	80 	. 
	inc a			;b5a8	3c 	< 
	ld a,l			;b5a9	7d 	} 
	add a,b			;b5aa	80 	. 
	ld (hl),b			;b5ab	70 	p 
	add a,d			;b5ac	82 	. 
	ld a,b			;b5ad	78 	x 
	add a,b			;b5ae	80 	. 
	nop			;b5af	00 	. 
	ld c,a			;b5b0	4f 	O 
	add a,b			;b5b1	80 	. 
	add a,b			;b5b2	80 	. 
	add a,b			;b5b3	80 	. 
	ld l,a			;b5b4	6f 	o 
	add a,b			;b5b5	80 	. 
	inc a			;b5b6	3c 	< 
	ld b,b			;b5b7	40 	@ 
	xor d			;b5b8	aa 	. 
	xor e			;b5b9	ab 	. 
	xor e			;b5ba	ab 	. 
	ld l,d			;b5bb	6a 	j 
	add a,b			;b5bc	80 	. 
	inc a			;b5bd	3c 	< 
	ld b,b			;b5be	40 	@ 
	xor d			;b5bf	aa 	. 
	sbc a,(hl)			;b5c0	9e 	. 
	cp (hl)			;b5c1	be 	. 
	ld l,d			;b5c2	6a 	j 
	add a,b			;b5c3	80 	. 
	inc a			;b5c4	3c 	< 
	ld b,b			;b5c5	40 	@ 
	xor d			;b5c6	aa 	. 
	adc a,a			;b5c7	8f 	. 
	xor a			;b5c8	af 	. 
	ld l,d			;b5c9	6a 	j 
	add a,b			;b5ca	80 	. 
	inc a			;b5cb	3c 	< 
	ld b,b			;b5cc	40 	@ 
	xor d			;b5cd	aa 	. 
	cp b			;b5ce	b8 	. 
	cp d			;b5cf	ba 	. 
	ld l,d			;b5d0	6a 	j 
	add a,b			;b5d1	80 	. 
	inc a			;b5d2	3c 	< 
	ld b,b			;b5d3	40 	@ 
	xor d			;b5d4	aa 	. 
	cp a			;b5d5	bf 	. 
	cp a			;b5d6	bf 	. 
	ld l,d			;b5d7	6a 	j 
	add a,b			;b5d8	80 	. 
	inc a			;b5d9	3c 	< 
	ld (hl),h			;b5da	74 	t 
	add a,b			;b5db	80 	. 
	ld b,b			;b5dc	40 	@ 
	adc a,e			;b5dd	8b 	. 
	ld h,b			;b5de	60 	` 
	add a,c			;b5df	81 	. 
	ld a,(hl)			;b5e0	7e 	~ 
	add a,b			;b5e1	80 	. 
	nop			;b5e2	00 	. 
	xor b			;b5e3	a8 	. 
	xor h			;b5e4	ac 	. 
	xor h			;b5e5	ac 	. 
	ld l,d			;b5e6	6a 	j 
	add a,b			;b5e7	80 	. 
	inc a			;b5e8	3c 	< 
	ld b,b			;b5e9	40 	@ 
	xor d			;b5ea	aa 	. 
	cp d			;b5eb	ba 	. 
	cp d			;b5ec	ba 	. 
	ld l,d			;b5ed	6a 	j 
	add a,b			;b5ee	80 	. 
	inc a			;b5ef	3c 	< 
	ld b,b			;b5f0	40 	@ 
	xor d			;b5f1	aa 	. 
	cp l			;b5f2	bd 	. 
	cp a			;b5f3	bf 	. 
	ld l,d			;b5f4	6a 	j 
	add a,b			;b5f5	80 	. 
	inc a			;b5f6	3c 	< 
	ld b,b			;b5f7	40 	@ 
	xor d			;b5f8	aa 	. 
	add a,b			;b5f9	80 	. 
	xor d			;b5fa	aa 	. 
	ld l,d			;b5fb	6a 	j 
	add a,b			;b5fc	80 	. 
	inc a			;b5fd	3c 	< 
	ld b,b			;b5fe	40 	@ 
	xor d			;b5ff	aa 	. 
	cp (hl)			;b600	be 	. 
	cp (hl)			;b601	be 	. 
	ld l,d			;b602	6a 	j 
	add a,b			;b603	80 	. 
	inc a			;b604	3c 	< 
	ld d,b			;b605	50 	P 
	add a,d			;b606	82 	. 
	ld b,b			;b607	40 	@ 
	xor a			;b608	af 	. 
	add a,a			;b609	87 	. 
	ld a,d			;b60a	7a 	z 
	add a,b			;b60b	80 	. 
	inc a			;b60c	3c 	< 
	ld bc,l807ch		;b60d	01 7c 80 	. | . 
	ld a,(hl)			;b610	7e 	~ 
	add a,b			;b611	80 	. 
	nop			;b612	00 	. 
	ld b,e			;b613	43 	C 
	and b			;b614	a0 	. 
	or b			;b615	b0 	. 
	or b			;b616	b0 	. 
	ld l,e			;b617	6b 	k 
	add a,b			;b618	80 	. 
	inc a			;b619	3c 	< 
	ld b,b			;b61a	40 	@ 
	xor d			;b61b	aa 	. 
	xor d			;b61c	aa 	. 
	xor d			;b61d	aa 	. 
	ld l,d			;b61e	6a 	j 
	add a,b			;b61f	80 	. 
	inc a			;b620	3c 	< 
	ld b,b			;b621	40 	@ 
	xor d			;b622	aa 	. 
	or a			;b623	b7 	. 
	cp a			;b624	bf 	. 
	ld l,d			;b625	6a 	j 
	add a,b			;b626	80 	. 
	inc a			;b627	3c 	< 
	ld b,b			;b628	40 	@ 
	xor d			;b629	aa 	. 
	add a,e			;b62a	83 	. 
	xor e			;b62b	ab 	. 
	ld l,d			;b62c	6a 	j 
	add a,b			;b62d	80 	. 
	inc a			;b62e	3c 	< 
	ld b,b			;b62f	40 	@ 
	xor d			;b630	aa 	. 
	cp b			;b631	b8 	. 
	cp d			;b632	ba 	. 
	ld l,d			;b633	6a 	j 
	add a,b			;b634	80 	. 
	inc a			;b635	3c 	< 
	ld b,b			;b636	40 	@ 
	adc a,d			;b637	8a 	. 
	cp a			;b638	bf 	. 
	sbc a,a			;b639	9f 	. 
	ld l,d			;b63a	6a 	j 
	add a,b			;b63b	80 	. 
	inc a			;b63c	3c 	< 
	ld a,l			;b63d	7d 	} 
	add a,b			;b63e	80 	. 
	ld (hl),b			;b63f	70 	p 
	add a,d			;b640	82 	. 
	ld a,b			;b641	78 	x 
	add a,b			;b642	80 	. 
	nop			;b643	00 	. 
	ld c,a			;b644	4f 	O 
	add a,b			;b645	80 	. 
	add a,b			;b646	80 	. 
	add a,b			;b647	80 	. 
	ld l,a			;b648	6f 	o 
	add a,b			;b649	80 	. 
	inc a			;b64a	3c 	< 
	ld b,b			;b64b	40 	@ 
	xor d			;b64c	aa 	. 
	xor e			;b64d	ab 	. 
	xor e			;b64e	ab 	. 
	ld l,d			;b64f	6a 	j 
	add a,b			;b650	80 	. 
	inc a			;b651	3c 	< 
	ld b,b			;b652	40 	@ 
	xor d			;b653	aa 	. 
	sbc a,(hl)			;b654	9e 	. 
	cp (hl)			;b655	be 	. 
	ld l,d			;b656	6a 	j 
	add a,b			;b657	80 	. 
	inc a			;b658	3c 	< 
	ld b,b			;b659	40 	@ 
	xor d			;b65a	aa 	. 
	adc a,a			;b65b	8f 	. 
	xor a			;b65c	af 	. 
	ld l,d			;b65d	6a 	j 
	add a,b			;b65e	80 	. 
	inc a			;b65f	3c 	< 
	ld b,b			;b660	40 	@ 
	xor d			;b661	aa 	. 
	and b			;b662	a0 	. 
	xor d			;b663	aa 	. 
	ld l,d			;b664	6a 	j 
	add a,b			;b665	80 	. 
	inc a			;b666	3c 	< 
	ld b,b			;b667	40 	@ 
	xor d			;b668	aa 	. 
	cp a			;b669	bf 	. 
	cp a			;b66a	bf 	. 
	ld l,d			;b66b	6a 	j 
	add a,b			;b66c	80 	. 
	inc a			;b66d	3c 	< 
	ld (hl),h			;b66e	74 	t 
	add a,b			;b66f	80 	. 
	ld b,b			;b670	40 	@ 
	adc a,e			;b671	8b 	. 
	ld h,b			;b672	60 	` 
	add a,c			;b673	81 	. 
	ld a,(hl)			;b674	7e 	~ 
	add a,b			;b675	80 	. 
	nop			;b676	00 	. 
	xor b			;b677	a8 	. 
	xor h			;b678	ac 	. 
	xor h			;b679	ac 	. 
	ld l,d			;b67a	6a 	j 
	add a,b			;b67b	80 	. 
	inc a			;b67c	3c 	< 
	ld b,b			;b67d	40 	@ 
	xor d			;b67e	aa 	. 
	cp d			;b67f	ba 	. 
	cp d			;b680	ba 	. 
	ld l,d			;b681	6a 	j 
	add a,b			;b682	80 	. 
	inc a			;b683	3c 	< 
	ld b,b			;b684	40 	@ 
	xor d			;b685	aa 	. 
	cp l			;b686	bd 	. 
	cp a			;b687	bf 	. 
	ld l,d			;b688	6a 	j 
	add a,b			;b689	80 	. 
	inc a			;b68a	3c 	< 
	ld b,b			;b68b	40 	@ 
	xor d			;b68c	aa 	. 
	add a,b			;b68d	80 	. 
	xor d			;b68e	aa 	. 
	ld l,d			;b68f	6a 	j 
	add a,b			;b690	80 	. 
	inc a			;b691	3c 	< 
	ld b,b			;b692	40 	@ 
	xor d			;b693	aa 	. 
	cp b			;b694	b8 	. 
	cp d			;b695	ba 	. 
	ld l,d			;b696	6a 	j 
	add a,b			;b697	80 	. 
	inc a			;b698	3c 	< 
	ld d,b			;b699	50 	P 
	add a,d			;b69a	82 	. 
	ld b,b			;b69b	40 	@ 
	xor a			;b69c	af 	. 
	add a,a			;b69d	87 	. 
	ld a,d			;b69e	7a 	z 
	add a,b			;b69f	80 	. 
	inc a			;b6a0	3c 	< 
	ld bc,l807ch		;b6a1	01 7c 80 	. | . 
	ld a,(hl)			;b6a4	7e 	~ 
	add a,b			;b6a5	80 	. 
	nop			;b6a6	00 	. 
	ld b,e			;b6a7	43 	C 
	and b			;b6a8	a0 	. 
	or b			;b6a9	b0 	. 
	or b			;b6aa	b0 	. 
	ld l,e			;b6ab	6b 	k 
	add a,b			;b6ac	80 	. 
	inc a			;b6ad	3c 	< 
	ld b,b			;b6ae	40 	@ 
	xor d			;b6af	aa 	. 
	xor d			;b6b0	aa 	. 
	xor d			;b6b1	aa 	. 
	ld l,d			;b6b2	6a 	j 
	add a,b			;b6b3	80 	. 
	inc a			;b6b4	3c 	< 
	ld b,b			;b6b5	40 	@ 
	xor d			;b6b6	aa 	. 
	or a			;b6b7	b7 	. 
	cp a			;b6b8	bf 	. 
	ld l,d			;b6b9	6a 	j 
	add a,b			;b6ba	80 	. 
	inc a			;b6bb	3c 	< 
	ld b,b			;b6bc	40 	@ 
	xor d			;b6bd	aa 	. 
	add a,e			;b6be	83 	. 
	xor e			;b6bf	ab 	. 
	ld l,d			;b6c0	6a 	j 
	add a,b			;b6c1	80 	. 
	inc a			;b6c2	3c 	< 
	ld b,b			;b6c3	40 	@ 
	xor d			;b6c4	aa 	. 
	and b			;b6c5	a0 	. 
	xor d			;b6c6	aa 	. 
	ld l,d			;b6c7	6a 	j 
	add a,b			;b6c8	80 	. 
	inc a			;b6c9	3c 	< 
	ld b,b			;b6ca	40 	@ 
	adc a,d			;b6cb	8a 	. 
	cp a			;b6cc	bf 	. 
	sbc a,a			;b6cd	9f 	. 
	ld l,d			;b6ce	6a 	j 
	add a,b			;b6cf	80 	. 
	inc a			;b6d0	3c 	< 
	ld a,l			;b6d1	7d 	} 
	add a,b			;b6d2	80 	. 
	ld (hl),b			;b6d3	70 	p 
	add a,d			;b6d4	82 	. 
	ld a,b			;b6d5	78 	x 
	add a,b			;b6d6	80 	. 
	nop			;b6d7	00 	. 
	ld c,a			;b6d8	4f 	O 
	add a,b			;b6d9	80 	. 
	add a,b			;b6da	80 	. 
	add a,b			;b6db	80 	. 
	ld l,a			;b6dc	6f 	o 
	add a,b			;b6dd	80 	. 
	inc a			;b6de	3c 	< 
	ld b,b			;b6df	40 	@ 
	xor d			;b6e0	aa 	. 
	xor e			;b6e1	ab 	. 
	xor e			;b6e2	ab 	. 
	ld l,d			;b6e3	6a 	j 
	add a,b			;b6e4	80 	. 
	inc a			;b6e5	3c 	< 
	ld b,b			;b6e6	40 	@ 
	xor d			;b6e7	aa 	. 
	sbc a,(hl)			;b6e8	9e 	. 
	cp (hl)			;b6e9	be 	. 
	ld l,d			;b6ea	6a 	j 
	add a,b			;b6eb	80 	. 
	inc a			;b6ec	3c 	< 
	ld b,b			;b6ed	40 	@ 
	xor d			;b6ee	aa 	. 
	adc a,a			;b6ef	8f 	. 
	xor a			;b6f0	af 	. 
	ld l,d			;b6f1	6a 	j 
	add a,b			;b6f2	80 	. 
	inc a			;b6f3	3c 	< 
	ld b,b			;b6f4	40 	@ 
	xor d			;b6f5	aa 	. 
	add a,b			;b6f6	80 	. 
	xor d			;b6f7	aa 	. 
	ld l,d			;b6f8	6a 	j 
	add a,b			;b6f9	80 	. 
	inc a			;b6fa	3c 	< 
	ld b,b			;b6fb	40 	@ 
	xor d			;b6fc	aa 	. 
	cp (hl)			;b6fd	be 	. 
	cp (hl)			;b6fe	be 	. 
	ld l,d			;b6ff	6a 	j 
	add a,b			;b700	80 	. 
	inc a			;b701	3c 	< 
	ld (hl),h			;b702	74 	t 
	add a,b			;b703	80 	. 
	ld b,b			;b704	40 	@ 
	adc a,e			;b705	8b 	. 
	ld h,b			;b706	60 	` 
	add a,c			;b707	81 	. 
	ld a,(hl)			;b708	7e 	~ 
	add a,b			;b709	80 	. 
	nop			;b70a	00 	. 
	ld bc,lb70eh		;b70b	01 0e b7 	. . . 
lb70eh:
	ld a,(de)			;b70e	1a 	. 
	or a			;b70f	b7 	. 
	ld a,(de)			;b710	1a 	. 
	or a			;b711	b7 	. 
	ld (hl),a			;b712	77 	w 
	or a			;b713	b7 	. 
	ld (hl),a			;b714	77 	w 
	or a			;b715	b7 	. 
	rst 8			;b716	cf 	. 
	or a			;b717	b7 	. 
	rst 8			;b718	cf 	. 
	or a			;b719	b7 	. 
	ld c,a			;b71a	4f 	O 
	add a,b			;b71b	80 	. 
	ld l,a			;b71c	6f 	o 
	add a,b			;b71d	80 	. 
	ld b,04fh		;b71e	06 4f 	. O 
	add a,b			;b720	80 	. 
	ld l,a			;b721	6f 	o 
	add a,b			;b722	80 	. 
lb723h:
	ld (hl),040h		;b723	36 40 	6 @ 
	xor d			;b725	aa 	. 
	or h			;b726	b4 	. 
	ld c,e			;b727	4b 	K 
	add a,b			;b728	80 	. 
	ld b,e			;b729	43 	C 
	and b			;b72a	a0 	. 
	or b			;b72b	b0 	. 
	or b			;b72c	b0 	. 
lb72dh:
	ld c,e			;b72d	4b 	K 
	add a,b			;b72e	80 	. 
	ld b,c			;b72f	41 	A 
	and b			;b730	a0 	. 
	ld b,b			;b731	40 	@ 
	cp (hl)			;b732	be 	. 
	ld l,d			;b733	6a 	j 
	add a,b			;b734	80 	. 
	ld (hl),050h		;b735	36 50 	6 P 
	add a,d			;b737	82 	. 
	ld b,b			;b738	40 	@ 
	xor a			;b739	af 	. 
	cp l			;b73a	bd 	. 
	cp d			;b73b	ba 	. 
	sbc a,(hl)			;b73c	9e 	. 
	cp (hl)			;b73d	be 	. 
	cp b			;b73e	b8 	. 
	cp a			;b73f	bf 	. 
	add a,a			;b740	87 	. 
	ld a,d			;b741	7a 	z 
	add a,b			;b742	80 	. 
	scf			;b743	37 	7 
	ld d,b			;b744	50 	P 
	add a,d			;b745	82 	. 
	ld b,b			;b746	40 	@ 
	cp a			;b747	bf 	. 
	cp a			;b748	bf 	. 
	cp a			;b749	bf 	. 
	cp a			;b74a	bf 	. 
	cp a			;b74b	bf 	. 
	sub a			;b74c	97 	. 
	ld a,d			;b74d	7a 	z 
	add a,b			;b74e	80 	. 
	jr c,lb7a6h		;b74f	38 55 	8 U 
	add a,b			;b751	80 	. 
	cp a			;b752	bf 	. 
	cp a			;b753	bf 	. 
	cp a			;b754	bf 	. 
	cp a			;b755	bf 	. 
	cp a			;b756	bf 	. 
	sub l			;b757	95 	. 
	add hl,sp			;b758	39 	9 
	add a,b			;b759	80 	. 
	cp a			;b75a	bf 	. 
	cp a			;b75b	bf 	. 
	cp a			;b75c	bf 	. 
	cp a			;b75d	bf 	. 
	cp a			;b75e	bf 	. 
	sub l			;b75f	95 	. 
	add hl,sp			;b760	39 	9 
	add a,b			;b761	80 	. 
	ld b,b			;b762	40 	@ 
	sbc a,a			;b763	9f 	. 
	adc a,e			;b764	8b 	. 
	ld h,b			;b765	60 	` 
	add a,c			;b766	81 	. 
	ld b,b			;b767	40 	@ 
	adc a,e			;b768	8b 	. 
	sbc a,a			;b769	9f 	. 
	ld l,b			;b76a	68 	h 
	add a,b			;b76b	80 	. 
	add hl,sp			;b76c	39 	9 
	ld a,l			;b76d	7d 	} 
	add a,b			;b76e	80 	. 
	ld a,h			;b76f	7c 	| 
	add a,b			;b770	80 	. 
	ld (bc),a			;b771	02 	. 
	ld a,l			;b772	7d 	} 
	add a,b			;b773	80 	. 
	ld a,h			;b774	7c 	| 
	add a,b			;b775	80 	. 
	nop			;b776	00 	. 
	ccf			;b777	3f 	? 
	ld bc,042a8h		;b778	01 a8 42 	. . B 
	sub b			;b77b	90 	. 
	ld l,a			;b77c	6f 	o 
	add a,b			;b77d	80 	. 
	ld c,a			;b77e	4f 	O 
	add a,b			;b77f	80 	. 
	add a,b			;b780	80 	. 
	add a,b			;b781	80 	. 
	ld l,a			;b782	6f 	o 
	add a,b			;b783	80 	. 
	ld b,a			;b784	47 	G 
	add a,b			;b785	80 	. 
	ld b,b			;b786	40 	@ 
	cp b			;b787	b8 	. 
	ld l,d			;b788	6a 	j 
	add a,b			;b789	80 	. 
	ld (hl),040h		;b78a	36 40 	6 @ 
	adc a,d			;b78c	8a 	. 
	cp a			;b78d	bf 	. 
	or h			;b78e	b4 	. 
	xor d			;b78f	aa 	. 
lb790h:
	cp e			;b790	bb 	. 
	cp e			;b791	bb 	. 
	and b			;b792	a0 	. 
	cp (hl)			;b793	be 	. 
	sbc a,a			;b794	9f 	. 
	ld l,d			;b795	6a 	j 
	add a,b			;b796	80 	. 
	ld (hl),07dh		;b797	36 7d 	6 } 
	add a,b			;b799	80 	. 
	ld b,b			;b79a	40 	@ 
	adc a,d			;b79b	8a 	. 
lb79ch:
	cp a			;b79c	bf 	. 
	cp a			;b79d	bf 	. 
	cp l			;b79e	bd 	. 
	cp a			;b79f	bf 	. 
	cp a			;b7a0	bf 	. 
	sbc a,a			;b7a1	9f 	. 
	ld l,b			;b7a2	68 	h 
	add a,b			;b7a3	80 	. 
	jr c,lb7fbh		;b7a4	38 55 	8 U 
lb7a6h:
	add a,b			;b7a6	80 	. 
	cp a			;b7a7	bf 	. 
	cp a			;b7a8	bf 	. 
	cp a			;b7a9	bf 	. 
	cp a			;b7aa	bf 	. 
	cp a			;b7ab	bf 	. 
	sub l			;b7ac	95 	. 
	add hl,sp			;b7ad	39 	9 
	add a,b			;b7ae	80 	. 
	cp a			;b7af	bf 	. 
	cp a			;b7b0	bf 	. 
	cp a			;b7b1	bf 	. 
	cp a			;b7b2	bf 	. 
	cp a			;b7b3	bf 	. 
	sub l			;b7b4	95 	. 
	add hl,sp			;b7b5	39 	9 
	add a,b			;b7b6	80 	. 
	ld b,b			;b7b7	40 	@ 
	cp a			;b7b8	bf 	. 
	xor a			;b7b9	af 	. 
	add a,a			;b7ba	87 	. 
	xor a			;b7bb	af 	. 
	cp a			;b7bc	bf 	. 
	ld h,b			;b7bd	60 	` 
	add a,c			;b7be	81 	. 
	add hl,sp			;b7bf	39 	9 
	ld (hl),l			;b7c0	75 	u 
	add a,b			;b7c1	80 	. 
	ld (hl),b			;b7c2	70 	p 
	add a,c			;b7c3	81 	. 
	ld a,h			;b7c4	7c 	| 
	add a,b			;b7c5	80 	. 
	ld a,(hl)			;b7c6	7e 	~ 
	add a,b			;b7c7	80 	. 
	ld (hl),h			;b7c8	74 	t 
	add a,b			;b7c9	80 	. 
	ld (hl),b			;b7ca	70 	p 
	add a,c			;b7cb	81 	. 
	ld a,(hl)			;b7cc	7e 	~ 
	add a,b			;b7cd	80 	. 
	nop			;b7ce	00 	. 
	ccf			;b7cf	3f 	? 
	ld bc,la043h		;b7d0	01 43 a0 	. C . 
	ld c,e			;b7d3	4b 	K 
	add a,b			;b7d4	80 	. 
	dec b			;b7d5	05 	. 
	ld e,a			;b7d6	5f 	_ 
	add a,b			;b7d7	80 	. 
	ld b,e			;b7d8	43 	C 
	and b			;b7d9	a0 	. 
	ld l,e			;b7da	6b 	k 
	add a,b			;b7db	80 	. 
	ld (hl),040h		;b7dc	36 40 	6 @ 
	xor d			;b7de	aa 	. 
	cp l			;b7df	bd 	. 
	ld b,d			;b7e0	42 	B 
	sub b			;b7e1	90 	. 
	ld b,b			;b7e2	40 	@ 
	xor b			;b7e3	a8 	. 
	xor h			;b7e4	ac 	. 
	xor h			;b7e5	ac 	. 
	ld b,d			;b7e6	42 	B 
	add a,b			;b7e7	80 	. 
	ld b,b			;b7e8	40 	@ 
	cp b			;b7e9	b8 	. 
	cp a			;b7ea	bf 	. 
	ld l,d			;b7eb	6a 	j 
	add a,b			;b7ec	80 	. 
	ld (hl),074h		;b7ed	36 74 	6 t 
	add a,b			;b7ef	80 	. 
	ld b,b			;b7f0	40 	@ 
	xor e			;b7f1	ab 	. 
	cp a			;b7f2	bf 	. 
	cp (hl)			;b7f3	be 	. 
	or a			;b7f4	b7 	. 
	cp a			;b7f5	bf 	. 
	cp (hl)			;b7f6	be 	. 
	cp a			;b7f7	bf 	. 
	ld h,b			;b7f8	60 	` 
	add a,c			;b7f9	81 	. 
	ld a,(hl)			;b7fa	7e 	~ 
lb7fbh:
	add a,b			;b7fb	80 	. 
	scf			;b7fc	37 	7 
	ld d,h			;b7fd	54 	T 
	add a,b			;b7fe	80 	. 
	ld b,b			;b7ff	40 	@ 
	cp a			;b800	bf 	. 
	cp a			;b801	bf 	. 
	cp a			;b802	bf 	. 
	cp a			;b803	bf 	. 
	cp a			;b804	bf 	. 
lb805h:
	sub l			;b805	95 	. 
	ld a,(hl)			;b806	7e 	~ 
	add a,b			;b807	80 	. 
	jr c,lb85fh		;b808	38 55 	8 U 
	add a,b			;b80a	80 	. 
	cp a			;b80b	bf 	. 
	cp a			;b80c	bf 	. 
	cp a			;b80d	bf 	. 
	cp a			;b80e	bf 	. 
	cp a			;b80f	bf 	. 
	sub l			;b810	95 	. 
	add hl,sp			;b811	39 	9 
	add a,b			;b812	80 	. 
	ld b,b			;b813	40 	@ 
	cp a			;b814	bf 	. 
	cp a			;b815	bf 	. 
	sbc a,a			;b816	9f 	. 
	cp a			;b817	bf 	. 
	cp a			;b818	bf 	. 
	add a,l			;b819	85 	. 
	add hl,sp			;b81a	39 	9 
	ld d,l			;b81b	55 	U 
	add a,b			;b81c	80 	. 
	ld b,b			;b81d	40 	@ 
	add a,a			;b81e	87 	. 
	ld (hl),b			;b81f	70 	p 
	add a,d			;b820	82 	. 
	ld a,b			;b821	78 	x 
	add a,b			;b822	80 	. 
	ld d,b			;b823	50 	P 
	add a,d			;b824	82 	. 
	ld b,b			;b825	40 	@ 
	add a,a			;b826	87 	. 
	ld a,d			;b827	7a 	z 
	add a,b			;b828	80 	. 
	nop			;b829	00 	. 
	ld bc,lb82dh		;b82a	01 2d b8 	. - . 
lb82dh:
	add hl,sp			;b82d	39 	9 
	cp b			;b82e	b8 	. 
	add hl,sp			;b82f	39 	9 
	cp b			;b830	b8 	. 
	ld d,h			;b831	54 	T 
	cp b			;b832	b8 	. 
	ld d,h			;b833	54 	T 
	cp b			;b834	b8 	. 
	ld (hl),b			;b835	70 	p 
	cp b			;b836	b8 	. 
	ld (hl),b			;b837	70 	p 
	cp b			;b838	b8 	. 
	xor b			;b839	a8 	. 
	xor h			;b83a	ac 	. 
	xor h			;b83b	ac 	. 
	ld l,d			;b83c	6a 	j 
	add a,b			;b83d	80 	. 
	inc a			;b83e	3c 	< 
	ld b,b			;b83f	40 	@ 
	xor d			;b840	aa 	. 
	cp a			;b841	bf 	. 
	cp a			;b842	bf 	. 
	ld l,d			;b843	6a 	j 
	add a,b			;b844	80 	. 
	inc a			;b845	3c 	< 
	ld d,b			;b846	50 	P 
	add a,d			;b847	82 	. 
	ld b,b			;b848	40 	@ 
	xor a			;b849	af 	. 
	add a,a			;b84a	87 	. 
	ld a,d			;b84b	7a 	z 
	add a,b			;b84c	80 	. 
	inc a			;b84d	3c 	< 
	ld bc,l807ch		;b84e	01 7c 80 	. | . 
	ld a,(hl)			;b851	7e 	~ 
	add a,b			;b852	80 	. 
	nop			;b853	00 	. 
	ld b,e			;b854	43 	C 
	and b			;b855	a0 	. 
	or b			;b856	b0 	. 
	or b			;b857	b0 	. 
	ld l,e			;b858	6b 	k 
	add a,b			;b859	80 	. 
	inc a			;b85a	3c 	< 
	ld b,b			;b85b	40 	@ 
	xor d			;b85c	aa 	. 
	cp (hl)			;b85d	be 	. 
	cp (hl)			;b85e	be 	. 
lb85fh:
	ld l,d			;b85f	6a 	j 
	add a,b			;b860	80 	. 
	inc a			;b861	3c 	< 
	ld b,b			;b862	40 	@ 
	adc a,d			;b863	8a 	. 
	cp a			;b864	bf 	. 
	sbc a,a			;b865	9f 	. 
	ld l,d			;b866	6a 	j 
	add a,b			;b867	80 	. 
	inc a			;b868	3c 	< 
	ld a,l			;b869	7d 	} 
	add a,b			;b86a	80 	. 
	ld (hl),b			;b86b	70 	p 
	add a,d			;b86c	82 	. 
	ld a,b			;b86d	78 	x 
	add a,b			;b86e	80 	. 
	nop			;b86f	00 	. 
	ld c,a			;b870	4f 	O 
	add a,b			;b871	80 	. 
	add a,b			;b872	80 	. 
	add a,b			;b873	80 	. 
	ld l,a			;b874	6f 	o 
	add a,b			;b875	80 	. 
	inc a			;b876	3c 	< 
	ld b,b			;b877	40 	@ 
	xor d			;b878	aa 	. 
	cp e			;b879	bb 	. 
	cp e			;b87a	bb 	. 
	ld l,d			;b87b	6a 	j 
	add a,b			;b87c	80 	. 
	inc a			;b87d	3c 	< 
	ld b,b			;b87e	40 	@ 
	xor d			;b87f	aa 	. 
lb880h:
	cp a			;b880	bf 	. 
	cp a			;b881	bf 	. 
	ld l,d			;b882	6a 	j 
	add a,b			;b883	80 	. 
	inc a			;b884	3c 	< 
	ld (hl),h			;b885	74 	t 
	add a,b			;b886	80 	. 
	ld b,b			;b887	40 	@ 
	adc a,e			;b888	8b 	. 
	ld h,b			;b889	60 	` 
	add a,c			;b88a	81 	. 
	ld a,(hl)			;b88b	7e 	~ 
	add a,b			;b88c	80 	. 
	nop			;b88d	00 	. 
	inc c			;b88e	0c 	. 
	rst 10h			;b88f	d7 	. 
	cp b			;b890	b8 	. 
	rst 10h			;b891	d7 	. 
	cp b			;b892	b8 	. 
	rst 10h			;b893	d7 	. 
lb894h:
	cp b			;b894	b8 	. 
	rst 10h			;b895	d7 	. 
	cp b			;b896	b8 	. 
	res 7,b		;b897	cb b8 	. . 
	cp a			;b899	bf 	. 
	cp b			;b89a	b8 	. 
	or e			;b89b	b3 	. 
	cp b			;b89c	b8 	. 
	and a			;b89d	a7 	. 
	cp b			;b89e	b8 	. 
	and a			;b89f	a7 	. 
	cp b			;b8a0	b8 	. 
	or e			;b8a1	b3 	. 
	cp b			;b8a2	b8 	. 
	cp a			;b8a3	bf 	. 
	cp b			;b8a4	b8 	. 
	res 7,b		;b8a5	cb b8 	. . 
	ex (sp),hl			;b8a7	e3 	. 
	cp b			;b8a8	b8 	. 
	ex (sp),hl			;b8a9	e3 	. 
	cp b			;b8aa	b8 	. 
	ld (022b9h),hl		;b8ab	22 b9 22 	" . " 
	cp c			;b8ae	b9 	. 
	ld h,e			;b8af	63 	c 
	cp c			;b8b0	b9 	. 
	ld h,e			;b8b1	63 	c 
lb8b2h:
	cp c			;b8b2	b9 	. 
	and h			;b8b3	a4 	. 
	cp c			;b8b4	b9 	. 
	and h			;b8b5	a4 	. 
	cp c			;b8b6	b9 	. 
	ex (sp),hl			;b8b7	e3 	. 
	cp c			;b8b8	b9 	. 
	ex (sp),hl			;b8b9	e3 	. 
	cp c			;b8ba	b9 	. 
	inc h			;b8bb	24 	$ 
	cp d			;b8bc	ba 	. 
	inc h			;b8bd	24 	$ 
	cp d			;b8be	ba 	. 
	ld h,l			;b8bf	65 	e 
lb8c0h:
	cp d			;b8c0	ba 	. 
	ld h,l			;b8c1	65 	e 
	cp d			;b8c2	ba 	. 
	and h			;b8c3	a4 	. 
	cp d			;b8c4	ba 	. 
	and h			;b8c5	a4 	. 
	cp d			;b8c6	ba 	. 
	push hl			;b8c7	e5 	. 
	cp d			;b8c8	ba 	. 
	push hl			;b8c9	e5 	. 
	cp d			;b8ca	ba 	. 
	ld h,0bbh		;b8cb	26 bb 	& . 
	ld h,0bbh		;b8cd	26 bb 	& . 
	ld h,l			;b8cf	65 	e 
	cp e			;b8d0	bb 	. 
	ld h,l			;b8d1	65 	e 
	cp e			;b8d2	bb 	. 
	and (hl)			;b8d3	a6 	. 
	cp e			;b8d4	bb 	. 
	and (hl)			;b8d5	a6 	. 
	cp e			;b8d6	bb 	. 
	rst 20h			;b8d7	e7 	. 
	cp e			;b8d8	bb 	. 
	rst 20h			;b8d9	e7 	. 
	cp e			;b8da	bb 	. 
	ld h,0bch		;b8db	26 bc 	& . 
	ld h,0bch		;b8dd	26 bc 	& . 
lb8dfh:
	ld h,a			;b8df	67 	g 
	cp h			;b8e0	bc 	. 
	ld h,a			;b8e1	67 	g 
	cp h			;b8e2	bc 	. 
	xor b			;b8e3	a8 	. 
	adc a,h			;b8e4	8c 	. 
	sbc a,h			;b8e5	9c 	. 
	xor h			;b8e6	ac 	. 
	ld l,d			;b8e7	6a 	j 
	add a,b			;b8e8	80 	. 
	dec sp			;b8e9	3b 	; 
	ld b,b			;b8ea	40 	@ 
	xor d			;b8eb	aa 	. 
	or b			;b8ec	b0 	. 
	and l			;b8ed	a5 	. 
	cp d			;b8ee	ba 	. 
	ld l,d			;b8ef	6a 	j 
	add a,b			;b8f0	80 	. 
	dec sp			;b8f1	3b 	; 
	ld b,b			;b8f2	40 	@ 
	xor d			;b8f3	aa 	. 
	cp a			;b8f4	bf 	. 
	xor a			;b8f5	af 	. 
	cp a			;b8f6	bf 	. 
	ld l,d			;b8f7	6a 	j 
	add a,b			;b8f8	80 	. 
	dec sp			;b8f9	3b 	; 
	ld b,b			;b8fa	40 	@ 
	xor d			;b8fb	aa 	. 
	cp a			;b8fc	bf 	. 
	cp a			;b8fd	bf 	. 
	cp a			;b8fe	bf 	. 
	ld l,d			;b8ff	6a 	j 
	add a,b			;b900	80 	. 
	dec sp			;b901	3b 	; 
	ld b,b			;b902	40 	@ 
	xor d			;b903	aa 	. 
	cp a			;b904	bf 	. 
	cp a			;b905	bf 	. 
	cp a			;b906	bf 	. 
	ld l,d			;b907	6a 	j 
	add a,b			;b908	80 	. 
	dec sp			;b909	3b 	; 
	ld b,b			;b90a	40 	@ 
	xor d			;b90b	aa 	. 
	cp a			;b90c	bf 	. 
	cp a			;b90d	bf 	. 
	cp a			;b90e	bf 	. 
	ld l,d			;b90f	6a 	j 
	add a,b			;b910	80 	. 
	dec sp			;b911	3b 	; 
	ld (hl),h			;b912	74 	t 
	add a,b			;b913	80 	. 
	ld b,b			;b914	40 	@ 
	adc a,e			;b915	8b 	. 
	sbc a,a			;b916	9f 	. 
	ld h,b			;b917	60 	` 
	add a,c			;b918	81 	. 
	ld a,(hl)			;b919	7e 	~ 
	add a,b			;b91a	80 	. 
	dec sp			;b91b	3b 	; 
	ld bc,l807dh		;b91c	01 7d 80 	. } . 
	ld a,h			;b91f	7c 	| 
	add a,b			;b920	80 	. 
	nop			;b921	00 	. 
	ld b,e			;b922	43 	C 
	and b			;b923	a0 	. 
	or b			;b924	b0 	. 
	or b			;b925	b0 	. 
	or b			;b926	b0 	. 
	ld l,e			;b927	6b 	k 
	add a,b			;b928	80 	. 
	dec sp			;b929	3b 	; 
	ld b,b			;b92a	40 	@ 
	xor d			;b92b	aa 	. 
	add a,b			;b92c	80 	. 
	sub l			;b92d	95 	. 
	xor d			;b92e	aa 	. 
	ld l,d			;b92f	6a 	j 
	add a,b			;b930	80 	. 
	dec sp			;b931	3b 	; 
	ld b,b			;b932	40 	@ 
	xor d			;b933	aa 	. 
	cp a			;b934	bf 	. 
	cp (hl)			;b935	be 	. 
	cp a			;b936	bf 	. 
	ld l,d			;b937	6a 	j 
	add a,b			;b938	80 	. 
	dec sp			;b939	3b 	; 
	ld b,b			;b93a	40 	@ 
	xor d			;b93b	aa 	. 
	cp a			;b93c	bf 	. 
	cp (hl)			;b93d	be 	. 
	cp a			;b93e	bf 	. 
	ld l,d			;b93f	6a 	j 
	add a,b			;b940	80 	. 
	dec sp			;b941	3b 	; 
	ld b,b			;b942	40 	@ 
	xor d			;b943	aa 	. 
	cp a			;b944	bf 	. 
	cp a			;b945	bf 	. 
	cp a			;b946	bf 	. 
	ld l,d			;b947	6a 	j 
	add a,b			;b948	80 	. 
	dec sp			;b949	3b 	; 
	ld b,b			;b94a	40 	@ 
	xor d			;b94b	aa 	. 
	cp a			;b94c	bf 	. 
	cp a			;b94d	bf 	. 
	cp a			;b94e	bf 	. 
	ld l,d			;b94f	6a 	j 
	add a,b			;b950	80 	. 
	dec sp			;b951	3b 	; 
	ld d,b			;b952	50 	P 
	add a,d			;b953	82 	. 
	ld b,b			;b954	40 	@ 
	xor a			;b955	af 	. 
	cp a			;b956	bf 	. 
	add a,a			;b957	87 	. 
	ld a,d			;b958	7a 	z 
	add a,b			;b959	80 	. 
	dec sp			;b95a	3b 	; 
	ld bc,l8074h		;b95b	01 74 80 	. t . 
	ld (hl),b			;b95e	70 	p 
	add a,c			;b95f	81 	. 
	ld a,(hl)			;b960	7e 	~ 
	add a,b			;b961	80 	. 
	nop			;b962	00 	. 
	ld c,a			;b963	4f 	O 
	add a,b			;b964	80 	. 
	add a,b			;b965	80 	. 
	add a,b			;b966	80 	. 
	add a,b			;b967	80 	. 
	ld l,a			;b968	6f 	o 
	add a,b			;b969	80 	. 
	dec sp			;b96a	3b 	; 
	ld b,b			;b96b	40 	@ 
	xor d			;b96c	aa 	. 
	add a,e			;b96d	83 	. 
	sub a			;b96e	97 	. 
	xor e			;b96f	ab 	. 
	ld l,d			;b970	6a 	j 
	add a,b			;b971	80 	. 
	dec sp			;b972	3b 	; 
	ld b,b			;b973	40 	@ 
	xor d			;b974	aa 	. 
	cp h			;b975	bc 	. 
	cp c			;b976	b9 	. 
	cp (hl)			;b977	be 	. 
	ld l,d			;b978	6a 	j 
	add a,b			;b979	80 	. 
	dec sp			;b97a	3b 	; 
	ld b,b			;b97b	40 	@ 
	xor d			;b97c	aa 	. 
	cp a			;b97d	bf 	. 
	cp e			;b97e	bb 	. 
	cp a			;b97f	bf 	. 
	ld l,d			;b980	6a 	j 
	add a,b			;b981	80 	. 
	dec sp			;b982	3b 	; 
	ld b,b			;b983	40 	@ 
	xor d			;b984	aa 	. 
	cp a			;b985	bf 	. 
	cp a			;b986	bf 	. 
	cp a			;b987	bf 	. 
	ld l,d			;b988	6a 	j 
	add a,b			;b989	80 	. 
	dec sp			;b98a	3b 	; 
	ld b,b			;b98b	40 	@ 
	xor d			;b98c	aa 	. 
	cp a			;b98d	bf 	. 
	cp a			;b98e	bf 	. 
	cp a			;b98f	bf 	. 
	ld l,d			;b990	6a 	j 
	add a,b			;b991	80 	. 
	dec sp			;b992	3b 	; 
	ld b,b			;b993	40 	@ 
	adc a,d			;b994	8a 	. 
	cp a			;b995	bf 	. 
	cp a			;b996	bf 	. 
	sbc a,a			;b997	9f 	. 
	ld l,d			;b998	6a 	j 
	add a,b			;b999	80 	. 
	dec sp			;b99a	3b 	; 
	ld a,l			;b99b	7d 	} 
	add a,b			;b99c	80 	. 
	ld d,b			;b99d	50 	P 
	add a,d			;b99e	82 	. 
	ld b,b			;b99f	40 	@ 
	add a,a			;b9a0	87 	. 
	ld a,b			;b9a1	78 	x 
	add a,b			;b9a2	80 	. 
	nop			;b9a3	00 	. 
	xor b			;b9a4	a8 	. 
	adc a,h			;b9a5	8c 	. 
	sbc a,h			;b9a6	9c 	. 
	xor h			;b9a7	ac 	. 
	ld l,d			;b9a8	6a 	j 
	add a,b			;b9a9	80 	. 
	dec sp			;b9aa	3b 	; 
	ld b,b			;b9ab	40 	@ 
	xor d			;b9ac	aa 	. 
	or b			;b9ad	b0 	. 
	and l			;b9ae	a5 	. 
	cp d			;b9af	ba 	. 
lb9b0h:
	ld l,d			;b9b0	6a 	j 
	add a,b			;b9b1	80 	. 
	dec sp			;b9b2	3b 	; 
	ld b,b			;b9b3	40 	@ 
	xor d			;b9b4	aa 	. 
	sub a			;b9b5	97 	. 
	sub e			;b9b6	93 	. 
	cp a			;b9b7	bf 	. 
	ld l,d			;b9b8	6a 	j 
	add a,b			;b9b9	80 	. 
	dec sp			;b9ba	3b 	; 
	ld b,b			;b9bb	40 	@ 
	xor d			;b9bc	aa 	. 
	cp a			;b9bd	bf 	. 
	cp a			;b9be	bf 	. 
	cp a			;b9bf	bf 	. 
	ld l,d			;b9c0	6a 	j 
	add a,b			;b9c1	80 	. 
	dec sp			;b9c2	3b 	; 
	ld b,b			;b9c3	40 	@ 
	xor d			;b9c4	aa 	. 
	cp a			;b9c5	bf 	. 
	cp a			;b9c6	bf 	. 
	cp a			;b9c7	bf 	. 
	ld l,d			;b9c8	6a 	j 
	add a,b			;b9c9	80 	. 
	dec sp			;b9ca	3b 	; 
	ld b,b			;b9cb	40 	@ 
	xor d			;b9cc	aa 	. 
	cp a			;b9cd	bf 	. 
	cp a			;b9ce	bf 	. 
	cp a			;b9cf	bf 	. 
	ld l,d			;b9d0	6a 	j 
	add a,b			;b9d1	80 	. 
	dec sp			;b9d2	3b 	; 
	ld (hl),h			;b9d3	74 	t 
	add a,b			;b9d4	80 	. 
	ld b,b			;b9d5	40 	@ 
	adc a,e			;b9d6	8b 	. 
	sbc a,a			;b9d7	9f 	. 
	ld h,b			;b9d8	60 	` 
	add a,c			;b9d9	81 	. 
	ld a,(hl)			;b9da	7e 	~ 
	add a,b			;b9db	80 	. 
	dec sp			;b9dc	3b 	; 
	ld bc,l807dh		;b9dd	01 7d 80 	. } . 
	ld a,h			;b9e0	7c 	| 
	add a,b			;b9e1	80 	. 
	nop			;b9e2	00 	. 
	ld b,e			;b9e3	43 	C 
	and b			;b9e4	a0 	. 
	or b			;b9e5	b0 	. 
	or b			;b9e6	b0 	. 
	or b			;b9e7	b0 	. 
	ld l,e			;b9e8	6b 	k 
	add a,b			;b9e9	80 	. 
	dec sp			;b9ea	3b 	; 
	ld b,b			;b9eb	40 	@ 
	xor d			;b9ec	aa 	. 
	add a,b			;b9ed	80 	. 
	sub l			;b9ee	95 	. 
	xor d			;b9ef	aa 	. 
	ld l,d			;b9f0	6a 	j 
	add a,b			;b9f1	80 	. 
	dec sp			;b9f2	3b 	; 
	ld b,b			;b9f3	40 	@ 
	xor d			;b9f4	aa 	. 
	sbc a,a			;b9f5	9f 	. 
	adc a,(hl)			;b9f6	8e 	. 
	cp a			;b9f7	bf 	. 
	ld l,d			;b9f8	6a 	j 
	add a,b			;b9f9	80 	. 
	dec sp			;b9fa	3b 	; 
	ld b,b			;b9fb	40 	@ 
	xor d			;b9fc	aa 	. 
	cp l			;b9fd	bd 	. 
	cp l			;b9fe	bd 	. 
	cp a			;b9ff	bf 	. 
	ld l,d			;ba00	6a 	j 
	add a,b			;ba01	80 	. 
	dec sp			;ba02	3b 	; 
	ld b,b			;ba03	40 	@ 
	xor d			;ba04	aa 	. 
	cp a			;ba05	bf 	. 
	cp a			;ba06	bf 	. 
	cp a			;ba07	bf 	. 
	ld l,d			;ba08	6a 	j 
	add a,b			;ba09	80 	. 
	dec sp			;ba0a	3b 	; 
	ld b,b			;ba0b	40 	@ 
	xor d			;ba0c	aa 	. 
	cp a			;ba0d	bf 	. 
	cp a			;ba0e	bf 	. 
	cp a			;ba0f	bf 	. 
	ld l,d			;ba10	6a 	j 
	add a,b			;ba11	80 	. 
	dec sp			;ba12	3b 	; 
	ld d,b			;ba13	50 	P 
	add a,d			;ba14	82 	. 
	ld b,b			;ba15	40 	@ 
	xor a			;ba16	af 	. 
	cp a			;ba17	bf 	. 
	add a,a			;ba18	87 	. 
	ld a,d			;ba19	7a 	z 
	add a,b			;ba1a	80 	. 
	dec sp			;ba1b	3b 	; 
	ld bc,l8074h		;ba1c	01 74 80 	. t . 
	ld (hl),b			;ba1f	70 	p 
	add a,c			;ba20	81 	. 
	ld a,(hl)			;ba21	7e 	~ 
	add a,b			;ba22	80 	. 
	nop			;ba23	00 	. 
	ld c,a			;ba24	4f 	O 
	add a,b			;ba25	80 	. 
	add a,b			;ba26	80 	. 
	add a,b			;ba27	80 	. 
	add a,b			;ba28	80 	. 
	ld l,a			;ba29	6f 	o 
	add a,b			;ba2a	80 	. 
	dec sp			;ba2b	3b 	; 
	ld b,b			;ba2c	40 	@ 
	xor d			;ba2d	aa 	. 
	add a,e			;ba2e	83 	. 
	sub a			;ba2f	97 	. 
	xor e			;ba30	ab 	. 
	ld l,d			;ba31	6a 	j 
	add a,b			;ba32	80 	. 
	dec sp			;ba33	3b 	; 
	ld b,b			;ba34	40 	@ 
	xor d			;ba35	aa 	. 
	cp h			;ba36	bc 	. 
	cp c			;ba37	b9 	. 
	cp (hl)			;ba38	be 	. 
	ld l,d			;ba39	6a 	j 
	add a,b			;ba3a	80 	. 
	dec sp			;ba3b	3b 	; 
	ld b,b			;ba3c	40 	@ 
	xor d			;ba3d	aa 	. 
	or l			;ba3e	b5 	. 
	or h			;ba3f	b4 	. 
	cp a			;ba40	bf 	. 
	ld l,d			;ba41	6a 	j 
	add a,b			;ba42	80 	. 
	dec sp			;ba43	3b 	; 
	ld b,b			;ba44	40 	@ 
	xor d			;ba45	aa 	. 
	cp a			;ba46	bf 	. 
	cp a			;ba47	bf 	. 
	cp a			;ba48	bf 	. 
	ld l,d			;ba49	6a 	j 
	add a,b			;ba4a	80 	. 
	dec sp			;ba4b	3b 	; 
	ld b,b			;ba4c	40 	@ 
	xor d			;ba4d	aa 	. 
	cp a			;ba4e	bf 	. 
	cp a			;ba4f	bf 	. 
	cp a			;ba50	bf 	. 
	ld l,d			;ba51	6a 	j 
	add a,b			;ba52	80 	. 
	dec sp			;ba53	3b 	; 
	ld b,b			;ba54	40 	@ 
	adc a,d			;ba55	8a 	. 
	cp a			;ba56	bf 	. 
lba57h:
	cp a			;ba57	bf 	. 
	sbc a,a			;ba58	9f 	. 
	ld l,d			;ba59	6a 	j 
	add a,b			;ba5a	80 	. 
	dec sp			;ba5b	3b 	; 
	ld a,l			;ba5c	7d 	} 
lba5dh:
	add a,b			;ba5d	80 	. 
	ld d,b			;ba5e	50 	P 
	add a,d			;ba5f	82 	. 
	ld b,b			;ba60	40 	@ 
	add a,a			;ba61	87 	. 
	ld a,b			;ba62	78 	x 
	add a,b			;ba63	80 	. 
	nop			;ba64	00 	. 
	xor b			;ba65	a8 	. 
	adc a,h			;ba66	8c 	. 
	sbc a,h			;ba67	9c 	. 
	xor h			;ba68	ac 	. 
	ld l,d			;ba69	6a 	j 
	add a,b			;ba6a	80 	. 
	dec sp			;ba6b	3b 	; 
	ld b,b			;ba6c	40 	@ 
	xor d			;ba6d	aa 	. 
	or b			;ba6e	b0 	. 
	and l			;ba6f	a5 	. 
	cp d			;ba70	ba 	. 
	ld l,d			;ba71	6a 	j 
	add a,b			;ba72	80 	. 
	dec sp			;ba73	3b 	; 
	ld b,b			;ba74	40 	@ 
	xor d			;ba75	aa 	. 
	add a,e			;ba76	83 	. 
	add a,e			;ba77	83 	. 
	xor e			;ba78	ab 	. 
	ld l,d			;ba79	6a 	j 
	add a,b			;ba7a	80 	. 
	dec sp			;ba7b	3b 	; 
	ld b,b			;ba7c	40 	@ 
	xor d			;ba7d	aa 	. 
	cp (hl)			;ba7e	be 	. 
	cp a			;ba7f	bf 	. 
	cp (hl)			;ba80	be 	. 
	ld l,d			;ba81	6a 	j 
	add a,b			;ba82	80 	. 
	dec sp			;ba83	3b 	; 
	ld b,b			;ba84	40 	@ 
	xor d			;ba85	aa 	. 
	cp a			;ba86	bf 	. 
	cp a			;ba87	bf 	. 
	cp a			;ba88	bf 	. 
	ld l,d			;ba89	6a 	j 
	add a,b			;ba8a	80 	. 
	dec sp			;ba8b	3b 	; 
	ld b,b			;ba8c	40 	@ 
	xor d			;ba8d	aa 	. 
	cp a			;ba8e	bf 	. 
	cp a			;ba8f	bf 	. 
	cp a			;ba90	bf 	. 
	ld l,d			;ba91	6a 	j 
	add a,b			;ba92	80 	. 
	dec sp			;ba93	3b 	; 
	ld (hl),h			;ba94	74 	t 
	add a,b			;ba95	80 	. 
	ld b,b			;ba96	40 	@ 
	adc a,e			;ba97	8b 	. 
	sbc a,a			;ba98	9f 	. 
	ld h,b			;ba99	60 	` 
	add a,c			;ba9a	81 	. 
	ld a,(hl)			;ba9b	7e 	~ 
	add a,b			;ba9c	80 	. 
	dec sp			;ba9d	3b 	; 
	ld bc,l807dh		;ba9e	01 7d 80 	. } . 
	ld a,h			;baa1	7c 	| 
	add a,b			;baa2	80 	. 
	nop			;baa3	00 	. 
	ld b,e			;baa4	43 	C 
	and b			;baa5	a0 	. 
	or b			;baa6	b0 	. 
	or b			;baa7	b0 	. 
	or b			;baa8	b0 	. 
	ld l,e			;baa9	6b 	k 
	add a,b			;baaa	80 	. 
	dec sp			;baab	3b 	; 
	ld b,b			;baac	40 	@ 
	xor d			;baad	aa 	. 
	add a,b			;baae	80 	. 
	sub l			;baaf	95 	. 
	xor d			;bab0	aa 	. 
	ld l,d			;bab1	6a 	j 
	add a,b			;bab2	80 	. 
	dec sp			;bab3	3b 	; 
	ld b,b			;bab4	40 	@ 
lbab5h:
	xor d			;bab5	aa 	. 
	adc a,a			;bab6	8f 	. 
	adc a,(hl)			;bab7	8e 	. 
	xor a			;bab8	af 	. 
	ld l,d			;bab9	6a 	j 
	add a,b			;baba	80 	. 
	dec sp			;babb	3b 	; 
	ld b,b			;babc	40 	@ 
	xor d			;babd	aa 	. 
	cp b			;babe	b8 	. 
	cp h			;babf	bc 	. 
	cp d			;bac0	ba 	. 
	ld l,d			;bac1	6a 	j 
	add a,b			;bac2	80 	. 
	dec sp			;bac3	3b 	; 
	ld b,b			;bac4	40 	@ 
	xor d			;bac5	aa 	. 
	cp a			;bac6	bf 	. 
	cp a			;bac7	bf 	. 
	cp a			;bac8	bf 	. 
	ld l,d			;bac9	6a 	j 
	add a,b			;baca	80 	. 
	dec sp			;bacb	3b 	; 
	ld b,b			;bacc	40 	@ 
	xor d			;bacd	aa 	. 
	cp a			;bace	bf 	. 
	cp a			;bacf	bf 	. 
	cp a			;bad0	bf 	. 
	ld l,d			;bad1	6a 	j 
	add a,b			;bad2	80 	. 
	dec sp			;bad3	3b 	; 
	ld d,b			;bad4	50 	P 
	add a,d			;bad5	82 	. 
	ld b,b			;bad6	40 	@ 
	xor a			;bad7	af 	. 
	cp a			;bad8	bf 	. 
	add a,a			;bad9	87 	. 
	ld a,d			;bada	7a 	z 
	add a,b			;badb	80 	. 
	dec sp			;badc	3b 	; 
	ld bc,l8074h		;badd	01 74 80 	. t . 
	ld (hl),b			;bae0	70 	p 
	add a,c			;bae1	81 	. 
	ld a,(hl)			;bae2	7e 	~ 
	add a,b			;bae3	80 	. 
	nop			;bae4	00 	. 
	ld c,a			;bae5	4f 	O 
	add a,b			;bae6	80 	. 
	add a,b			;bae7	80 	. 
	add a,b			;bae8	80 	. 
	add a,b			;bae9	80 	. 
	ld l,a			;baea	6f 	o 
	add a,b			;baeb	80 	. 
	dec sp			;baec	3b 	; 
	ld b,b			;baed	40 	@ 
	xor d			;baee	aa 	. 
	add a,e			;baef	83 	. 
	sub a			;baf0	97 	. 
	xor e			;baf1	ab 	. 
	ld l,d			;baf2	6a 	j 
	add a,b			;baf3	80 	. 
	dec sp			;baf4	3b 	; 
	ld b,b			;baf5	40 	@ 
	xor d			;baf6	aa 	. 
	cp h			;baf7	bc 	. 
	cp c			;baf8	b9 	. 
	cp (hl)			;baf9	be 	. 
	ld l,d			;bafa	6a 	j 
	add a,b			;bafb	80 	. 
	dec sp			;bafc	3b 	; 
	ld b,b			;bafd	40 	@ 
	xor d			;bafe	aa 	. 
	and b			;baff	a0 	. 
	or b			;bb00	b0 	. 
	xor d			;bb01	aa 	. 
	ld l,d			;bb02	6a 	j 
	add a,b			;bb03	80 	. 
	dec sp			;bb04	3b 	; 
	ld b,b			;bb05	40 	@ 
	xor d			;bb06	aa 	. 
	cp a			;bb07	bf 	. 
	cp a			;bb08	bf 	. 
	cp a			;bb09	bf 	. 
	ld l,d			;bb0a	6a 	j 
	add a,b			;bb0b	80 	. 
	dec sp			;bb0c	3b 	; 
	ld b,b			;bb0d	40 	@ 
	xor d			;bb0e	aa 	. 
	cp a			;bb0f	bf 	. 
	cp a			;bb10	bf 	. 
	cp a			;bb11	bf 	. 
	ld l,d			;bb12	6a 	j 
	add a,b			;bb13	80 	. 
	dec sp			;bb14	3b 	; 
	ld b,b			;bb15	40 	@ 
	adc a,d			;bb16	8a 	. 
	cp a			;bb17	bf 	. 
	cp a			;bb18	bf 	. 
	sbc a,a			;bb19	9f 	. 
	ld l,d			;bb1a	6a 	j 
	add a,b			;bb1b	80 	. 
	dec sp			;bb1c	3b 	; 
	ld a,l			;bb1d	7d 	} 
	add a,b			;bb1e	80 	. 
	ld d,b			;bb1f	50 	P 
	add a,d			;bb20	82 	. 
	ld b,b			;bb21	40 	@ 
	add a,a			;bb22	87 	. 
	ld a,b			;bb23	78 	x 
	add a,b			;bb24	80 	. 
	nop			;bb25	00 	. 
	xor b			;bb26	a8 	. 
	adc a,h			;bb27	8c 	. 
	sbc a,h			;bb28	9c 	. 
	xor h			;bb29	ac 	. 
	ld l,d			;bb2a	6a 	j 
	add a,b			;bb2b	80 	. 
	dec sp			;bb2c	3b 	; 
	ld b,b			;bb2d	40 	@ 
	xor d			;bb2e	aa 	. 
	or b			;bb2f	b0 	. 
	and l			;bb30	a5 	. 
	cp d			;bb31	ba 	. 
	ld l,d			;bb32	6a 	j 
	add a,b			;bb33	80 	. 
	dec sp			;bb34	3b 	; 
	ld b,b			;bb35	40 	@ 
	xor d			;bb36	aa 	. 
	add a,e			;bb37	83 	. 
	add a,e			;bb38	83 	. 
	xor e			;bb39	ab 	. 
	ld l,d			;bb3a	6a 	j 
	add a,b			;bb3b	80 	. 
	dec sp			;bb3c	3b 	; 
	ld b,b			;bb3d	40 	@ 
	xor d			;bb3e	aa 	. 
	cp b			;bb3f	b8 	. 
	cp h			;bb40	bc 	. 
	cp d			;bb41	ba 	. 
	ld l,d			;bb42	6a 	j 
	add a,b			;bb43	80 	. 
	dec sp			;bb44	3b 	; 
	ld b,b			;bb45	40 	@ 
	xor d			;bb46	aa 	. 
	cp a			;bb47	bf 	. 
	cp a			;bb48	bf 	. 
	cp a			;bb49	bf 	. 
	ld l,d			;bb4a	6a 	j 
	add a,b			;bb4b	80 	. 
	dec sp			;bb4c	3b 	; 
	ld b,b			;bb4d	40 	@ 
	xor d			;bb4e	aa 	. 
	cp a			;bb4f	bf 	. 
	cp a			;bb50	bf 	. 
	cp a			;bb51	bf 	. 
	ld l,d			;bb52	6a 	j 
	add a,b			;bb53	80 	. 
	dec sp			;bb54	3b 	; 
	ld (hl),h			;bb55	74 	t 
	add a,b			;bb56	80 	. 
	ld b,b			;bb57	40 	@ 
	adc a,e			;bb58	8b 	. 
	sbc a,a			;bb59	9f 	. 
	ld h,b			;bb5a	60 	` 
	add a,c			;bb5b	81 	. 
	ld a,(hl)			;bb5c	7e 	~ 
	add a,b			;bb5d	80 	. 
	dec sp			;bb5e	3b 	; 
	ld bc,l807dh		;bb5f	01 7d 80 	. } . 
	ld a,h			;bb62	7c 	| 
	add a,b			;bb63	80 	. 
	nop			;bb64	00 	. 
	ld b,e			;bb65	43 	C 
	and b			;bb66	a0 	. 
	or b			;bb67	b0 	. 
	or b			;bb68	b0 	. 
	or b			;bb69	b0 	. 
	ld l,e			;bb6a	6b 	k 
	add a,b			;bb6b	80 	. 
	dec sp			;bb6c	3b 	; 
	ld b,b			;bb6d	40 	@ 
	xor d			;bb6e	aa 	. 
	add a,b			;bb6f	80 	. 
	sub l			;bb70	95 	. 
	xor d			;bb71	aa 	. 
	ld l,d			;bb72	6a 	j 
	add a,b			;bb73	80 	. 
	dec sp			;bb74	3b 	; 
	ld b,b			;bb75	40 	@ 
	xor d			;bb76	aa 	. 
	adc a,a			;bb77	8f 	. 
	adc a,(hl)			;bb78	8e 	. 
	xor a			;bb79	af 	. 
	ld l,d			;bb7a	6a 	j 
	add a,b			;bb7b	80 	. 
	dec sp			;bb7c	3b 	; 
	ld b,b			;bb7d	40 	@ 
	xor d			;bb7e	aa 	. 
	and b			;bb7f	a0 	. 
	or b			;bb80	b0 	. 
	xor d			;bb81	aa 	. 
	ld l,d			;bb82	6a 	j 
	add a,b			;bb83	80 	. 
	dec sp			;bb84	3b 	; 
	ld b,b			;bb85	40 	@ 
	xor d			;bb86	aa 	. 
	cp a			;bb87	bf 	. 
	cp a			;bb88	bf 	. 
	cp a			;bb89	bf 	. 
	ld l,d			;bb8a	6a 	j 
	add a,b			;bb8b	80 	. 
	dec sp			;bb8c	3b 	; 
	ld b,b			;bb8d	40 	@ 
	xor d			;bb8e	aa 	. 
	cp a			;bb8f	bf 	. 
	cp a			;bb90	bf 	. 
	cp a			;bb91	bf 	. 
	ld l,d			;bb92	6a 	j 
	add a,b			;bb93	80 	. 
	dec sp			;bb94	3b 	; 
	ld d,b			;bb95	50 	P 
	add a,d			;bb96	82 	. 
	ld b,b			;bb97	40 	@ 
	xor a			;bb98	af 	. 
	cp a			;bb99	bf 	. 
	add a,a			;bb9a	87 	. 
	ld a,d			;bb9b	7a 	z 
	add a,b			;bb9c	80 	. 
	dec sp			;bb9d	3b 	; 
	ld bc,l8074h		;bb9e	01 74 80 	. t . 
	ld (hl),b			;bba1	70 	p 
	add a,c			;bba2	81 	. 
	ld a,(hl)			;bba3	7e 	~ 
	add a,b			;bba4	80 	. 
	nop			;bba5	00 	. 
	ld c,a			;bba6	4f 	O 
	add a,b			;bba7	80 	. 
	add a,b			;bba8	80 	. 
	add a,b			;bba9	80 	. 
	add a,b			;bbaa	80 	. 
	ld l,a			;bbab	6f 	o 
	add a,b			;bbac	80 	. 
	dec sp			;bbad	3b 	; 
	ld b,b			;bbae	40 	@ 
	xor d			;bbaf	aa 	. 
	add a,e			;bbb0	83 	. 
	sub a			;bbb1	97 	. 
	xor e			;bbb2	ab 	. 
	ld l,d			;bbb3	6a 	j 
	add a,b			;bbb4	80 	. 
	dec sp			;bbb5	3b 	; 
	ld b,b			;bbb6	40 	@ 
	xor d			;bbb7	aa 	. 
	cp h			;bbb8	bc 	. 
	cp c			;bbb9	b9 	. 
	cp (hl)			;bbba	be 	. 
	ld l,d			;bbbb	6a 	j 
	add a,b			;bbbc	80 	. 
	dec sp			;bbbd	3b 	; 
	ld b,b			;bbbe	40 	@ 
	xor d			;bbbf	aa 	. 
	add a,b			;bbc0	80 	. 
	add a,b			;bbc1	80 	. 
	xor d			;bbc2	aa 	. 
	ld l,d			;bbc3	6a 	j 
	add a,b			;bbc4	80 	. 
	dec sp			;bbc5	3b 	; 
	ld b,b			;bbc6	40 	@ 
	xor d			;bbc7	aa 	. 
	cp (hl)			;bbc8	be 	. 
	cp a			;bbc9	bf 	. 
	cp (hl)			;bbca	be 	. 
	ld l,d			;bbcb	6a 	j 
	add a,b			;bbcc	80 	. 
	dec sp			;bbcd	3b 	; 
	ld b,b			;bbce	40 	@ 
	xor d			;bbcf	aa 	. 
	cp a			;bbd0	bf 	. 
	cp a			;bbd1	bf 	. 
	cp a			;bbd2	bf 	. 
	ld l,d			;bbd3	6a 	j 
	add a,b			;bbd4	80 	. 
	dec sp			;bbd5	3b 	; 
	ld b,b			;bbd6	40 	@ 
	adc a,d			;bbd7	8a 	. 
	cp a			;bbd8	bf 	. 
	cp a			;bbd9	bf 	. 
	sbc a,a			;bbda	9f 	. 
	ld l,d			;bbdb	6a 	j 
	add a,b			;bbdc	80 	. 
	dec sp			;bbdd	3b 	; 
	ld a,l			;bbde	7d 	} 
	add a,b			;bbdf	80 	. 
	ld d,b			;bbe0	50 	P 
	add a,d			;bbe1	82 	. 
	ld b,b			;bbe2	40 	@ 
	add a,a			;bbe3	87 	. 
	ld a,b			;bbe4	78 	x 
	add a,b			;bbe5	80 	. 
	nop			;bbe6	00 	. 
	xor b			;bbe7	a8 	. 
	adc a,h			;bbe8	8c 	. 
	sbc a,h			;bbe9	9c 	. 
	xor h			;bbea	ac 	. 
	ld l,d			;bbeb	6a 	j 
	add a,b			;bbec	80 	. 
	dec sp			;bbed	3b 	; 
	ld b,b			;bbee	40 	@ 
	xor d			;bbef	aa 	. 
	or b			;bbf0	b0 	. 
	and l			;bbf1	a5 	. 
	cp d			;bbf2	ba 	. 
	ld l,d			;bbf3	6a 	j 
	add a,b			;bbf4	80 	. 
	dec sp			;bbf5	3b 	; 
	ld b,b			;bbf6	40 	@ 
	xor d			;bbf7	aa 	. 
	add a,e			;bbf8	83 	. 
	add a,e			;bbf9	83 	. 
	xor e			;bbfa	ab 	. 
	ld l,d			;bbfb	6a 	j 
	add a,b			;bbfc	80 	. 
	dec sp			;bbfd	3b 	; 
	ld b,b			;bbfe	40 	@ 
	xor d			;bbff	aa 	. 
	and b			;bc00	a0 	. 
	or b			;bc01	b0 	. 
	xor d			;bc02	aa 	. 
	ld l,d			;bc03	6a 	j 
	add a,b			;bc04	80 	. 
	dec sp			;bc05	3b 	; 
	ld b,b			;bc06	40 	@ 
	xor d			;bc07	aa 	. 
	cp a			;bc08	bf 	. 
	cp a			;bc09	bf 	. 
	cp a			;bc0a	bf 	. 
	ld l,d			;bc0b	6a 	j 
	add a,b			;bc0c	80 	. 
	dec sp			;bc0d	3b 	; 
	ld b,b			;bc0e	40 	@ 
	xor d			;bc0f	aa 	. 
	cp a			;bc10	bf 	. 
	cp a			;bc11	bf 	. 
	cp a			;bc12	bf 	. 
	ld l,d			;bc13	6a 	j 
	add a,b			;bc14	80 	. 
	dec sp			;bc15	3b 	; 
	ld (hl),h			;bc16	74 	t 
	add a,b			;bc17	80 	. 
	ld b,b			;bc18	40 	@ 
	adc a,e			;bc19	8b 	. 
	sbc a,a			;bc1a	9f 	. 
	ld h,b			;bc1b	60 	` 
	add a,c			;bc1c	81 	. 
	ld a,(hl)			;bc1d	7e 	~ 
	add a,b			;bc1e	80 	. 
	dec sp			;bc1f	3b 	; 
	ld bc,l807dh		;bc20	01 7d 80 	. } . 
	ld a,h			;bc23	7c 	| 
	add a,b			;bc24	80 	. 
	nop			;bc25	00 	. 
	ld b,e			;bc26	43 	C 
	and b			;bc27	a0 	. 
	or b			;bc28	b0 	. 
	or b			;bc29	b0 	. 
	or b			;bc2a	b0 	. 
	ld l,e			;bc2b	6b 	k 
	add a,b			;bc2c	80 	. 
	dec sp			;bc2d	3b 	; 
	ld b,b			;bc2e	40 	@ 
	xor d			;bc2f	aa 	. 
	add a,b			;bc30	80 	. 
	sub l			;bc31	95 	. 
	xor d			;bc32	aa 	. 
	ld l,d			;bc33	6a 	j 
	add a,b			;bc34	80 	. 
	dec sp			;bc35	3b 	; 
	ld b,b			;bc36	40 	@ 
	xor d			;bc37	aa 	. 
	adc a,a			;bc38	8f 	. 
	adc a,(hl)			;bc39	8e 	. 
	xor a			;bc3a	af 	. 
	ld l,d			;bc3b	6a 	j 
	add a,b			;bc3c	80 	. 
	dec sp			;bc3d	3b 	; 
	ld b,b			;bc3e	40 	@ 
	xor d			;bc3f	aa 	. 
	add a,b			;bc40	80 	. 
	add a,b			;bc41	80 	. 
	xor d			;bc42	aa 	. 
	ld l,d			;bc43	6a 	j 
	add a,b			;bc44	80 	. 
	dec sp			;bc45	3b 	; 
	ld b,b			;bc46	40 	@ 
	xor d			;bc47	aa 	. 
	cp (hl)			;bc48	be 	. 
	cp a			;bc49	bf 	. 
	cp (hl)			;bc4a	be 	. 
	ld l,d			;bc4b	6a 	j 
	add a,b			;bc4c	80 	. 
	dec sp			;bc4d	3b 	; 
	ld b,b			;bc4e	40 	@ 
	xor d			;bc4f	aa 	. 
	cp a			;bc50	bf 	. 
	cp a			;bc51	bf 	. 
	cp a			;bc52	bf 	. 
	ld l,d			;bc53	6a 	j 
	add a,b			;bc54	80 	. 
lbc55h:
	dec sp			;bc55	3b 	; 
	ld d,b			;bc56	50 	P 
	add a,d			;bc57	82 	. 
	ld b,b			;bc58	40 	@ 
	xor a			;bc59	af 	. 
	cp a			;bc5a	bf 	. 
	add a,a			;bc5b	87 	. 
	ld a,d			;bc5c	7a 	z 
	add a,b			;bc5d	80 	. 
	dec sp			;bc5e	3b 	; 
	ld bc,l8074h		;bc5f	01 74 80 	. t . 
	ld (hl),b			;bc62	70 	p 
	add a,c			;bc63	81 	. 
	ld a,(hl)			;bc64	7e 	~ 
	add a,b			;bc65	80 	. 
	nop			;bc66	00 	. 
	ld c,a			;bc67	4f 	O 
	add a,b			;bc68	80 	. 
	add a,b			;bc69	80 	. 
	add a,b			;bc6a	80 	. 
	add a,b			;bc6b	80 	. 
	ld l,a			;bc6c	6f 	o 
	add a,b			;bc6d	80 	. 
	dec sp			;bc6e	3b 	; 
	ld b,b			;bc6f	40 	@ 
	xor d			;bc70	aa 	. 
	add a,e			;bc71	83 	. 
	sub a			;bc72	97 	. 
	xor e			;bc73	ab 	. 
	ld l,d			;bc74	6a 	j 
	add a,b			;bc75	80 	. 
	dec sp			;bc76	3b 	; 
	ld b,b			;bc77	40 	@ 
	xor d			;bc78	aa 	. 
	cp h			;bc79	bc 	. 
	cp c			;bc7a	b9 	. 
	cp (hl)			;bc7b	be 	. 
	ld l,d			;bc7c	6a 	j 
	add a,b			;bc7d	80 	. 
	dec sp			;bc7e	3b 	; 
	ld b,b			;bc7f	40 	@ 
	xor d			;bc80	aa 	. 
	add a,b			;bc81	80 	. 
	add a,b			;bc82	80 	. 
	xor d			;bc83	aa 	. 
	ld l,d			;bc84	6a 	j 
	add a,b			;bc85	80 	. 
	dec sp			;bc86	3b 	; 
	ld b,b			;bc87	40 	@ 
	xor d			;bc88	aa 	. 
	cp b			;bc89	b8 	. 
	cp h			;bc8a	bc 	. 
	cp d			;bc8b	ba 	. 
	ld l,d			;bc8c	6a 	j 
	add a,b			;bc8d	80 	. 
	dec sp			;bc8e	3b 	; 
	ld b,b			;bc8f	40 	@ 
	xor d			;bc90	aa 	. 
	cp a			;bc91	bf 	. 
	cp a			;bc92	bf 	. 
	cp a			;bc93	bf 	. 
	ld l,d			;bc94	6a 	j 
	add a,b			;bc95	80 	. 
	dec sp			;bc96	3b 	; 
	ld b,b			;bc97	40 	@ 
	adc a,d			;bc98	8a 	. 
	cp a			;bc99	bf 	. 
	cp a			;bc9a	bf 	. 
	sbc a,a			;bc9b	9f 	. 
	ld l,d			;bc9c	6a 	j 
	add a,b			;bc9d	80 	. 
	dec sp			;bc9e	3b 	; 
	ld a,l			;bc9f	7d 	} 
	add a,b			;bca0	80 	. 
	ld d,b			;bca1	50 	P 
	add a,d			;bca2	82 	. 
	ld b,b			;bca3	40 	@ 
	add a,a			;bca4	87 	. 
	ld a,b			;bca5	78 	x 
	add a,b			;bca6	80 	. 
	nop			;bca7	00 	. 
	inc h			;bca8	24 	$ 
	pop af			;bca9	f1 	. 
	cp h			;bcaa	bc 	. 
	pop af			;bcab	f1 	. 
	cp h			;bcac	bc 	. 
	cp iyh		;bcad	fd bc 	. . 
	cp iyh		;bcaf	fd bc 	. . 
	add hl,bc			;bcb1	09 	. 
	cp l			;bcb2	bd 	. 
	dec d			;bcb3	15 	. 
	cp l			;bcb4	bd 	. 
	add hl,bc			;bcb5	09 	. 
	cp l			;bcb6	bd 	. 
	dec d			;bcb7	15 	. 
	cp l			;bcb8	bd 	. 
	add hl,bc			;bcb9	09 	. 
	cp l			;bcba	bd 	. 
	dec d			;bcbb	15 	. 
	cp l			;bcbc	bd 	. 
	add hl,bc			;bcbd	09 	. 
	cp l			;bcbe	bd 	. 
	dec d			;bcbf	15 	. 
	cp l			;bcc0	bd 	. 
	add hl,bc			;bcc1	09 	. 
	cp l			;bcc2	bd 	. 
	dec d			;bcc3	15 	. 
	cp l			;bcc4	bd 	. 
	add hl,bc			;bcc5	09 	. 
	cp l			;bcc6	bd 	. 
	dec d			;bcc7	15 	. 
	cp l			;bcc8	bd 	. 
	add hl,bc			;bcc9	09 	. 
	cp l			;bcca	bd 	. 
	dec d			;bccb	15 	. 
	cp l			;bccc	bd 	. 
	add hl,bc			;bccd	09 	. 
	cp l			;bcce	bd 	. 
	dec d			;bccf	15 	. 
	cp l			;bcd0	bd 	. 
	add hl,bc			;bcd1	09 	. 
	cp l			;bcd2	bd 	. 
	dec d			;bcd3	15 	. 
	cp l			;bcd4	bd 	. 
	add hl,bc			;bcd5	09 	. 
	cp l			;bcd6	bd 	. 
	dec d			;bcd7	15 	. 
	cp l			;bcd8	bd 	. 
	add hl,bc			;bcd9	09 	. 
	cp l			;bcda	bd 	. 
	dec d			;bcdb	15 	. 
	cp l			;bcdc	bd 	. 
	add hl,bc			;bcdd	09 	. 
	cp l			;bcde	bd 	. 
	dec d			;bcdf	15 	. 
	cp l			;bce0	bd 	. 
	add hl,bc			;bce1	09 	. 
	cp l			;bce2	bd 	. 
	dec d			;bce3	15 	. 
	cp l			;bce4	bd 	. 
	add hl,bc			;bce5	09 	. 
	cp l			;bce6	bd 	. 
	dec d			;bce7	15 	. 
	cp l			;bce8	bd 	. 
	pop af			;bce9	f1 	. 
	cp h			;bcea	bc 	. 
	pop af			;bceb	f1 	. 
	cp h			;bcec	bc 	. 
	cp iyh		;bced	fd bc 	. . 
	cp iyh		;bcef	fd bc 	. . 
	ld hl,021bdh		;bcf1	21 bd 21 	! . ! 
	cp l			;bcf4	bd 	. 
	ld hl,021bdh		;bcf5	21 bd 21 	! . ! 
	cp l			;bcf8	bd 	. 
	ld hl,021bdh		;bcf9	21 bd 21 	! . ! 
	cp l			;bcfc	bd 	. 
	inc sp			;bcfd	33 	3 
	cp l			;bcfe	bd 	. 
	inc sp			;bcff	33 	3 
	cp l			;bd00	bd 	. 
	inc sp			;bd01	33 	3 
	cp l			;bd02	bd 	. 
	inc sp			;bd03	33 	3 
	cp l			;bd04	bd 	. 
	inc sp			;bd05	33 	3 
	cp l			;bd06	bd 	. 
	inc sp			;bd07	33 	3 
	cp l			;bd08	bd 	. 
	ld b,l			;bd09	45 	E 
	cp l			;bd0a	bd 	. 
	ld b,l			;bd0b	45 	E 
	cp l			;bd0c	bd 	. 
	ld b,l			;bd0d	45 	E 
	cp l			;bd0e	bd 	. 
	ld b,l			;bd0f	45 	E 
	cp l			;bd10	bd 	. 
	ld b,l			;bd11	45 	E 
	cp l			;bd12	bd 	. 
	ld b,l			;bd13	45 	E 
	cp l			;bd14	bd 	. 
	ld d,a			;bd15	57 	W 
	cp l			;bd16	bd 	. 
	ld d,a			;bd17	57 	W 
	cp l			;bd18	bd 	. 
	ld d,a			;bd19	57 	W 
	cp l			;bd1a	bd 	. 
	ld d,a			;bd1b	57 	W 
	cp l			;bd1c	bd 	. 
	ld d,a			;bd1d	57 	W 
	cp l			;bd1e	bd 	. 
	ld d,a			;bd1f	57 	W 
	cp l			;bd20	bd 	. 
	xor b			;bd21	a8 	. 
	sbc a,h			;bd22	9c 	. 
	xor h			;bd23	ac 	. 
	adc a,h			;bd24	8c 	. 
	sub h			;bd25	94 	. 
	dec sp			;bd26	3b 	; 
	xor d			;bd27	aa 	. 
	cp l			;bd28	bd 	. 
	or (hl)			;bd29	b6 	. 
	cp h			;bd2a	bc 	. 
	sub l			;bd2b	95 	. 
	dec sp			;bd2c	3b 	; 
	adc a,d			;bd2d	8a 	. 
	adc a,a			;bd2e	8f 	. 
	cp h			;bd2f	bc 	. 
	adc a,(hl)			;bd30	8e 	. 
	add a,l			;bd31	85 	. 
	nop			;bd32	00 	. 
	xor b			;bd33	a8 	. 
	adc a,h			;bd34	8c 	. 
	sbc a,h			;bd35	9c 	. 
	xor h			;bd36	ac 	. 
	sub h			;bd37	94 	. 
	dec sp			;bd38	3b 	; 
	xor d			;bd39	aa 	. 
	cp h			;bd3a	bc 	. 
	cp c			;bd3b	b9 	. 
	cp (hl)			;bd3c	be 	. 
	sub l			;bd3d	95 	. 
	dec sp			;bd3e	3b 	; 
	adc a,d			;bd3f	8a 	. 
	adc a,l			;bd40	8d 	. 
	cp h			;bd41	bc 	. 
	adc a,a			;bd42	8f 	. 
	add a,l			;bd43	85 	. 
	nop			;bd44	00 	. 
	and b			;bd45	a0 	. 
	or b			;bd46	b0 	. 
	or b			;bd47	b0 	. 
	or b			;bd48	b0 	. 
	sub b			;bd49	90 	. 
	dec sp			;bd4a	3b 	; 
	xor d			;bd4b	aa 	. 
	xor h			;bd4c	ac 	. 
	cp c			;bd4d	b9 	. 
	xor (hl)			;bd4e	ae 	. 
	sub l			;bd4f	95 	. 
	dec sp			;bd50	3b 	; 
	adc a,d			;bd51	8a 	. 
	adc a,h			;bd52	8c 	. 
	cp h			;bd53	bc 	. 
	adc a,(hl)			;bd54	8e 	. 
	add a,l			;bd55	85 	. 
	nop			;bd56	00 	. 
	xor b			;bd57	a8 	. 
	adc a,h			;bd58	8c 	. 
	sbc a,h			;bd59	9c 	. 
	xor h			;bd5a	ac 	. 
	sub h			;bd5b	94 	. 
	dec sp			;bd5c	3b 	; 
	xor d			;bd5d	aa 	. 
	adc a,e			;bd5e	8b 	. 
	adc a,(hl)			;bd5f	8e 	. 
	xor e			;bd60	ab 	. 
	sub l			;bd61	95 	. 
	dec sp			;bd62	3b 	; 
	add a,d			;bd63	82 	. 
	add a,e			;bd64	83 	. 
	cp a			;bd65	bf 	. 
	add a,e			;bd66	83 	. 
	add a,c			;bd67	81 	. 
	nop			;bd68	00 	. 
	ld bc,lbd6ch		;bd69	01 6c bd 	. l . 
lbd6ch:
	ld a,b			;bd6c	78 	x 
	cp l			;bd6d	bd 	. 
	ld a,b			;bd6e	78 	x 
	cp l			;bd6f	bd 	. 
	pop af			;bd70	f1 	. 
	cp l			;bd71	bd 	. 
	pop af			;bd72	f1 	. 
	cp l			;bd73	bd 	. 
	ld l,d			;bd74	6a 	j 
	cp (hl)			;bd75	be 	. 
	ld l,d			;bd76	6a 	j 
	cp (hl)			;bd77	be 	. 
	ld b,055h		;bd78	06 55 	. U 
	add a,b			;bd7a	80 	. 
	sub l			;bd7b	95 	. 
	ld a,080h		;bd7c	3e 80 	> . 
	sub l			;bd7e	95 	. 
	ld a,080h		;bd7f	3e 80 	> . 
	sub l			;bd81	95 	. 
lbd82h:
	ld a,080h		;bd82	3e 80 	> . 
	sub l			;bd84	95 	. 
	ld a,080h		;bd85	3e 80 	> . 
	sub l			;bd87	95 	. 
	ld a,080h		;bd88	3e 80 	> . 
	sub l			;bd8a	95 	. 
	add hl,sp			;bd8b	39 	9 
	ld e,a			;bd8c	5f 	_ 
	add a,b			;bd8d	80 	. 
	ld c,a			;bd8e	4f 	O 
	add a,b			;bd8f	80 	. 
	add a,b			;bd90	80 	. 
	ld (bc),a			;bd91	02 	. 
	ld d,l			;bd92	55 	U 
	add a,b			;bd93	80 	. 
	ld b,b			;bd94	40 	@ 
	sub l			;bd95	95 	. 
	ld (bc),a			;bd96	02 	. 
	ld e,a			;bd97	5f 	_ 
	add a,b			;bd98	80 	. 
	ld c,a			;bd99	4f 	O 
	add a,b			;bd9a	80 	. 
	add a,b			;bd9b	80 	. 
	inc sp			;bd9c	33 	3 
	ld b,a			;bd9d	47 	G 
	add a,b			;bd9e	80 	. 
	ld b,b			;bd9f	40 	@ 
	sbc a,b			;bda0	98 	. 
	add a,e			;bda1	83 	. 
	adc a,c			;bda2	89 	. 
	ld b,d			;bda3	42 	B 
	sub b			;bda4	90 	. 
	ld bc,l8045h		;bda5	01 45 80 	. E . 
	ld b,b			;bda8	40 	@ 
	sub l			;bda9	95 	. 
	ld c,a			;bdaa	4f 	O 
	add a,b			;bdab	80 	. 
	ld b,a			;bdac	47 	G 
	add a,b			;bdad	80 	. 
	ld b,b			;bdae	40 	@ 
	sbc a,b			;bdaf	98 	. 
	add a,e			;bdb0	83 	. 
	adc a,c			;bdb1	89 	. 
	ld b,d			;bdb2	42 	B 
	sub b			;bdb3	90 	. 
	ld (l8270h),a		;bdb4	32 70 82 	2 p . 
	ld b,b			;bdb7	40 	@ 
	and b			;bdb8	a0 	. 
	add a,(hl)			;bdb9	86 	. 
	adc a,c			;bdba	89 	. 
	or d			;bdbb	b2 	. 
	cp h			;bdbc	bc 	. 
	cp a			;bdbd	bf 	. 
	cp a			;bdbe	bf 	. 
	cp l			;bdbf	bd 	. 
lbdc0h:
	or (hl)			;bdc0	b6 	. 
	sbc a,b			;bdc1	98 	. 
	add a,e			;bdc2	83 	. 
	and h			;bdc3	a4 	. 
	ld l,b			;bdc4	68 	h 
	add a,b			;bdc5	80 	. 
	inc sp			;bdc6	33 	3 
	ld a,h			;bdc7	7c 	| 
	add a,b			;bdc8	80 	. 
	ld b,h			;bdc9	44 	D 
	add a,b			;bdca	80 	. 
	ld b,b			;bdcb	40 	@ 
	sbc a,b			;bdcc	98 	. 
	adc a,(hl)			;bdcd	8e 	. 
	adc a,a			;bdce	8f 	. 
	cp a			;bdcf	bf 	. 
	cp a			;bdd0	bf 	. 
	sbc a,a			;bdd1	9f 	. 
	adc a,a			;bdd2	8f 	. 
	adc a,h			;bdd3	8c 	. 
	sub b			;bdd4	90 	. 
	ld l,h			;bdd5	6c 	l 
	add a,b			;bdd6	80 	. 
	ld a,(hl)			;bdd7	7e 	~ 
	add a,b			;bdd8	80 	. 
	inc sp			;bdd9	33 	3 
	ld d,l			;bdda	55 	U 
	add a,b			;bddb	80 	. 
	ld b,b			;bddc	40 	@ 
	add a,(hl)			;bddd	86 	. 
	ld a,b			;bdde	78 	x 
	add a,b			;bddf	80 	. 
	ld bc,l8270h		;bde0	01 70 82 	. p . 
	ld b,b			;bde3	40 	@ 
	adc a,e			;bde4	8b 	. 
	adc a,e			;bde5	8b 	. 
	ld h,b			;bde6	60 	` 
	add a,e			;bde7	83 	. 
	ld a,d			;bde8	7a 	z 
	add a,b			;bde9	80 	. 
	ld a,l			;bdea	7d 	} 
	add a,b			;bdeb	80 	. 
	ld d,b			;bdec	50 	P 
	add a,d			;bded	82 	. 
	ld b,b			;bdee	40 	@ 
	add a,h			;bdef	84 	. 
	nop			;bdf0	00 	. 
	ld b,055h		;bdf1	06 55 	. U 
	add a,b			;bdf3	80 	. 
	sub l			;bdf4	95 	. 
	ld a,080h		;bdf5	3e 80 	> . 
	sub l			;bdf7	95 	. 
	ld a,080h		;bdf8	3e 80 	> . 
	sub l			;bdfa	95 	. 
	ld a,080h		;bdfb	3e 80 	> . 
	sub l			;bdfd	95 	. 
	ld a,080h		;bdfe	3e 80 	> . 
	sub l			;be00	95 	. 
lbe01h:
	ld a,080h		;be01	3e 80 	> . 
	sub l			;be03	95 	. 
	ld a,080h		;be04	3e 80 	> . 
	sub l			;be06	95 	. 
	jr c,lbe68h		;be07	38 5f 	8 _ 
	add a,b			;be09	80 	. 
	ld b,c			;be0a	41 	A 
	and b			;be0b	a0 	. 
	ld b,b			;be0c	40 	@ 
	adc a,h			;be0d	8c 	. 
	and h			;be0e	a4 	. 
	ld c,e			;be0f	4b 	K 
	add a,b			;be10	80 	. 
	ld bc,l8055h		;be11	01 55 80 	. U . 
	ld b,b			;be14	40 	@ 
	sub l			;be15	95 	. 
	ld bc,0805fh		;be16	01 5f 80 	. _ . 
	ld b,c			;be19	41 	A 
	and b			;be1a	a0 	. 
	ld b,b			;be1b	40 	@ 
	adc a,h			;be1c	8c 	. 
	and h			;be1d	a4 	. 
	ld c,e			;be1e	4b 	K 
	add a,b			;be1f	80 	. 
	ld (l8840h),a		;be20	32 40 88 	2 @ . 
	add a,c			;be23	81 	. 
	sbc a,b			;be24	98 	. 
	and h			;be25	a4 	. 
	adc a,c			;be26	89 	. 
	or b			;be27	b0 	. 
	cp h			;be28	bc 	. 
	cp l			;be29	bd 	. 
	or h			;be2a	b4 	. 
	sbc a,b			;be2b	98 	. 
	and c			;be2c	a1 	. 
	adc a,h			;be2d	8c 	. 
	sub b			;be2e	90 	. 
	ld h,b			;be2f	60 	` 
	add a,c			;be30	81 	. 
	inc sp			;be31	33 	3 
	ld (hl),b			;be32	70 	p 
	add a,d			;be33	82 	. 
	ld d,b			;be34	50 	P 
	add a,b			;be35	80 	. 
	ld b,b			;be36	40 	@ 
	and b			;be37	a0 	. 
	cp e			;be38	bb 	. 
	cp a			;be39	bf 	. 
	cp a			;be3a	bf 	. 
	cp a			;be3b	bf 	. 
	cp a			;be3c	bf 	. 
	cp a			;be3d	bf 	. 
	or c			;be3e	b1 	. 
	add a,b			;be3f	80 	. 
	ld (hl),b			;be40	70 	p 
	add a,d			;be41	82 	. 
	ld a,d			;be42	7a 	z 
	add a,b			;be43	80 	. 
	inc sp			;be44	33 	3 
	ld d,a			;be45	57 	W 
	add a,b			;be46	80 	. 
	ld b,b			;be47	40 	@ 
	sbc a,b			;be48	98 	. 
	ld h,b			;be49	60 	` 
	add a,c			;be4a	81 	. 
	ld a,h			;be4b	7c 	| 
	add a,b			;be4c	80 	. 
	ld b,b			;be4d	40 	@ 
	adc a,b			;be4e	88 	. 
	xor a			;be4f	af 	. 
	xor a			;be50	af 	. 
	adc a,l			;be51	8d 	. 
	ld l,b			;be52	68 	h 
	add a,b			;be53	80 	. 
	ld (hl),h			;be54	74 	t 
	add a,b			;be55	80 	. 
	ld b,b			;be56	40 	@ 
	adc a,c			;be57	89 	. 
	ld b,d			;be58	42 	B 
	sub b			;be59	90 	. 
	inc (hl)			;be5a	34 	4 
	ld a,l			;be5b	7d 	} 
	add a,b			;be5c	80 	. 
	ld a,h			;be5d	7c 	| 
	add a,b			;be5e	80 	. 
	inc bc			;be5f	03 	. 
	add a,b			;be60	80 	. 
	add a,b			;be61	80 	. 
	ld a,(hl)			;be62	7e 	~ 
	add a,b			;be63	80 	. 
	ld (bc),a			;be64	02 	. 
	ld a,l			;be65	7d 	} 
	add a,b			;be66	80 	. 
	ld a,h			;be67	7c 	| 
lbe68h:
	add a,b			;be68	80 	. 
	nop			;be69	00 	. 
	ld b,055h		;be6a	06 55 	. U 
	add a,b			;be6c	80 	. 
	sub l			;be6d	95 	. 
	ld a,080h		;be6e	3e 80 	> . 
	sub l			;be70	95 	. 
	ld a,080h		;be71	3e 80 	> . 
	sub l			;be73	95 	. 
	ld a,080h		;be74	3e 80 	> . 
	sub l			;be76	95 	. 
	ld a,080h		;be77	3e 80 	> . 
	sub l			;be79	95 	. 
	ld a,080h		;be7a	3e 80 	> . 
	sub l			;be7c	95 	. 
	ld a,080h		;be7d	3e 80 	> . 
	sub l			;be7f	95 	. 
	add hl,sp			;be80	39 	9 
	ld b,a			;be81	47 	G 
	add a,b			;be82	80 	. 
	ld b,e			;be83	43 	C 
	or b			;be84	b0 	. 
	sub b			;be85	90 	. 
	ld l,a			;be86	6f 	o 
	add a,b			;be87	80 	. 
	ld bc,l8055h		;be88	01 55 80 	. U . 
	ld b,b			;be8b	40 	@ 
	sub l			;be8c	95 	. 
	ld (bc),a			;be8d	02 	. 
	ld b,a			;be8e	47 	G 
	add a,b			;be8f	80 	. 
	ld b,e			;be90	43 	C 
	or b			;be91	b0 	. 
	sub b			;be92	90 	. 
	ld l,a			;be93	6f 	o 
	add a,b			;be94	80 	. 
	ld (la041h),a		;be95	32 41 a0 	2 A . 
	ld b,b			;be98	40 	@ 
	add a,(hl)			;be99	86 	. 
	and b			;be9a	a0 	. 
	sub d			;be9b	92 	. 
	and h			;be9c	a4 	. 
	ld b,e			;be9d	43 	C 
	add a,b			;be9e	80 	. 
	ld b,c			;be9f	41 	A 
	or b			;bea0	b0 	. 
	ld b,b			;bea1	40 	@ 
	or l			;bea2	b5 	. 
	ld b,e			;bea3	43 	C 
	sub b			;bea4	90 	. 
	ld b,c			;bea5	41 	A 
	and b			;bea6	a0 	. 
	ld b,b			;bea7	40 	@ 
	add a,(hl)			;bea8	86 	. 
	or b			;bea9	b0 	. 
	add a,d			;beaa	82 	. 
	add a,h			;beab	84 	. 
	ld (l807ch),a		;beac	32 7c 80 	2 | . 
	ld b,b			;beaf	40 	@ 
	adc a,b			;beb0	88 	. 
	add a,c			;beb1	81 	. 
	add a,d			;beb2	82 	. 
	xor h			;beb3	ac 	. 
	cp a			;beb4	bf 	. 
	cp a			;beb5	bf 	. 
	cp a			;beb6	bf 	. 
	cp a			;beb7	bf 	. 
	cp l			;beb8	bd 	. 
	add a,(hl)			;beb9	86 	. 
	add a,b			;beba	80 	. 
	adc a,c			;bebb	89 	. 
	ld l,d			;bebc	6a 	j 
	add a,b			;bebd	80 	. 
	inc sp			;bebe	33 	3 
	ld e,a			;bebf	5f 	_ 
	add a,b			;bec0	80 	. 
	ld b,c			;bec1	41 	A 
	and b			;bec2	a0 	. 
	ld b,b			;bec3	40 	@ 
	add a,(hl)			;bec4	86 	. 
	ld (hl),b			;bec5	70 	p 
	add a,e			;bec6	83 	. 
	ld b,b			;bec7	40 	@ 
	and e			;bec8	a3 	. 
	cp a			;bec9	bf 	. 
	cp a			;beca	bf 	. 
	or a			;becb	b7 	. 
	ld h,b			;becc	60 	` 
	add a,e			;becd	83 	. 
	ld d,b			;bece	50 	P 
	add a,e			;becf	83 	. 
	ld b,b			;bed0	40 	@ 
	and h			;bed1	a4 	. 
	ld c,e			;bed2	4b 	K 
	add a,b			;bed3	80 	. 
	inc (hl)			;bed4	34 	4 
	ld (hl),l			;bed5	75 	u 
	add a,b			;bed6	80 	. 
	ld (hl),b			;bed7	70 	p 
lbed8h:
	add a,c			;bed8	81 	. 
	ld a,(hl)			;bed9	7e 	~ 
	add a,b			;beda	80 	. 
	ld bc,l807ch		;bedb	01 7c 80 	. | . 
	ld (hl),b			;bede	70 	p 
	add a,d			;bedf	82 	. 
	add a,d			;bee0	82 	. 
	ld a,b			;bee1	78 	x 
	add a,b			;bee2	80 	. 
	ld a,(hl)			;bee3	7e 	~ 
	add a,b			;bee4	80 	. 
	ld bc,l8074h		;bee5	01 74 80 	. t . 
	ld (hl),b			;bee8	70 	p 
	add a,c			;bee9	81 	. 
	nop			;beea	00 	. 
lbeebh:
	ld (hl),e			;beeb	73 	s 
	jr z,$+38		;beec	28 24 	( $ 
	ld l,e			;beee	6b 	k 
	rst 10h			;beef	d7 	. 
	jr z,lbf28h		;bef0	28 36 	( 6 
	ld e,d			;bef2	5a 	Z 
	or l			;bef3	b5 	. 
	jr z,lbf2ch		;bef4	28 36 	( 6 
	ld h,b			;bef6	60 	` 
	ret nz			;bef7	c0 	. 
	inc d			;bef8	14 	. 
	jr nc,$+109		;bef9	30 6b 	0 k 
	rst 10h			;befb	d7 	. 
	inc d			;befc	14 	. 
	dec l			;befd	2d 	- 
	ld l,e			;befe	6b 	k 
	rst 10h			;beff	d7 	. 
	dec h			;bf00	25 	% 
	jr z,$+82		;bf01	28 50 	( P 
	and c			;bf03	a1 	. 
	inc bc			;bf04	03 	. 
	ld bc,00101h		;bf05	01 01 01 	. . . 
	dec h			;bf08	25 	% 
	jr z,$+74		;bf09	28 48 	( H 
	sub b			;bf0b	90 	. 
	inc bc			;bf0c	03 	. 
	ld bc,00101h		;bf0d	01 01 01 	. . . 
lbf10h:
	dec h			;bf10	25 	% 
	ld (l8844h),hl		;bf11	22 44 88 	" D . 
	inc bc			;bf14	03 	. 
	ld bc,00101h		;bf15	01 01 01 	. . . 
	dec h			;bf18	25 	% 
	jr z,$+82		;bf19	28 50 	( P 
	and c			;bf1b	a1 	. 
	inc bc			;bf1c	03 	. 
	ld bc,00101h		;bf1d	01 01 01 	. . . 
	jr z,$+38		;bf20	28 24 	( $ 
	ld l,e			;bf22	6b 	k 
	rst 10h			;bf23	d7 	. 
	jr z,lbf5ch		;bf24	28 36 	( 6 
	ld e,d			;bf26	5a 	Z 
	or l			;bf27	b5 	. 
lbf28h:
	jr z,lbf60h		;bf28	28 36 	( 6 
	ld h,b			;bf2a	60 	` 
	ret nz			;bf2b	c0 	. 
lbf2ch:
	inc d			;bf2c	14 	. 
	jr nc,lbf9ah		;bf2d	30 6b 	0 k 
	rst 10h			;bf2f	d7 	. 
	inc d			;bf30	14 	. 
	dec l			;bf31	2d 	- 
	ld l,e			;bf32	6b 	k 
	rst 10h			;bf33	d7 	. 
	dec h			;bf34	25 	% 
	jr z,lbf87h		;bf35	28 50 	( P 
	and c			;bf37	a1 	. 
	inc bc			;bf38	03 	. 
	ld bc,00101h		;bf39	01 01 01 	. . . 
	dec h			;bf3c	25 	% 
	jr z,lbf87h		;bf3d	28 48 	( H 
	sub b			;bf3f	90 	. 
	inc bc			;bf40	03 	. 
	ld bc,00101h		;bf41	01 01 01 	. . . 
	dec h			;bf44	25 	% 
	ld (l8844h),hl		;bf45	22 44 88 	" D . 
	inc bc			;bf48	03 	. 
	ld bc,00101h		;bf49	01 01 01 	. . . 
	dec h			;bf4c	25 	% 
	jr z,lbf9fh		;bf4d	28 50 	( P 
	and c			;bf4f	a1 	. 
	inc bc			;bf50	03 	. 
	ld bc,00101h		;bf51	01 01 01 	. . . 
	dec h			;bf54	25 	% 
	inc h			;bf55	24 	$ 
	rst 10h			;bf56	d7 	. 
	ld l,e			;bf57	6b 	k 
	inc bc			;bf58	03 	. 
	ld bc,00101h		;bf59	01 01 01 	. . . 
lbf5ch:
	dec h			;bf5c	25 	% 
	dec de			;bf5d	1b 	. 
	ret nz			;bf5e	c0 	. 
	ld h,b			;bf5f	60 	` 
lbf60h:
	inc bc			;bf60	03 	. 
	ld bc,00101h		;bf61	01 01 01 	. . . 
	dec h			;bf64	25 	% 
	ld e,0a1h		;bf65	1e a1 	. . 
	ld d,b			;bf67	50 	P 
	inc bc			;bf68	03 	. 
	ld bc,00101h		;bf69	01 01 01 	. . . 
	dec h			;bf6c	25 	% 
	dec de			;bf6d	1b 	. 
	rst 10h			;bf6e	d7 	. 
	ld l,e			;bf6f	6b 	k 
	inc bc			;bf70	03 	. 
	ld bc,00101h		;bf71	01 01 01 	. . . 
	dec h			;bf74	25 	% 
	ld (050a1h),hl		;bf75	22 a1 50 	" . P 
	inc bc			;bf78	03 	. 
	ld bc,00101h		;bf79	01 01 01 	. . . 
	dec h			;bf7c	25 	% 
	ld (09048h),hl		;bf7d	22 48 90 	" H . 
	inc bc			;bf80	03 	. 
lbf81h:
	ld bc,00101h		;bf81	01 01 01 	. . . 
	dec h			;bf84	25 	% 
	dec de			;bf85	1b 	. 
	ld b,h			;bf86	44 	D 
lbf87h:
	adc a,b			;bf87	88 	. 
	inc bc			;bf88	03 	. 
	ld bc,00101h		;bf89	01 01 01 	. . . 
	dec h			;bf8c	25 	% 
	ld (la150h),hl		;bf8d	22 50 a1 	" P . 
	inc bc			;bf90	03 	. 
	ld bc,00101h		;bf91	01 01 01 	. . . 
	ld (03924h),hl		;bf94	22 24 39 	" $ 9 
	ret nz			;bf97	c0 	. 
	ld b,001h		;bf98	06 01 	. . 
lbf9ah:
	ld bc,02201h		;bf9a	01 01 22 	. . " 
	inc h			;bf9d	24 	$ 
	add hl,sp			;bf9e	39 	9 
lbf9fh:
	sub b			;bf9f	90 	. 
	ld b,001h		;bfa0	06 01 	. . 
	ld bc,01401h		;bfa2	01 01 14 	. . . 
	inc h			;bfa5	24 	$ 
lbfa6h:
	dec l			;bfa6	2d 	- 
	ld c,b			;bfa7	48 	H 
	inc d			;bfa8	14 	. 
	jr z,lbfdbh		;bfa9	28 30 	( 0 
	ld b,b			;bfab	40 	@ 
	inc d			;bfac	14 	. 
	dec l			;bfad	2d 	- 
	ld (hl),048h		;bfae	36 48 	6 H 
	inc d			;bfb0	14 	. 
	jr nc,$+59		;bfb1	30 39 	0 9 
lbfb3h:
	ld b,b			;bfb3	40 	@ 
	ld (04836h),hl		;bfb4	22 36 48 	" 6 H 
	rst 10h			;bfb7	d7 	. 
	ld b,001h		;bfb8	06 01 	. . 
	ld bc,02201h		;bfba	01 01 22 	. . " 
	inc h			;bfbd	24 	$ 
	add hl,sp			;bfbe	39 	9 
	sub b			;bfbf	90 	. 
	ld b,001h		;bfc0	06 01 	. . 
	ld bc,02a01h		;bfc2	01 01 2a 	. . * 
	dec de			;bfc5	1b 	. 
	dec hl			;bfc6	2b 	+ 
	ld l,h			;bfc7	6c 	l 
	ld bc,005dch		;bfc8	01 dc 05 	. . . 
	ld b,007h		;bfcb	06 07 	. . 
	ex af,af'			;bfcd	08 	. 
	dec b			;bfce	05 	. 
	add hl,bc			;bfcf	09 	. 
	ld a,(bc)			;bfd0	0a 	. 
	inc c			;bfd1	0c 	. 
	dec b			;bfd2	05 	. 
	dec bc			;bfd3	0b 	. 
	dec c			;bfd4	0d 	. 
	inc d			;bfd5	14 	. 
	dec b			;bfd6	05 	. 
	ld a,(bc)			;bfd7	0a 	. 
	inc c			;bfd8	0c 	. 
	ld c,005h		;bfd9	0e 05 	. . 
lbfdbh:
	inc d			;bfdb	14 	. 
	add hl,de			;bfdc	19 	. 
lbfddh:
	ld e,005h		;bfdd	1e 05 	. . 
	ld e,028h		;bfdf	1e 28 	. ( 
	ld (03205h),a		;bfe1	32 05 32 	2 . 2 
	inc a			;bfe4	3c 	< 
	ld d,b			;bfe5	50 	P 
	dec b			;bfe6	05 	. 
lbfe7h:
	ld h,h			;bfe7	64 	d 
	sub (hl)			;bfe8	96 	. 
	cp (hl)			;bfe9	be 	. 
	inc d			;bfea	14 	. 
	jp p,0f2f2h		;bfeb	f2 f2 f2 	. . . 
	ld bc,0098ch		;bfee	01 8c 09 	. . . 
	add a,b			;bff1	80 	. 
	ld c,h			;bff2	4c 	L 
lbff3h:
	ld b,b			;bff3	40 	@ 
	ld (bc),a			;bff4	02 	. 
	ld bc,00101h		;bff5	01 01 01 	. . . 
	add hl,bc			;bff8	09 	. 
	ld h,b			;bff9	60 	` 
	ld b,b			;bffa	40 	@ 
	jr nc,$+4		;bffb	30 02 	0 . 
	ld bc,00101h		;bffd	01 01 01 	. . . 
	add hl,bc			;c000	09 	. 
	ld c,h			;c001	4c 	L 
	jr nc,lc02ah		;c002	30 26 	0 & 
	ld (bc),a			;c004	02 	. 
	ld bc,00101h		;c005	01 01 01 	. . . 
	add hl,bc			;c008	09 	. 
	ld b,b			;c009	40 	@ 
	ld c,h			;c00a	4c 	L 
	jr nz,lc018h		;c00b	20 0b 	  . 
	ld bc,00101h		;c00d	01 01 01 	. . . 
	add hl,bc			;c010	09 	. 
	ld b,b			;c011	40 	@ 
	ld h,020h		;c012	26 20 	&   
	ld (bc),a			;c014	02 	. 
	ld bc,00101h		;c015	01 01 01 	. . . 
lc018h:
	add hl,bc			;c018	09 	. 
	ld b,b			;c019	40 	@ 
	ld c,h			;c01a	4c 	L 
	jr nz,$+4		;c01b	20 02 	  . 
	ld bc,00101h		;c01d	01 01 01 	. . . 
	ld a,(bc)			;c020	0a 	. 
	ld b,b			;c021	40 	@ 
	ld h,020h		;c022	26 20 	&   
	dec bc			;c024	0b 	. 
	ld bc,00101h		;c025	01 01 01 	. . . 
	ld a,(bc)			;c028	0a 	. 
	ld c,h			;c029	4c 	L 
lc02ah:
	jr nc,lc052h		;c02a	30 26 	0 & 
	dec bc			;c02c	0b 	. 
	ld bc,00101h		;c02d	01 01 01 	. . . 
	add hl,bc			;c030	09 	. 
	ld c,h			;c031	4c 	L 
	jr nc,lc05ah		;c032	30 26 	0 & 
	ld (bc),a			;c034	02 	. 
	ld bc,00101h		;c035	01 01 01 	. . . 
	add hl,bc			;c038	09 	. 
	ld c,h			;c039	4c 	L 
	jr nc,lc062h		;c03a	30 26 	0 & 
	ld (bc),a			;c03c	02 	. 
	ld bc,00101h		;c03d	01 01 01 	. . . 
	ld a,(bc)			;c040	0a 	. 
	ld c,h			;c041	4c 	L 
	jr nc,lc06ah		;c042	30 26 	0 & 
	dec bc			;c044	0b 	. 
	ld bc,00101h		;c045	01 01 01 	. . . 
	ld a,(bc)			;c048	0a 	. 
	ld h,b			;c049	60 	` 
	ld b,b			;c04a	40 	@ 
	jr nc,lc058h		;c04b	30 0b 	0 . 
	ld bc,00101h		;c04d	01 01 01 	. . . 
	ld a,(bc)			;c050	0a 	. 
	ld c,h			;c051	4c 	L 
lc052h:
	jr nc,lc07ah		;c052	30 26 	0 & 
	dec bc			;c054	0b 	. 
	ld bc,00101h		;c055	01 01 01 	. . . 
lc058h:
	ld a,(bc)			;c058	0a 	. 
	ld h,b			;c059	60 	` 
lc05ah:
	ld b,b			;c05a	40 	@ 
	jr nc,lc068h		;c05b	30 0b 	0 . 
	ld bc,00101h		;c05d	01 01 01 	. . . 
	jr z,lbfe7h		;c060	28 85 	( . 
lc062h:
	ld c,a			;c062	4f 	O 
	ld b,d			;c063	42 	B 
	dec bc			;c064	0b 	. 
	ld bc,00101h		;c065	01 01 01 	. . . 
lc068h:
	add hl,bc			;c068	09 	. 
	add a,b			;c069	80 	. 
lc06ah:
	ld c,h			;c06a	4c 	L 
	ld b,b			;c06b	40 	@ 
	ld (bc),a			;c06c	02 	. 
	ld bc,00101h		;c06d	01 01 01 	. . . 
	add hl,bc			;c070	09 	. 
	ld h,b			;c071	60 	` 
	ld b,b			;c072	40 	@ 
	jr nc,$+4		;c073	30 02 	0 . 
	ld bc,00101h		;c075	01 01 01 	. . . 
	add hl,bc			;c078	09 	. 
	ld c,h			;c079	4c 	L 
lc07ah:
	jr nc,lc0a2h		;c07a	30 26 	0 & 
	ld (bc),a			;c07c	02 	. 
	ld bc,00101h		;c07d	01 01 01 	. . . 
	ld a,(bc)			;c080	0a 	. 
	ld b,b			;c081	40 	@ 
	ld c,h			;c082	4c 	L 
	jr nz,lc090h		;c083	20 0b 	  . 
	ld bc,00101h		;c085	01 01 01 	. . . 
	add hl,bc			;c088	09 	. 
	ld b,b			;c089	40 	@ 
	ld h,020h		;c08a	26 20 	&   
	ld (bc),a			;c08c	02 	. 
	ld bc,00101h		;c08d	01 01 01 	. . . 
lc090h:
	add hl,bc			;c090	09 	. 
	ld b,b			;c091	40 	@ 
	ld c,h			;c092	4c 	L 
	jr nz,$+4		;c093	20 02 	  . 
	ld bc,00101h		;c095	01 01 01 	. . . 
	ld a,(bc)			;c098	0a 	. 
	ld b,b			;c099	40 	@ 
	ld h,020h		;c09a	26 20 	&   
	dec bc			;c09c	0b 	. 
	ld bc,00101h		;c09d	01 01 01 	. . . 
	ld a,(bc)			;c0a0	0a 	. 
	ld c,h			;c0a1	4c 	L 
lc0a2h:
	jr nc,lc0cah		;c0a2	30 26 	0 & 
	dec bc			;c0a4	0b 	. 
	ld bc,00101h		;c0a5	01 01 01 	. . . 
	ld a,(bc)			;c0a8	0a 	. 
	ld h,b			;c0a9	60 	` 
	ld b,b			;c0aa	40 	@ 
	jr nc,lc0b8h		;c0ab	30 0b 	0 . 
	ld bc,00101h		;c0ad	01 01 01 	. . . 
	ld a,(bc)			;c0b0	0a 	. 
	add a,b			;c0b1	80 	. 
	ld c,h			;c0b2	4c 	L 
	ld b,b			;c0b3	40 	@ 
	dec bc			;c0b4	0b 	. 
	ld bc,00101h		;c0b5	01 01 01 	. . . 
lc0b8h:
	add hl,bc			;c0b8	09 	. 
	add a,b			;c0b9	80 	. 
	ld c,h			;c0ba	4c 	L 
	ld b,b			;c0bb	40 	@ 
	ld (bc),a			;c0bc	02 	. 
	ld bc,00101h		;c0bd	01 01 01 	. . . 
	add hl,bc			;c0c0	09 	. 
	add a,b			;c0c1	80 	. 
	ld c,h			;c0c2	4c 	L 
	ld b,b			;c0c3	40 	@ 
	ld (bc),a			;c0c4	02 	. 
	ld bc,00101h		;c0c5	01 01 01 	. . . 
	ld a,(bc)			;c0c8	0a 	. 
	add a,b			;c0c9	80 	. 
lc0cah:
	ld c,h			;c0ca	4c 	L 
	ld b,b			;c0cb	40 	@ 
	dec bc			;c0cc	0b 	. 
	ld bc,00101h		;c0cd	01 01 01 	. . . 
	ret z			;c0d0	c8 	. 
	ld (08550h),a		;c0d1	32 50 85 	2 P . 
	ld bc,00555h		;c0d4	01 55 05 	. U . 
	pop af			;c0d7	f1 	. 
	jp nc,001f3h		;c0d8	d2 f3 01 	. . . 
lc0dbh:
	dec b			;c0db	05 	. 
	inc d			;c0dc	14 	. 
	inc b			;c0dd	04 	. 
	inc c			;c0de	0c 	. 
	ld e,012h		;c0df	1e 12 	. . 
	ld b,00bh		;c0e1	06 0b 	. . 
	inc hl			;c0e3	23 	# 
	djnz lc0eeh		;c0e4	10 08 	. . 
	ld a,(bc)			;c0e6	0a 	. 
	jr z,$+16		;c0e7	28 0e 	( . 
	ld a,(bc)			;c0e9	0a 	. 
	add hl,bc			;c0ea	09 	. 
	ld (00c0ch),a		;c0eb	32 0c 0c 	2 . . 
lc0eeh:
	rlca			;c0ee	07 	. 
	inc a			;c0ef	3c 	< 
	ld bc,01e0eh		;c0f0	01 0e 1e 	. . . 
	jr nz,$+29		;c0f3	20 1b 	  . 
	rla			;c0f5	17 	. 
	ld bc,01e36h		;c0f6	01 36 1e 	. 6 . 
	jr nz,$+29		;c0f9	20 1b 	  . 
	rla			;c0fb	17 	. 
	ld bc,01e36h		;c0fc	01 36 1e 	. 6 . 
	ld (0181ch),hl		;c0ff	22 1c 18 	" . . 
	ld bc,01e36h		;c102	01 36 1e 	. 6 . 
	inc h			;c105	24 	$ 
	ld e,019h		;c106	1e 19 	. . 
	ld bc,01e36h		;c108	01 36 1e 	. 6 . 
	ld h,020h		;c10b	26 20 	&   
	dec de			;c10d	1b 	. 
	ld bc,01e36h		;c10e	01 36 1e 	. 6 . 
	jr z,lc135h		;c111	28 22 	( " 
	inc e			;c113	1c 	. 
	ld bc,01e36h		;c114	01 36 1e 	. 6 . 
	dec hl			;c117	2b 	+ 
	inc h			;c118	24 	$ 
	ld e,001h		;c119	1e 01 	. . 
	ld (hl),01eh		;c11b	36 1e 	6 . 
	dec l			;c11d	2d 	- 
	ld h,020h		;c11e	26 20 	&   
	ld bc,01e36h		;c120	01 36 1e 	. 6 . 
	jr nc,lc14dh		;c123	30 28 	0 ( 
	ld (l9501h),hl		;c125	22 01 95 	" . . 
	ld e,036h		;c128	1e 36 	. 6 
	ld b,h			;c12a	44 	D 
	and c			;c12b	a1 	. 
	ld a,(bc)			;c12c	0a 	. 
	ld bc,00101h		;c12d	01 01 01 	. . . 
	ld (de),a			;c130	12 	. 
	ld b,h			;c131	44 	D 
	ld l,e			;c132	6b 	k 
	adc a,b			;c133	88 	. 
	ld (bc),a			;c134	02 	. 
lc135h:
	ld bc,l6c01h		;c135	01 01 6c 	. . l 
	ld (de),a			;c138	12 	. 
	ld e,d			;c139	5a 	Z 
	ld l,e			;c13a	6b 	k 
	or l			;c13b	b5 	. 
	ld (bc),a			;c13c	02 	. 
	ld bc,l6c01h		;c13d	01 01 6c 	. . l 
	ld e,051h		;c140	1e 51 	. Q 
	adc a,b			;c142	88 	. 
	and c			;c143	a1 	. 
	ld a,(bc)			;c144	0a 	. 
	ld bc,00101h		;c145	01 01 01 	. . . 
	ld (de),a			;c148	12 	. 
	ld (hl),051h		;c149	36 51 	6 Q 
	ld l,e			;c14b	6b 	k 
	ld (bc),a			;c14c	02 	. 
lc14dh:
	ld bc,05201h		;c14d	01 01 52 	. . R 
	ld (de),a			;c150	12 	. 
	inc sp			;c151	33 	3 
	ld d,c			;c152	51 	Q 
	ld h,l			;c153	65 	e 
	ld (bc),a			;c154	02 	. 
	ld bc,05201h		;c155	01 01 52 	. . R 
	ld (de),a			;c158	12 	. 
	jr nc,lc1bbh		;c159	30 60 	0 ` 
	adc a,b			;c15b	88 	. 
	ld (bc),a			;c15c	02 	. 
	ld bc,l6101h		;c15d	01 01 61 	. . a 
	ld (de),a			;c160	12 	. 
	ld b,h			;c161	44 	D 
	adc a,b			;c162	88 	. 
	and c			;c163	a1 	. 
	ld (bc),a			;c164	02 	. 
	ld bc,l8901h		;c165	01 01 89 	. . . 
	inc h			;c168	24 	$ 
	dec a			;c169	3d 	= 
	ld d,c			;c16a	51 	Q 
	ld a,c			;c16b	79 	y 
	inc b			;c16c	04 	. 
	ld bc,05201h		;c16d	01 01 52 	. . R 
	ld (de),a			;c170	12 	. 
	ld d,c			;c171	51 	Q 
	ld a,c			;c172	79 	y 
	and c			;c173	a1 	. 
	ld (bc),a			;c174	02 	. 
	ld bc,07a01h		;c175	01 01 7a 	. . z 
	ld (de),a			;c178	12 	. 
	ld b,h			;c179	44 	D 
	ld a,c			;c17a	79 	y 
	adc a,b			;c17b	88 	. 
	ld (bc),a			;c17c	02 	. 
	ld bc,07a01h		;c17d	01 01 7a 	. . z 
	inc h			;c180	24 	$ 
	jr nc,$+83		;c181	30 51 	0 Q 
	adc a,b			;c183	88 	. 
	inc b			;c184	04 	. 
	ld bc,05201h		;c185	01 01 52 	. . R 
	ld (de),a			;c188	12 	. 
	dec l			;c189	2d 	- 
	ld e,d			;c18a	5a 	Z 
	ld a,c			;c18b	79 	y 
	ld (bc),a			;c18c	02 	. 
	ld bc,07a01h		;c18d	01 01 7a 	. . z 
	ld (de),a			;c190	12 	. 
	ld e,03ch		;c191	1e 3c 	. < 
	ld a,c			;c193	79 	y 
	ld (bc),a			;c194	02 	. 
	ld bc,07a01h		;c195	01 01 7a 	. . z 
	ld (de),a			;c198	12 	. 
	ld (l9844h),hl		;c199	22 44 98 	" D . 
	ld (bc),a			;c19c	02 	. 
	ld bc,l9901h		;c19d	01 01 99 	. . . 
	ld (de),a			;c1a0	12 	. 
	ld e,03ch		;c1a1	1e 3c 	. < 
	sbc a,b			;c1a3	98 	. 
	ld (bc),a			;c1a4	02 	. 
	ld bc,l9901h		;c1a5	01 01 99 	. . . 
	ld (de),a			;c1a8	12 	. 
	ld h,04ch		;c1a9	26 4c 	& L 
	adc a,b			;c1ab	88 	. 
	ld (bc),a			;c1ac	02 	. 
	ld bc,l8901h		;c1ad	01 01 89 	. . . 
	ld (de),a			;c1b0	12 	. 
	ld e,03ch		;c1b1	1e 3c 	. < 
	adc a,b			;c1b3	88 	. 
	ld (bc),a			;c1b4	02 	. 
	ld bc,l8901h		;c1b5	01 01 89 	. . . 
	ld (de),a			;c1b8	12 	. 
	inc sp			;c1b9	33 	3 
	ld h,l			;c1ba	65 	e 
lc1bbh:
	and c			;c1bb	a1 	. 
	ld (bc),a			;c1bc	02 	. 
	ld bc,la301h		;c1bd	01 01 a3 	. . . 
	ld (de),a			;c1c0	12 	. 
	jr z,lc214h		;c1c1	28 51 	( Q 
	and c			;c1c3	a1 	. 
	ld (bc),a			;c1c4	02 	. 
	ld bc,la301h		;c1c5	01 01 a3 	. . . 
	inc d			;c1c8	14 	. 
	dec l			;c1c9	2d 	- 
	ld e,d			;c1ca	5a 	Z 
	or l			;c1cb	b5 	. 
	dec b			;c1cc	05 	. 
	ld e,026h		;c1cd	1e 26 	. & 
	ld h,l			;c1cf	65 	e 
	dec b			;c1d0	05 	. 
	dec de			;c1d1	1b 	. 
	ld (0055ah),hl		;c1d2	22 5a 05 	" Z . 
	ld e,026h		;c1d5	1e 26 	. & 
	ld h,l			;c1d7	65 	e 
	dec b			;c1d8	05 	. 
	dec de			;c1d9	1b 	. 
	ld (00f5ah),hl		;c1da	22 5a 0f 	" Z . 
	inc a			;c1dd	3c 	< 
	ld d,c			;c1de	51 	Q 
	ld a,c			;c1df	79 	y 
	dec b			;c1e0	05 	. 
	ld bc,00101h		;c1e1	01 01 01 	. . . 
	rrca			;c1e4	0f 	. 
	ld (hl),05ah		;c1e5	36 5a 	6 Z 
	ld l,e			;c1e7	6b 	k 
	dec b			;c1e8	05 	. 
	ld bc,00101h		;c1e9	01 01 01 	. . . 
	ld d,02dh		;c1ec	16 2d 	. - 
	or l			;c1ee	b5 	. 
	ld e,d			;c1ef	5a 	Z 
	ld bc,00b14h		;c1f0	01 14 0b 	. . . 
	jr nz,$+29		;c1f3	20 1b 	  . 
	rla			;c1f5	17 	. 
	ld bc,00b14h		;c1f6	01 14 0b 	. . . 
	ld (0181ch),hl		;c1f9	22 1c 18 	" . . 
	ld bc,00b14h		;c1fc	01 14 0b 	. . . 
	inc h			;c1ff	24 	$ 
	ld e,019h		;c200	1e 19 	. . 
	ld bc,00b14h		;c202	01 14 0b 	. . . 
	jr nz,$+29		;c205	20 1b 	  . 
	rla			;c207	17 	. 
	ld bc,00b14h		;c208	01 14 0b 	. . . 
	ld (0181ch),hl		;c20b	22 1c 18 	" . . 
	ld bc,00b14h		;c20e	01 14 0b 	. . . 
	inc h			;c211	24 	$ 
	ld e,019h		;c212	1e 19 	. . 
lc214h:
	ld bc,00b14h		;c214	01 14 0b 	. . . 
	jr nz,$+29		;c217	20 1b 	  . 
	rla			;c219	17 	. 
	ld bc,00b14h		;c21a	01 14 0b 	. . . 
	ld (0181ch),hl		;c21d	22 1c 18 	" . . 
	ld bc,00b14h		;c220	01 14 0b 	. . . 
	inc h			;c223	24 	$ 
	ld e,019h		;c224	1e 19 	. . 
	ld bc,00b14h		;c226	01 14 0b 	. . . 
	jr nz,$+29		;c229	20 1b 	  . 
	rla			;c22b	17 	. 
	ld bc,00b14h		;c22c	01 14 0b 	. . . 
	ld (0181ch),hl		;c22f	22 1c 18 	" . . 
	ld bc,00b14h		;c232	01 14 0b 	. . . 
	inc h			;c235	24 	$ 
	ld e,019h		;c236	1e 19 	. . 
	ld bc,00b14h		;c238	01 14 0b 	. . . 
	jr nz,lc258h		;c23b	20 1b 	  . 
	rla			;c23d	17 	. 
	ld bc,00b14h		;c23e	01 14 0b 	. . . 
	ld (0181ch),hl		;c241	22 1c 18 	" . . 
	ld bc,00b14h		;c244	01 14 0b 	. . . 
	inc h			;c247	24 	$ 
	ld e,019h		;c248	1e 19 	. . 
	ld bc,0094ch		;c24a	01 4c 09 	. L . 
	xor d			;c24d	aa 	. 
	and b			;c24e	a0 	. 
	sub (hl)			;c24f	96 	. 
	ld bc,018a6h		;c250	01 a6 18 	. . . 
	ld h,001h		;c253	26 01 	& . 
	ld bc,00108h		;c255	01 08 01 	. . . 
lc258h:
	ld bc,01801h		;c258	01 01 18 	. . . 
	jr z,$+3		;c25b	28 01 	( . 
	ld bc,00108h		;c25d	01 08 01 	. . . 
	ld bc,01801h		;c260	01 01 18 	. . . 
	ld h,001h		;c263	26 01 	& . 
	ld bc,00108h		;c265	01 08 01 	. . . 
	ld bc,00c01h		;c268	01 01 0c 	. . . 
	jr nc,$+3		;c26b	30 01 	0 . 
	ld bc,00104h		;c26d	01 04 01 	. . . 
	ld bc,00c01h		;c270	01 01 0c 	. . . 
	jr nc,$+3		;c273	30 01 	0 . 
	ld bc,00104h		;c275	01 04 01 	. . . 
	ld bc,01801h		;c278	01 01 18 	. . . 
	inc sp			;c27b	33 	3 
	ld bc,00801h		;c27c	01 01 08 	. . . 
	ld bc,00101h		;c27f	01 01 01 	. . . 
	jr lc2bdh		;c282	18 39 	. 9 
	ld bc,00801h		;c284	01 01 08 	. . . 
	ld bc,00101h		;c287	01 01 01 	. . . 
	jr lc2cch		;c28a	18 40 	. @ 
	ld c,h			;c28c	4c 	L 
	ld bc,00108h		;c28d	01 08 01 	. . . 
	ld bc,01801h		;c290	01 01 18 	. . . 
	ld b,h			;c293	44 	D 
	ld d,c			;c294	51 	Q 
	ld bc,00108h		;c295	01 08 01 	. . . 
	ld bc,01801h		;c298	01 01 18 	. . . 
	ld c,h			;c29b	4c 	L 
	sbc a,b			;c29c	98 	. 
	ld h,l			;c29d	65 	e 
	ex af,af'			;c29e	08 	. 
	ld bc,00101h		;c29f	01 01 01 	. . . 
	inc c			;c2a2	0c 	. 
	ld b,h			;c2a3	44 	D 
	adc a,b			;c2a4	88 	. 
	ld d,c			;c2a5	51 	Q 
	inc b			;c2a6	04 	. 
	ld bc,00101h		;c2a7	01 01 01 	. . . 
lc2aah:
	inc c			;c2aa	0c 	. 
	ld b,b			;c2ab	40 	@ 
	add a,b			;c2ac	80 	. 
	ld c,h			;c2ad	4c 	L 
	inc b			;c2ae	04 	. 
	ld bc,00101h		;c2af	01 01 01 	. . . 
	jr $+53		;c2b2	18 33 	. 3 
	ld h,(hl)			;c2b4	66 	f 
	sbc a,b			;c2b5	98 	. 
	ex af,af'			;c2b6	08 	. 
	ld bc,00101h		;c2b7	01 01 01 	. . . 
	inc c			;c2ba	0c 	. 
	ld b,h			;c2bb	44 	D 
	adc a,b			;c2bc	88 	. 
lc2bdh:
	ld d,c			;c2bd	51 	Q 
	inc b			;c2be	04 	. 
	ld bc,00101h		;c2bf	01 01 01 	. . . 
	inc c			;c2c2	0c 	. 
	ld b,b			;c2c3	40 	@ 
	add a,b			;c2c4	80 	. 
	ld c,h			;c2c5	4c 	L 
	inc b			;c2c6	04 	. 
	ld bc,00101h		;c2c7	01 01 01 	. . . 
	djnz $+78		;c2ca	10 4c 	. L 
lc2cch:
	sbc a,b			;c2cc	98 	. 
	ld e,d			;c2cd	5a 	Z 
	djnz lc314h		;c2ce	10 44 	. D 
	adc a,b			;c2d0	88 	. 
	ld d,c			;c2d1	51 	Q 
	djnz lc314h		;c2d2	10 40 	. @ 
	add a,b			;c2d4	80 	. 
	ld c,h			;c2d5	4c 	L 
	djnz lc31ch		;c2d6	10 44 	. D 
	adc a,b			;c2d8	88 	. 
	ld d,c			;c2d9	51 	Q 
	djnz lc31ch		;c2da	10 40 	. @ 
	add a,b			;c2dc	80 	. 
	ld c,h			;c2dd	4c 	L 
	djnz lc319h		;c2de	10 39 	. 9 
	ld (hl),d			;c2e0	72 	r 
	ld b,h			;c2e1	44 	D 
	djnz lc324h		;c2e2	10 40 	. @ 
	add a,b			;c2e4	80 	. 
	ld c,h			;c2e5	4c 	L 
	djnz lc321h		;c2e6	10 39 	. 9 
	ld (hl),d			;c2e8	72 	r 
	ld b,h			;c2e9	44 	D 
	jr $+53		;c2ea	18 33 	. 3 
	ld h,(hl)			;c2ec	66 	f 
	ld b,b			;c2ed	40 	@ 
	ex af,af'			;c2ee	08 	. 
	ld bc,00101h		;c2ef	01 01 01 	. . . 
	ex af,af'			;c2f2	08 	. 
	jr nc,lc355h		;c2f3	30 60 	0 ` 
	ld b,b			;c2f5	40 	@ 
	ex af,af'			;c2f6	08 	. 
	dec l			;c2f7	2d 	- 
	ld e,d			;c2f8	5a 	Z 
	add hl,sp			;c2f9	39 	9 
	ex af,af'			;c2fa	08 	. 
	dec hl			;c2fb	2b 	+ 
	ld d,(hl)			;c2fc	56 	V 
	ld (hl),008h		;c2fd	36 08 	6 . 
	jr z,lc352h		;c2ff	28 51 	( Q 
	inc sp			;c301	33 	3 
	jr lc32ah		;c302	18 26 	. & 
	ld c,h			;c304	4c 	L 
	ld b,b			;c305	40 	@ 
	ex af,af'			;c306	08 	. 
	ld bc,00101h		;c307	01 01 01 	. . . 
	inc d			;c30a	14 	. 
	ld c,h			;c30b	4c 	L 
	add a,b			;c30c	80 	. 
	ld h,l			;c30d	65 	e 
	ld bc,0283ah		;c30e	01 3a 28 	. : ( 
	inc sp			;c311	33 	3 
	ld a,c			;c312	79 	y 
	sbc a,b			;c313	98 	. 
lc314h:
	jr z,$+59		;c314	28 39 	( 9 
	ld bc,02801h		;c316	01 01 28 	. . ( 
lc319h:
	inc a			;c319	3c 	< 
	ld a,c			;c31a	79 	y 
	sbc a,b			;c31b	98 	. 
lc31ch:
	jr z,lc362h		;c31c	28 44 	( D 
	ld bc,03c01h		;c31e	01 01 3c 	. . < 
lc321h:
	ld c,h			;c321	4c 	L 
	ld h,l			;c322	65 	e 
	ld a,c			;c323	79 	y 
lc324h:
	inc d			;c324	14 	. 
	ld bc,00101h		;c325	01 01 01 	. . . 
	inc a			;c328	3c 	< 
	inc sp			;c329	33 	3 
lc32ah:
	ld a,c			;c32a	79 	y 
	sbc a,b			;c32b	98 	. 
	inc d			;c32c	14 	. 
	ld bc,00101h		;c32d	01 01 01 	. . . 
	inc a			;c330	3c 	< 
	dec l			;c331	2d 	- 
	ld c,h			;c332	4c 	L 
	ld (hl),d			;c333	72 	r 
	inc d			;c334	14 	. 
	ld bc,00101h		;c335	01 01 01 	. . . 
	inc a			;c338	3c 	< 
	add hl,sp			;c339	39 	9 
	ld e,d			;c33a	5a 	Z 
	sbc a,b			;c33b	98 	. 
	inc d			;c33c	14 	. 
	ld bc,00101h		;c33d	01 01 01 	. . . 
	adc a,h			;c340	8c 	. 
	inc sp			;c341	33 	3 
	ld c,h			;c342	4c 	L 
	ld a,c			;c343	79 	y 
	inc d			;c344	14 	. 
	ld bc,00101h		;c345	01 01 01 	. . . 
	jr z,lc37dh		;c348	28 33 	( 3 
	ld a,c			;c34a	79 	y 
	sbc a,b			;c34b	98 	. 
	jr z,$+59		;c34c	28 39 	( 9 
	ld bc,02801h		;c34e	01 01 28 	. . ( 
	inc a			;c351	3c 	< 
lc352h:
	ld bc,02801h		;c352	01 01 28 	. . ( 
lc355h:
	ld b,h			;c355	44 	D 
	ld bc,02801h		;c356	01 01 28 	. . ( 
	ld c,h			;c359	4c 	L 
	ld a,c			;c35a	79 	y 
	sbc a,b			;c35b	98 	. 
	jr z,lc3a2h		;c35c	28 44 	( D 
	ld bc,02801h		;c35e	01 01 28 	. . ( 
	inc a			;c361	3c 	< 
lc362h:
	ld c,h			;c362	4c 	L 
	ld h,l			;c363	65 	e 
	jr z,lc3b2h		;c364	28 4c 	( L 
	ld bc,02801h		;c366	01 01 28 	. . ( 
	inc a			;c369	3c 	< 
	sbc a,b			;c36a	98 	. 
	or l			;c36b	b5 	. 
	jr z,lc3b2h		;c36c	28 44 	( D 
	ld bc,02801h		;c36e	01 01 28 	. . ( 
	ld c,h			;c371	4c 	L 
	ld bc,02801h		;c372	01 01 28 	. . ( 
	ld d,c			;c375	51 	Q 
	ld bc,03c01h		;c376	01 01 3c 	. . < 
	ld e,d			;c379	5a 	Z 
	ld a,c			;c37a	79 	y 
	sbc a,b			;c37b	98 	. 
	inc d			;c37c	14 	. 
lc37dh:
	ld bc,00101h		;c37d	01 01 01 	. . . 
	inc a			;c380	3c 	< 
	inc a			;c381	3c 	< 
	ld e,d			;c382	5a 	Z 
	ld c,h			;c383	4c 	L 
	inc d			;c384	14 	. 
	ld bc,00101h		;c385	01 01 01 	. . . 
	jr z,lc3ceh		;c388	28 44 	( D 
	and c			;c38a	a1 	. 
	ld h,l			;c38b	65 	e 
	jr z,lc3dah		;c38c	28 4c 	( L 
	ld bc,02801h		;c38e	01 01 28 	. . ( 
	ld d,c			;c391	51 	Q 
	ld bc,02801h		;c392	01 01 28 	. . ( 
	ld e,d			;c395	5a 	Z 
	ld bc,02801h		;c396	01 01 28 	. . ( 
	ld h,l			;c399	65 	e 
	adc a,b			;c39a	88 	. 
	and c			;c39b	a1 	. 
	jr z,$+83		;c39c	28 51 	( Q 
	ld bc,02801h		;c39e	01 01 28 	. . ( 
	ld b,h			;c3a1	44 	D 
lc3a2h:
	ld bc,02801h		;c3a2	01 01 28 	. . ( 
	ld d,c			;c3a5	51 	Q 
	ld bc,02801h		;c3a6	01 01 28 	. . ( 
	inc a			;c3a9	3c 	< 
	ld e,d			;c3aa	5a 	Z 
	sbc a,b			;c3ab	98 	. 
	jr z,lc3f2h		;c3ac	28 44 	( D 
	ld bc,02801h		;c3ae	01 01 28 	. . ( 
	ld c,h			;c3b1	4c 	L 
lc3b2h:
	ld bc,02801h		;c3b2	01 01 28 	. . ( 
	ld d,c			;c3b5	51 	Q 
	ld bc,02801h		;c3b6	01 01 28 	. . ( 
	ld e,d			;c3b9	5a 	Z 
	ld a,c			;c3ba	79 	y 
	sbc a,b			;c3bb	98 	. 
	jr z,lc40ah		;c3bc	28 4c 	( L 
	ld bc,02801h		;c3be	01 01 28 	. . ( 
	inc a			;c3c1	3c 	< 
	ld bc,02801h		;c3c2	01 01 28 	. . ( 
	ld c,h			;c3c5	4c 	L 
	ld bc,02801h		;c3c6	01 01 28 	. . ( 
	add hl,sp			;c3c9	39 	9 
	ld d,c			;c3ca	51 	Q 
	adc a,b			;c3cb	88 	. 
	jr z,lc40ah		;c3cc	28 3c 	( < 
lc3ceh:
	ld bc,02801h		;c3ce	01 01 28 	. . ( 
	ld b,h			;c3d1	44 	D 
	ld bc,02801h		;c3d2	01 01 28 	. . ( 
	ld c,h			;c3d5	4c 	L 
	ld bc,02801h		;c3d6	01 01 28 	. . ( 
	ld d,c			;c3d9	51 	Q 
lc3dah:
	ld (hl),d			;c3da	72 	r 
	adc a,b			;c3db	88 	. 
	jr z,$+70		;c3dc	28 44 	( D 
	ld bc,02801h		;c3de	01 01 28 	. . ( 
	inc a			;c3e1	3c 	< 
	ld d,c			;c3e2	51 	Q 
	adc a,b			;c3e3	88 	. 
	jr z,lc41fh		;c3e4	28 39 	( 9 
	ld bc,03c01h		;c3e6	01 01 3c 	. . < 
	ld h,02dh		;c3e9	26 2d 	& - 
	add hl,sp			;c3eb	39 	9 
	inc d			;c3ec	14 	. 
	ld bc,00101h		;c3ed	01 01 01 	. . . 
	inc a			;c3f0	3c 	< 
	dec l			;c3f1	2d 	- 
lc3f2h:
	add hl,sp			;c3f2	39 	9 
	ld b,h			;c3f3	44 	D 
	inc d			;c3f4	14 	. 
	ld bc,00101h		;c3f5	01 01 01 	. . . 
	inc a			;c3f8	3c 	< 
	add hl,sp			;c3f9	39 	9 
	ld b,h			;c3fa	44 	D 
	ld d,c			;c3fb	51 	Q 
	inc d			;c3fc	14 	. 
	ld bc,00101h		;c3fd	01 01 01 	. . . 
	inc a			;c400	3c 	< 
	ld d,c			;c401	51 	Q 
	ld h,l			;c402	65 	e 
	ld (hl),d			;c403	72 	r 
	inc d			;c404	14 	. 
	ld bc,00101h		;c405	01 01 01 	. . . 
	adc a,h			;c408	8c 	. 
	ld c,h			;c409	4c 	L 
lc40ah:
	ld a,c			;c40a	79 	y 
	sbc a,b			;c40b	98 	. 
	inc d			;c40c	14 	. 
	ld bc,00101h		;c40d	01 01 01 	. . . 
	ld d,b			;c410	50 	P 
	ld h,03ch		;c411	26 3c 	& < 
	ld c,h			;c413	4c 	L 
	ld bc,01e31h		;c414	01 31 1e 	. 1 . 
	inc sp			;c417	33 	3 
	ld h,l			;c418	65 	e 
	rr (hl)		;c419	cb 1e 	. . 
	ld c,h			;c41b	4c 	L 
	sbc a,b			;c41c	98 	. 
	or l			;c41d	b5 	. 
	inc a			;c41e	3c 	< 
lc41fh:
	inc sp			;c41f	33 	3 
	ld h,l			;c420	65 	e 
	rr (hl)		;c421	cb 1e 	. . 
	dec l			;c423	2d 	- 
	ld e,d			;c424	5a 	Z 
	or l			;c425	b5 	. 
	ld e,044h		;c426	1e 44 	. D 
	adc a,b			;c428	88 	. 
	and c			;c429	a1 	. 
	inc a			;c42a	3c 	< 
	dec l			;c42b	2d 	- 
	ld e,d			;c42c	5a 	Z 
	or l			;c42d	b5 	. 
	ld e,028h		;c42e	1e 28 	. ( 
	ld d,c			;c430	51 	Q 
	and c			;c431	a1 	. 
	ld e,03ch		;c432	1e 3c 	. < 
	ld a,c			;c434	79 	y 
	pop af			;c435	f1 	. 
	inc a			;c436	3c 	< 
	jr z,lc48ah		;c437	28 51 	( Q 
	and c			;c439	a1 	. 
	jp m,l5a26h		;c43a	fa 26 5a 	. & Z 
	ld (hl),d			;c43d	72 	r 
	ret z			;c43e	c8 	. 
	ld bc,00101h		;c43f	01 01 01 	. . . 
	jr z,$+103		;c442	28 65 	( e 
	ld a,c			;c444	79 	y 
	ld bc,00128h		;c445	01 28 01 	. ( . 
	ld bc,04698h		;c448	01 98 46 	. . F 
	ld h,l			;c44b	65 	e 
	ld a,c			;c44c	79 	y 
	ld bc,0010ah		;c44d	01 0a 01 	. . . 
	ld bc,02801h		;c450	01 01 28 	. . ( 
	ld e,d			;c453	5a 	Z 
	ld (hl),d			;c454	72 	r 
	ld bc,00128h		;c455	01 28 01 	. ( . 
	ld bc,04688h		;c458	01 88 46 	. . F 
	ld e,d			;c45b	5a 	Z 
	ld (hl),d			;c45c	72 	r 
	ld bc,0010ah		;c45d	01 0a 01 	. . . 
	ld bc,02801h		;c460	01 01 28 	. . ( 
	ld d,c			;c463	51 	Q 
	ld h,l			;c464	65 	e 
	ld bc,00128h		;c465	01 28 01 	. ( . 
	ld bc,04679h		;c468	01 79 46 	. y F 
	ld d,c			;c46b	51 	Q 
	ld h,l			;c46c	65 	e 
	ld bc,0010ah		;c46d	01 0a 01 	. . . 
	ld bc,l7801h		;c470	01 01 78 	. . x 
	ld e,d			;c473	5a 	Z 
	ld (hl),d			;c474	72 	r 
	adc a,b			;c475	88 	. 
	jr z,$+3		;c476	28 01 	( . 
	ld bc,02601h		;c478	01 01 26 	. . & 
	ld h,l			;c47b	65 	e 
	ld a,c			;c47c	79 	y 
	ld bc,00102h		;c47d	01 02 01 	. . . 
	ld bc,02601h		;c480	01 01 26 	. . & 
	ld bc,l9801h		;c483	01 01 98 	. . . 
	ld (bc),a			;c486	02 	. 
	ld bc,00101h		;c487	01 01 01 	. . . 
lc48ah:
	ld b,(hl)			;c48a	46 	F 
	ld h,l			;c48b	65 	e 
	ld a,c			;c48c	79 	y 
	ld bc,0010ah		;c48d	01 0a 01 	. . . 
	ld bc,02601h		;c490	01 01 26 	. . & 
	ld e,d			;c493	5a 	Z 
	ld (hl),d			;c494	72 	r 
	ld bc,00102h		;c495	01 02 01 	. . . 
	ld bc,02601h		;c498	01 01 26 	. . & 
	ld bc,l8801h		;c49b	01 01 88 	. . . 
	ld (bc),a			;c49e	02 	. 
	ld bc,00101h		;c49f	01 01 01 	. . . 
	ld b,(hl)			;c4a2	46 	F 
	ld e,d			;c4a3	5a 	Z 
	ld (hl),d			;c4a4	72 	r 
	ld bc,0010ah		;c4a5	01 0a 01 	. . . 
	ld bc,02601h		;c4a8	01 01 26 	. . & 
	ld d,c			;c4ab	51 	Q 
	ld h,l			;c4ac	65 	e 
	ld bc,00102h		;c4ad	01 02 01 	. . . 
	ld bc,02601h		;c4b0	01 01 26 	. . & 
	ld bc,07901h		;c4b3	01 01 79 	. . y 
	ld (bc),a			;c4b6	02 	. 
	ld bc,00101h		;c4b7	01 01 01 	. . . 
	ld b,(hl)			;c4ba	46 	F 
	ld d,c			;c4bb	51 	Q 
	ld h,l			;c4bc	65 	e 
	ld bc,0010ah		;c4bd	01 0a 01 	. . . 
	ld bc,l7801h		;c4c0	01 01 78 	. . x 
	ld c,h			;c4c3	4c 	L 
	ld e,d			;c4c4	5a 	Z 
	ld (hl),d			;c4c5	72 	r 
	jr z,$+3		;c4c6	28 01 	( . 
	ld bc,02201h		;c4c8	01 01 22 	. . " 
	inc a			;c4cb	3c 	< 
	ld e,d			;c4cc	5a 	Z 
	ld (hl),d			;c4cd	72 	r 
	ld b,001h		;c4ce	06 01 	. . 
	ld e,d			;c4d0	5a 	Z 
	ld (hl),d			;c4d1	72 	r 
	ld (l5a44h),hl		;c4d2	22 44 5a 	" D Z 
	ld (hl),d			;c4d5	72 	r 
	ld b,001h		;c4d6	06 01 	. . 
	ld e,d			;c4d8	5a 	Z 
	ld (hl),d			;c4d9	72 	r 
	ld b,(hl)			;c4da	46 	F 
	ld c,h			;c4db	4c 	L 
	ld e,d			;c4dc	5a 	Z 
	ld (hl),d			;c4dd	72 	r 
	ld a,(bc)			;c4de	0a 	. 
	ld bc,00101h		;c4df	01 01 01 	. . . 
	ld (l653ch),hl		;c4e2	22 3c 65 	" < e 
	ld a,c			;c4e5	79 	y 
	ld b,001h		;c4e6	06 01 	. . 
	ld e,d			;c4e8	5a 	Z 
	ld (hl),d			;c4e9	72 	r 
	ld (l6544h),hl		;c4ea	22 44 65 	" D e 
	ld a,c			;c4ed	79 	y 
	ld b,001h		;c4ee	06 01 	. . 
	ld e,d			;c4f0	5a 	Z 
	ld (hl),d			;c4f1	72 	r 
	ld b,(hl)			;c4f2	46 	F 
	ld c,h			;c4f3	4c 	L 
	ld h,l			;c4f4	65 	e 
	ld a,c			;c4f5	79 	y 
	ld a,(bc)			;c4f6	0a 	. 
	ld bc,00101h		;c4f7	01 01 01 	. . . 
	ld (l723ch),hl		;c4fa	22 3c 72 	" < r 
	adc a,b			;c4fd	88 	. 
	ld b,001h		;c4fe	06 01 	. . 
	ld e,d			;c500	5a 	Z 
	ld (hl),d			;c501	72 	r 
	ld (l7244h),hl		;c502	22 44 72 	" D r 
	adc a,b			;c505	88 	. 
	ld b,001h		;c506	06 01 	. . 
	ld e,d			;c508	5a 	Z 
	ld (hl),d			;c509	72 	r 
	ld b,(hl)			;c50a	46 	F 
	ld c,h			;c50b	4c 	L 
	ld (hl),d			;c50c	72 	r 
	adc a,b			;c50d	88 	. 
	ld a,(bc)			;c50e	0a 	. 
	ld bc,00101h		;c50f	01 01 01 	. . . 
	and b			;c512	a0 	. 
	inc sp			;c513	33 	3 
	ld a,c			;c514	79 	y 
	sbc a,b			;c515	98 	. 
	ld h,026h		;c516	26 26 	& & 
	ld bc,00201h		;c518	01 01 02 	. . . 
	ld bc,00101h		;c51b	01 01 01 	. . . 
	ld h,026h		;c51e	26 26 	& & 
	dec l			;c520	2d 	- 
	ld bc,00102h		;c521	01 02 01 	. . . 
	ld bc,02801h		;c524	01 01 28 	. . ( 
	ld h,02dh		;c527	26 2d 	& - 
	add hl,sp			;c529	39 	9 
	jr z,$+3		;c52a	28 01 	( . 
	ld bc,02601h		;c52c	01 01 26 	. . & 
	jr z,$+3		;c52f	28 01 	( . 
	ld bc,00102h		;c531	01 02 01 	. . . 
	ld bc,02601h		;c534	01 01 26 	. . & 
	jr z,lc56ch		;c537	28 33 	( 3 
	ld bc,00102h		;c539	01 02 01 	. . . 
	ld bc,02801h		;c53c	01 01 28 	. . ( 
	jr z,lc574h		;c53f	28 33 	( 3 
	inc a			;c541	3c 	< 
	jr z,$+3		;c542	28 01 	( . 
	ld bc,02601h		;c544	01 01 26 	. . & 
	dec l			;c547	2d 	- 
	ld bc,00201h		;c548	01 01 02 	. . . 
	ld bc,00101h		;c54b	01 01 01 	. . . 
	ld h,02dh		;c54e	26 2d 	& - 
	add hl,sp			;c550	39 	9 
	ld bc,00102h		;c551	01 02 01 	. . . 
	ld bc,02801h		;c554	01 01 28 	. . ( 
	dec l			;c557	2d 	- 
	add hl,sp			;c558	39 	9 
	ld b,h			;c559	44 	D 
	jr z,$+3		;c55a	28 01 	( . 
	ld bc,l8c01h		;c55c	01 01 8c 	. . . 
	ld h,065h		;c55f	26 65 	& e 
	ld a,c			;c561	79 	y 
	inc e			;c562	1c 	. 
	ld bc,00101h		;c563	01 01 01 	. . . 
	and b			;c566	a0 	. 
	ld c,h			;c567	4c 	L 
	ld e,d			;c568	5a 	Z 
	ld (hl),d			;c569	72 	r 
	inc c			;c56a	0c 	. 
	ld c,h			;c56b	4c 	L 
lc56ch:
	ld bc,lbe01h		;c56c	01 01 be 	. . . 
	ld c,h			;c56f	4c 	L 
	ld h,l			;c570	65 	e 
	ld a,c			;c571	79 	y 
	inc c			;c572	0c 	. 
	ld c,h			;c573	4c 	L 
lc574h:
	ld bc,0dc01h		;c574	01 01 dc 	. . . 
	ld c,h			;c577	4c 	L 
	ld (hl),d			;c578	72 	r 
	adc a,b			;c579	88 	. 
	inc c			;c57a	0c 	. 
	ld c,h			;c57b	4c 	L 
	ld bc,0ff01h		;c57c	01 01 ff 	. . . 
	ld a,c			;c57f	79 	y 
	ld c,h			;c580	4c 	L 
	set 7,a		;c581	cb ff 	. . 
	ld a,c			;c583	79 	y 
	ld c,h			;c584	4c 	L 
	rlc c		;c585	cb 01 	. . 
sub_c587h:
	xor a			;c587	af 	. 
	ld (0c63bh),a		;c588	32 3b c6 	2 ; . 
	ld a,l			;c58b	7d 	} 
	rlc a		;c58c	cb 07 	. . 
	sbc a,a			;c58e	9f 	. 
	ld h,a			;c58f	67 	g 
	ex de,hl			;c590	eb 	. 
	ld hl,(lc80ch)		;c591	2a 0c c8 	* . . 
	add hl,de			;c594	19 	. 
	ld (lc80ch),hl		;c595	22 0c c8 	" . . 
	ex de,hl			;c598	eb 	. 
	ld a,l			;c599	7d 	} 
	or a			;c59a	b7 	. 
	jp p,lc5cdh		;c59b	f2 cd c5 	. . . 
	neg		;c59e	ed 44 	. D 
	ld l,a			;c5a0	6f 	o 
	ld a,(lc80eh)		;c5a1	3a 0e c8 	: . . 
	sub l			;c5a4	95 	. 
	jp p,lc5c8h		;c5a5	f2 c8 c5 	. . . 
	add a,040h		;c5a8	c6 40 	. @ 
	ld (lc80eh),a		;c5aa	32 0e c8 	2 . . 
	ld hl,(lc810h)		;c5ad	2a 10 c8 	* . . 
	dec hl			;c5b0	2b 	+ 
	ld a,(hl)			;c5b1	7e 	~ 
	or a			;c5b2	b7 	. 
	jr z,lc5c2h		;c5b3	28 0d 	( . 
	call sub_c656h		;c5b5	cd 56 c6 	. V . 
	call sub_c679h		;c5b8	cd 79 c6 	. y . 
	ld a,001h		;c5bb	3e 01 	> . 
	ld (0c63bh),a		;c5bd	32 3b c6 	2 ; . 
	jr lc600h		;c5c0	18 3e 	. > 
lc5c2h:
	ld hl,00000h		;c5c2	21 00 00 	! . . 
	ld (lc80ch),hl		;c5c5	22 0c c8 	" . . 
lc5c8h:
	ld (lc80eh),a		;c5c8	32 0e c8 	2 . . 
	jr lc600h		;c5cb	18 33 	. 3 
lc5cdh:
	ld a,(lc80eh)		;c5cd	3a 0e c8 	: . . 
	add a,l			;c5d0	85 	. 
	cp 040h		;c5d1	fe 40 	. @ 
	jr c,lc5fdh		;c5d3	38 28 	8 ( 
	sub 040h		;c5d5	d6 40 	. @ 
	ld (lc80eh),a		;c5d7	32 0e c8 	2 . . 
	ld hl,(lc812h)		;c5da	2a 12 c8 	* . . 
	inc hl			;c5dd	23 	# 
	ld a,(hl)			;c5de	7e 	~ 
	or a			;c5df	b7 	. 
	ld a,040h		;c5e0	3e 40 	> @ 
	jr z,lc5f1h		;c5e2	28 0d 	( . 
	call sub_c665h		;c5e4	cd 65 c6 	. e . 
	call sub_c681h		;c5e7	cd 81 c6 	. . . 
	ld a,001h		;c5ea	3e 01 	> . 
	ld (0c63bh),a		;c5ec	32 3b c6 	2 ; . 
	jr lc600h		;c5ef	18 0f 	. . 
lc5f1h:
	ld hl,00009h		;c5f1	21 09 00 	! . . 
	add hl,hl			;c5f4	29 	) 
	add hl,hl			;c5f5	29 	) 
	add hl,hl			;c5f6	29 	) 
	add hl,hl			;c5f7	29 	) 
	add hl,hl			;c5f8	29 	) 
	add hl,hl			;c5f9	29 	) 
	ld (lc80ch),hl		;c5fa	22 0c c8 	" . . 
lc5fdh:
	ld (lc80eh),a		;c5fd	32 0e c8 	2 . . 
lc600h:
	ld hl,(lc80eh)		;c600	2a 0e c8 	* . . 
	ld (0c64eh),hl		;c603	22 4e c6 	" N . 
	ex de,hl			;c606	eb 	. 
	ld hl,0ca12h		;c607	21 12 ca 	! . . 
	add hl,de			;c60a	19 	. 
	ld (sub_c63eh+1),hl		;c60b	22 3f c6 	" ? . 
	ld hl,00040h		;c60e	21 40 00 	! @ . 
	or a			;c611	b7 	. 
	sbc hl,de		;c612	ed 52 	. R 
	ld (0c642h),hl		;c614	22 42 c6 	" B . 
	ld hl,0ce12h		;c617	21 12 ce 	! . . 
	ld (lc64ah+1),hl		;c61a	22 4b c6 	" K . 
	ld de,0d212h		;c61d	11 12 d2 	. . . 
	ld b,010h		;c620	06 10 	. . 
lc622h:
	push bc			;c622	c5 	. 
	call sub_c63eh		;c623	cd 3e c6 	. > . 
	ld hl,(sub_c63eh+1)		;c626	2a 3f c6 	* ? . 
	ld bc,00040h		;c629	01 40 00 	. @ . 
	add hl,bc			;c62c	09 	. 
	ld (sub_c63eh+1),hl		;c62d	22 3f c6 	" ? . 
	ld hl,(lc64ah+1)		;c630	2a 4b c6 	* K . 
	add hl,bc			;c633	09 	. 
	ld (lc64ah+1),hl		;c634	22 4b c6 	" K . 
	pop bc			;c637	c1 	. 
	djnz lc622h		;c638	10 e8 	. . 
	ld a,000h		;c63a	3e 00 	> . 
	or a			;c63c	b7 	. 
	ret			;c63d	c9 	. 
sub_c63eh:
	ld hl,0ca12h		;c63e	21 12 ca 	! . . 
	ld bc,00040h		;c641	01 40 00 	. @ . 
	ld a,c			;c644	79 	y 
	cp b			;c645	b8 	. 
	jr z,lc64ah		;c646	28 02 	( . 
	ldir		;c648	ed b0 	. . 
lc64ah:
	ld hl,0ce12h		;c64a	21 12 ce 	! . . 
	ld bc,00000h		;c64d	01 00 00 	. . . 
	ld a,c			;c650	79 	y 
	cp b			;c651	b8 	. 
	ret z			;c652	c8 	. 
	ldir		;c653	ed b0 	. . 
	ret			;c655	c9 	. 
sub_c656h:
	push hl			;c656	e5 	. 
	ld hl,(lc810h)		;c657	2a 10 c8 	* . . 
	ld (lc812h),hl		;c65a	22 12 c8 	" . . 
	ld hl,0ca12h		;c65d	21 12 ca 	! . . 
	ld de,0ce12h		;c660	11 12 ce 	. . . 
	jr lc672h		;c663	18 0d 	. . 
sub_c665h:
	push hl			;c665	e5 	. 
	ld hl,(lc812h)		;c666	2a 12 c8 	* . . 
	ld (lc810h),hl		;c669	22 10 c8 	" . . 
	ld de,0ca12h		;c66c	11 12 ca 	. . . 
	ld hl,0ce12h		;c66f	21 12 ce 	! . . 
lc672h:
	ld bc,00400h		;c672	01 00 04 	. . . 
	ldir		;c675	ed b0 	. . 
	pop hl			;c677	e1 	. 
	ret			;c678	c9 	. 
sub_c679h:
	ld de,0ca12h		;c679	11 12 ca 	. . . 
	ld (lc810h),hl		;c67c	22 10 c8 	" . . 
	jr lc687h		;c67f	18 06 	. . 
sub_c681h:
	ld de,0ce12h		;c681	11 12 ce 	. . . 
	ld (lc812h),hl		;c684	22 12 c8 	" . . 
lc687h:
	push de			;c687	d5 	. 
	ld (0c6e6h),de		;c688	ed 53 e6 c6 	. S . . 
	ld (0c6c0h),de		;c68c	ed 53 c0 c6 	. S . . 
	ld l,(hl)			;c690	6e 	n 
	ld h,000h		;c691	26 00 	& . 
	add hl,hl			;c693	29 	) 
	ld de,0e212h		;c694	11 12 e2 	. . . 
	add hl,de			;c697	19 	. 
	ld e,(hl)			;c698	5e 	^ 
	inc hl			;c699	23 	# 
	ld d,(hl)			;c69a	56 	V 
	ex de,hl			;c69b	eb 	. 
	pop de			;c69c	d1 	. 
	ld a,h			;c69d	7c 	| 
	or l			;c69e	b5 	. 
	jr nz,lc6a3h		;c69f	20 02 	  . 
	inc a			;c6a1	3c 	< 
	ret			;c6a2	c9 	. 
lc6a3h:
	dec hl			;c6a3	2b 	+ 
	dec de			;c6a4	1b 	. 
lc6a5h:
	inc de			;c6a5	13 	. 
lc6a6h:
	inc hl			;c6a6	23 	# 
	ld a,(hl)			;c6a7	7e 	~ 
	cp 020h		;c6a8	fe 20 	.   
	jr c,lc6b2h		;c6aa	38 06 	8 . 
lc6ach:
	xor 000h		;c6ac	ee 00 	. . 
	ld (de),a			;c6ae	12 	. 
	jp lc6a5h		;c6af	c3 a5 c6 	. . . 
lc6b2h:
	cp 00ah		;c6b2	fe 0a 	. . 
	jr z,lc6d5h		;c6b4	28 1f 	( . 
	cp 004h		;c6b6	fe 04 	. . 
	jr c,lc6e1h		;c6b8	38 27 	8 ' 
	cp 006h		;c6ba	fe 06 	. . 
	jr z,lc6a6h		;c6bc	28 e8 	( . 
	or a			;c6be	b7 	. 
	ld hl,00000h		;c6bf	21 00 00 	! . . 
	ld bc,00400h		;c6c2	01 00 04 	. . . 
	add hl,bc			;c6c5	09 	. 
	sbc hl,de		;c6c6	ed 52 	. R 
	jr z,lc6d3h		;c6c8	28 09 	( . 
	ld b,h			;c6ca	44 	D 
	ld c,l			;c6cb	4d 	M 
	ld h,d			;c6cc	62 	b 
	ld l,e			;c6cd	6b 	k 
	inc de			;c6ce	13 	. 
lc6cfh:
	ld (hl),080h		;c6cf	36 80 	6 . 
	ldir		;c6d1	ed b0 	. . 
lc6d3h:
	xor a			;c6d3	af 	. 
	ret			;c6d4	c9 	. 
lc6d5h:
	inc hl			;c6d5	23 	# 
	ld b,(hl)			;c6d6	46 	F 
	dec de			;c6d7	1b 	. 
	ld a,(de)			;c6d8	1a 	. 
	inc de			;c6d9	13 	. 
lc6dah:
	ld (de),a			;c6da	12 	. 
	inc de			;c6db	13 	. 
	djnz lc6dah		;c6dc	10 fc 	. . 
	jp lc6a6h		;c6de	c3 a6 c6 	. . . 
lc6e1h:
	inc hl			;c6e1	23 	# 
	push hl			;c6e2	e5 	. 
	ld l,(hl)			;c6e3	6e 	n 
	ld h,a			;c6e4	67 	g 
	ld bc,00000h		;c6e5	01 00 00 	. . . 
	add hl,bc			;c6e8	09 	. 
	push hl			;c6e9	e5 	. 
	or a			;c6ea	b7 	. 
	sbc hl,de		;c6eb	ed 52 	. R 
	ld b,h			;c6ed	44 	D 
	ld c,l			;c6ee	4d 	M 
	ld h,d			;c6ef	62 	b 
	ld l,e			;c6f0	6b 	k 
	inc de			;c6f1	13 	. 
lc6f2h:
	ld (hl),080h		;c6f2	36 80 	6 . 
	ldir		;c6f4	ed b0 	. . 
	pop de			;c6f6	d1 	. 
	pop hl			;c6f7	e1 	. 
	jp lc6a6h		;c6f8	c3 a6 c6 	. . . 
	ld de,l803eh		;c6fb	11 3e 80 	. > . 
	ld hl,l8036h		;c6fe	21 36 80 	! 6 . 
	jr lc70eh		;c701	18 0b 	. . 
	ld de,0bf3eh		;c703	11 3e bf 	. > . 
	jr lc70bh		;c706	18 03 	. . 
	ld de,03feeh		;c708	11 ee 3f 	. . ? 
lc70bh:
	ld hl,0bf36h		;c70b	21 36 bf 	! 6 . 
lc70eh:
	ld a,(lc9edh)		;c70e	3a ed c9 	: . . 
	set 0,a		;c711	cb c7 	. . 
	jr lc725h		;c713	18 10 	. . 
	ld de,l803eh		;c715	11 3e 80 	. > . 
	jr lc71dh		;c718	18 03 	. . 
sub_c71ah:
	ld de,000eeh		;c71a	11 ee 00 	. . . 
lc71dh:
	ld hl,l8036h		;c71d	21 36 80 	! 6 . 
	ld a,(lc9edh)		;c720	3a ed c9 	: . . 
	res 0,a		;c723	cb 87 	. . 
lc725h:
	ld (lc6ach),de		;c725	ed 53 ac c6 	. S . . 
	ld (lc6cfh),hl		;c729	22 cf c6 	" . . 
	ld (lc6f2h),hl		;c72c	22 f2 c6 	" . . 
	ld (lc787h),hl		;c72f	22 87 c7 	" . . 
	ld (lc9edh),a		;c732	32 ed c9 	2 . . 
	ld hl,(lc810h)		;c735	2a 10 c8 	* . . 
	call sub_c679h		;c738	cd 79 c6 	. y . 
	ld hl,(lc812h)		;c73b	2a 12 c8 	* . . 
	call sub_c681h		;c73e	cd 81 c6 	. . . 
	jp lc600h		;c741	c3 00 c6 	. . . 
sub_c744h:
	ld hl,00000h		;c744	21 00 00 	! . . 
	ld (lc80ch),hl		;c747	22 0c c8 	" . . 
	ld (lc80eh),hl		;c74a	22 0e c8 	" . . 
	call sub_c77eh		;c74d	cd 7e c7 	. ~ . 
	ld bc,0e212h		;c750	01 12 e2 	. . . 
	ld hl,l644ah		;c753	21 4a 64 	! J d 
	ld de,02323h		;c756	11 23 23 	. # # 
lc759h:
	inc hl			;c759	23 	# 
lc75ah:
	ld a,(hl)			;c75a	7e 	~ 
	cp 009h		;c75b	fe 09 	. . 
	ret z			;c75d	c8 	. 
	cp 00ah		;c75e	fe 0a 	. . 
	jr z,$-8		;c760	28 f6 	( . 
	cp 008h		;c762	fe 08 	. . 
	jr z,$-13		;c764	28 f1 	( . 
	cp 00bh		;c766	fe 0b 	. . 
	jr z,$-17		;c768	28 ed 	( . 
	cp 004h		;c76a	fe 04 	. . 
	jr c,$-21		;c76c	38 e9 	8 . 
	jr nz,lc759h		;c76e	20 e9 	  . 
	inc hl			;c770	23 	# 
	ld e,(hl)			;c771	5e 	^ 
	inc hl			;c772	23 	# 
	ld d,(hl)			;c773	56 	V 
	inc hl			;c774	23 	# 
	ex de,hl			;c775	eb 	. 
	add hl,hl			;c776	29 	) 
	add hl,bc			;c777	09 	. 
	ld (hl),e			;c778	73 	s 
	inc hl			;c779	23 	# 
	ld (hl),d			;c77a	72 	r 
	ex de,hl			;c77b	eb 	. 
	jr lc75ah		;c77c	18 dc 	. . 
sub_c77eh:
	ld hl,0ca12h		;c77e	21 12 ca 	! . . 
	ld d,h			;c781	54 	T 
	ld e,l			;c782	5d 	] 
	inc de			;c783	13 	. 
	ld bc,01800h		;c784	01 00 18 	. . . 
lc787h:
	ld (hl),080h		;c787	36 80 	6 . 
	ldir		;c789	ed b0 	. . 
	ld bc,000c7h		;c78b	01 c7 00 	. . . 
	ld (hl),000h		;c78e	36 00 	6 . 
	ldir		;c790	ed b0 	. . 
	ret			;c792	c9 	. 
sub_c793h:
	ld a,(lc80bh)		;c793	3a 0b c8 	: . . 
	ld (0c7f8h),a		;c796	32 f8 c7 	2 . . 
	ld (lc807h+1),a		;c799	32 08 c8 	2 . . 
	di			;c79c	f3 	. 
	push hl			;c79d	e5 	. 
	ld hl,02018h		;c79e	21 18 20 	! .   
	exx			;c7a1	d9 	. 
	ld iy,lc7dfh		;c7a2	fd 21 df c7 	. ! . . 
	pop ix		;c7a6	dd e1 	. . 
	ld l,(ix+000h)		;c7a8	dd 6e 00 	. n . 
	xor a			;c7ab	af 	. 
lc7ach:
	ld de,00101h		;c7ac	11 01 01 	. . . 
	ld h,d			;c7af	62 	b 
	ex af,af'			;c7b0	08 	. 
	exx			;c7b1	d9 	. 
	ld d,h			;c7b2	54 	T 
	ld a,(ix+002h)		;c7b3	dd 7e 02 	. ~ . 
	dec a			;c7b6	3d 	= 
	jr nz,lc7bah		;c7b7	20 01 	  . 
	ld d,l			;c7b9	55 	U 
lc7bah:
	ld (iy+000h),d		;c7ba	fd 72 00 	. r . 
	ld d,h			;c7bd	54 	T 
	ld a,(ix+003h)		;c7be	dd 7e 03 	. ~ . 
	dec a			;c7c1	3d 	= 
	jr nz,lc7c5h		;c7c2	20 01 	  . 
	ld d,l			;c7c4	55 	U 
lc7c5h:
	ld (iy+007h),d		;c7c5	fd 72 07 	. r . 
	ld d,h			;c7c8	54 	T 
	ld a,(ix+004h)		;c7c9	dd 7e 04 	. ~ . 
	dec a			;c7cc	3d 	= 
	jr nz,lc7d0h		;c7cd	20 01 	  . 
	ld d,l			;c7cf	55 	U 
lc7d0h:
	ld (iy+00eh),d		;c7d0	fd 72 0e 	. r . 
	exx			;c7d3	d9 	. 
	ld a,001h		;c7d4	3e 01 	> . 
	ex af,af'			;c7d6	08 	. 
	ld c,l			;c7d7	4d 	M 
lc7d8h:
	ld b,(ix+001h)		;c7d8	dd 46 01 	. F . 
	dec b			;c7db	05 	. 
	ret z			;c7dc	c8 	. 
	inc b			;c7dd	04 	. 
lc7deh:
	dec h			;c7de	25 	% 
lc7dfh:
	jr nz,lc7e5h		;c7df	20 04 	  . 
	ld h,(ix+002h)		;c7e1	dd 66 02 	. f . 
	inc a			;c7e4	3c 	< 
lc7e5h:
	dec d			;c7e5	15 	. 
	jr nz,lc7ech		;c7e6	20 04 	  . 
	ld d,(ix+003h)		;c7e8	dd 56 03 	. V . 
	inc a			;c7eb	3c 	< 
lc7ech:
	dec e			;c7ec	1d 	. 
	jr nz,lc7f3h		;c7ed	20 04 	  . 
	ld e,(ix+004h)		;c7ef	dd 5e 04 	. ^ . 
	inc a			;c7f2	3c 	< 
lc7f3h:
	or a			;c7f3	b7 	. 
	jr z,lc807h		;c7f4	28 11 	( . 
	ex af,af'			;c7f6	08 	. 
	out (080h),a		;c7f7	d3 80 	. . 
	ex af,af'			;c7f9	08 	. 
	dec a			;c7fa	3d 	= 
	ret c			;c7fb	d8 	. 
lc7fch:
	djnz lc7deh		;c7fc	10 e0 	. . 
	dec c			;c7fe	0d 	. 
	jr nz,lc7d8h		;c7ff	20 d7 	  . 
	ld c,004h		;c801	0e 04 	. . 
	add ix,bc		;c803	dd 09 	. . 
	jr lc7ach		;c805	18 a5 	. . 
lc807h:
	out (080h),a		;c807	d3 80 	. . 
	jr lc7fch		;c809	18 f1 	. . 
lc80bh:
	rst 38h			;c80b	ff 	. 
lc80ch:
	nop			;c80c	00 	. 
	nop			;c80d	00 	. 
lc80eh:
	nop			;c80e	00 	. 
	nop			;c80f	00 	. 
lc810h:
	nop			;c810	00 	. 
	nop			;c811	00 	. 
lc812h:
	nop			;c812	00 	. 
	nop			;c813	00 	. 
sub_c814h:
	push ix		;c814	dd e5 	. . 
	ld b,(ix-001h)		;c816	dd 46 ff 	. F . 
	ld a,(lc9edh)		;c819	3a ed c9 	: . . 
	bit 0,a		;c81c	cb 47 	. G 
	ld a,000h		;c81e	3e 00 	> . 
	jr z,lc824h		;c820	28 02 	( . 
	ld a,03fh		;c822	3e 3f 	> ? 
lc824h:
	ld (0c904h),a		;c824	32 04 c9 	2 . . 
	ld (0c909h),a		;c827	32 09 c9 	2 . . 
	ld a,0b6h		;c82a	3e b6 	> . 
	jr z,lc830h		;c82c	28 02 	( . 
	ld a,0aeh		;c82e	3e ae 	> . 
lc830h:
	ld (lc928h),a		;c830	32 28 c9 	2 ( . 
lc833h:
	push de			;c833	d5 	. 
	push bc			;c834	c5 	. 
	push ix		;c835	dd e5 	. . 
	push iy		;c837	fd e5 	. . 
	ld bc,lc849h		;c839	01 49 c8 	. I . 
	push bc			;c83c	c5 	. 
	bit 0,(ix+00eh)		;c83d	dd cb 0e 46 	. . . F 
	jr nz,lc856h		;c841	20 13 	  . 
	ld bc,00096h		;c843	01 96 00 	. . . 
	jp 00060h		;c846	c3 60 00 	. ` . 
lc849h:
	pop iy		;c849	fd e1 	. . 
	pop ix		;c84b	dd e1 	. . 
	pop bc			;c84d	c1 	. 
	pop de			;c84e	d1 	. 
	add ix,de		;c84f	dd 19 	. . 
	djnz lc833h		;c851	10 e0 	. . 
	pop ix		;c853	dd e1 	. . 
	ret			;c855	c9 	. 
lc856h:
	ld a,(ix+00ch)		;c856	dd 7e 0c 	. ~ . 
	dec a			;c859	3d 	= 
	jp nz,lc860h		;c85a	c2 60 c8 	. ` . 
	ld a,(ix+00bh)		;c85d	dd 7e 0b 	. ~ . 
lc860h:
	ld (ix+00ch),a		;c860	dd 77 0c 	. w . 
	call z,sub_c93ch		;c863	cc 3c c9 	. < . 
	bit 3,(ix+00eh)		;c866	dd cb 0e 5e 	. . . ^ 
	jp z,lc88dh		;c86a	ca 8d c8 	. . . 
	ld a,(ix+010h)		;c86d	dd 7e 10 	. ~ . 
	dec a			;c870	3d 	= 
	jr nz,lc888h		;c871	20 15 	  . 
	ld a,(ix+00fh)		;c873	dd 7e 0f 	. ~ . 
	bit 2,(ix+00eh)		;c876	dd cb 0e 56 	. . . V 
	set 2,(ix+00eh)		;c87a	dd cb 0e d6 	. . . . 
	jr z,lc888h		;c87e	28 08 	( . 
	res 2,(ix+00eh)		;c880	dd cb 0e 96 	. . . . 
	rrca			;c884	0f 	. 
	rrca			;c885	0f 	. 
	rrca			;c886	0f 	. 
	rrca			;c887	0f 	. 
lc888h:
	and 00fh		;c888	e6 0f 	. . 
	ld (ix+010h),a		;c88a	dd 77 10 	. w . 
lc88dh:
	ld a,(ix+012h)		;c88d	dd 7e 12 	. ~ . 
	dec a			;c890	3d 	= 
	jp nz,lc897h		;c891	c2 97 c8 	. . . 
	ld a,(ix+011h)		;c894	dd 7e 11 	. ~ . 
lc897h:
	ld (ix+012h),a		;c897	dd 77 12 	. w . 
	ld l,(ix+015h)		;c89a	dd 6e 15 	. n . 
	ld h,(ix+016h)		;c89d	dd 66 16 	. f . 
	ld a,(ix+013h)		;c8a0	dd 7e 13 	. ~ . 
	jp nz,lc8beh		;c8a3	c2 be c8 	. . . 
	inc a			;c8a6	3c 	< 
	cp (hl)			;c8a7	be 	. 
	jp c,lc8bbh		;c8a8	da bb c8 	. . . 
	bit 1,(ix+00eh)		;c8ab	dd cb 0e 4e 	. . . N 
	jp z,lc8bah		;c8af	ca ba c8 	. . . 
	res 0,(ix+00eh)		;c8b2	dd cb 0e 86 	. . . . 
	res 2,(ix+00eh)		;c8b6	dd cb 0e 96 	. . . . 
lc8bah:
	xor a			;c8ba	af 	. 
lc8bbh:
	ld (ix+013h),a		;c8bb	dd 77 13 	. w . 
lc8beh:
	bit 2,(ix+00eh)		;c8be	dd cb 0e 56 	. . . V 
	ret z			;c8c2	c8 	. 
	ld b,000h		;c8c3	06 00 	. . 
	inc hl			;c8c5	23 	# 
	ld c,a			;c8c6	4f 	O 
	add hl,bc			;c8c7	09 	. 
	add hl,bc			;c8c8	09 	. 
	ld a,(hl)			;c8c9	7e 	~ 
	inc hl			;c8ca	23 	# 
	ld h,(hl)			;c8cb	66 	f 
	ld l,a			;c8cc	6f 	o 
	ld c,(ix+014h)		;c8cd	dd 4e 14 	. N . 
	add hl,bc			;c8d0	09 	. 
	add hl,bc			;c8d1	09 	. 
	ld a,(hl)			;c8d2	7e 	~ 
	inc hl			;c8d3	23 	# 
	ld h,(hl)			;c8d4	66 	f 
	ld l,a			;c8d5	6f 	o 
	ld c,(ix+001h)		;c8d6	dd 4e 01 	. N . 
	ex de,hl			;c8d9	eb 	. 
	ld hl,lc9a5h		;c8da	21 a5 c9 	! . . 
	add hl,bc			;c8dd	09 	. 
	add hl,bc			;c8de	09 	. 
	ld b,000h		;c8df	06 00 	. . 
	ld a,(hl)			;c8e1	7e 	~ 
	inc hl			;c8e2	23 	# 
	ld h,(hl)			;c8e3	66 	f 
	ld l,a			;c8e4	6f 	o 
	ld c,(ix+002h)		;c8e5	dd 4e 02 	. N . 
	ld a,c			;c8e8	79 	y 
	rlca			;c8e9	07 	. 
	sbc a,a			;c8ea	9f 	. 
	ld b,a			;c8eb	47 	G 
	add hl,bc			;c8ec	09 	. 
	ld bc,0d612h		;c8ed	01 12 d6 	. . . 
	add hl,bc			;c8f0	09 	. 
	ex de,hl			;c8f1	eb 	. 
	ld b,000h		;c8f2	06 00 	. . 
	xor a			;c8f4	af 	. 
	ld (0c906h),a		;c8f5	32 06 c9 	2 . . 
	bit 5,(ix+00eh)		;c8f8	dd cb 0e 6e 	. . . n 
	jp z,lc90dh		;c8fc	ca 0d c9 	. . . 
	jp lc92eh		;c8ff	c3 2e c9 	. . . 
lc902h:
	ld a,(de)			;c902	1a 	. 
	xor 000h		;c903	ee 00 	. . 
	and 000h		;c905	e6 00 	. . 
	or (hl)			;c907	b6 	. 
	xor 000h		;c908	ee 00 	. . 
	ld (de),a			;c90a	12 	. 
	inc de			;c90b	13 	. 
	inc hl			;c90c	23 	# 
lc90dh:
	ld a,(hl)			;c90d	7e 	~ 
	or a			;c90e	b7 	. 
	jp m,lc902h		;c90f	fa 02 c9 	. . . 
	ret z			;c912	c8 	. 
	inc hl			;c913	23 	# 
	bit 6,a		;c914	cb 77 	. w 
	jr z,lc920h		;c916	28 08 	( . 
	and 0bfh		;c918	e6 bf 	. . 
	ld (0c906h),a		;c91a	32 06 c9 	2 . . 
	jp lc90dh		;c91d	c3 0d c9 	. . . 
lc920h:
	ld c,a			;c920	4f 	O 
	ex de,hl			;c921	eb 	. 
	add hl,bc			;c922	09 	. 
	ex de,hl			;c923	eb 	. 
	jp lc90dh		;c924	c3 0d c9 	. . . 
lc927h:
	ld a,(de)			;c927	1a 	. 
lc928h:
	or (hl)			;c928	b6 	. 
	or 080h		;c929	f6 80 	. . 
	ld (de),a			;c92b	12 	. 
	inc de			;c92c	13 	. 
	inc hl			;c92d	23 	# 
lc92eh:
	ld a,(hl)			;c92e	7e 	~ 
	or a			;c92f	b7 	. 
	jp m,lc927h		;c930	fa 27 c9 	. ' . 
	ret z			;c933	c8 	. 
	inc hl			;c934	23 	# 
	ld c,a			;c935	4f 	O 
	ex de,hl			;c936	eb 	. 
	add hl,bc			;c937	09 	. 
	ex de,hl			;c938	eb 	. 
	jp lc92eh		;c939	c3 2e c9 	. . . 
sub_c93ch:
	ld a,(ix+014h)		;c93c	dd 7e 14 	. ~ . 
	bit 0,(ix+00dh)		;c93f	dd cb 0d 46 	. . . F 
	jp z,lc957h		;c943	ca 57 c9 	. W . 
	bit 5,(ix+00dh)		;c946	dd cb 0d 6e 	. . . n 
	jp nz,lc954h		;c94a	c2 54 c9 	. T . 
	sub 002h		;c94d	d6 02 	. . 
	jp nc,lc957h		;c94f	d2 57 c9 	. W . 
	add a,006h		;c952	c6 06 	. . 
lc954h:
	dec (ix+001h)		;c954	dd 35 01 	. 5 . 
lc957h:
	bit 1,(ix+00dh)		;c957	dd cb 0d 4e 	. . . N 
	jp z,lc971h		;c95b	ca 71 c9 	. q . 
	bit 5,(ix+00dh)		;c95e	dd cb 0d 6e 	. . . n 
	jp nz,lc96eh		;c962	c2 6e c9 	. n . 
	add a,002h		;c965	c6 02 	. . 
	cp 006h		;c967	fe 06 	. . 
	jp c,lc971h		;c969	da 71 c9 	. q . 
	sub 006h		;c96c	d6 06 	. . 
lc96eh:
	inc (ix+001h)		;c96e	dd 34 01 	. 4 . 
lc971h:
	bit 2,(ix+00dh)		;c971	dd cb 0d 56 	. . . V 
	jp z,lc989h		;c975	ca 89 c9 	. . . 
	bit 4,(ix+00dh)		;c978	dd cb 0d 66 	. . . f 
	jp nz,lc986h		;c97c	c2 86 c9 	. . . 
	xor 001h		;c97f	ee 01 	. . 
	bit 0,a		;c981	cb 47 	. G 
	jp z,lc989h		;c983	ca 89 c9 	. . . 
lc986h:
	dec (ix+002h)		;c986	dd 35 02 	. 5 . 
lc989h:
	bit 3,(ix+00dh)		;c989	dd cb 0d 5e 	. . . ^ 
	jp z,lc9a1h		;c98d	ca a1 c9 	. . . 
	bit 4,(ix+00dh)		;c990	dd cb 0d 66 	. . . f 
	jp nz,lc99eh		;c994	c2 9e c9 	. . . 
	xor 001h		;c997	ee 01 	. . 
	bit 0,a		;c999	cb 47 	. G 
	jp nz,lc9a1h		;c99b	c2 a1 c9 	. . . 
lc99eh:
	inc (ix+002h)		;c99e	dd 34 02 	. 4 . 
lc9a1h:
	ld (ix+014h),a		;c9a1	dd 77 14 	. w . 
	ret			;c9a4	c9 	. 
lc9a5h:
	nop			;c9a5	00 	. 
	nop			;c9a6	00 	. 
	ld b,b			;c9a7	40 	@ 
	nop			;c9a8	00 	. 
	add a,b			;c9a9	80 	. 
	nop			;c9aa	00 	. 
	ret nz			;c9ab	c0 	. 
	nop			;c9ac	00 	. 
	nop			;c9ad	00 	. 
	ld bc,00140h		;c9ae	01 40 01 	. @ . 
	add a,b			;c9b1	80 	. 
	ld bc,001c0h		;c9b2	01 c0 01 	. . . 
	nop			;c9b5	00 	. 
	ld (bc),a			;c9b6	02 	. 
	ld b,b			;c9b7	40 	@ 
	ld (bc),a			;c9b8	02 	. 
	add a,b			;c9b9	80 	. 
	ld (bc),a			;c9ba	02 	. 
	ret nz			;c9bb	c0 	. 
	ld (bc),a			;c9bc	02 	. 
	nop			;c9bd	00 	. 
	inc bc			;c9be	03 	. 
	ld b,b			;c9bf	40 	@ 
	inc bc			;c9c0	03 	. 
	add a,b			;c9c1	80 	. 
	inc bc			;c9c2	03 	. 
	ret nz			;c9c3	c0 	. 
	inc bc			;c9c4	03 	. 
	nop			;c9c5	00 	. 
	inc b			;c9c6	04 	. 
	ld b,b			;c9c7	40 	@ 
	inc b			;c9c8	04 	. 
	add a,b			;c9c9	80 	. 
	inc b			;c9ca	04 	. 
	ret nz			;c9cb	c0 	. 
	inc b			;c9cc	04 	. 
	nop			;c9cd	00 	. 
	dec b			;c9ce	05 	. 
	ld b,b			;c9cf	40 	@ 
	dec b			;c9d0	05 	. 
	add a,b			;c9d1	80 	. 
	dec b			;c9d2	05 	. 
	ret nz			;c9d3	c0 	. 
	dec b			;c9d4	05 	. 
	nop			;c9d5	00 	. 
	ld b,040h		;c9d6	06 40 	. @ 
	ld b,080h		;c9d8	06 80 	. . 
	ld b,0c0h		;c9da	06 c0 	. . 
	ld b,000h		;c9dc	06 00 	. . 
	rlca			;c9de	07 	. 
	ld b,b			;c9df	40 	@ 
	rlca			;c9e0	07 	. 
	add a,b			;c9e1	80 	. 
	rlca			;c9e2	07 	. 
	ret nz			;c9e3	c0 	. 
	rlca			;c9e4	07 	. 
	nop			;c9e5	00 	. 
	ex af,af'			;c9e6	08 	. 
	ld b,b			;c9e7	40 	@ 
	ex af,af'			;c9e8	08 	. 
	add a,b			;c9e9	80 	. 
	ex af,af'			;c9ea	08 	. 
	ret nz			;c9eb	c0 	. 
	ex af,af'			;c9ec	08 	. 
lc9edh:
	nop			;c9ed	00 	. 
sub_c9eeh:
	ld de,00000h		;c9ee	11 00 00 	. . . 
lc9f1h:
	call sub_c9fdh		;c9f1	cd fd c9 	. . . 
	ret nz			;c9f4	c0 	. 
	dec de			;c9f5	1b 	. 
	ld a,e			;c9f6	7b 	{ 
	or d			;c9f7	b2 	. 
	jr nz,lc9f1h		;c9f8	20 f7 	  . 
	djnz lc9f1h		;c9fa	10 f5 	. . 
	ret			;c9fc	c9 	. 
sub_c9fdh:
	ld a,(038ffh)		;c9fd	3a ff 38 	: . 8 
	ld c,a			;ca00	4f 	O 
	ld a,0ffh		;ca01	3e ff 	> . 
	cpl			;ca03	2f 	/ 
	or c			;ca04	b1 	. 
	ret			;ca05	c9 	. 
