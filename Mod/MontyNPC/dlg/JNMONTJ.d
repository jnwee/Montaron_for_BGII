BEGIN JNMONTJ

/* =========== Structure ============
- Interceptions
- Triggered Talks
- Player private Talks
(Always standard route first
and then alternative)
=================================== */

// Some of the commented lines here might not be accurate to the line in the tra file, because I was lazy when refining

/* =====================================
======== Mandatory Interceptions =======
===================================== */


// Trademeet fortune teller

EXTEND_BOTTOM TRGYP02 2
IF ~!InPartySlot(LastTalkedToBy,0) Name("JNMONT",LastTalkedToBy)~ EXTERN TRGYP02 g1
END

CHAIN TRGYP02 g1
@0 /* You are a... */
== JNMONTJ @1 /* I have no time for yer nonsense. Quit babbling lest I cut yer tongue. */ 
EXIT

// Crazy Celvan

CHAIN IF WEIGHT #-1 
~InParty("JNMONT")
See("JNMONT")
!StateCheck("JNMONT",CD_STATE_NOTVALID)
Global("JNMONTReactionCelvan","AR0300",0)~ THEN CELVAN c1
@2 /* A boy once had parents so cruel,
They twisted his mind as a rule.
In shadows he grew,
With darkness he flew,
Now mischief and death are his tools. */
DO ~SetGlobal("JNMONTReactionCelvan","AR0300",1)~
== JNMONTJ @3 /* Shut yer trap, madman.. or you will get to see me tools soon enough. */
END CELVAN 1

I_C_T PLAYER1 5 JNMONTFirstSlayerChange1 
== JNMONTJ IF ~InParty("JNMONT") See("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @4 /* Ye make for a powerful ally. Almost worth me respect. */
END


/* =====================================
=========== Triggered Talks ============
===================================== */


/* ============ Standard ============ */


/* Initiate Quest1 when reaching Xzar's deathplace */

CHAIN IF ~Global("JNMONTXzarTalk","AR0300",1) Global("JNMontResurrected","GLOBAL",1)~ THEN JNMONTJ xt
	@5 /* You weren't lying after all. A fine sight to see him lie in the gutter */
	DO ~SetGlobal("JNMONTXzarTalk","AR0300",2)~
	== JNMONTJ @6 /* Now that it be done, I be out o' a job. */
	= @7 /* Ye prove effective. I'll do yer killing if you'll have me. */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @8 /* <CHARNAME>, I must question your judgement in character. There is darkness in him that cannot be ignored. I urge you to take a close look at him before making rash decisions. */
END
++ @9 EXTERN JNMONTJ xt.1 /* Wasn't Xzar your partner? Why are you happy about his death? */
++ @10 EXTERN JNMONTJ xt.join /* Well, let's go then. */
++ @12 EXTERN JNMONTJ xt.leave /* On second thought I will sleep better without you in my company. */

CHAIN JNMONTJ xt.1
	@13 /* Partners we were and wasn't a day I nae wanna slit his throat. Now that it's done me old boss will no be pleased. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @15 /* The poor wizard really thought he was his friend and tried to rescue him. And still he is so cold, that's just wrong.  Please don't let him stay with us <CHARNAME>. */
	== JNMONTJ @14 /* I be tellin' you no more, now let us proceed. */
END
++ @16 EXTERN JNMONTJ xt.join /* Sure, let's go. */
++ @11 EXTERN JNMONTJ xt.fight /* You deserve nothing but death. I see that now. */
++ @12 EXTERN JNMONTJ xt.leave /* On second thought I will sleep better without you in my company. */

CHAIN JNMONTJ xt.join
	@17 /* Very well. Let us go to my old hideout then, I have got one of my tools there. */
	DO ~SetGlobal("JNMONTVisitedXzarDeath","Global",1) AddJournalEntry(@500,QUEST)~
	== AERIEJ IF ~!InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID) InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @18 /* If.. if you're sure <CHARNAME>. But I don't like this at all. */
	== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @19 /* I will not stand for this. By consorting with such a vile being you have shown me your true self. */
	= @73 /* Clearly I was wrong about you. Rethink your decision or draw your weapon! */
	== ANOMENJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID) InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @74 /* I will not fight against a noble knight besides such villainy. It is your choice <CHARNAME>. */
	== AERIEJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID) InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @75 /* If... if you decide to split our group for this... this villain! I have no choice but to abandon your cause. */
