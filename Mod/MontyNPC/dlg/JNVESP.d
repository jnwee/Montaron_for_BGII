BEGIN JNVESP

CHAIN IF ~NumberOfTimesTalkedTo(0)~ THEN JNVESP jnvesp1
	@0 /* You... how are you here? */
	DO ~SetGlobal("JNVESPLives","GLOBAL",0)~
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @1 /* What're ye doin' here? Think ye can take me stuff when I'm dead, eh? Ye'll be screamin' when this's over. */
	== JNVESP @2 /* But I was sure! You were dead. So what harm could it do to make use of your belongings. You can't kill me anyway. Our boss wouldn't have it. */
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @3 /* ~Would've done the same, if I was ye. Ye just had poor luck and now ye're payin' for it, 'cause yer boss ain't my boss any longer! */
	= @4 /* Now let's get to cuttin' <CHARNAME>! */
	== JNVESP @5 /* No, please! I beg you, leave me my life and I will give you your dagger. You will never see me again, I promise. Just don't kill me please. */
END
++ @6 EXTERN JNVESP jnvesp1.1 /* First tell me about this boss of yours. */
++ @7 EXTERN JNVESP jnvesp.kill /* Stop whining and die already. */
++ @8 EXTERN JNVESP jnvesp1.1.1.1 /* Stop this madness Montaron! Hand over the dagger and leave. */

CHAIN JNVESP jnvesp1.1
	@9 /* I only know him by Grimstone and he is quite high up in our Organisation. But I swear I'm just a new recruit, I dont know anything more, please let me go. */
END
++ @10 EXTERN JNVESP jnvesp1.1.1 /* Tell me where I can find him and I'll let you go. */
++ @11 EXTERN JNVESP jnvesp.kill /* No, sorry. You die now. */
++ @12 EXTERN JNVESP jnvesp1.1.1.1 /* Fine, go. */

CHAIN JNVESP jnvesp1.1.1
	@13 /* I don't know, I swear. I have only seen him once, if he has orders he always sends some mage to me. Now can I ple... */
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @14 /* 'nough questions! Yer time's up. */
END
++ @15 EXTERN JNVESP jnvesp.kill /* Fine. Go ahead Montaron. */
++ @16 EXTERN JNVESP jnvesp1.1.1.1 /* Knock it off Montaron. Hand everything over and you're free to go. */

CHAIN JNVESP jnvesp1.1.1.1
	@17 /* Thank you my lord. */
	DO ~AddExperienceParty(5000) SetGlobal("JNVESPLives","GLOBAL",1) DestroyItem("JNDAG01") GiveItemCreate("JNDAG01",LastTalkedToBy,0,0,0) AddJournalEntry(@1000004,QUEST_DONE) EscapeAreaNoSee()~
	== JNMONTJ IF ~InParty("JNMONT") InMyArea("JNMONT") !StateCheck("JNMONT",CD_STATE_NOTVALID)~ THEN @18 /* Fool! Now the Zhentarim'll know I'm alive and come after me for sure. */
EXIT

CHAIN JNVESP jnvesp.kill
	@19 /* You bastard! I won't die without a fight! */
	DO ~Enemy() AddJournalEntry(@1000003,QUEST_DONE) SetGlobal("JNVESPLives","GLOBAL",2) AddXPObject("JNMONT",10000)~
EXIT
