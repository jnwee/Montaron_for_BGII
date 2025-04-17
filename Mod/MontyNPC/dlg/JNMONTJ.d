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

// Ribald

CHAIN IF WEIGHT #-1
~InParty("JNMONT")
See("JNMONT")
!StateCheck("JNMONT",STATE_SLEEPING)
Global("RibaldJNMONT","LOCALS",0) ~ THEN RIBALD jnm1
	@1005
	DO ~SetGlobal("RibaldJNMONT","LOCALS",1)~
	== RIBALD @1006
	== JNMONTJ IF ~Global("JNMONTXzarTalk", "GLOBAL", 9)~ THEN  @1007
	== JNMONTJ IF ~!Global("JNMONTXzarTalk", "GLOBAL", 9)~ THEN @1008
	== RIBALD @1009
EXIT

// Mad Cleric (Docks)

I_C_T DCLERIC 0 JNMONTMadCleric0
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1010
END

I_C_T2 DCLERIC 4 JNMONTMadCleric4
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1011
END

// Shadow Thief Sentry

I_C_T STGUARD1 2 JNMONTStGuard2
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1012
END

// Bregg & Chorvale

INTERJECT COHRVALE 1 JNMONTCohrvale1
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1013
	== COHRVALE IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1014 DO ~Enemy()~
EXIT

// Nalia

I_C_T NALIA 45 JNMONTNaliaInit45
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1015
END

// Lynis

I_C_T LLYNIS 6 JNMONTLynis6
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1016
END

// Hendak

I_C_T HENDAK 18 JNMONTHendak18
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1017
END

// Baron Ployer

I_C_T BARONP 43 JNMONTPloyer43
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1018
END

// Renal Bloodscalp

I_C_T RENAL 10 JNMONTRenal10
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID) Global("JNMONTRenal10Talk","GLOBAL",0)~ THEN @1019 DO ~SetGlobal("JNMONTRenal10Talk","GLOBAL",1)~
END

I_C_T RENAL 30 JNMONTRenal30
	==JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1020
END

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

I_C_T JAREVIA 0 JNMONTReviane0
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1021
	== JAREVIA IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1022
END

I_C_T2 JAREVIA 7 JNMONTReviane7
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1023
END

