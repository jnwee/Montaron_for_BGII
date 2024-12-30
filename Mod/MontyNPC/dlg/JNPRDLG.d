/* =========================================
==== Priest Dialogue to resurrect Monty ====
========================================= */

// Priest of Ilmater in Slums

APPEND SLILMAT

IF ~~ THEN BEGIN JNRM1
	SAY @1 /* I can certainly try, but our church will require a donation for such a service. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM1.1 /* Fine. Here you have 2000 gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM1.2 /* Would a 1000 gold suffice? */
	++ @4 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM1.res
	SAY @5 /* Thank you for your contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMONTResurrected","GLOBAL",1)
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
	SAY @6 /* You are most benevolent <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM1.res
END

IF ~~ THEN BEGIN JNRM1.2
	SAY @7 /* Certainly, <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM1.res
END

END

EXTEND_BOTTOM SLILMAT 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM1 /* I have the dead body of a friend with me and I need your services to resurrect him. */
END

// Priest of Oghma in the Docks

APPEND DOGHMA

IF ~~ THEN BEGIN JNRM2
	SAY @1 /* I can certainly try, but our church will require a donation for such a service. */
	+ ~PartyGoldGT(2000)~ + @2 GOTO JNRM2.1 /* Fine. Here you have 2000 gold. Get to work. */
	+ ~PartyGoldGT(1000)~ + @3 GOTO JNRM2.2 /* Would a 1000 gold suffice? */
	++ @4 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM2.res
	SAY @5 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMONTResurrected","GLOBAL",1)
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
	SAY @9 /* Certainly. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM2.res
END

IF ~~ THEN BEGIN JNRM2.2
	SAY @8 /* If that is all you can offer it will do. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM2.res
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
	++ @4 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM3.res
	SAY @5 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMONTResurrected","GLOBAL",1)
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
	SAY @6 /* You are most benevolent <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM3.res
END

IF ~~ THEN BEGIN JNRM3.2
	SAY @7 /* Certainly, <BROTHERSISTER>. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM3.res
END

END

EXTEND_BOTTOM WILMAT 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM3 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priest of Helm

APPEND HELMPR

IF ~~ THEN BEGIN JNRM4
	SAY @10 /* Of course my <LORDLADY>, though we would require a sizeable donation of... let's say 1000 gold for such a service. */
	+ ~PartyGoldGT(1000)~ + @11 GOTO JNRM4.res /* Very well. */
	++ @4 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM4.res
	SAY @5 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMONTResurrected","GLOBAL",1)
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
	++ @4 EXIT /* Actually nevermind. */
END

IF ~~ THEN BEGIN JNRM5.res
	SAY @5 /* Thank you for you contribution. I will get to work right now. */
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	SetGlobal("JNMONTResurrected","GLOBAL",1)
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
	SAY @9 /* Certainly. */
	
	IF ~~ THEN DO ~TakePartyGold(2000)~ GOTO JNRM5.res
END

IF ~~ THEN BEGIN JNRM5.2
	SAY @8 /* If that is all you can offer it will do. */
	
	IF ~~ THEN DO ~TakePartyGold(1000)~ GOTO JNRM5.res
END

END

EXTEND_BOTTOM DAWNMAS 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + @0 GOTO JNRM5 /* I have a dead body with me and I need your services to resurrect him. */
END

// Priestess of Talos (previously used for evil route, now commented out until I copy standard route here.

// APPEND TALMISS

// IF ~~ THEN BEGIN JNRMT

// EXTEND_BOTTOM TALMISS 0 // Standard Dialogue State

// EXTEND_BOTTOM TALMISS 2 // Dialogue State after stolen from
