/* =========================================
==== Priest Dialogue to resurrect Monty ====
========================================= */

// Priest of Ilmater in Slums

APPEND SLILMAT

IF ~~ THEN BEGIN JNRM1
	SAY @1 /* I can certainly try, but our church will require a donation for such a service. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM1.1 /* Fine. Here you have two thousand gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM1.2 /* Would a thousand gold suffice? */
	++ @4 GOTO JNRM1.3 /* There is also something else I require. When you resurrect him I require you lay a curse of some form on him to force him into my servitude. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM1.res
	SAY @8 /* Thank you for your contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",1)
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(2)
	PlaySound("CAS_M04")
	Wait(2)
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM1.1
	SAY @24 /* You are most benevolent <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM1.res
END

IF ~~ THEN BEGIN JNRM1.2
	SAY @25 /* Certainly, <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM1.res
END

IF ~~ THEN BEGIN JNRM1.3
	SAY @26 /* We do not provide such a service here. The willingness to suffer has to and will come from oneself. */
	++ @27 GOTO JNRM1.3.1 /* Do you know where I might find such a service? */
	++ @28 GOTO JNRM1.3.2 /* Fine. Just resurrect him then. */
	++ @29 EXIT /* I will take my leave then. */
END

IF ~~ THEN BEGIN JNRM1.3.1
	SAY @30 /* Some of the larger temples in the temple district might prove helpful in this case. Though I urge you to reconsider your course of action <BROTHERSISTER>. */
	++ @31 EXIT /* Thank you good priest. */
	++ @32 EXIT /* Well, thank you for nothing. */
END

IF ~~ THEN BEGIN JNRM1.3.2
	SAY @33 /* Again I'll have to ask you for a donation before I can start with the procedure. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM1.1 /* Fine. Here you have two thousand gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM1.2 /* Would a thousand gold suffice? */
	++ @5 EXIT /* Actually nevermind. */
END

END

EXTEND_BOTTOM SLILMAT 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM1 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priest of Oghma in the Docks

APPEND DOGHMA

IF ~~ THEN BEGIN JNRM2
	SAY @1 /* I can certainly try, but our church will require a donation for such a service. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM2.1 /* Fine. Here you have two thousand gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM2.2 /* Would a thousand gold suffice? */
	++ @4 GOTO JNRM2.3 /* There is also something else I require. When you resurrect him I require you lay a curse of some form on him to force him into my servitude. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM2.res
	SAY @8 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",1)
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(2)
	PlaySound("CAS_M04")
	Wait(2)
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM2.1
	SAY @7 /* Certainly. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM2.res
END

IF ~~ THEN BEGIN JNRM2.2
	SAY @6 /* If that is all you can offer it will do. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM2.res
END

IF ~~ THEN BEGIN JNRM2.3
	SAY @9 /* You will not find such a service here! What you suggest is foul I will have no more of it. */
	+ ~ReputationGT(Player1,13)~ + @10 GOTO JNRM2.3.1 /* Haven't you heard of me? I am a force of good and you can trust in my judgement. */
	+ ~ReputationLT(Player1,14)~ + @10 GOTO JNRM2.3.2 /* Haven't you heard of me? I am a force of good and you can trust in my judgement. */
	++ @11 GOTO JNRM2.3.2 /* What's the problem? I don't see any harm in it. */
	++ @12 DO ~TakePartyGold(2000)~ GOTO JNRM2.res /* I'm sorry I don't know why I said that. Two thousand gold you said? Here you go. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM2.3.1
	SAY @13 /* I have indeed heard of you and what you say is true. Still you won't find the service you described here. But because I trust your judgement I will advise you to go seek out the worshippers of Talos for such a deed. */
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JNRM2.3.2
	SAY @14 /* What you suggest is foul and I will have no part in it! */
	IF ~~ THEN EXIT
END

END

EXTEND_BOTTOM DOGHMA 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM2 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priest of Ilmater in Waukeens Promenade

APPEND WILMAT

IF ~~ THEN BEGIN JNRM3
	SAY @1 /* I can certainly try, but our church will require a donation for such a service. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM3.1 /* Fine. Here you have two thousand gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM3.2 /* Would a thousand gold suffice? */
	++ @4 GOTO JNRM3.3 /* There is also something else I require. When you resurrect him I require you lay a curse of some form on him to force him into my servitude. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM3.res
	SAY @8 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",1)
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(2)
	PlaySound("CAS_M04")
	Wait(2)
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM3.1
	SAY @24 /* You are most benevolent <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM3.res
END

IF ~~ THEN BEGIN JNRM3.2
	SAY @25 /* Certainly, <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM3.res
END

IF ~~ THEN BEGIN JNRM3.3
	SAY @26 /* We do not provide such a service here. The willingness to suffer has to and will come from oneself. */
	++ @27 GOTO JNRM3.3.1 /* Do you know where I might find such a service? */
	++ @28 GOTO JNRM3.3.2 /* Fine. Just resurrect him then. */
	++ @29 EXIT /* I will take my leave then. */
END

IF ~~ THEN BEGIN JNRM3.3.1
	SAY @30 /* Some of the larger temples in the temple district might prove helpful in this case. Though I urge you to reconsider your course of action <BROTHERSISTER>. */
	++ @31 EXIT /* Thank you good priest. */
	++ @32 EXIT /* Well, thank you for nothing. */
END

IF ~~ THEN BEGIN JNRM3.3.2
	SAY @33 /* Again I'll have to ask you for a donation before I can start with the procedure. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM3.1 /* Fine. Here you have two thousand gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM3.2 /* Would a thousand gold suffice? */
	++ @5 EXIT /* Actually nevermind. */
END

END

EXTEND_BOTTOM WILMAT 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM3 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priest of Helm