END
IF ~!InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN EXIT
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @76 EXTERN JNMONTJ xt.keldorn1 /* I see that I have made a too rash decision. You're on your own Montaron. */
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @77 EXTERN JNMONTJ xt.keldorn2 /* Try me old man! */
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @78 EXTERN JNMONTJ xt.keldorn2 /* Come on, give Montaron a chance. */
	
CHAIN JNMONTJ xt.fight
	@20 /* Then get to cuttin'! */
	DO ~LeaveParty() Enemy() SetGlobal("JNMONTKickedOut","GLOBAL",1)~
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @21 /* A most noble decision. I salute you <CHARNAME>. */
	== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @22 /* I knew you would follow the path of rightousness <CHARNAME>. Now let us vanquish this vile creature. */
EXIT

CHAIN JNMONTJ xt.leave
	@23 /* My work's better done alone anyway, ye cretin. */
	DO ~LeaveParty() EscapeArea() SetGlobal("JNMONTKickedOut","GLOBAL",1)~
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @24 /* Off with you now, vile scoundrel! Our most noble band has no place for lowly scum as you are. */
EXIT

// Conflict with Keldorn

CHAIN JNMONTJ xt.keldorn1
	@80 DO ~LeaveParty() EscapeArea()~ /* Fine ye coward! Ye'll see no more o' me. */
	== KELDORJ @79 /* I will forgive you and account this mistake to ignorance, but for the future I expect you to have learned your lesson. */
EXIT

CHAIN JNMONTJ xt.keldorn2
	@82 /* We've no need of ye anyway, old man. */
	== KELDORJ @81 DO ~LeaveParty() Enemy()~ /* A poor choice and you will face the consequences right now. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @83 DO ~LeaveParty() Enemy()~ /* I will show no mercy to evil.	*/
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @84 DO ~LeaveParty() EscapeArea()~ /* No! I won't watch this happen. */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @85 DO ~LeaveParty() Enemy()~ /* A sad end to your story. */
	== MAZZYJ IF ~InParty("Mazzy") InMyArea("Mazzy") !StateCheck("Mazzy",CD_STATE_NOTVALID)~ THEN @86 DO ~LeaveParty() Enemy()~ /* Arvoreen! Guide my blade! */
EXIT

// Talk after retrieving Montaron's dagger

CHAIN IF ~Global("JNMontVespTalk","GLOBAL",2) Global("JNMontResurrected","GLOBAL",1)~ THEN JNMONTJ xt1
	@98 /* Ye know, <CHARNAME>. It's good to have me dagger again.. */
	DO ~SetGlobal("JNMontVespTalk","GLOBAL",3)~
END
IF ~Global("JNVESPLives","GLOBAL",1)~ EXTERN JNMONTJ xt1.1 /* Vesper lived */
IF ~Global("JNVESPLives","GLOBAL",2)~ EXTERN JNMONTJ xt1.2 /* Vesper died */

CHAIN JNMONTJ xt1.2
	@121 /* We be a powerful team. */
END
++ @122 EXTERN JNMONTJ xt1.2.1 /* Well, you're in a good mood Montaron. */
++ @123 EXTERN JNMONTJ xt1.2.2 /* There's something else you want, I presume? */
++ @124 EXTERN JNMONTJ xt1.2.3 /* Shut up. I have no time for talking. */

CHAIN JNMONTJ xt1.2.3
	@125 /* Neither do I fool, but ye'll be regretin' not hearing me out here. */
	== KORGANJ IF ~InParty("Korgan") InMyArea("Korgan") !StateCheck("Korgan",CD_STATE_NOTVALID)~ THEN @130 /* Come on <CHARNAME>. Let our friend tell his story. Hard enough to get him to speak already and I want to hear it. */
END
++ @126 EXTERN JNMONTJ xt1.2.2 /* Fine. What is it? */
+ ~!InParty("Korgan") !InMyArea("Korgan") StateCheck("Korgan",CD_STATE_NOTVALID)~ + @127 EXTERN JNMONTJ xt1.1.2.1 /* I don't care. Keep quiet. */

CHAIN JNMONTJ xt1.2.1
	@128 /* Whatever ye say.. now hear me out for I'll say it only once. */
END
++ @126 EXTERN JNMONTJ xt1.2.2 /* Fine. What is it? */
++ @129 EXTERN JNMONTJ xt1.1.2.1 /* No, I have no time for your rambling. */

