/* ==========================================
=========== Banters and Conflicts ===========
========================================== */

/*
	Progress Tracking
	
	Korgan - 1 - Both
	Keldorn - Conflict - Standard

*/

BEGIN JNBMONT

CHAIN IF ~
	InParty("Korgan")
	See("Korgan")
	!StateCheck("Korgan",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTKorgan1","GLOBAL",0)~
THEN BKORGAN JNMONTKorgan1
	@10 /* Halfing! */
	DO ~SetGlobal("JNMONTKorgan1","GLOBAL",1)~
	== JNBMONT @11 /* What need ye, dwarf? */
	== BKORGAN @12 /* You dare to insult me. I have seen and heard enough! */
	== JNBMONT @13 /* Yer axe be sharp, dwarf.. but yer tongue's too loose. */
	== BKORGAN @14 /* Hah! Ye be talkin' fine.. 'Tis a bummer ye speak so little. */
	== JNBMONT @15 /* Tell me who be my prey or leave me be. */
	== BKORGAN @16 /* Aye, we'll find ye something.. I'll make sure of it! */
EXIT


/* =====================================
============== Standard ================
===================================== */

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTKeldorn1","GLOBAL",0)
	Global("JNMontResurrected","GLOBAL",1)~ // If Montaron isn't forced to the player only
THEN JNBMONT JNMONTKeldorn1
	@0 /* Eh, <CHARNAME>! What's for dinner? */
	DO ~SetGlobal("JNMONTKeldorn1","GLOBAL",1)~
	== BKELDOR @1 /* You dare demand dinner halfling! It is a disgrace you are breathing the same air as me! */
	== JNBMONT @2 /* Pah! So what ye lackwit! */
	== BKELDOR @3 /* You dare to insult me. I have seen and heard enough! */
	= @4 /* Send him on his way at once <CHARNAME>.. or even better join me to send him to his grave, for I will not much longer keep you company if this keeps up! */
	== JNBMONT @5 /* I have no equal, old man. Ye'll regret putting this ultimatum on yerself. */
EXIT

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTKeldorn1","GLOBAL",1)
	Global("JNMontResurrected","GLOBAL",1)~ // If Montaron isn't forced to the player only
THEN BKELDOR JNMONTKeldorn2
	@6 /* You seem ignorant to my objections towards the vile scoundral you carry with you, <CHARNAME>. Thus I will no longer stay with you to endure this insult to my honor. */
	DO ~SetGlobal("JNMONTKeldorn1","GLOBAL",2)~
	== JNBMONT @7 /* Hah! Flee ye coward. We've no need o' some old fool. */
	== BKELDOR @8 /* I can only pray that you come to your senses, <CHARNAME>. */
	= @9 /* May we never meet again. */
	DO ~LeaveParty() EscapeAreaNoSee()~
EXIT


/* =====================================
============ Alternative ===============
===================================== */
