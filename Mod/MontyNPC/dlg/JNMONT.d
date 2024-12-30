/* =================================
===== Montaron Initial Dialog ======
================================= */

BEGIN JNMONT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN JNMONT Introduction
	@0 /* Arrr! */
	== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @1 /* Boo says this one stinks of villainy and I can only agree. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @2 /* We went trough this trouble for *this* bloodthirsty simian?! More of such nonsense and I will seriously reconsider our alliance. */
	== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @3 /* I can sense evil in this scoundrel. I urge you to act with caution <CHARNAME>. */
	== JNMONT @4 /* That blasted mage... always gets me in trouble. */
	= @5 /* Expect no thanks from me, 'cause ye won't get it. Now, who be ye? Speak quick! */
	== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @6 /* Aye. It be thankless world we live in and this one knows how to prosper in it! */
END
+ ~~ + @7 EXTERN JNMONT m1 /* I am <CHARNAME> and we travelled together. Don't you remember me? */
+ ~~ + @8 EXTERN JNMONT m2 /* I am <CHARNAME> and I rescued you. */
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @9 EXTERN JNMONT m3 /* Right you are Sir Keldorn. It seems I have been mislead in my cause, so let us vanquish this vile being again! */

CHAIN JNMONT m1
	@10 /* I remember you. Want me dagger back at your side, eh? */
	== JNMONT @11 /* Tough first tell me, where be Xzar? I'll no longer suffer the fool! */
	DO ~SetGlobal("JNMONTBg1","GLOBAL",1)~
END
++ @12 EXTERN JNMONT m1.1 /* He's dead. */
++ @13 EXTERN JNMONT m1.2 /* I killed him. */

CHAIN JNMONT m1.1
	@14 /* Ye're sayin' I be rid of the fool finally? */
	== JNMONT @15 /* I will no believe you till I see for myself. If ye're tellin' true, I might just stick with yer lot for a while. */
END
++ @16 EXTERN JNMONT m1.1.1 /* Fine by me. Come along then. */
++ @17 EXTERN JNMONT m1.1.2 /* No chance! Now bugger off. */

CHAIN JNMONT m1.1.1
	@18 /* And ye better hurry, lest me dagger gets impatient. */
	DO ~JoinParty()~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @19 /* I have heard nothing but wicked and evil of our new member. I strongly advise you to rethink your decision in the near future. */
EXIT

CHAIN JNMONT m1.1.2
	@20 /* Ye dare deny me!? Ye better sleep with one eye open from now on. */
	DO ~EscapeArea()~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @21 /* A good decision <CHARNAME>. For a second I almost thought you would take that evil creature in. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @22 /* Yes! Flee wretched fiend! */
	= @23 /* For a noble band such as ours would never ally with a vile scoundrel like you are. */
EXIT
	
CHAIN JNMONT m1.2
	@24 /* Did the job for me, eh? Show me his corpse then and if ye're tellin' true, I might just stick with yer lot. */
END
++ @16 EXTERN JNMONT m1.1.1 /* Fine by me. Come along then. */
++ @17 EXTERN JNMONT m1.1.2 /* No chance! Now bugger off. */

CHAIN JNMONT m2
	@25 /* Keep yer distance, I no trust ye. */
	== JNMONT @26 /* Now tell me.. where be a certain mad wizard in green robes and I will be on my way. */
	DO ~SetGlobal("JNMONTBg1","GLOBAL",0)~
END
++ @27 EXTERN JNMONT m1.2 /* Xzar? I killed him. */
++ @28 EXTERN JNMONT m1.1 /* Xzar? He's dead. */

CHAIN JNMONT m3
	@29 /* Ye bring me back from the Abyss just to send me back. A pox on ye! */
	DO ~Enemy()~
EXIT