CHAIN JNMONTJ xt1.2.2
	@133 /* Ye know.. with Xzar dead, me old boss will likely search for his killer. */
END
++ @101 EXTERN JNMONTJ xt1.1.1 /* Tell me about your boss then. */
++ @102 EXTERN JNMONTJ xt1.1.2 /* I'm looking forward to it. */
++ @103 EXTERN JNMONTJ xt1.1.2 /* I have no time for your schemes right now. */


CHAIN JNMONTJ xt1.1
	@99 /* But ye made a grave mistake in lettin' the fool live. */
	= @100 /* The coward's likely runnin' to me old boss right now and it won't take long until he'll come for me. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @113 /* You did the right thing <CHARNAME>! And don't let him tell you otherwise. */
END
++ @101 EXTERN JNMONTJ xt1.1.1 /* Tell me about your boss then. */
++ @102 EXTERN JNMONTJ xt1.1.2 /* I'm looking forward to it. */
++ @103 EXTERN JNMONTJ xt1.1.2 /* I have no time for your schemes right now. */

CHAIN JNMONTJ xt1.1.1
	@104 /* Never talked to him meself.. only know him by Grimblade. Xzar did the talkin' and I just did what I's told. */
	= @105 /* Problem is.. he was quite fond of Xzar, never understood why meself. Now he'll come after me for sure and it won't be a happy meetin'. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @106 /* Now the scoundrel drags us into his schemes! */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @107 /* We will have to be careful with the Zhentarim after us. They know no honor and will most likely try to strike from the shadows. */
	= @108 /* But I would lie if I said the idea of taking down at a Zhentarim Lieutenant doesn't tempt me. Lure him in I say. */
END
++ @109 EXTERN JNMONTJ xt1.1.1.1 /* But you have neither harmed Xzar, him or the Zhentarim.. correct? */
++ @110 EXTERN JNMONTJ xt1.1.2 /* We will be ready. */

CHAIN JNMONTJ xt1.1.1.1
	@111 /* He'll not see it that way.. he knew how much I despised Xzar.. probably took joy in forcin' me to work with the madman. */
	= @112 /* Besides.. ye don't just leave the Zhentarim. */
	== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @114 /* Almost reminds me of home... */
END
++ @115 EXTERN JNMONTJ xt1.1.2 /* Then we will be ready for him. */

CHAIN JNMONTJ xt1.1.2
	@116 /* Ye shouldn't underestimate him <CHARNAME>.. step carefully or ye'll doom us all. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenIsNotKnight","GLOBAL",0)~ THEN @131 /* The righteous and noble have no need for fear of fiends, cowering in the shadows. Let them come I say. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID) Global("AnomenIsNotKnight","GLOBAL",1)~ THEN @132 /* Let them come I say. I will bash their heads so that Helm may judge them for their crimes! */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @119 /* You know I rarely agree with vermin, but for once he is right <CHARNAME>. If you plan on taking Montaron along further you should be careful. */
END
++ @117 EXIT /* I will keep it in mind. */
++ @118 EXTERN JNMONTJ xt1.1.2.1 /* Let him come then. I fear nobody! */

CHAIN JNMONTJ xt1.1.2.1
	@120 /* Fool... */
EXIT
	

/* ============== Alternative =============== */


// Initiate Quest1 after some time in the group

CHAIN IF ~Global("JNMontQuest1","GLOBAL",2) Global("JNMONTVisitedXzarDeath","Global",0)~ THEN JNMONTJ xta1
	@93 /* <CHARNAME>! I'll tell ye somethin'. */
	= @94 /* For yer and me sake... I've got one o' me tools stashed in me and Xzar's old base. Ye need to get it for me. */
	DO ~SetGlobal("JNMONTVisitedXzarDeath","Global",1) AddJournalEntry(@500,QUEST)~
END
++ @95 EXTERN JNMONTJ xta1.
++ @96 EXTERN JNMONTJ xta1.

CHAIN JNMONTJ xta1.
	@97 /* Ye'd not want yer servant lacking his weapon, eh? */
EXIT

// Talk at Xzar's place of death (instead of standard talk)

