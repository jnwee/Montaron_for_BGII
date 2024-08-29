BEGIN JNVESP

CHAIN IF ~NumberOfTimesTalkedTo(0)~ THEN JNVESP jnvesp1
	@0
	DO ~SetGlobal("JNVESPLives","GLOBAL",0)~
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1
	== JNVESP @2
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @3
	= @4
	== JNVESP @5
END
++ @6 EXTERN JNVESP jnvesp1.1
++ @7 EXTERN JNVESP jnvesp.kill
++ @8 EXTERN JNVESP jnvesp1.1.1.1

CHAIN JNVESP jnvesp1.1
	@9
END
++ @10 EXTERN JNVESP jnvesp1.1.1
++ @11 EXTERN JNVESP jnvesp.kill
++ @12 EXTERN JNVESP jnvesp1.1.1.1

CHAIN JNVESP jnvesp1.1.1
	@13
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @14
END
++ @15 EXTERN JNVESP jnvesp.kill
++ @16 EXTERN JNVESP jnvesp1.1.1.1

CHAIN JNVESP jnvesp1.1.1.1
	@17
	DO ~SetGlobal("JNVESPLives","GLOBAL",1) DestroyItem("JNDAG01") GiveItemCreate("JNDAG01",LastTalkedToBy,0,0,0) AddJournalEntry(@502,QUEST_DONE) EscapeArea()~
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @18
EXIT

CHAIN JNVESP jnvesp.kill
	@19
	DO ~Enemy() AddJournalEntry(@501,QUEST_DONE) SetGlobal("JNVESPLives","GLOBAL",2)~
EXIT
