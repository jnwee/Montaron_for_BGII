/* ==========================================
=========== Banters and Conflicts ===========
========================================== */

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTKeldorn","GLOBAL",0)
	Global("JNMontResurrected","GLOBAL",1)~ // If Montaron isn't forced to the player only
THEN JNBMONT JNMONTKeldorn
	@0 /* Eh, <CHARNAME>! What's for dinner? */
	DO ~SetGlobal("JNMONTKeldorn1","GLOBAL",1)~
	== BKELDOR @1 /* You dare demand dinner halfling! It is a disgrace you are breathing the same air as me! */
	== JNBMONT @2 /* Pah! So what ye lackwit! */
	== BKELDOR @3 /* You dare to insult me. I have seen and heard enough! */
	= @4 /* Send him on his way at once <CHARNAME>.. or even better join me to send him to his grave, or I will no longer keep you company! */
END
++ @5 EXTERN JNBMONT JNMONTKeldorn1 /* Montaron will stay with the group. */
++ @6 EXTERN JNBMONT JNMONTKeldorn2 /* You're right Keldorn. Get out of here Montaron, now! */
++ @7 EXTERN JNBMONT JNMONTKeldorn3 /* You're right Keldorn. You will answer for your crimes today Montaron! */

CHAIN JNBMONT JNMONTKeldorn1
	@8 /* Heh, ye're not needed here anyway old man. */
	== BKELDOR @9 /* It seems I was wrong about you <CHARNAME>. Let's hope we don't ever meet again. */
	DO ~LeaveParty() EscapeAreaNoSee()~
EXIT

CHAIN JNBMONT JNMONTKeldorn2
	@10 /* Bah! Me work's better done alone anyway. */
	DO ~LeaveParty() EscapeAreaNoSee()~
EXIT

CHAIN JNBMONT JNMONTKeldorn3
	@11 /* Get to cuttin' then */
	DO ~LeaveParty() Enemy() SetGlobal("JNMONTKickedOut","GLOBAL",1)~
EXIT