CHAIN IF ~Global("JNMONTXzarTalk","AR0300",1) Global("JNMontResurrected","GLOBAL",2)~ THEN JNMONTJ xta
	@87 /* The madman truly is dead. Brings me at least some joy in me misery. */
	DO ~SetGlobal("JNMONTXzarTalk","AR0300",2)~
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @145 /* One lunatic less <CHARNAME> can take in his company. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @88 /* Xzar wanted us to rescue you, he cared for you. How can you be so cold towards his death? */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @89 /* Pah! In me partnership with the mad wizard I murdered many. But no kill was as tempting as the lunatic himself. */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @90 /* If only me boss hadn't took a liking to him. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @91 /* You truly have no heart. You... you deserve your misery! */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @92 /* Ye've no idea of what I deserve girl. Now leave me be! */
EXIT

// Talk after retrieving Montaron's dagger

CHAIN IF ~Global("JNMontVespTalk","GLOBAL",2) Global("JNMontResurrected","GLOBAL",2)~ THEN JNMONTJ xta2
	@134 /* <CHARNAME>! There's somethin' ye'll want to know. */
	DO ~SetGlobal("JNMontVespTalk","GLOBAL",3)~
END
IF ~Global("JNVESPLives","GLOBAL",1)~ EXTERN JNMONTJ xta2.1 /* Vesper lived */
IF ~Global("JNVESPLives","GLOBAL",2)~ EXTERN JNMONTJ xta2.2 /* Vesper died */

CHAIN JNMONTJ xta2.1
	@135 /* The coward ye left breathin' is probably runnin' to me boss right now. And once me boss hears of me livin' he'll come after me for sure. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @136 /* You were right to show mercy to that unfortunate soul, <CHARNAME>. Don't let him tell you otherwise! */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @106 /* Now the scoundrel drags us into his schemes! */
END
++ @101 EXTERN JNMONTJ xt1.1.1 /* Tell me about your boss then. */
++ @102 EXTERN JNMONTJ xt1.1.2 /* I'm looking forward to it. */
++ @103 EXTERN JNMONTJ xt1.1.2 /* I have no time for your schemes right now. */

CHAIN JNMONTJ xta2.2
	@137 /* Me old boss'll want to know what happened to Xzar and when he finds us ye'll want to be ready. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @106 /* Now the scoundrel drags us into his schemes! */
END
++ @101 EXTERN JNMONTJ xt1.1.1 /* Tell me about your boss then. */
++ @102 EXTERN JNMONTJ xt1.1.2 /* I'm looking forward to it. */
++ @103 EXTERN JNMONTJ xt1.1.2 /* I have no time for your schemes right now. */


/* =====================================
======== Player private talks ==========
=========== Standard route =============
===================================== */


APPEND JNMONTJ

// Talk 1 - about Irenicus

IF ~Global("JNMONTTalk","GLOBAL",2) Global("JNMontResurrected","GLOBAL",1)~ t1
	SAY @25 /* Ye! <CHARNAME>. */
	++ @26 + t1. /* Yes? */
END

IF ~~ t1.
	SAY @27 /* While stayin' with ye lot, I overheard ye're huntin' some powerful mage. Who be him? */
	++ @28 + t1.1 /* I don't know who he is, but he has captured Imoen and I'm going to rescue her. */
	++ @29 + t1.2 /* I don't know, but I owe him a great debt of pain. */
	++ @30 + t1.3 /* I don't know, but he seems to know something about a power within me. */
END

IF ~~ t1.1
	SAY @31 /* Ye be after that lass o' yers? Ye need to toughen up. */
	= @32 /* Mighty wizards likely has some mighty treasure though. So as long as there be gold, I'll do yer killin'. */
	++ @34 + t1.1.1 /* What a curious little creature you are. */
	++ @33 DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT /* Whatever you say. */
	++ @35 + t1.1.2 /* I won't have this kind of talk anymore, get out of my face! */
END

IF ~~ t1.1.2
	SAY @36 /* Ye be makin' a grave mistake. I'll give ye a chance to reconsider. */
	++ @37 + t1.1.2.1 /* I meant what I said. I can't take your company anymore. */
	++ @38 + t1.1.2.2 /* You're right. Get back in line and let's keep going. */
END

IF ~~ t1.1.1
	SAY @39 /* Ye better nae get too curious. And now leave me be! */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t1.1.2.1
	SAY @40 /* Ye weren't good 'nough for me anyway. */
	IF ~~ DO ~LeaveParty() EscapeArea()~ EXIT
END