I_C_T2 JAREVIA 9 JNMONTReviane9
	== JNMONTJ IF ~InParty("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1023
END

I_C_T PLAYER1 5 JNMONTFirstSlayerChange1
== JNMONTJ IF ~InParty("JNMONT") See("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1004 /* Ye make for a powerful ally. Almost worth me respect. */
END


/* =====================================
=========== Triggered Talks ============
===================================== */

/* Not going to Xzar's deathplace */

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",2)~ THEN JNMONTJ xt2
	@1 /* <CHARNAME>! Ye promised me a dead lunatic. */
	== JNMONTJ @2 /* Show him or you will take his place. */
	DO ~IncrementGlobal("JNMONTXzarTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTVisitXzarTimer","GLOBAL",600)~
EXIT

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",4)~ THEN JNMONTJ xt3
	@3 /* I'll no be played by ye any longer <CHARNAME>! You're lucky my dagger isn't with me. */
	== JNMONTJ @4 /* I be tellin' you to make way to Xzar or ye'll not have my company for much longer. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @5 /* Oh, what a dreadful future! To not have some bloodthirsty imbecile at our backs.. */
	== JNMONTJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @6 /* Shut it cretin! If I no see a dead green wizard, a red one will have to do. */
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @7 /* Then let us make haste to some loons corpse at once <CHARNAME>. Before I have to relieve us of this cur. */
	DO ~IncrementGlobal("JNMONTXzarTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTVisitXzarTimer","GLOBAL",600)~
EXIT

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",6)~ THEN JNMONTJ xt4
	@8 /* I see now that ye're nothing, but a lying coward <CHARNAME>. I've no need of ye and yer lot anyway! */
	DO ~IncrementGlobal("JNMONTXzarTalk","GLOBAL",1) LeaveParty() EscapeArea()~
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @9 /* Why you've even been dragging him along in the first place is a mystery to me. */
	= @10 /* Anyways.. good riddance to bad rubbish. */
EXIT

/* Initiate Quest1 when reaching Xzar's deathplace */

CHAIN IF ~Global("JNMONTXzarTalk","GLOBAL",8)~ THEN JNMONTJ xt
	@11 /* You weren't lying after all. The madman truly be dead! A day like non other! */
	DO ~IncrementGlobal("JNMONTXzarTalk","GLOBAL",1)~
	== EDWINJ IF ~InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @12 /* One lunatic less <CHARNAME> can take in his company. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @13 /* Xzar wanted us to rescue you, he cared for you. How can you be so cold towards his death? */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @14 /* Pah! In me partnership with the mad wizard I murdered many. But no kill was as tempting as the lunatic himself. */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @15 /* If only me boss hadn't took a liking to him. */
	= @16 /* Now let us talk about the future <CHARNAME>. */
	= IF ~Global("JNMONTBg1","GLOBAL",0)~ @17 /* The killing in yer company be nice. Now that I'm finally relieved of my "partner" we can join up as long as ye prove effective. */
	= IF ~Global("JNMONTBg1","GLOBAL",1)~ @18 /* Now then.. If I remember correctly ye've lots of enemies as always <CHARNAME>? If the loot be as nice as always, I'll do what I do best for ye again. */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @19 /* His partner lies dead besides us and he shows nothing but joy. Think <CHARNAME>. Why would we be any different to him? */
END
+ ~!InParty("Aerie") !InMyArea("Aerie") StateCheck("Aerie",CD_STATE_NOTVALID)~ + @20 EXTERN JNMONTJ xt.1 /* Wasn't Xzar your partner? Why are you happy about his death? */
++ @21 EXTERN JNMONTJ xt.2 /* Very well. Let us waste no more time and get going. */
++ @22 EXTERN JNMONTJ xt.3 /* Har HAR there Montaron! Let's move then, eh, chum? */
++ @23 EXTERN JNMONTJ xt.4 /* On second thought. I will sleep better without you in my company. */

CHAIN JNMONTJ xt.1
	@14 /* Pah! In me partnership with the mad wizard I killed many.. but no kill was as tempting as the madman himself. */
	== JNMONTJ @15 /* If only my boss hadn't took a liking to him. */
	= @24 /* Enough talk of Xzar now! Let us find some prey for me blade. */
END
++ @21 EXTERN JNMONTJ xt.2 /* Very well. Let us waste no more time and get going. */
++ @23 EXTERN JNMONTJ xt.4 /* On second thought I will sleep better without you in my company. */

CHAIN JNMONTJ xt.2
	@25 /* Agreed. First thing, we should get one o' me tools from my old hideout quickly. It is right around here. */
	== KELDORJ IF ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN @26 /* I will not stand for this. By consorting with such a vile being you have shown me your true self <CHARNAME>. */
	= @27 /* I must ask you to reconsider your decision or I am forced to abandon your cause. */
END
IF ~!InParty("Keldorn") !InMyArea("Keldorn") StateCheck("Keldorn",CD_STATE_NOTVALID)~ THEN DO ~SetGlobal("JNMONTVisitedXzarDeath","Global",1) AddJournalEntry(@1000002,QUEST)~ EXIT
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @28 EXTERN JNMONTJ xt.2.1 /* Right you are, Sir Keldorn. I was a fool not to see the obvious. You're on your own Montaron. Leave us at once. */
+ ~ReactionGT(Myself, 17) InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @29 EXTERN KELDORJ jn_xt.2.2 /* My decision is final. It might not seem wise to you Keldorn, but I ask you to trust me for now. */
+ ~!ReactionGT(Myself,17) InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @29 EXTERN KELDORJ jn_xt.2.3 /* My decision is final. It might not seem wise to you Keldorn, but I ask you to trust me for now. */
+ ~InParty("Keldorn") InMyArea("Keldorn") !StateCheck("Keldorn",CD_STATE_NOTVALID)~ + @30 EXTERN KELDORJ jn_xt.2.4 /* That's too bad then old man. If you force me to choose, you loose. */

// Montaron leaves
CHAIN JNMONTJ xt.2.1
	@31 /* A fool ye are, following the advice of an old man, blinded by some order. */
	== JNMONTJ @32 /* My work is better done without yer interference anyways. */
	DO ~SetGlobal("JNMONTKickedOut","GLOBAL",1) LeaveParty() EscapeArea()~
	== KELDORJ @33 /* You chose right <CHARNAME>. For this I will turn a blind eye to your ealier ignorance, but in the future I expect you to follow the noble and righteous path. */
EXIT

// Keldorn persuaded
CHAIN KELDORJ jn_xt.2.2
	@34 /* Your new associate makes it hard, but I have yet to find reason not to trust you. I will give him a chance to show his worth, for now. */
	DO ~SetGlobal("JNMONTVisitedXzarDeath","GLOBAL",1) AddJournalEntry(@1000002,QUEST)~
	== JNMONTJ @35 /* Then shut yer trap old man and get going already. */
	== KELDORJ @36 /* You test my patience halfman! <CHARNAME>'s word only holds my hand for so long. */
EXIT

// Keldorn not persuaded
CHAIN KELDORJ jn_xt.2.3
	@37 /* No <CHARNAME>. Your indecision towards him is enough to show, that only one of us strives for righteousness. You will have to go on without me. */
	DO ~LeaveParty() EscapeArea()~
	== JNMONTJ @38 /* Tell your sermons to the other fools in your order, old man. I've no need for prayers, my skills be enough as is. */
	DO ~SetGlobal("JNMONTVisitedXzarDeath","GLOBAL",1) AddJournalEntry(@1000002,QUEST)~
EXIT

// Keldorn leaves
CHAIN KELDORJ jn_xt.2.4
	@39 /* There will come a time when you will regret your choices in life <CHARNAME>. */
	== KELDORJ @40 /* May we never meet again, though if we should, I reckon it will be at odds. */
	DO ~LeaveParty() EscapeArea()~
	== JNMONTJ @41 /* I await the day me blade spills yer blood old fool. Better be runnin' while ye're able. */
	DO ~SetGlobal("JNMONTVisitedXzarDeath","GLOBAL",1) AddJournalEntry(@1000002,QUEST)~
EXIT

CHAIN JNMONTJ xt.3
	@42 /* I'll be damned! This be the last time ye ever recite the madman or next time I'll make sure it is. */
END
++ @21 EXTERN JNMONTJ xt.2 /* Very well. Let us waste no more time and get going. */
++ @43 EXTERN JNMONTJ xt.3.1 /* Oh, come on, Montaron. Must you be so moody all the time. */

CHAIN JNMONTJ xt.3.1
	@44 /* A madman ye are! May ye suffer for all eternity, prat! */
	DO ~LeaveParty() EscapeArea() SetGlobal("JNMONTKickedOut","GLOBAL",1)~
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @45 /* Have you truly gone mad <CHARNAME>? Did we bring the Zhent spy back just for your amusement? I hope you advise with me, the next time you have a similar idea. */
EXIT

CHAIN JNMONTJ xt.4
	@46 /* Find someone else to do yer killin' then. My work be better done alone anyway. */
	DO ~LeaveParty() EscapeArea() SetGlobal("JNMONTKickedOut","GLOBAL",1)~
EXIT


/* After Vesper (Zhentarim Thief) is dead/let go */

CHAIN IF ~Global("JNMONTVespTalk","GLOBAL",1)~ THEN JNMONTJ vt
	@63 /* Finally me dagger is in my hands again! */
END
+ ~Dead("JNVESP")~ + @64 EXTERN JNMONTJ vt.1 /* That thief. He didn't have to die. */
+ ~Dead("JNVESP")~ + @65 EXTERN JNMONTJ vt.2 /* What was that about your boss? */
+ ~!Dead("JNVESP")~ + @65 EXTERN JNMONTJ vt.3 /* What was that about your boss? */
++ @66 EXTERN JNMONTJ vt.4 /* I'm glad you're happy. Now let us move on. */

CHAIN JNMONTJ vt.1
	@67 /* Saved us the touble of dealing with my boss. */
END
++ @68 EXTERN JNMONTJ vt.2 /* Who is your boss? */

CHAIN JNMONTJ vt.2
	@69 /* Doesn't matter. He'll never know I'm still alive, so let's stop wasting time and move onwards, 'fore ye annoy me again. */
EXIT

CHAIN JNMONTJ vt.3
	@70 /* Thanks to yer foolishness you'll likely meet him soon enough. Now get a move on 'fore ye annoy me even more! */
EXIT

CHAIN JNMONTJ vt.4
	@71 /* Agreed. */
EXIT

CHAIN IF ~Global("JNMONTMaeVarTalk","GLOBAL",2)~ THEN JNMONTJ jnmt
	@72
	DO ~SetGlobal("JNMONTMaeVarTalk","GLOBAL",3)~
END
++ @73 EXTERN JNMONTJ jnmt.1
++ @74 EXTERN JNMONTJ jnmt.2
++ @75 EXTERN JNMONTJ jnmt.3
++ @76 EXTERN JNMONTJ jnmt.4

CHAIN JNMONTJ jnmt.1
	@77
EXIT

CHAIN JNMONTJ jnmt.2
	@78
EXIT

CHAIN JNMONTJ jnmt.3
	@79
EXIT

CHAIN JNMONTJ jnmt.4
	@80
EXIT


/* =====================================
============== Dialogues ===============
===================================== */

// No random player private talks.. since Montaron isn't too interested in talking
// and forcing some dialogue where there is none needed makes no sense imo
// similar to most vanilla NPCs Monty is just there for the ride


/* Underdark Talk */

CHAIN IF ~Global("JNMONTChapter5","GLOBAL",2)~ THEN JNMONTJ ut
    @37 /* This be a nice place <CHARNAME>. Why not stay down here, where no daylight can reach us. */
    DO ~SetGlobal("JNMONTChapter5","GLOBAL",3)~
    == VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @48 /* Of course you say that, iblith. You wouldn't last a minute down here alone. You're nothing compared to the drow, pathetic halfman. */
    == AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @49 /* Don't you listen to him <CHARNAME>. Nothing good can come of us being down here. */
    == JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @50 /* Shut yer trap girl! Yer whining makes me sick. */
    == CERNDJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @51 /* I will be grateful when we are out of here and back under the sun. You truly need to find peace and balance in your heart, if you despise the daylight so much, you'd rather stay in this place. */
    == JNMONTJ IF ~InParty("Cernd") InMyArea("Cernd") !StateCheck("Cernd",CD_STATE_NOTVALID)~ THEN @52 /* Go find me some balance then and stop bothering me, dirtlover. */
END
++ @53 EXTERN JNMONTJ ut.1 /* I'll not stay down here a second longer than needed. */
++ @54 EXTERN JNMONTJ ut.2 /* It is indeed nice down here, but I have to chase after Irenicus. */
++ @55 EXTERN JNMONTJ ut.3 /* I have important things to worry about, I have no time to talk to you. */

CHAIN JNMONTJ ut.1
	@56 /* A pity. There is so much potential down here. */
	== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @57 /* Don't you understand? Down here you're nothing special. You're just prey for your betters. */
	== JNMONTJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @58 /* I have no equal! Your people will learn to fear me in time. */
	== EDWINJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @59 /* Why is confidence always wasted on those small of mind.. */
EXIT

CHAIN JNMONTJ ut.2
	@60 /* I will bring death upon that mageling soon enough. And then I will return down here. */
	== VICONIJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @57 /* Don't you understand? Down here you're nothing special. You're just prey for your betters. */
	== JNMONTJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID)~ THEN @58 /* I have no equal! Your people will learn to fear me in time. */
	== EDWINJ IF ~InParty("Viconia") InMyArea("Viconia") !StateCheck("Viconia",CD_STATE_NOTVALID) InParty("Edwin") InMyArea("Edwin") !StateCheck("Edwin",CD_STATE_NOTVALID)~ THEN @59 /* Why is confidence always wasted on those small of mind.. */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @61 /* I knew you're mad, halfman, but this is a new low. Even for you. Why we still drag this scum along I can't begin to understand, <CHARNAME>. */
EXIT

CHAIN JNMONTJ ut.3
	@62 /* Fine by me. Just make sure there be prey around. */
END
