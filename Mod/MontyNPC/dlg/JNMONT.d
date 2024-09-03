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
+ ~Global("JNMontResurrected","GLOBAL",1)~ + @200 EXTERN JNMONT m1 /* <CHARNAME>. You don't remember me? */
+ ~Global("JNMontResurrected","GLOBAL",1)~ + @201 EXTERN JNMONT m2 /* I am <CHARNAME> and I rescued you. */
+ ~Global("JNMontResurrected","GLOBAL",2)~ + @210 EXTERN JNMONT m3 /* You don't remember me? I am <CHARNAME> and I just cursed you to serve me. */
+ ~Global("JNMontResurrected","GLOBAL",2)~ + @211 EXTERN JNMONT m4 /* My name is <CHARNAME> and I just cursed you to serve me as I see fit. */

CHAIN JNMONT m1
	@3 /* I 'member ye. Want to team up again, heh? */
	== JNMONT @4 /* First tell me where Xzar be, so I can slit his throat. I've had it with the bastard. */
	DO ~SetGlobal("JNMontbg1","GLOBAL",1)~
END
++ @202 EXTERN JNMONT m1.1 /* He's dead. */
++ @203 EXTERN JNMONT m1.2 /* I killed him. */

CHAIN JNMONT m2
	@5 /* Keep yer distance, I no trust ye. */
	== JNMONT @6 /* Now tell me where I can find a mad wizard in green robes and I'll be on me merry way. */
	DO ~SetGlobal("JNMontbg1","GLOBAL",0)~
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

CHAIN JNMONT m3
	@13 /* Ye did what!? Why!? */
	== JNMONT @14 /* Tell me ye're jestin' wit' me. */
	DO ~SetGlobal("JNMontbg1","GLOBAL",1)~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @108 /* A more than deserved fate for one such as you! Although I wonder why you resurrected this evil creature in the first place <CHARNAME>. */
END
++ @213 EXTERN JNMONT m3. /* I simply needed an extra pair of hands. */
++ @212 EXTERN JNMONT m3. /* I decided that it is time for you to pay for your crimes and you will do so by serving me. */
++ @214 EXTERN JNMONT m3. /* No. And from now on you will do as you are told. */

CHAIN JNMONT m4
	@13 /* Ye did what!? Why!? */
	== JNMONT @14 /* Tell me ye're jestin' wit' me. */
	DO ~SetGlobal("JNMontbg1","GLOBAL",0)~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @108 /* A more than deserved fate for one such as you! Although I wonder why you resurrected this evil creature in the first place <CHARNAME>. */
END
++ @213 EXTERN JNMONT m3. /* I simply needed an extra pair of hands. */
++ @215 EXTERN JNMONT m3. /* I decided that it is time for you to pay for your crimes as a Zhentarim agent and you will do so by serving me. */
++ @214 EXTERN JNMONT m3. /* This is real. And from now on you will do as you are told. */

CHAIN JNMONT m3.
	@15 /* Ye cretin! This be worse than me partnership with that damned madman. */
	== JNMONT @16 /* Where is Xzar!? Did he put ye up to this? */
END
++ @216 EXTERN JNMONT m3.. /* He didn't. Xzar is dead. */

CHAIN JNMONT m3..
	@17 /* A cruel fate ye have layed out before me. At least the mad wizard breathes no more. */
	== JNMONT @18 /* I'll rather go back to the grave than to serve ye, ye scum. */
	== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @109 /* Hah! Tell him <CHARNAME>. Truly a grand scheme got played on ye my little friend. */
END
++ @217 EXTERN JNMONT m3...

CHAIN JNMONT m3...
	@19 /* So I'll be yer servant for all eternity!? */
	== YOSHJ IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @110 /* A gruesome perspective. Noone deserves such a fate. */
END
++ @218 EXTERN JNMONT m3.1 /* You will be for as long as I see fit. */
++ @219 EXTERN JNMONT m3.2 /* Yes. Now get in line. */

CHAIN JNMONT m3.2
	@20 /* If ye're not tellin' true, I will make ye regret this on me first chance. */
	== JNMONT @21 /* For now ye'll get yer wish. */
	DO ~JoinParty()~
EXIT

CHAIN JNMONT m3.1
	@22 /* And what'll ye have me do taskmaster? */
END
++ @220 EXTERN JNMONT m3.2 /* For now... Step in line. */