IF ~~ t1.1.2.2
	SAY @41 /* Heh, a coward ye be. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t1.2
	SAY @42 /* Heh, yer hatred for him gets my blood boilin'. Can nae wait to use me tools on someone. Let's move fast then. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t1.3
	SAY @43 /* Then why are we still standin' here. If there be power to be gained ye should grab for it. */
	= @44 /* We already be a powerful lot. If ye grow stronger.. oh the riches we'll have. */
	++ @45 + t1.3.1 /* Still we should act with caution. */
	++ @46 + t1.3.2 /* We will see. */
END

IF ~~ t1.3.1
	SAY @47 /* And now ye bore me again. Let's get goin'. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t1.3.2
	SAY @48 /* Soon I hope. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

// Talk 2 - about leadership

IF ~Global("JNMONTTalk","GLOBAL",4) Global("JNMontResurrected","GLOBAL",1)~ t2
	SAY @49 /* *you notice Montaron observing you while walking* */
	++ @50 + t2.1 /* Something on your mind, Montaron? */
	++ @51 + t2.2 /* Stop staring at me, little man. */
END

IF ~~ t2.2
	SAY @52 /* What? Me lookin' at ye? Ye're mad. */
	++ @53 + t2.2.1 /* Tell me what you want or shut up. */
	++ @54 DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT /* Just shut up. */
END

IF ~~ t2.2.1
	SAY @55 /* I was nae lookin' at ye, but there is indeed somethin' I've been thinkin' on. */
	IF ~~ GOTO t2.1
END

IF ~~ t2.1
	SAY @56 /* I be wondering 'bout ye. We be quite effective and ye as so-called leader do yer part. How ye do it? */
	= @57 /* How ye make the people fear us? 'Cause I no see it. */
	++ @58 + t2.1.1 /* People don't fear me. They respect me, because I earn it. */
	++ @59 + t2.1.2 /* Our success comes from kindness and endurance. */
	++ @60 + t2.1.3 /* The people fear me because they see my power. */
END

IF ~~ t2.1.1
	SAY @61 /* Ye can't fool me. Respect's just fear in a fancy coat, ye're not better than me, even if ye think so. */
	++ @62 + t2.1.1.1 /* I pity you for not knowing the difference. */
	++ @63 + t2.1.1.2 /* My motivation is different. */
END

IF ~~ t2.1.1.1
	SAY @64 /* Ye pity ME? Ye better watch yer back, lest I plunge a dagger into it. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t2.1.1.2
	SAY @65 /* What counts is results. And since I'm happy with yers, there's no point in arguin'. */
	= @66 /* Can't hear anymore of yer talk so let's get movin'. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t2.1.2
	SAY @67 /* Ye tell yerself that, ye noble soul. Pah! Ye sicken me. But as long ye keep makin' us rich I'll nae complain. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t2.1.3
	SAY @68 /* Ye don't look so scary, but thinkin' on it ye're right. Ye make big things happen and people fear greatness. I'll be watchin' ye more closely from now on. */
	++ @69 + t2.1.3.1 /* Sure, but do so from a distance. */
	++ @70 + t2.1.3.2 /* If I catch you looking at me again, I'll end your miserable life. */
END

IF ~~ t2.1.3.1
	SAY @71 /* Ye'll no notice me anyway. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t2.1.3.2
	SAY @72 /* Pah. Ye couldn't catch me in yer dreams and if ye did I'd have cut yer throat long before ye grabbed yer weapon. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END


/* =====================================
======== Player private talks ==========
========= Alternative route ============
===================================== */


// Talk 2 - Montaron kind of comes to terms with his existence

IF ~Global("JNMONTTalk","GLOBAL",4) Global("JNMontResurrected","GLOBAL",2)~ ta2
	SAY @164 /* Ye.. taskmaster! Why ye have me suffer like this? */
	++ @165 + ta2.1 /* What do you mean? */
	++ @166 + ta2.2 /* What suffering? You're working for me and just have a bit extra incentive to do so. */
	++ @167 + ta2.1.3 /* I offer you a chance. Take it or you'll be dead again soon. */
	++ @168 + ta2.3 /* Because you deserve it. */
END

IF ~~ ta2.1
	SAY @169 /* Ye bring me back from the dead just to enslave me! */
	++ @170 + ta2.1.1 /* How is this different from you working for the Zhentarim? */
	++ @171 + ta2.1.2 /* You just work for me and when this is done I might free you. */
	++ @172 + ta2.1.3 /* If you're so unhappy here I can send you back to the grave right away. */
