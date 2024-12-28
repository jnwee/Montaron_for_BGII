# JNMONT - Initial Dialogue

## Introduction
**Condition:** `~NumTimesTalkedTo(0)~`  
**NPC Dialogue:**  
`@0` *Arrr!*  

**Party Responses (Conditional Interjections):**  
- **Minsc:** `@100` *Boo says this one has the smell of villainy...*  
- **Edwin:** `@101` *More of such nonsense...*  
- **Keldorn:** `@102` *I urge you to act with caution...*  

**Player Response:**  
- `@1` *That damned mage... always gets me in trouble.*  
- `@2` *Expect no thanks from me, 'cause ye'll no get it...*

**Next:**  
- **Global:** `JNMontResurrected = 1` → [m1](##m1)  
- **Global:** `JNMontResurrected = 2` → [m3](##m3)

---

## m1 - Friendly Reminder  
`@200` *<CHARNAME>, you don't remember me?*  
- **Response:** `@201` *I am <CHARNAME> and I rescued you.* → [m2](#m2)  

---

## m2 - Acknowledgement  
`@202` *Ah, yes... I remember now.*  

---

## m3 - Curse Dialogue  
`@210` *You don't remember me? I just cursed you to serve me.*  
- **Follow-up:** `@211` *My name is <CHARNAME> and I cursed you.* → [m4](#m4)  

---

## m4 - Continued Interaction  
`@3` *Curse or not, you'll get no thanks from me.*  
- **Option 1:** `@202` *Very well, but tread carefully.*  
- **Option 2:** `@203` *I don't care for your thanks.*  
