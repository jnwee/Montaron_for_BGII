BEGIN JNMONTJ

// Dialogue interceptions - very incomplete as of now

EXTEND_BOTTOM TRGYP02 2
IF ~!InPartySlot(LastTalkedToBy,0) Name("JNMONT",LastTalkedToBy)~ EXTERN TRGYP02 g1
END

CHAIN TRGYP02 g1
@0 /* You are a... */
== JNMONTJ @1 /* I've no time for yer nonsense. Quit babblin' lest I cut yer tongue. */ 
EXIT

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
== JNMONTJ @3 /* Shut yer trap ye madman or ye'll get to see me tools soon enough. */
END CELVAN 1

I_C_T PLAYER1 5 JNMONTFirstSlayerChange1 
== JNMONTJ IF ~InParty("JNMONT") See("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @4 /* Ye make for a powerful ally. Almost worth me respect. */
END

// Quest related Talks

// Talk if Montaron is serving you to guide you to his dagger

CHAIN IF ~Global("JNMontQuest1","GLOBAL",2)~ THEN JNMONTJ xqt
	@93 /* <CHARNAME>! I'll tell ye somethin'. */
	= @94 /* For yer and me sake... I've got one o' me tools stashed in me and Xzar's old base. Ye need to get it for me. */
	DO ~SetGlobal("JNMONTVisitedXzarDeath","Global",1) AddJournalEntry(@500,QUEST)~
END
++ @95 EXIT
++ @96 EXIT

// Talk upon reaching Xzars place of death

CHAIN IF ~Global("JNMONTXzarTalk","AR0300",1) Global("JNMontResurrected","GLOBAL",2)~ THEN JNMONTJ xta
	@87 /* The madman truly is dead. Brings me at least some joy in me misery. */
	DO ~SetGlobal("JNMONTXzarTalk","AR0300",2)~
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @88 /* Xzar wanted us to rescue you, he cared for you. How can you be so cold towards his death? */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @89 /* Pah! In me partnership with the mad wizard I murdered many. But no kill was as tempting as the lunatic himself. */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @90 /* If only me boss hadn't took a liking to him. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @91 /* You truly have no heart. You... you deserve your punishment. */
	== JNMONTJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @92 /* Ye've no idea of what I deserve girl. Now leave me to me misery! */
EXIT

CHAIN IF ~Global("JNMONTXzarTalk","AR0300",1) Global("JNMontResurrected","GLOBAL",1)~ THEN JNMONTJ xt
	@5 /* Ye weren't lyin' after all. Finally I'm rid o' that madman. */
	DO ~SetGlobal("JNMONTXzarTalk","AR0300",2)~
	== JNMONTJ @6 /* But it looks like I'm out o' a job for now. */
	= @7 /* Ye seem promisin' enough, so might as well stick with yer band of miscreants. */
	== JAHEIRAJ IF ~InParty("Jaheira") InMyArea("Jaheira") !StateCheck("Jaheira",CD_STATE_NOTVALID)~ THEN @8 /* <CHARNAME>, I must question your judgement in character. There is darkness in him that cannot be ignored. I urge you to take a close look at him before making rash decisions. */
END
++ @9 EXTERN JNMONTJ xt1 /* Wasn't Xzar your partner? Why are you happy about his death? */
++ @10 EXTERN JNMONTJ xt.join /* Well, let's go then. */
++ @12 EXTERN JNMONTJ xt.leave /* On second thought I will sleep better without you in my company. */

CHAIN JNMONTJ xt1
	@13 /* I worked with the mad wizard, sure. But wasn't a day I didn't wanna slit his throat. Now that it's done me old boss will nae be pleased. */
	== AERIEJ IF ~InParty("Aerie") InMyArea("Aerie") !StateCheck("Aerie",CD_STATE_NOTVALID)~ THEN @15 /* The poor wizard really thought he was his friend and tried to rescue him. And still he is so cold, that's just wrong.  Please don't let him stay with us <CHARNAME>. */
	== JNMONTJ @14 /* So? Yer curiosity's sated? Can we keep goin'. */
END
++ @16 EXTERN JNMONTJ xt.join /* Sure, let's go. */
++ @11 EXTERN JNMONTJ xt.fight /* You cold and evil creature! I shall strike you down. */
++ @12 EXTERN JNMONTJ xt.leave /* On second thought I will sleep better without you in my company. */

CHAIN JNMONTJ xt.join
	@17 /* One last thing. We need to get one o' me tools from me and Xzar's old hideout, and ye better not take too long. */
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
	@23 /* Me work's better done alone anyway ye cretin. */
	DO ~LeaveParty() EscapeArea() SetGlobal("JNMONTKickedOut","GLOBAL",1)~
	== ANOMENJ IF ~InParty("Anomen") InMyArea("Anomen") !StateCheck("Anomen",CD_STATE_NOTVALID)~ THEN @24 /* Off with you now, vile scoundrel! Our most noble band has no place for lowly scum as you are. */
EXIT

/* Conflict with Keldorn achieved through one of Montaron's Dialogues (at Xzar's place of death) */

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

// Player private talks

APPEND JNMONTJ	// not sure if I need append but I think I read somewhere you need it to transition from CHAIN to SAY

// Talk 1 - about Irenicus

IF ~Global("JNMONTTalk","GLOBAL",2)~ t1
	SAY @25 /* Ye! <CHARNAME>. */
	++ @26 + t1. /* Yes? */
END

IF ~~ t1.
	SAY @27 /* While stayin' with ye lot, I overheard ye're huntin' some powerful mage. Who's this Irenicus fella? */
	++ @28 + t1.1 /* I don't know who he is, but he has captured Imoen and I'm going to rescue her. */
	++ @29 + t1.2 /* I don't know, but I owe him a great debt of pain. */
	++ @30 + t1.3 /* I don't know, but he seems to know something about a power within me. */
END

IF ~~ t1.1
	SAY @31 /* All this to save that lass o' yers? Ye need to toughen up. */
	= @32 /* Can't say I'm not intrigued by a mighty wizard's treasure. So as long as the gold flows, I'll do yer killin'. */
	++ @34 + t1.1.1 /* What a curious little creature you are. */
	++ @33 DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT /* Whatever you say. */
	++ @35 + t1.1.2 /* I won't have this kind of talk anymore, get out of my face! */
END

IF ~~ t1.1.2
	SAY @36 /* Ye're makin' a grave mistake. I'll give ye a chance to reconsider. */
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
	SAY @42 /* Heh, yer hatred for him gets me blood boilin'. Then let's get goin'! I can't wait to use me tools on someone. */
	IF ~~ DO ~IncrementGlobal("JNMONTTalk","GLOBAL",1) RealSetGlobalTimer("JNMONTTimer","GLOBAL",3600)~ EXIT
END

IF ~~ t1.3
	SAY @43 /* Then why are we still standin' here. If there be power to be gained ye should grab for it. */
	= @44 /* We already attract power and wealth. If ye grow stronger I can't imagine the riches we'll have. */
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

IF ~Global("JNMONTTalk","GLOBAL",4)~ t2
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
	SAY @56 /* I be wonderin' 'bout ye. We're quite successful as a team, and ye play a rather large role in that. Why's that? */
	= @57 /* Do the people fear ye that much? 'Cause I no see it. */
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

// Talk 3

IF ~Global("JNMONTTalk","GLOBAL",6)~ t3
	SAY ~Nice weather, eh.~
	IF ~~ EXIT
END

END