END

IF ~~ ta2.2
	SAY @173 /* I be a slave to yer lot! If ye asked nice I might have joined ye freely. */
	++ @170 + ta2.1.1 /* How is this different from you working for the Zhentarim? */
	++ @171 + ta2.1.2 /* You just work for me and when this is done I might free you. */
	++ @172 + ta2.1.3 /* If you're so unhappy here I can send you back to the grave right away. */
END

IF ~~ ta2.3
	SAY @174 /* Who are ye to tell what I deserve! My potential be wasted on ye cretin. */
	++ @172 + ta2.1.3 /* If you're so unhappy here I can send you back to the grave right away. */
END

IF ~~ ta2.1.1
	SAY @175 /* Pah! I took orders and worked with a madman, but 'twas a bloody job. Suited me well. */
	++ @176 + ta2.1.1.1 /* I am your only chance on power now, halfling and you know it. */
	++ @177 + ta2.1.3 /* I give you a chance on redemption. Or do you want to go back to your deserved afterlife. */
END

IF ~~ ta2.1.3
	SAY @178 /* Ye have a point, taskmaster. Thinking on it doing your killing is a lot better than the alternative. */
	++ @179 + ta2.1.3.1 /* You're not only doing my killing. */
	++ @180 + ta2.1.3.2 /* What happened after your death? */
	++ @181 + ta2.1.3.3 /* Great. Now that this is settled, let us move on. */
END

IF ~~ ta2.1.3.1
	SAY @182 /* Say what ye will. To me the only matter be the killing and it be better than the torture in hell. */
	++ @180 + ta2.1.3.2 /* What happened after your death? */
	++ @181 + ta2.1.3.3 /* Great. Now that this is settled, let us move on. */
END

IF ~~ ta2.1.3.2
	SAY @183 /* I no like babblin' so I be sayin' it only once! */
	= @184 /* I 'member bein' in the Abyss and some lesser demon cretin torturing me to his liking. Felt like an eternity and if I be meetin' that demon again, I'll make it regret every needle and every word he spoke! */
	= @185 /* Then ye pulled me out o' there and here I be. */
	++ @186 + ta2.1.3.2.1 /* You got a second chance. You should think about taking it. */
	++ @187 + ta2.1.3.2.2 /* You got what you deserved. */
	++ @188 + ta2.1.3.2.3 /* Tough luck. Let's get moving. */
END

IF ~~ ta2.1.3.2.1
	SAY @189 /* Pah! I'll no die again. */
	+ ~ReactionGT(Player1,3)~ + @190 + ta2.1.3.2.1.1 /* Sooner or later you will die. Noone is immortal. */
	+ ~ReactionLT(Player1,4)~ + @190 + ta2.1.3.2.1.2 /* Sooner or later you will die. Noone is immortal. */
	++ @191 + ta2.1.3.2.1.2 /* Whatever you say. */
END

IF ~~ ta2.1.3.2.1.1
	SAY @192 /* Ye may be right. I'll be thinkin' on it. */
	= @193 /* But we be done talking now and I expect to be rid o' yer curse sometime. */
	IF ~~ DO ~IncrementGlobal("JNMontRedemption","GLOBAL",1)~ EXIT
END

IF ~~ ta2.1.3.2.1.2
	SAY @194 /* With my talent, my immortality be inevitable and ye'll be rotting. */
	= @195 /* I'll happily do yer killin' for now but I expect to be rid o' yer curse sometime. Now move. */
	IF ~~ EXIT
END

IF ~~ ta2.1.3.2.2
	SAY @196 /* And thanks to ye, I be suffering there no longer and I'll no return to that blasted afterlife. */
	+ ~ReactionGT(Player1,3)~ + @190 + ta2.1.3.2.1.1 /* Sooner or later you will die. Noone is immortal. */
	+ ~ReactionLT(Player1,4)~ + @190 + ta2.1.3.2.1.2 /* Sooner or later you will die. Noone is immortal. */
	++ @191 + ta2.1.3.2.1.2 /* Whatever you say. */
END

IF ~~ ta2.1.3.2.3
	SAY @197 /* Right ye are. Let us find some prey. */
	IF ~~ EXIT
END

IF ~~ ta2.1.3.3
	SAY @197 /* Right ye are. Let us find some prey. */
	IF ~~ EXIT
END

