* ==========================================
=========== Banters and Conflicts ===========
========================================== */

/*
	Progress Tracking

	Jaheira - 2 + 1R
	Korgan - 2
	Edwin - 2
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
================ Jaheira ===============
===================================== */

CHAIN IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("JNMONT",CD_STATE_NOTVALID)
!StateCheck("Jaheira",CD_STATE_NOTVALID)
CombatCounter(0)
Global("JNMONTJaheiraR","GLOBAL",0)
Global("JaheiraMatch","GLOBAL",1)
OR(2)
Global("JaheiraRomanceActive","GLOBAL",0)
Global("JaheiraRomanceActive","GLOBAL",1)~
THEN JNBMONT JNMONTJaheiraR
	@88 /* So ye want to do it with our leader, harper? */
	DO ~SetGlobal("JNMONTJaheiraR","GLOBAL",1)~
	== BJAHEIR @89 /* That is none of your business, Zhent. */
	== JNBMONT @90 /* Rude. If ye want to screw <CHARNAME>, go 'head, I'll no keep ye. */
END
++ @91 EXTERN JNBMONT JNMONTJaheiraR.1 /* I didn't know you were such a sucker for love, Montaron. */
++ @92 EXTERN JNBMONT JNMONTJaheiraR.2 /* That is none of your business, as Jaheira said. */
++ @93 EXTERN BJAHEIR JNMONTJaheiraR.3 /* No one is "screwing" anyone here, Montaron. */
++ @94 EXTERN JNBMONT JNMONTJaheiraR.4 /* Stop talking and let us move on. */

CHAIN JNBMONT JNMONTJaheiraR.1
	@95 /* Heh. I tried being nice an' all, since me and the harper are a lot now. */
	== BJAHEIR @96 /* ... */
	= @97 /* I.. I don't know what to say. You might not be a mind flayer after all. */
EXIT

CHAIN JNBMONT JNMONTJaheiraR.2
	@99 /* Ye try to be nice an' all and that's what ye get. Should've figured. */
	== BJAHEIR @100 /* Try being nice? You? */
	= @97 /* I.. I don't know what to say. You might not be a mind flayer after all. */
EXIT

CHAIN BJAHEIR JNMONTJaheiraR.3
	@101 /* Really..? I mean you're right of course. Let's keep going, Irenicus is out there somewhere. */
EXIT

CHAIN JNBMONT JNMONTJaheiraR.4
	@103 /* As ye wish, <CHARNAME>. */
EXIT

