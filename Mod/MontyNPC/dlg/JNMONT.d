/* =================================
===== Montaron Initial Dialog ======
================================= */

BEGIN JNMONT

CHAIN IF ~NumTimesTalkedTo(0)~ THEN JNMONT Introduction
	@0 /* Arrr! */
	== MINSCJ IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @100 /* Boo says this one has the smell of villainy and I can only agree. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @101 /* We went trough this trouble for this bloodthirsty simian?! More of such nonsense and I will seriously reconsider our alliance. */
	== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @102 /* I can sense the pure evil in this scoundrel. I urge you to act with caution. */
	== JNMONT @1 /* That damned mage... always gets me in trouble. */
	= @2 /* Expect no thanks from me, 'cause ye'll no get it. Now, who be ye? Speak quick! */
	== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @103 /* Aye. It is a thankless world we're living in and this one knows how to love in it! */
END
++ @200 EXTERN JNMONT m1 /* <CHARNAME>. You don't remember me? */
++ @201 EXTERN JNMONT m2 /* I am <CHARNAME> and I rescued you. */

CHAIN JNMONT m1
	@3 /* I 'member ye. Want to team up again, heh? */
	== JNMONT @4 /* First tell me where Xzar be, so I can slit his throat. I've had it with the bastard. */
END
++ @202 EXTERN JNMONT m1.1 /* He's dead. */
++ @203 EXTERN JNMONT m1.2 /* I killed him. */

CHAIN JNMONT m2
	@5 /* Keep yer distance, ye goody-goody. I no like the smell of charity. */
	== JNMONT @6 /* Now tell me where I can find a mad wizard in green robes and I'll be on me merry way. */
END
++ @204 EXTERN JNMONT m1.2 /* Xzar? I killed him. */
++ @205 EXTERN JNMONT m1.1 /* Xzar? He's dead. */

CHAIN JNMONT m1.1
	@7 /* Someone did the job for me, eh? */
	== JNMONT @8 /* Matters not. I'll no believe ye till ye show me his corpse. If ye're tellin' the truth, I might just stick with ye for a while. */
END
++ @206 EXTERN JNMONT m1.1.1 /* Fine by me. Come along then. */
++ @207 EXTERN JNMONT m1.1.2 /* No chance! Now bugger off. */
	
CHAIN JNMONT m1.2
	@9 /* Did the job for me, eh? Show me his corpse then and if ye're tellin' true I might just stick with ye. */
END
++ @208 EXTERN JNMONT m1.1.1 /* Come along then. */
++ @209 EXTERN JNMONT m1.1.2 /* Not a chance. Now leave me be. */

CHAIN JNMONT m1.1.1
	@10 /* But ye better not take too long, or I'll cut yer throat. */
	DO ~JoinParty()~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @104
EXIT

CHAIN JNMONT m1.1.2
	@11 /* Ye dare deny me!? Ye better sleep with one eye open from now on. */
	== JNMONT @12 /* Me work's better done alone anyway. */
	DO ~EscapeArea()~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @105 /* A good decision <CHARNAME>. For a second I almost thought you would take that evil creature in. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @106 /* Yes! Flee wretched fiend! */
	= @107 /* For a noble band such as ours would never ally with a vile scoundrel like you are. */
EXIT
