/* ==========================================
=========== Banters and Conflicts ===========
========================================== */

/*
	Progress Tracking

	Korgan - 1
	Edwin - 1
	Keldorn - 2 (Conflict)
	Yoshimo - 1
	Aerie - 1
	Nalia - 2

	JNMONTAerieConflict Variable
	4 = Montaron left
	3 = Minsc protects Aerie from Montaron
	2 = Player protects Aerie from Montaron
	1 = Aerie left because she is scared of Montaron
*/

BEGIN JNBMONT

/* =====================================
================ Korgan ================
===================================== */

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
	== BKORGAN @12 /* Ye needn't always be so moody. */
	== JNBMONT @13 /* Yer axe be sharp, dwarf.. but yer tongue's too loose. */
	== BKORGAN @14 /* Hah! Ye be talkin' fine.. 'Tis a bummer ye speak so little. */
	== JNBMONT @15 /* Tell me where be prey or leave me be. */
	== BKORGAN @16 /* Aye, we'll find ye something.. I'll make sure of it! */
EXIT

/* =====================================
================ Edwin =================
===================================== */

CHAIN IF ~
	InParty("Edwin")
	See("Edwin")
	!StateCheck("Edwin",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTEdwin1","GLOBAL",0)~
THEN JNBMONT JNMONTEdwin1
	@17 /* Ye know red one.. I never cared for ye wizards. */
	DO ~SetGlobal("JNMONTEdwin1","GLOBAL",1)~
	== BEDWIN @18 /* To not understand the finer arts of battle is to be expected from the likes of you. (That I have to bear with such company.) */
	== JNBMONT @19 /* In battle ye might have yer worth, but a dagger to the chest while ye be sleeping sound.. */
	== BEDWIN @20 /* You dare threaten me? Edwin Odesseiron.. I have no fear of some monkey with a blade! */
	== BEDWIN @21 /* You are lucky my spells would be wasted on you, ignorant fool! */
	== JNBMONT @22 /* As long as ye show effect I'd be a fool to end ye.. but if ye be lacking, you'll feel me dagger coming. */
	== BEDWIN @23 /* Pah! (Yes.. leave the imbecile believing he has the upper hand.) */
EXIT

/* =====================================
================ Aerie =================
===================================== */

CHAIN IF ~
	InParty("Aerie")
	See("Aerie")
	!StateCheck("Aerie",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTAerie1","GLOBAL",0)~
THEN BAERIE JNMONTAerie1
	@35 /* Stop walking behind me! */
	DO ~SetGlobal("JNMONTAerie1","GLOBAL",1)~
	== JNBMONT @36 /* Be ye scared? Why ye even travel with us be a mystery to me. */
	== BAERIE @37 /* <CHARNAME>! Can't you see? He will betray us the moment it benefits him. Please make him leave. */
	== JNBMONT @38 /* Cease yer prattle girl or me dagger will silence ye. */
	== BAERIE @39 /* See <CHARNAME>! */
	== BMINSC IF ~InParty("Minsc") InMyArea("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @40 EXTERN JNBMONT JNMONTAerie1Misnc /* Fear not Aerie! Me and Boo will be keeping a sharp eye on the small villain. */
END
+ ~ReputationGT(Player1,15)~ + @41 EXTERN BAERIE JNMONTAerie1.good /* Calm down Aerie, I will make sure no harm comes to you. */
+ ~ReputationLT(Player1,16)~ + @41 EXTERN BAERIE JNMONTAerie1.bad /* Calm down Aerie, I will make sure no harm comes to you. */
++ @42 EXTERN BAERIE JNMONTAerie1.leave /* If you can't stand your ground you shouldn't be part of this group. */
++ @43 EXTERN JNBMONT JNMONTAerie1.stay /* You are right Aerie. I will sleep a lot better without your company Montaron, leave at once. */

CHAIN JNBMONT JNMONTAerie1Misnc
	@44 /* Pah! Ye are no match for me. */
	DO ~SetGlobal("JNMONTAerieConflict","GLOBAL",3)~
	== BMINSC @45 /* Watch it villain! Boo knows the smell of treachery and which butt needs kicking! */
	== JNBMONT @46 /* Ye be truly lost madman, keep yer distance from me! */
	== BAERIE @47 /* Thank you Minsc, with you at my side I feel a lot better already. */
EXIT

CHAIN BAERIE JNMONTAerie1.good
	@48 /* I do not like this, but I trust you <CHARNAME>. I am sorry for my outburst. We can continue now. */
	DO ~SetGlobal("JNMONTAerieConflict","GLOBAL",2)~
EXIT

CHAIN BAERIE JNMONTAerie1.bad
	@49 /* You say that, but you choose to surround yourself with such evil. I'm sorry <CHARNAME>, but I can't keep going like this. */
	= @50 /* You will have to go on without me. */
	DO ~SetGlobal("JNMONTAerieConflict","GLOBAL",1) LeaveParty() EscapeAreaNoSee()~
	== JNBMONT @51 /* Finally I be rid of that whiny wench! */
EXIT

CHAIN BAERIE JNMONTAerie1.leave
	@52 /* I did not expect you to be so cold <CHARNAME>. You will see no more of me. */
	DO ~SetGlobal("JNMONTAerieConflict","GLOBAL",1) LeaveParty() EscapeAreaNoSee()~
	== JNBMONT @51 /* Finally I be rid of that whiny wench! */
EXIT

CHAIN JNBMONT JNMONTAerie1.stay
	@53 /* Keep the whiny girl with ye then. You'll meet your end with these weaklings soon enough. */
	DO ~SetGlobal("JNMONTAerieConflict","GLOBAL",4) LeaveParty() EscapeAreaNoSee()~
EXIT

/* =====================================
================ Nalia =================
===================================== */

CHAIN IF ~
	InParty("Nalia")
	See("Nalia")
	!StateCheck("Nalia",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTNalia1","GLOBAL",0)~
THEN JNBMONT JNMONTNalia1
	@54 /* Pretender girl, listen 'ere! */
	DO ~SetGlobal("JNMONTNalia1","GLOBAL",1)~
	== BNALIA @55 /* Are you talking to me? */
	== JNBMONT @56 /* Yes! Ye and yer noble goals. Instead of babblin' so much, ye could be of use for once. */
	= @57 /* Ye be unable to pick a basic lock or find a trap if it hit yer pretty face. */
	== BNALIA @58 /* I have done nothing to you and yet you insult me. Tell me halfling what caused you to be as you are? */
	== JNBMONT @59 /* Unlike ye, I be a natural. If ye'd not talk so much, maybe ye could even reach a small portion of my talent. */
	== BNALIA @60 /* You are lying to me as you are lying to yourself, halfling. You obviously suffer and you choose to blame the world for it. */
	== JNBMONT @61 /* Pah! Ye be foolish to talk to me as such. Now sod off, 'fore me blade slips. */
EXIT

CHAIN IF ~
	InParty("Nalia")
	See("Nalia")
	!StateCheck("Nalia",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTNalia2","GLOBAL",0)~
THEN BNALIA JNMONTNalia2
	@62 /* Do you have family somewhere, Montaron? */
	DO ~SetGlobal("JNMONTNalia1","GLOBAL",1)~
	== JNBMONT @63 /* Shut it girl! */
	== BNALIA @64 /* You must have parents. Are they still alive? */
	== JNBMONT @65 /* I told ye to cut it out! */
	== BNALIA @66 /* Come on. Tell me something and I'll stop bothering you. */
	== JNBMONT @67 /* I'll tell ye, but if ye bother me again I'll cut yer tongue. */
	= @68 /* My family be dead, except I've a brother somewhere. */
	== BNALIA @69 /* What happened to your fam.. */
	== JNBMONT @70 /* I'll put ye in a grave if ye press on! */
	== BNALIA @71 /* Fine.. fine. */
	== BKORGAN IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @72 /* He's chatty as a rock, hah! I'm surprised ye even got one sentence out of him. */
EXIT

CHAIN IF ~
	InParty("Nalia")
	See("Nalia")
	!StateCheck("Nalia",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTNalia2","GLOBAL",1)~
THEN BNALIA JNMONTNalia2.1
	DO ~SetGlobal("JNMONTNalia1","GLOBAL",2)~
EXIT


/* =====================================
============== Keldorn =================
===================================== */

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTKeldorn1","GLOBAL",0)~
THEN JNBMONT JNMONTKeldorn1
	@0 /* Eh, <CHARNAME>! What's for dinner? */
	DO ~SetGlobal("JNMONTKeldorn1","GLOBAL",1)~
	== BKELDOR @1 /* You dare demand dinner halfling! It is a disgrace you are breathing the same air as me! */
	== JNBMONT @2 /* Pah! So what ye cretin! */
	== BKELDOR @3 /* You dare to insult me. I have seen and heard enough! */
	= @4 /* Send him on his way at once <CHARNAME>.. or even better join me to send him to his grave, for I will not much longer keep you company if this keeps up! */
	== JNBMONT @5 /* I have no equal, old man. Ye'll regret putting this ultimatum on yerself. */
EXIT

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTKeldorn1","GLOBAL",1)~
THEN BKELDOR JNMONTKeldorn2
	@6 /* You seem ignorant to my objections towards the vile scoundral you carry with you, <CHARNAME>. Thus I will no longer stay with you to endure this insult to my honor. */
	DO ~SetGlobal("JNMONTKeldorn1","GLOBAL",2)~
	== JNBMONT @7 /* Hah! Flee ye coward. We've no need o' some old fool. */
	== BKELDOR @8 /* I can only pray that you come to your senses, <CHARNAME>. */
	= @9 /* May we never meet again. */
	DO ~LeaveParty() EscapeAreaNoSee()~
EXIT

/* =====================================
============== Yoshimo =================
===================================== */


CHAIN IF ~
	InParty("Yoshimo")
	See("Yoshimo")
	!StateCheck("Yoshimo",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	Global("JNMONTYoshimo1","GLOBAL",0)~
THEN BYOSHIM JNMONTYoshimo1
	@27 /* I am curious Montaron. What was it like to come back from the dead? */
	DO ~SetGlobal("JNMONTYoshimo1","GLOBAL",1)~
	== JNBMONT @29 /* 'Twas a relief. It be a painful place. */
	== BYOSHIM @30 /* If you truly were tortured in your afterlife, my fierce companion, maybe you should change your ways. */
	== JNBMONT @31 /* Pah! I'll no change anything, but I will make sure I'll nae go back to that blasted place! */
	== BYOSHIM @32 /* An ambitious goal... still one can never be too sure when death waits around the corner. */
	== JNBMONT @33 /* Yers be a lot sooner if ye keep asking me so many damn questions! */
	== BYOSHIM @34 /* I meant no offense, my short friend. Let us continue onwards then. */
EXIT