CHAIN IF ~
	InParty("Jaheira")
	See("Jaheira")
	!StateCheck("Jaheira",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTJaheira1","GLOBAL",0)~
THEN JNBMONT JNMONTJaheira1
	@83 /* Why can't ye harpers mind yer own business. Ye always have to intrude into everyones life. */
	DO ~SetGlobal("JNMONTJaheira1","GLOBAL",1)~
	== BJAHEIR @84 /* Weren't you caught spying, by the harpers? */
	== JNBMONT @85 /* *hrmphf* I've done what I'm told. Like a professional. */
	== BJAHEIR @86 /* Like Xzar's dog you mean? */
	== JNBMONT @87 /* Arrr! Yer blade better be as quick as yer wit, if ye keep to annoy me. */
EXIT

CHAIN IF ~
	InParty("Jaheira")
	See("Jaheira")
	!StateCheck("Jaheira",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTJaheira2","GLOBAL",0)~
THEN BJAHEIR JNMONTJaheira1
	@104 /* What are you going to do, when <CHARNAME> has no need of you anymore, Montaron? */
	DO ~SetGlobal("JNMONTJaheira2","GLOBAL",1)~
	== JNBMONT @105 /* Ye want to know 'ere to find me, with yer lot o' harpers? */
	== BJAHEIR @106 /* No such thing. Without the Zhentarim you are of no concern to me. */
	== JNBMONT @107 /* I be a powerful force, with or without them. When this be done, the richest will fight over who gets to pay me to most. */
	== BJAHEIR @109 /* A disappointing answer. You really are just a heartless killer. */
	== JNBMONT @110 /* If ye like it or not.. someone has to do the killin' and I'm the best at it. */
	= @111 /* No worries to ye though, ye're on my good side now. */
	== BJAHEIR @112 /* Your attempts at decency are almost sweet, were they not so wretched and dull. */
	== JNBMONT @113 /* We're a merry little lot now, so ye better get used to me, heh. */
EXIT

/* =====================================
================ Korgan ================
===================================== */

CHAIN IF ~
	InParty("Korgan")
	See("Korgan")
	!StateCheck("Korgan",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
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

CHAIN IF ~
	InParty("Korgan")
	See("Korgan")
	!StateCheck("Korgan",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTKorgan2","GLOBAL",0)~
THEN BKORGAN JNMONTKorgan2
	@115  /* I can nae understand ye, halfling. Ye live to kill, but even in that ye take no pleasure. */
	DO ~SetGlobal("JNMONTKorgan2","GLOBAL",1)~
	== JNBMONT @116 /* There be no pleasure to this life, dwarf. There be power and the ones to weak to take it. */
	== BKORGAN @117 /* Nae. There be also a good drink after a good fight and.. other pleasures. */
	== BMAZZY IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @118 /* *ugh* You are a pig of a man, Korgan. */
	== BKORGAN IF ~InParty("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @119 /* Har! Har! Har! */
EXIT

/* =====================================
================ Edwin =================
===================================== */

CHAIN IF ~
	InParty("Edwin")
	See("Edwin")
	!StateCheck("Edwin",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTEdwin1","GLOBAL",0)~
THEN JNBMONT JNMONTEdwin1
	@17 /* Ye know red one.. I never cared for ye wizards. */
	DO ~SetGlobal("JNMONTEdwin1","GLOBAL",1)~
	== BEDWIN @18 /* To not understand the finer arts of battle is to be expected from the likes of you. (That I have to bear with such company.) */
	== JNBMONT @19 /* In battle ye might have yer worth, but a dagger to the chest while ye be sleeping sound.. */
	== BEDWIN @20 /* You dare threaten me? Edwin Odesseiron.. I have no fear of some monkey with a blade! */
	== BEDWIN @21 /* You are lucky my spells would be wasted on you, ignorant fool! */
	== JNBMONT @22 /* If I catch you lacking wizard, a dagger in you sleep will relieve us all of you. */
	== BEDWIN @23 /* Pah! You're no more than a tool and will only relieve us of who <CHARNAME> tells you, simpleton. */
	== JNBMONT @24 /* Tell yourself that wizard. Now enough chatter! There be cutting to do. */
EXIT

CHAIN IF ~
	InParty("Edwin")
	See("Edwin")
	!StateCheck("Edwin",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTEdwin1","GLOBAL",1)~
THEN BEDWIN JNMONTEdwin2
	@73 /* Montaron. Stop creeping around my back and make yourself useful. */
	DO ~SetGlobal("JNMONTEdwin1","GLOBAL",2)~
	== BEDWIN @74 /* Scout the area or whatever it is you thugs do. */
	== JNBMONT @75 /* There's no trusting a wizard! What says ye ain't slinging a spell at my back, if I walk ahead. */
	// @76 for Valygar?
	== JNBMONT @77 /* It is comfortable right here behind ye, where my blade'll pierce ye 'fore ye can utter some nasty spell. */
	== BEDWIN @78 /* I can not believe I have to state the obvious again. I have no reason to waste energy on destroying a useful tool. */
	== JNBMONT @79 /* Useful I am indeed. There's no one equal to me, hah! */
	== BEDWIN @80 /* Yes you are so very skilled. (We would have to search the whole of the local thug alley to find a replacement for you) */
	== JNBMONT @81 /* So ye've come to yer senses wizard. Keep it up and ye won't have to fear getting cut. */
	== BEDWIN @82 /* How very gracious of you. *sigh* */
EXIT

/* =====================================
================ Aerie =================
===================================== */

CHAIN IF ~
	InParty("Aerie")
	See("Aerie")
	!StateCheck("Aerie",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTAerie1","GLOBAL",0)~
THEN BAERIE JNMONTAerie1
	@35 /* Stop walking behind me! */
	DO ~SetGlobal("JNMONTAerie1","GLOBAL",1)~
	== JNBMONT @36 /* Be ye scared? Why ye even travel with us be a mystery to me. */
	== BAERIE @37 /* <CHARNAME>! Can't you see? He will betray us the moment it benefits him. Please make him leave. */
	== JNBMONT @38 /* Cease yer prattle girl or me dagger will silence ye. */
	== BAERIE @39 /* See <CHARNAME>! */
	== BMINSC IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @40 EXTERN JNBMONT JNMONTAerie1Misnc /* Fear not Aerie! Me and Boo will be keeping a sharp eye on the small villain. */
END
+ ~ReputationGT(Player1,15)~ + @41 EXTERN BAERIE JNMONTAerie1.good /* Calm down Aerie, I will make sure no harm comes to you. */
+ ~ReputationLT(Player1,16)~ + @41 EXTERN BAERIE JNMONTAerie1.bad /* Calm down Aerie, I will make sure no harm comes to you. */
++ @42 EXTERN BAERIE JNMONTAerie1.leave /* If you can't stand your ground you shouldn't be part of this group. */
++ @43 EXTERN JNBMONT JNMONTAerie1.stay /* You are right Aerie. I will sleep a lot better without your company Montaron, leave at once. */

CHAIN JNBMONT JNMONTAerie1Misnc
	@44 /* Pah! Ye are no match for me. */
	== BMINSC @45 /* Watch it villain! Boo knows the smell of treachery and which butt needs kicking! */
	== JNBMONT @46 /* Ye be truly lost madman, keep yer distance from me! */
	== BAERIE @47 /* Thank you Minsc, with you at my side I feel a lot better already. */
EXIT

CHAIN BAERIE JNMONTAerie1.good
	@48 /* I do not like this, but I trust you <CHARNAME>. I am sorry for my outburst. We can continue now. */
EXIT

CHAIN BAERIE JNMONTAerie1.bad
	@49 /* You say that, but you choose to surround yourself with such evil. I'm sorry <CHARNAME>, but I can't keep going like this. */
	= @50 /* You will have to go on without me. */
	DO ~LeaveParty() EscapeAreaNoSee()~
	== JNBMONT @51 /* Finally I be rid of that whiny wench! */
EXIT

CHAIN BAERIE JNMONTAerie1.leave
	@52 /* I did not expect you to be so cold <CHARNAME>. You will see no more of me. */
	DO ~LeaveParty() EscapeAreaNoSee()~
	== JNBMONT @51 /* Finally I be rid of that whiny wench! */
EXIT

CHAIN JNBMONT JNMONTAerie1.stay
	@54 /* Keep the whiny girl with ye then. You'll meet your end with these weaklings soon enough. */
	DO ~LeaveParty() EscapeAreaNoSee()~
EXIT

CHAIN IF ~
	InParty("Aerie")
	See("Aerie")
	!StateCheck("Aerie",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTAerie1","GLOBAL",1)~
THEN JNBMONT JNMONTAerie2
	@120 /* Ye annoy me with yer every breath, girl. */
	DO ~SetGlobal("JNMONTAerie1","GLOBAL",2)~
	== BMINSC IF ~InParty("Minsc") !StateCheck("Minsc",CD_STATE_NOTVALID)~ THEN @121 EXTERN JNBMONT JNMONTAerie2.Minsc/* Bite your tongue, villain. Me and Boo will not tolerate much more mean words to our gentle witch. */
	== BAERIE @122 /* Then why do you have to keep bothering me? Are you jealous? Do you need someone to talk? */
	== JNBMONT @123 /* Heh! At least ye don't whine for once. */
	== BAERIE @124 /* You are insufferable. */
EXIT

CHAIN JNBMONT JNMONTAerie2.Minsc
	@125 /* Shut yer trap, ye big dull loghead. */
	== JNBMONT @123 /* Heh! At least ye don't whine for once. */
	== BAERIE @124 /* You are insufferable. */
EXIT

/* =====================================
================ Nalia =================
===================================== */

CHAIN IF ~
	InParty("Nalia")
	See("Nalia")
	!StateCheck("Nalia",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTNalia1","GLOBAL",0)~
THEN JNBMONT JNMONTNalia1
	@54 /* Pretender girl, listen 'ere! */
	DO ~SetGlobal("JNMONTNalia1","GLOBAL",1)~
	== BNALIA @55 /* Are you talking to me? */
	== JNBMONT @56 /* Yes! Ye and yer noble goals. Instead of babblin' so much, ye could be of use for once. */
	= @57 /* Ye be unable to pick a basic lock or find a trap if it sat on yer pretty face. */
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
	CombatCounter(0)
	Global("JNMONTNalia2","GLOBAL",0)~
THEN BNALIA JNMONTNalia2
	@62 /* Do you have family somewhere, Montaron? */
	DO ~SetGlobal("JNMONTNalia2","GLOBAL",1)~
	== JNBMONT @63 /* Shut it girl! */
	== BNALIA @64 /* You must have parents. Are they still alive? */
	== JNBMONT @65 /* I told ye to cut it out! */
	== BNALIA @66 /* Come on. Tell me something and I'll stop bothering you. */
	== JNBMONT @67 /* My family be rottin' in either their graves or homes. All the same to me. */
	== BNALIA @69 /* You're not speaking to your family? */
	== JNBMONT @70 /* I'll put ye in a grave if ye keep talking! */
	== BNALIA @71 /* Fine.. fine. */
	== BKORGAN IF ~InParty("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @72 /* He's chatty as a rock, hah! I'm surprised ye even got one sentence out of him. */
EXIT

CHAIN IF ~
	InParty("Nalia")
	See("Nalia")
	!StateCheck("Nalia",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTNalia2","GLOBAL",1)~
THEN BNALIA JNMONTNalia2.1
	DO ~SetGlobal("JNMONTNalia2","GLOBAL",2)~
EXIT


/* =====================================
============== Keldorn =================
===================================== */

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTKeldorn1","GLOBAL",0)~
THEN JNBMONT JNMONTKeldorn1
	@0 /* Eh, <CHARNAME>! What's for dinner? */
	DO ~SetGlobal("JNMONTKeldorn1","GLOBAL",1)~
	== BKELDOR @1 /* You dare demand dinner halfling! It is a disgrace you are breathing the same air as me! */
	== JNBMONT @2 /* Pah! Go rot where I can no see ye! */
	== BKELDOR @3 /* You dare to insult me. I have seen and heard enough! */
	= @4 /* Send him on his way at once <CHARNAME>.. or even better join me to send him to his grave, for I will not much longer keep you company if this keeps up! */
	== JNBMONT @5 /* I have no equal, old man. Ye'll regret putting this ultimatum on yerself. */
EXIT

CHAIN IF ~
	InParty("Keldorn")
	See("Keldorn")
	!StateCheck("Keldorn",CD_STATE_NOTVALID)
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTKeldorn1","GLOBAL",1)~
THEN BKELDOR JNMONTKeldorn2
	@6 /* You seem ignorant to my objections towards the vile scoundrel you carry with you, <CHARNAME>. Thus I will no longer stay with you to endure this insult to my honor. */
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
	CombatCounter(0)
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

/* =====================================
================ Cernd =================
===================================== */

/* =====================================
================ Imoen =================
===================================== */


CHAIN IF ~
	InParty("imoen2")
	See("imoen2")
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	!StateCheck("imoen2",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTImoen1","GLOBAL",0)~
THEN BImoen2 JNMONTImoen1
	@127 /* Hey Monty. Why are you traveling with us? */
	DO ~SetGlobal("JNMONTImoen1","GLOBAL",1)~
	== JNBMONT @128 /* What ye call me? */
	== BImoen2 @129 /* Monty. Like your partner I think. Actually.. where is he? */
	== JNBMONT @130 /* Rottin' on some street. And not to a small bit accountable to his lunacies, so ye better stop at once, or ye'll end up the same. */
	== BImoen2 IF ~Global("JNMONTBg1","GLOBAL",1)~ THEN @131 EXTERN JNBMONT JNMONTImoen1.1 /* I see you're gnarly as ever. Why <CHARNAME> took you to travel with us, still seems odd to me. */
	== BImoen2 IF ~!Global("JNMONTBg1","GLOBAL",1)~ THEN @133 EXTERN JNBMONT JNMONTImoen1.2 /* I see you're gnarly as ever. Makes sense that <CHARNAME> walked past you on that road to Candlekeep. */
EXIT

CHAIN JNBMONT JNMONTImoen1.1
	@132 /* <CHARNAME>, unlike ye silly girl, knows <HE/SHE> needs me to do what he no likes, and I be the best at it. */
EXIT

CHAIN JNBMONT JNMONTImoen1.2
	@134 /* Pah. But <HE/SHE> changed his mind as ye see. I be the best at cuttin' and <CHARNAME> needs lots of people cut, heh. */
EXIT

CHAIN IF ~
	InParty("imoen2")
	See("imoen2")
	!StateCheck("JNMONT",CD_STATE_NOTVALID)
	!StateCheck("imoen2",CD_STATE_NOTVALID)
	CombatCounter(0)
	Global("JNMONTImoen2","GLOBAL",0)~
THEN JNBMONT JNMONTImoen1
	@135 /* *sigh* I beg ye, girl. Quit yer babblin', I can no take it for much longer. */
	DO ~SetGlobal("JNMONTImoen2","GLOBAL",1)~
	== BImoen2 @136 /* Come on, Monty. Just tell me how you died and I won't bother you for at least the rest of the day. */
	== JNBMONT @137 /* If ye push it, you'll be able to tell such a tale soon 'nough. */
	== BImoen2 @138 /* Have it your way. Next time you want something from me, you better have an apology ready. */
EXIT