APPEND HELMPR

IF ~~ THEN BEGIN JNRM4
	SAY @34 /* Of course my lord, though we would require a sizeable donation of... let's say 1000 gold for such a service. */
	+ ~PartyGoldGT(1000)~ + @35 GOTO JNRM4.res /* Very well. */
	++ @4 GOTO JNRM4.3 /* There is also something else I require. When you resurrect him I require you lay a curse of some form on him to force him into my servitude. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM4.res
	SAY @8 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",1)
	TakePartyItem("MISC5U")
	TakePartyGold(1000)
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(2)
	PlaySound("CAS_M04")
	Wait(2)
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM4.3
	SAY @9 /* You will not find such a service here! What you suggest is foul I will have no more of it. */
	+ ~PartyGoldGT(500)~ + @37 GOTO JNRM4.3.1 /* Maybe a donation of 500 gold might change your mind? */
	++ @11 GOTO JNRM4.3.2 /* What's the problem? I don't see any harm in it. */
	+ ~PartyGoldGT(1000)~ + @36 GOTO JNRM4.res /* I'm sorry I don't know why I said that. One thousand gold you said? Here you go. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM4.3.1
	SAY @38 /* The Vigilant One might indeed know of a place where such a service is offered. The worshippers of Talos have strayed far from the light and will be judged for their crimes accordingly, so you best stay away from that place. */
	= @39 /* It would be best if you left our temple now. */
	IF ~~ DO ~TakePartyGold(500)~ EXIT
END

IF ~~ THEN BEGIN JNRM4.3.2
	SAY @14 /* What you suggest is foul and I will have no part in it! */
	IF ~~ THEN EXIT
END

END

EXTEND_BOTTOM HELMPR 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM4 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priest of Lathander

APPEND DAWNMAS

IF ~~ THEN BEGIN JNRM5
	SAY @1 /* I can certainly try, but our church will require a donation for such a service. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM5.1 /* Fine. Here you have two thousand gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM5.2 /* Would a thousand gold suffice? */
	++ @4 GOTO JNRM5.3 /* There is also something else I require. When you resurrect him I require you lay a curse of some form on him to force him into my servitude. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM5.res
	SAY @8 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",1)
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(2)
	PlaySound("CAS_M04")
	Wait(2)
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM5.1
	SAY @7 /* Certainly. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM5.res
END

IF ~~ THEN BEGIN JNRM5.2
	SAY @6 /* If that is all you can offer it will do. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM5.res
END

IF ~~ THEN BEGIN JNRM5.3
	SAY @9 /* You will not find such a service here! What you suggest is foul I will have no more of it. */
	+ ~ReputationGT(Player1,13)~ + @10 GOTO JNRM5.3.1 /* Haven't you heard of me? I am a force of good and you can trust in my judgement. */
	+ ~ReputationLT(Player1,14)~ + @10 GOTO JNRM5.3.2 /* Haven't you heard of me? I am a force of good and you can trust in my judgement. */
	++ @11 GOTO JNRM5.3.2 /* What's the problem? I don't see any harm in it. */
	++ @12 DO ~TakePartyGold(2000)~ GOTO JNRM5.res /* I'm sorry I don't know why I said that. Two thousand gold you said? Here you go. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM5.3.1
	SAY @13 /* I have indeed heard of you and what you say is true. Still you won't find the service you described here. But because I trust your judgement I will advise you to go seek out the worshippers of Talos for such a deed. */
	IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN JNRM5.3.2
	SAY @14 /* What you suggest is foul and I will have no part in it! */
	IF ~~ THEN EXIT
END

END

EXTEND_BOTTOM DAWNMAS 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM5 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priest of Talos (Who can put a curse on Montaron)

APPEND TALMISS

IF ~~ THEN BEGIN JNRMT
	SAY @16 /* What exactly do you have in mind? */
	++ @40 GOTO JNRMT.1 /* I need you to resurrect him. */
	++ @18 GOTO JNRMT.2 /* I require of you to resurrect this body and curse him to serve me. */
END

IF ~~ THEN BEGIN JNRMT.1
	SAY @41 /* Certainly. Our church would just require a donation of 1000 gold for this service. */
	+ ~PartyGoldGT(1000)~ + @42 GOTO JNRMT.1.res /* Very well. */
	++ @5 EXIT /* Actually nevermind. */
END 

IF ~~ THEN BEGIN JNRMT.1.res
	SAY @8 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",1)
	TakePartyItem("MISC5U")
	TakePartyGold(1000)
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(2)
	PlaySound("CAS_M04")
	Wait(2)
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRMT.2
	SAY @19 /* Such a thing could be arranged. If you tell me his name I can put a geas on him that forces him to do your bidding or he will suffer pain that follows beyond death. */
	= @20 /* Of course it will cost you. I will require... let's say 4000 gold for this action. */
	+ ~PartyGoldGT(4000)~ + @21 GOTO JNRMT.res /* His name is Montaron and I wish you to bind him to me, <CHARNAME>. Here you go. */
	++ @22 EXIT /* I don't have that much gold. I will return once I have. */
	++ @5 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRMT.res
	SAY @23 /* I will start right now... and I assume you know to keep quiet to the authorities about this act. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMontResurrected","GLOBAL",2)
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	FadeToColor([30.0],0)
    Wait(3)
	PlaySound("CAS_P07")
	Wait(2)
	PlaySound("CAS_PM6F")
	Wait(4)
	PlaySound("CAS_P01N")
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

END	

EXTEND_BOTTOM TALMISS 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @15 GOTO JNRMT /* I have a dead body with me and I require your services. */
END

EXTEND_BOTTOM TALMISS 2
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @17 GOTO JNRMT /* I have important business involving a dead body I carry with me and I am willing to pay. */
END
