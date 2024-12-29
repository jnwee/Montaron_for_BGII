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
@1000 /* You are a... */
== JNMONTJ @1001 /* I have no time for yer nonsense. Quit babbling lest I cut yer tongue. */
EXIT

// Crazy Celvan

CHAIN IF WEIGHT #-1
~InParty("JNMONT")
See("JNMONT")
!StateCheck("JNMONT",CD_STATE_NOTVALID)
Global("JNMONTReactionCelvan","AR0300",0)~ THEN CELVAN c1
@1002 /* A boy once had parents so cruel,
They twisted his mind as a rule.
In shadows he grew,
With darkness he flew,
Now mischief and death are his tools. */
DO ~SetGlobal("JNMONTReactionCelvan","AR0300",1)~
== JNMONTJ @1003 /* Shut yer trap, madman.. or you will get to see me tools soon enough. */
END CELVAN 1

I_C_T PLAYER1 5 JNMONTFirstSlayerChange1
== JNMONTJ IF ~InParty("JNMONT") See("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1004 /* Ye make for a powerful ally. Almost worth me respect. */
END


/* =====================================
=========== Triggered Talks ============
===================================== */


CHAIN IF ~Global("JNMONTChapter5","GLOBAL",2)~ THEN JNMONTJ ut
    @206 /* This be a nice place <CHARNAME>. Why not stay down here, where no daylight can reach us. */
    DO ~SetGlobal("JNMONTChapter5","GLOBAL",3)~
    == VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @207 /* Of course you say that, iblith. You wouldn't last a minute down here alone. You're pathetic, halfman.. trying to imitate the drow. */
    == AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @208 /* Don't you listen to him <CHARNAME>. Nothing good can come of us being down here. */
    == JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @209 /* Shut yer trap girl! Yer whining makes me sick. */
    == CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NONVALID)~ THEN @210 /* I will be grateful when we are out of here and back under the sun. You truly need to find peace and balance in your heart, if you despise the daylight so much, you'd rather stay in this place. */
    == JNMONTJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NONVALID)~ THEN @211 /* Go find yer balance and stop bothering me then, ye dirtlover. */
END
++ @212 EXTERN JNMONTJ ut1 /* I'll not stay down here a second longer than needed. */
++ @213 EXTERN JNMONTJ ut2 /* It is nice down here, but I have to chase Irenicus. */
++ @214 EXTERN JNMONTJ ut3 /* I have important things to worry about, I have no time to talk to you. */

CHAIN JNMONTJ ut1

END

CHAIN JNMONTJ ut2

END

CHAIN JNMONTJ ut3

END


/* ============ Standard ============ */

/* Not going to Xzar's deathplace */

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",2)~ THEN JNMONTJ xt2
	@1 /* <CHARNAME>! Ye promised me a dead lunatic. */
	== JNMONTJ @2 /* Show him or you will take his place. */
	DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTVisitXzarTimer","GLOBAL",600)~
EXIT

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",4)~ THEN JNMONTJ xt3
	@3 /* I'll no be played by ye any longer <CHARNAME>! You're lucky my dagger isn't with me. */
	== JNMONJ @4 /* I be tellin' you to make way to Xzar or ye'll not have my company for much longer. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @5 /* Oh, what a dreadful future! To not have some bloodthirsty imbecile at our backs.. */
	== JNMONTJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @6 /* Shut it cretin! If I no see a dead green wizard, a red one will have to do. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @7 /* Then let us make haste to some loons corpse at once <CHARNAME>. Before I have to relieve us of this cur. */
	DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTVisitXzarTimer","GLOBAL",600)~
EXIT

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",6)~ THEN JNMONTJ xt4
	@8 /* I see now that ye're nothing, but a lying coward <CHARNAME>. I've no need of ye and yer lot anyway! */
	DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) LeaveParty() EscapeArea()~
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @9 /* Why you've even been dragging him along in the first place is a mystery to me. */
	= @10 /* Anyways.. good riddance to bad rubbish. */
EXIT

// TODO


/* Initiate Quest1 when reaching Xzar's deathplace */

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",8)~ THEN JNMONTJ xt
	@4 /* You weren't lying after all. A fine sight to see him lie in the gutter */
	DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1)~
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @5 /* One lunatic less <CHARNAME> can take in his company. */
	== JNMONTJ @6 /* Now that it be done, I be out o' a job. */
	= @7 /* Ye prove effective. I'll do yer killing if you'll have me. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @88 /* Xzar wanted us to rescue you, he cared for you. How can you be so cold towards his death? */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @89 /* Pah! In me partnership with the mad wizard I murdered many. But no kill was as tempting as the lunatic himself. */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @90 /* If only me boss hadn't took a liking to him. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @91 /* You truly have no heart. You... you deserve your misery! */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @92 /* Ye've no idea of what I deserve girl. Now leave me be! */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @8 /* <CHARNAME>, I must question your judgement in character. There is darkness in him that cannot be ignored. I urge you to take a close look at him before making rash decisions. */
END
++ @9 EXTERN JNMONTJ xt.1 /* Xzar was your partner? Why are you happy about his death? */
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

/* =====================================
======== Player private talks ==========
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
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1)~ EXIT
END
