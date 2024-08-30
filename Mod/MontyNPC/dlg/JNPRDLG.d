/*
	Append Reply Option to priests in the game if you have Monty's Corpse
*/

// Priest of Ilmater in Slums

APPEND SLILMAT

IF ~~ THEN BEGIN JNRM
	SAY ~Certainly. If you have the funds that is.~
	+ ~PartyGoldGT(500)~ + ~Sure. Just do it. *hand over 500 gp*~ GOTO JNRM.1
	+ ~PartyGoldLT(500)~ + ~Come on. It is really important and I don't have the gold.~ GOTO JNRM.2
	++ ~Actually nevermind.~ EXIT
END

IF ~~ THEN BEGIN JNRM.1
	SAY ~Thank you for you contribution. I will get to work right now.~
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	TakePartyGold(500)
	FadeToColor([30.0],0)
    Wait(3)
	PlaySound("CAS_M04")
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM.2
	SAY ~I am sorry but there is just nothing I can do for you then.~
	
	IF ~~ THEN EXIT
END

END

EXTEND_BOTTOM SLILMAT 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + ~I need you to resurrect a dear friend of mine. I have his corpse here.~ GOTO JNRM
END

// Priest of Oghma in the Docks

APPEND DOGHMA

IF ~~ THEN BEGIN JNRM1
	SAY ~Certainly. If you have the funds that is.~
	+ ~PartyGoldGT(500)~ + ~Sure. Just do it. *hand over 500 gp*~ GOTO JNRM1.1
	+ ~PartyGoldLT(500)~ + ~Come on. It is really important and I don't have the gold.~ GOTO JNRM1.2
	++ ~Actually nevermind.~ EXIT
END

IF ~~ THEN BEGIN JNRM1.1
	SAY ~Thank you for you contribution. I will get to work right now.~
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	TakePartyGold(500)
	FadeToColor([30.0],0)
    Wait(3)
	PlaySound("CAS_M04")
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM1.2
	SAY ~I am sorry but there is just nothing I can do for you then.~
	
	IF ~~ THEN EXIT
END

END

EXTEND_BOTTOM DOGHMA 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + ~I need you to resurrect a dear friend of mine. I have his corpse here.~ GOTO JNRM1
END

// Priest of Ilmater in Waukeens Promenade

APPEND WILMAT

IF ~~ THEN BEGIN JNRM2
	SAY ~Certainly. If you have the funds that is.~
	+ ~PartyGoldGT(500)~ + ~Sure. Just do it. *hand over 500 gp*~ GOTO JNRM2.1
	+ ~PartyGoldLT(500)~ + ~Come on. It is really important and I don't have the gold.~ GOTO JNRM2.2
	++ ~Actually nevermind.~ EXIT
END

IF ~~ THEN BEGIN JNRM2.1
	SAY ~Thank you for you contribution. I will get to work right now.~
	IF ~~ DO ~ClearAllActions()
	StartCutSceneMode()
	TakePartyItem("MISC5U")
	DestroyItem("MISC5U")
	TakePartyGold(500)
	FadeToColor([30.0],0)
    Wait(3)
	PlaySound("CAS_M04")
	CreateCreature("JNMONT",[-1.-1], 3)
	Wait(2)
	FadeFromColor([30.0],0)
	Wait(2)
	EndCutSceneMode()~
	EXIT
END

IF ~~ THEN BEGIN JNRM2.2
	SAY ~I am sorry but there is just nothing I can do for you then.~
	
	IF ~~ THEN EXIT
END

END

EXTEND_BOTTOM WILMAT 0
	+ ~PartyHasItem("MISC5U") GlobalLT("Chapter","GLOBAL",%bg2_chapter_4%)~ + ~I need you to resurrect a dear friend of mine. I have his corpse here.~ GOTO JNRM2
END