IF ~~ ta2.1.1.1
	SAY @198 /* 'Tis true... ye prove effective. Maybe staying with ye ain't that bad of a deal. */
	= @199 /* Still I expect to be rid of yer curse sometime. */
	++ @200 + ta2.1.1.1.1 /* We will see. */
	++ @201 + ta2.1.1.1.2 /* Do as I say and you will be free in no time. */
	++ @202 + ta2.1.1.1.3 /* I can't set you free unless I am sure you won't harm anyone. */
END

IF ~~ ta2.1.1.1.1
	SAY @203 /* Yes we will. Now find me some prey before I get restless. */
	IF ~~ EXIT
END

IF ~~ ta2.1.1.1.2
	SAY @204 /* As long as there be killing. If ye make me yer butler, I'll rather be back in the Abyss. Now let us find some prey to sharpen me blade. */
	IF ~~ EXIT
END

IF ~~ ta2.1.1.1.3
	SAY @205 /* Ye coward! But someday you'll be dead and I'll be free. Till then... find me some prey! */
	IF ~~ EXIT
END


END


APPEND JNMONTJ

// Talk 1 - Montaron doubts the geas is working

CHAIN IF ~Global("JNMONTTalk","GLOBAL",2) Global("JNMontResurrected","GLOBAL",2)~ JNMONTJ ta1
	@25 /* Ye! <CHARNAME>. */
END
++ @26 EXTERN JNMONTJ ta1. /* Yes? */

CHAIN JNMONTJ ta1.
	@138 /* I told ye ye'll regret this. */
	= @139 /* (As Montaron tries to throw a dagger at you he stops moving midway and falls to the ground shaking) */
	= @140 /* AH! Aarr! */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @141 /* We offer the scoundrel a chance to make up for his crimes and he repays us like this! A deserved punishment he received. */
	== YOSHJ IF ~InParty("Yoshimo") InMyArea("Yoshimo") !StateCheck("Yoshimo",CD_STATE_NOTVALID)~ THEN @142 /* The curse that was layed upon you can not be fought, my halfling friend. You will have to come to terms with your new fate. */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @143 /* Serves you right, insect. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @144 /* This is horrible.. I know he can not be trusted <CHARNAME>, but noone deserves to suffer like this. */
	== NALIAJ IF ~InParty("Nalia") InMyArea("Nalia") !StateCheck("Nalia",CD_STATE_NOTVALID)~ THEN @146 /* It pains me to see that this curse proves necessary. I wonder what shapes a person to become like him. */
	== JNMONTJ @147 /* YE CRETIN! Why ye have me suffer this? This be worse than death! */
END
++ @148 EXTERN JNMONTJ ta1.1 /* Just do as you are told and this won't happen. */
++ @149 EXTERN JNMONTJ ta1.1 /* Are you done with your little tantrum? Can we keep going. */
++ @150 EXTERN JNMONTJ ta1.2 /* This is your purgatory. Accept it or suffer even more. */

CHAIN JNMONTJ ta1.1
	@151 /* Ye treat me as if I be yer servant.. I be no servant! */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @152 /* You always have been a servant.. obeying the orders of your Zhentarim superiors. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @153 /* As if someone of your intellect was capable of being more than a servant. */
END
++ @154 EXTERN JNMONTJ ta1.1. /* You are my servant. */
++ @155 EXTERN JNMONTJ ta1.1. /* Accept it or don't. It doesn't matter to me. */

CHAIN JNMONTJ ta1.2
	@156 /* Ye think yerself so good, but ye be worse than me. Ye could have left me to rot, but instead ye torture me. */
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @157 /* A noble cause <CHARNAME>, but I worry it is wasted on this brute. */
END
++ @158 EXTERN JNMONTJ ta1.2. /* I give you a chance to redeem yourself. */
++ @155 EXTERN JNMONTJ ta1.1. /* Accept it or don't. It doesn't matter to me. */

CHAIN JNMONTJ ta1.1.
	@159 /* Yer cruelty knows no ends. Just leave me be. */
	DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~
END
++ @160 EXIT /* As you wish. */
++ @161 EXIT /* Fine. But know that next time you try something I will take your hand. */

CHAIN JNMONTJ ta1.2.
	@162 /* I can take no more of yer talk. Ye knights, paladins and goody-goodies be a prest upon us all. */
	= @163 /* May ye all suffer. */
	DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~
EXIT

END
