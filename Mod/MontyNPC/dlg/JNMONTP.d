BEGIN JNMONTP

IF ~Global("JNMONTKickedOut","GLOBAL",0)~ b2
SAY @1 /* We be a mighty lot <CHARNAME>. Be ye sure ye want me to leave? */
++ @2 /* No, I made a mistake. Just stay here. */ DO ~JoinParty()~ EXIT
+ ~!AreaCheck("AR0603")
!AreaCheck("AR0410")
!AreaCheck("AR0411")
!AreaCheck("AR0412")
!AreaCheck("AR0413")
!AreaCheck("AR0414")
!AreaCheck("AR1512")
!AreaCheck("AR1513")
!AreaCheck("AR1514")
!AreaCheck("AR1515")
!AreaCheck("AR1516")
!AreaCheck("AR1501")
!AreaCheck("AR1502")
!AreaCheck("AR1503")
!AreaCheck("AR1504")
!AreaCheck("AR1505")
!AreaCheck("AR1506")
!AreaCheck("AR1507")
!AreaCheck("AR1508")~ + @3 /* Yes, we can meet at the Docks, if I ever need you. */ DO ~SetGlobal("JNMONTKickedOut","GLOBAL",1) MoveGlobal("AR0300","JNMONT",[1818.3140])~ EXIT 
+ ~!AreaCheck("AR0301")
!AreaCheck("AR0302")
!AreaCheck("AR0303")
!AreaCheck("AR0304")
!AreaCheck("AR0305")
!AreaCheck("AR0306")
!AreaCheck("AR0307")
!AreaCheck("AR0509")
!AreaCheck("AR0510")
!AreaCheck("AR0511")
!AreaCheck("AR1102")
!AreaCheck("AR1107")
!AreaCheck("AR0801")
!AreaCheck("AR0803")~ + @4 /* Just wait here for a while. */ DO ~SetGlobal("JNMONTKickedOut","GLOBAL",1)~ EXIT
END

IF ~Global("JNMONTKickedOut","GLOBAL",1)~ b3
SAY @5 /* Have ye realized your mistake, fool? */
++ @6 /* Sure, now get in line. */ + b3.1
++ @7 /* No. Just checking up on you. */ + b3.2
END 

IF ~~ b3.1
SAY @8 /* Bah! */
IF ~~ DO ~SetGlobal("JNMONTKickedOut","GLOBAL",0) JoinParty()~ EXIT
END

IF ~~ b3.2
SAY @9 /* Pah! Ye better sleep with one eye open. */
IF ~~ EXIT
END

