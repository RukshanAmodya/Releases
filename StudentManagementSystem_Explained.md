# 📖 StudentManagementSystem.java — සිංහල Storytelling Documentation

> **iCET Student Management System** — Java code එකේ ඇතුළේ වෙන දේ, story ගෙ flow ෙකෙ සිංහලෙන්

---

## 🗃️ Data Store — ශිෂ්‍ය data ගබඩා කරන ආකාරය

Program run වෙන්නට කලිනේ, class level ෙකෙ global arrays ගොඩාක් declare කෙරෙනවා. ඔය arrays ෙකෙ තමයි ශිෂ්‍යයන් ගේ data *in-memory* ෙකෙ store ෙව්නෙ — database file එකක් නෑ.

```java
public static String[] regNoArray  // Registration Numbers
public static String[] nicArray    // NIC Numbers
public static String[] nameArray   // Student Names
public static int[]    prfArray    // PRF Marks
public static int[]    dbmsArray   // DBMS Marks
```

ශිෂ්‍ය data store ෙව්නෙ "parallel arrays" model ෙකෙ — `regNoArray[0]`, `nicArray[0]`, `nameArray[0]`, `prfArray[0]`, `dbmsArray[0]` කියන්නෙ ෙකෙනෙකුෙගෙ data. Index number same ෙකෙ ශිෂ්‍යයා ෙකෙනෙකෙ data ලිස්ටු 5ක ගෙ store ෙව්නවා.

**PRF/DBMS marks special values:**
- `-1` → ශිෂ්‍යයා exam ෙකෙ absent ෙවෙලා
- `-2` → exam conduct ෙකෙ නෑ (exam ෙකෙ නෑ)
- `0–100` → actual marks

**Batch arrays:**
```java
public static int[] batchNameArray  = { 105, 106, 107, 108, 109, 110 };
public static int[] batchStatusArray = { 0,   0,   0,   0,   1,   1  };
```
`0 = CLOSED`, `1 = OPEN` — ෙදෙකොල arrays ෙකෙ index position ෙකෙ match ෙව්නවා.

---

## 🔧 Method 01 — `clearConsole()`

```java
public final static void clearConsole()
```

Program ෙකෙ screen clear ෙකෙරෙනෙකෙ කොහොමද? `clearConsole()` call ෙවෙනකොට, method ෙකෙ ප්‍රථමෙයෙන්ම `System.getProperty("os.name")` use කරලා **operating system ෙකෙ name** ගන්නවා. ෙසෙකෙ result string ෙකෙ `"Windows"` කියල ෙගෙනයද කියලා `.contains("Windows")` කියලා check ෙකෙරෙනවා.

**Windows system ෙකෙ නං:** `new ProcessBuilder("cmd", "/c", "cls")` use කරලා console window clear command (CLS) run ෙකෙරෙනවා. `.inheritIO()` කියන්නෙ current Java process ෙකෙ Input/Output stream ෙකෙ use ෙව්නවා. `.start()` ෙකෙ process start ෙකෙරෙනවා, `.waitFor()` ෙකෙ process end ෙව්නෙ දක්ෙව් Java code wait ෙකෙරෙනවා.

**Windows නොෙව් නං (Linux/Mac):** `System.out.print("\033[H\033[2J")` use ෙකෙරෙනවා — ෙමය ANSI escape code, terminal cursor ෙකෙ top-left ෙකෙ (H = Home) ගෙනල screen clear ෙකෙරෙනවා (2J = erase display). ෙඊලෙවෙ `System.out.flush()` call ෙව්නෙ buffer ෙකෙ print pending output flush ෙකෙරෙන්ෙන්.

ෙකෙෙකෝ error ෙකෙකෙ ආෙව් නං `catch(Exception e)` block ෙකෙ `e.printStackTrace()` ෙකෙ error details console ෙකෙ print ෙකෙරෙනවා.

---

## 🔧 Method 02 — `exit()`

```java
public static void exit()
```

User exit option select ෙකෙරෙනකොට, ෙමෙ method call ෙව්නවා. ෙප්‍ලාෙව්ෙල් `clearConsole()` ෙකෙ screen clear කෙරෙලා, ෙඊලෙවෙ `"You left the program..."` message ෙකෙ print ෙකෙරෙනවා. ෙසෙකෙ `System.exit(0)` call ෙව්නෙ — `0` argument ෙකෙ meaning program **successful exit** ෙකෙ (error ෙකෙ නොෙව්) program completely terminate ෙකෙරෙනවා.

---

## 🔧 Method 03 — `getGPA(int marks)`

```java
public static double getGPA(int marks)
```

ෙමෙ method ෙකෙ ශිෂ්‍යයෙකෙ ලකු data argument ෙකෙ ලෙස receive ෙකෙරෙනවා. ෙප්‍ලාෙව්ෙල් if condition ෙකෙ `marks < 0` ෙකෙ check ෙකෙරෙනවා — marks negative ෙවෙලා ෙවෙලා නං (`-1` absent හෝ `-2` not conducted), GPA `0.0` ෙකෙ return ෙව්නවා.

ෙඊලෙවෙ cascading if-else chain ෙකෙ through ෙකෙ marks grade scale ෙකෙ compare ෙකෙරෙනවා — 90-100 range? `4.25`. 80-89 range? `4.00`. ෙමෙෙ ෙ pattern ෙකෙ continue ෙව්නවා. ෙකෙෙකෝ condition ෙකෙ match ෙකෙෙව් නං (ෙකෙ 20 ට ෙත් දිය මාෙල), last `return 0.00` execute ෙව්නවා.

| ලකුණු | GPA | ලකුණු | GPA |
|-------|-----|-------|-----|
| 90-100 | 4.25 | 55-59 | 2.30 |
| 80-89 | 4.00 | 50-54 | 2.00 |
| 75-79 | 3.70 | 45-49 | 1.70 |
| 70-74 | 3.30 | 40-44 | 1.30 |
| 65-69 | 3.00 | 30-39 | 1.00 |
| 60-64 | 2.70 | 20-29 | 0.70 |
| < 20 | 0.00 | < 0 | 0.00 |

---

## 🔧 Method 04 — `formatMarks(int marks)`

```java
public static String formatMarks(int marks)
```

ෙමෙ method ෙකෙ purpose ෙකෙ simple — ශිෂ්‍යයෙකෙ marks value ෙකෙ user ෙකෙ readable ෙකෙ display ෙකෙරෙනෙකෙ convert ෙකෙරෙනවා. `marks == -1` ෙකෙ check ෙකෙරෙනවා — absent ෙකෙ ෙව්නෙ `"Absent"` return. `marks == -2` ෙකෙ නං `"Not conducted"` return. ෙකොෙකෙ condition ෙකෙ match ෙකෙෙව් නං සාමාන්‍ය number ෙකෙ — `String.valueOf(marks)` ෙකෙ int ෙකෙ String ෙකෙ convert ෙකෙරෙලා return ෙව්නවා.

---

## 🔧 Method 05 — `findStudentIndex(String regNo)`

```java
public static int findStudentIndex(String regNo)
```

Registration Number ෙකෙ use කෙරෙලා ශිෂ්‍යයා ෙකෙනෙකෙ system ෙකෙ ෙකෙ index ෙකෙ ෙවෙලාද කියල ෙහෙලෙනෙකෙ ෙමෙ method ෙකෙ කරනවා.

**ෙකෙෙ ආකාරෙයෙ ෙකෙරෙනවාද:** `regNoArray` ෙකෙ ෙකෙ element ෙකෙ ෙකෙ loop ෙකෙ `i = 0` ෙසිෙ start ෙකෙෙව්, array end (`regNoArray.length`) ෙදෙකෙ loop run ෙව්නවා. Loop ෙකෙ ෙකෙ iteration ෙකෙ `regNoArray[i].equalsIgnoreCase(regNo)` ෙකෙ compare ෙකෙරෙනවා. `equalsIgnoreCase` use ෙකෙරෙනෙකෙ "pr24105001" ෙකෙෙ "PR24105001" ෙකෙ same ෙකෙ treat ෙකෙෙ — case sensitivity problem ෙකෙ නෑ.

Match ෙකෙෙව් නං that iteration ෙකෙ `i` value ෙකෙ `return i` ෙකෙ method ෙකෙ exit ෙකෙෙව් ෙහ ෙ index return ෙව්නවා. Loop ෙකෙ end ෙදෙකෙ ෙගෙෙය නං ශිෂ්‍යයා ෙකෙ system ෙකෙ ෙකෙෙව් නෑ — `return -1` execute ෙව්නවා, ෙකෙ -1 ෙකෙ "not found" signal ෙකෙ.

---

## 🔧 Method 06 — `findStudentIndexByNIC(String nic)`

```java
public static int findStudentIndexByNIC(String nic)
```

ෙෙ method ෙකෙ logic ෙකෙ `findStudentIndex()` ෙකෙ හරිෙයෙෙ same — ෙකෙෙ වෙනෙස ෙකෙ `regNoArray` ෙකෙ ෙව' `nicArray` ෙකෙ loop ෙකෙරෙෙ, ෙෙ `equalsIgnoreCase()` ෙකෙ ෙව' `equals()` use ෙෙෙනෙවෙ. NIC ෙෙෙ case-sensitive ෙෙෙෙ `equals()` ෙෙෙෙ.

Match ෙෙෙෙ නං index return, ෙෙෙෙෙ නං `-1` return.

---

## 🔧 Method 07 — `checkBadgeStatus(int batchNum)`

```java
public static int checkBadgeStatus(int batchNum)
```

ශිෂ්‍යයෙෙ add ෙෙෙෙෙ batch ෙෙෙ enrollment open ෙෙෙෙ? ෙෙෙ method ෙෙෙ ෙෙෙ ෙෙෙෙෙ.

`batchNameArray` ෙෙෙ for loop ෙෙෙ iterate ෙෙෙෙෙ. Loop ෙෙෙ ෙෙ iteration ෙෙෙ `batchNameArray[i] == batchNum` compare ෙෙෙෙෙ — ෙෙ match ෙෙෙ? ෙෙෙෙ `return batchStatusArray[i]` ෙෙෙ execute ෙෙෙෙෙ, **ෙෙ same index ෙෙෙ batch ෙෙෙ status value** (0 ෙෙ 1) return ෙෙෙෙෙ.

Loop ෙෙෙ end ෙෙෙෙ ෙෙෙෙ ෙෙෙ batch ෙෙෙ system ෙෙෙ ෙෙ නෙ — `return -1` execute ෙෙෙෙෙ ෙෙෙ "batch ෙෙ නෙ" signal ෙෙෙෙෙ.

---

## 🔧 Method 08 — `isDuplicateNIC(String nic)`

```java
public static boolean isDuplicateNIC(String nic)
```

NIC already system ෙෙෙ ෙෙෙෙෙෙ? ෙෙෙ ෙෙ simple wrapper logic ෙෙෙ. `findStudentIndexByNIC(nic)` call ෙෙෙෙෙ — ෙෙෙ result ෙෙ index number ෙෙ `-1` ෙෙ ෙෙෙෙෙ. ෙෙ `!= -1` ෙෙ check ෙෙෙෙෙ — `-1` ෙෙ නෙ නං student exist ෙෙෙ, ෙෙෙෙ `true` return. `-1` නං student ෙෙ නෙ, ෙෙෙෙ `false` return.

---

## 🔧 Method 09 — `checkNIC(String nic)`

```java
public static boolean checkNIC(String nic)
```

ෙෙෙ method ෙෙෙ `isDuplicateNIC(nic)` call ෙෙෙෙ result directly return ෙෙෙෙෙ. Wrapper/alias method ෙෙෙ — ෙකෙෙ new logic ෙෙ නෙ.

---

## 🔧 Method 10 — `getStudentCountForBatch(int batchNumber)`

```java
public static int getStudentCountForBatch(int batchNumber)
```

ෙෙ batch ෙෙෙ ශිෂ්‍ය ෙෙෙෙ ෙෙෙෙෙ? ෙෙෙ method ෙෙෙ counter variable (`count = 0`) ෙෙෙ ෙෙ.

**Registration Number format:** `PR24105001` → ෙෙෙ structure ෙෙෙ `[PR/OR][24][BatchNum][Seq]`. Batch number ෙෙෙ index 4 ෙෙ 7 ෙෙෙෙ ෙෙෙෙෙ: `regNo.substring(4, 7)` ෙෙෙ `"105"` ෙෙෙෙෙ.

`regNoArray` ෙෙෙ for-each loop ෙෙෙ iterate ෙෙෙෙෙ. ෙෙ registration number ෙෙෙ:
- `regNo.length() >= 7` ෙෙෙ check ෙෙෙෙෙ — substring crash ෙෙෙ safety check
- `.substring(4, 7).equals(batchStr)` ෙෙෙ batch ෙෙෙ match ෙෙෙෙෙ

Match ෙෙෙ? `count++`. Loop end ෙෙෙ total count return ෙෙෙෙෙ.

---

## 🔧 Method 11 — `generateStudentID(int batchNumber, boolean isPhysical)`

```java
public static String generateStudentID(int batchNumber, boolean isPhysical)
```

නව ශිෂ්‍යයෙෙ unique Registration Number generate ෙෙෙෙෙ ෙෙෙ method ෙෙෙ.

**Step 1 — Max Sequence ෙෙෙෙෙ:**
`maxSeq = 0` ෙෙෙ initialize ෙෙෙෙ. `regNoArray` ෙෙෙ loop ෙෙෙෙෙ. ෙෙ iteration ෙෙෙ:
- `regNo.length() == 10` ෙෙෙ check — format valid?
- `regNo.substring(4, 7).equals(batchStr)` — correct batch?
- ෙෙෙෙ `regNo.substring(7)` ෙෙෙ last 3 characters ගෙෙ → `Integer.parseInt()` ෙෙෙ int ෙෙෙ convert ෙෙෙෙෙ
- ෙෙෙ `seq > maxSeq` ෙෙෙ? ෙෙෙෙ `maxSeq = seq` update

**Step 2 — Next Sequence:**
`nextSeq = maxSeq + 1` — ෙෙෙෙෙ ෙෙෙ ෙෙ seq ෙෙෙ ෙෙෙෙ

**Step 3 — Prefix:**
```java
String prefix = isPhysical ? "PR" : "OR";
```
`isPhysical` true ෙෙෙ? → `"PR"`. False ෙෙෙ? → `"OR"`.

**Step 4 — Final ID:**
```java
return prefix + "24" + batchStr + String.format("%03d", nextSeq);
```
`%03d` ෙෙෙ sequence number ෙෙෙ 3 digits ෙෙෙ zero-pad ෙෙෙෙෙ — `1` → `"001"`, `26` → `"026"`.

ෙෙෙෙෙ `PR24110026` ෙෙෙෙෙ result.

---

## 🔧 Method 12 — `addStudentToArray(...)`

```java
public static void addStudentToArray(String regNo, String nic, String name, int prf, int dbms)
```

Java arrays ෙෙෙ size runtime ෙෙෙ change ෙෙෙ ෙෙ — ෙෙෙෙෙ ෙෙෙ array ෙෙෙ element add ෙෙෙෙෙ manual resize technique ෙෙෙ.

**ෙෙ array ෙෙෙ (5 arrays ෙෙෙ ෙෙෙ process ෙෙෙ same):**

1. `new String[regNoArray.length + 1]` — ෙෙෙෙෙ ෙෙෙ ෙෙ new array ෙෙෙ
2. `System.arraycopy(regNoArray, 0, newRegNoArray, 0, regNoArray.length)` — old array ෙෙෙ data ෙෙෙෙ copy ෙෙෙෙෙ
   - `src = regNoArray` (ෙෙෙෙ)
   - `srcPos = 0` (ෙෙෙෙෙ index ෙෙෙ)
   - `dest = newRegNoArray` (ෙෙෙෙ)
   - `destPos = 0` (paste ෙෙෙ start index)
   - `length = regNoArray.length` (ෙෙෙෙෙ elements ෙෙෙ)
3. `newRegNoArray[regNoArray.length] = regNo` — new student ෙෙෙ data ෙෙෙෙ (last slot ෙෙෙ)
4. `regNoArray = newRegNoArray` — global variable ෙෙෙ new array ෙෙෙ point ෙෙෙෙෙ

ෙෙ process `nicArray`, `nameArray`, `prfArray`, `dbmsArray` ෙෙෙ ෙෙ repeat ෙෙෙෙෙ.

---

## 🔧 Method 13 — `deleteStudentFromArray(int index)`

```java
public static void deleteStudentFromArray(int index)
```

ෙෙෙ method ෙෙෙ index-based delete technique ෙෙෙ use ෙෙෙෙෙ. `length - 1` size arrays 5ක් නව ෙෙෙ හදෙෙෙෙෙ.

`target = 0` variable ෙෙෙ initialize ෙෙෙෙෙ. ෙෙෙ original array ෙෙෙ `i` ෙෙ `0` ෙෙ `regNoArray.length` ෙෙෙෙෙ iterate ෙෙෙෙෙ:

```java
if (i == index) continue;  // ෙෙ row ෙෙෙ skip!
newRegNoArray[target] = regNoArray[i];
// ... (other arrays too)
target++;
```

Delete ෙෙෙෙ index ෙෙෙ ෙෙ `i == index` ෙෙෙ `continue` ෙෙෙ ෙෙ iteration ෙෙෙ skip ෙෙෙෙෙ — copy ෙෙෙ ෙෙ නෙ. ෙෙෙෙ ෙෙෙ data automatically ෙෙෙෙෙ gap ෙෙ ෙෙෙෙ `target` index ෙෙෙ fill ෙෙෙෙෙ. Loop end ෙෙෙෙ global arrays ෙෙෙ update ෙෙෙෙෙ.

---

## 🔧 Method 14 — `addBatchToArray(int batchNumber)`

```java
public static void addBatchToArray(int batchNumber)
```

`addStudentToArray()` ෙෙෙ same technique — `length + 1` arrays ෙෙෙ, old data copy, new batch number append. `batchStatusArray` ෙෙෙ new batch ෙෙෙ `1` (ENROLLMENTOPEN) default ෙෙෙ add ෙෙෙෙෙ.

---

## 🔧 Method 15 — `homePage()`

```java
public static void homePage()
```

Program start ෙෙෙෙෙ main menu display ෙෙෙෙෙ. `do { ... } while (true)` loop ෙෙෙ use ෙෙෙෙෙ — ෙෙ user exit option select ෙෙෙෙෙ ෙෙෙෙෙ loop ෙෙ ෙෙෙෙෙ.

Loop ෙෙෙ ෙෙ iteration ෙෙෙ:
1. `clearConsole()` ෙෙෙ screen refresh ෙෙෙෙෙ
2. Main menu print ෙෙෙෙෙ
3. `input.nextInt()` ෙෙෙ user ෙෙෙ choice wait ෙෙෙෙෙ
4. `switch(option)` ෙෙෙ choice ෙෙ match ෙෙෙ case ෙෙෙ execute:
   - `case 1` → `studentManagement()`
   - `case 2` → `batchManagement()`
   - `case 3` → `gradeManagement()`
   - `case 4` → `reportGenerator()`
   - `case 5` → `exit()`
5. Sub-method return ෙෙෙෙ loop ෙෙෙෙෙ, menu ෙෙෙ refresh ෙෙෙෙෙ

---

## 🔧 Method 16 — `studentManagement()`

```java
public static void studentManagement()
```

Student Management sub-menu ෙෙෙ, `homePage()` ෙෙෙ exact same `do-while(true)` pattern. වෙෙෙස ෙෙෙ `case 5` ෙෙෙ `exit()` ෙෙ `return` ෙෙෙ — ෙෙ `return` ෙෙෙ ෙෙෙ method ෙෙෙ exit ෙෙෙෙ, `homePage()` ෙෙෙ control ෙෙෙෙෙ.

---

## 🔧 Method 17 — `addStudent()`

```java
public static void addStudent()
```

ෙෙ method ෙෙෙ multiple validation layers ෙෙෙ through ෙෙෙෙ ශිෂ්‍යයෙෙ add ෙෙෙෙෙ.

**Layer 1 — Batch Validation:**
User ෙෙෙ batch number ෙෙෙෙ. `checkBadgeStatus(inputBadge)` ෙෙෙ result `status` ෙෙෙ store ෙෙෙෙෙ.

- `status == -1` → batch ෙෙ නෙ. Error print ෙෙෙෙෙ, Y/N choice ෙෙෙෙෙ. "N" ෙෙෙ `return` ෙෙෙ method exit. "Y" ෙෙෙ `continue` ෙෙෙ loop restart.
- `status == ENROLLMENTCLOSED (0)` → enrollment closed. ෙෙෙ same Y/N pattern.

**Layer 2 — NIC Duplicate Check:**
`isDuplicateNIC(nic)` ෙෙෙ `true` return ෙෙෙ? Existing student ෙෙෙ data (`regNoArray[existingIdx]`, `nameArray[existingIdx]`, `nicArray[existingIdx]`) print ෙෙෙෙෙ. Y/N choice.

**Layer 3 — Data Input:**
```java
scanner.nextLine(); // Buffer flush — nextInt() ෙෙෙ leftover newline clear
String name = scanner.nextLine(); // Full name with spaces
int mode = scanner.nextInt(); // 1=Physical, 0=Online
boolean isPhysical = (mode == 1);
```

**Layer 4 — ID Generate & Store:**
`generateStudentID(inputBadge, isPhysical)` ෙෙෙ call ෙෙෙෙෙ, result `regNo` ෙෙෙ store. ෙෙෙ `addStudentToArray(regNo, nic, name, -2, -2)` ෙෙෙ call ෙෙෙෙෙ — `prf = -2`, `dbms = -2` ෙෙෙ default, ෙෙෙෙෙ exam conduct ෙෙ ෙෙ.

Generated Reg No print ෙෙෙ success message.

---

## 🔧 Method 18 — `updateStudent()`

```java
public static void updateStudent()
```

Reg No input ෙෙෙෙෙ, `findStudentIndex(regNo)` ෙෙෙ student ෙෙෙෙෙ.

`idx == -1` ෙෙෙ? Student not found — retry loop.

Student found ෙෙෙෙ current Name ෙෙ NIC display. ෙෙෙ update option:

**Option 1 — Name Update:**
`scanner.nextLine()` ෙෙෙ buffer flush ෙෙෙෙ. New name input. `nameArray[idx] = newName` — directly array ෙෙෙ element update ෙෙෙෙෙ.

**Option 2 — NIC Update:**
New NIC input ෙෙෙෙ. ෙෙෙ ෙෙෙ condition check:

```java
if (isDuplicateNIC(newNIC) && !newNIC.equals(nicArray[idx]))
```

`isDuplicateNIC(newNIC)` true ෙෙෙ AND ෙෙ new NIC ෙෙෙ same student ෙෙෙ current NIC ෙෙ DIFFERENT ෙෙෙ → ෙෙෙෙ someone else ෙෙෙ NIC ෙෙ — error. `!newNIC.equals(nicArray[idx])` condition ෙෙෙ ෙෙෙ student ෙෙෙ same NIC ෙෙෙ enter ෙෙෙෙ false block skip ෙෙෙෙ (update ok).

---

## 🔧 Method 19 — `veiwStudent()`

```java
public static void veiwStudent()
```

> **⚠️ Spelling Note:** Method name "View" → "Veiw" ෙෙෙ typo ෙෙෙ code ෙෙෙ ෙෙෙෙෙ.

Reg No input ෙෙෙ `findStudentIndex()` ෙෙෙ call. Student found ෙෙෙෙ:

**GPA Calculation:**
```java
double gpa = (getGPA(prfArray[idx]) + getGPA(dbmsArray[idx])) / 2.0;
```
PRF marks ෙෙෙ `getGPA()` call ෙෙෙෙ GPA ෙෙෙෙෙ, DBMS ෙෙෙෙ ෙෙෙෙ, ෙෙ average ෙෙෙෙෙ.

**Display:**
- `formatMarks(prfArray[idx])` ෙෙෙ call ෙෙෙෙ PRF display — -1 → "Absent", -2 → "Not conducted"
- `String.format(Locale.US, "%.3f", gpa)` → GPA ෙෙෙ 3 decimal places ෙෙෙෙ print

---

## 🔧 Method 20 — `deleteStudent()`

```java
public static void deleteStudent()
```

Reg No input ෙෙෙ student ෙෙෙෙෙ. Found ෙෙෙෙ full profile display (GPA calculate ෙෙෙ show ෙෙෙෙෙ). ෙෙෙ confirmation:

```java
if (confirm.equalsIgnoreCase("Y")) {
    deleteStudentFromArray(idx);
}
```

`Y` ෙෙෙ confirm ෙෙෙ ෙෙෙ `deleteStudentFromArray(idx)` call ෙෙෙෙෙ — arrays 5 ෙෙෙ ෙෙ student ෙෙෙ data remove. ෙෙෙ another student delete Y/N loop.

---

## 🔧 Method 21 — `batchManagement()`

```java
public static void batchManagement()
```

`do-while(true)` loop ෙෙෙ batch management menu. Options:
- `case 1` → `addBatch()`
- `case 2` → `updateBatch()`
- `case 3` → `viewBatches()`
- `case 4` → `return` (home page)

---

## 🔧 Method 22 — `addBatch()`

```java
public static void addBatch()
```

Batch number input ෙෙෙෙෙ. `exists = false` variable ෙෙෙ initialize ෙෙෙෙෙ.

**Duplicate check:**
```java
for (int b : batchNameArray) {
    if (b == batchNum) {
        exists = true;
        break;  // ෙෙෙෙ match ෙෙෙ — loop stop
    }
}
```
For-each loop ෙෙෙ `batchNameArray` iterate. Match ෙෙෙ? `exists = true` ෙෙෙ set ෙෙෙ `break` ෙෙෙ loop exit.

`exists == true` → error. `exists == false` → `addBatchToArray(batchNum)` call ෙෙෙ success.

---

## 🔧 Method 23 — `updateBatch()`

```java
public static void updateBatch()
```

Batch number input ෙෙෙෙෙ. `idx = -1` ෙෙෙ initialize ෙෙෙෙෙ.

**Index search:**
```java
for (int i = 0; i < batchNameArray.length; i++) {
    if (batchNameArray[i] == batchNum) {
        idx = i;
        break;
    }
}
```
Match ෙෙෙෙ index `idx` ෙෙෙ save ෙෙෙ `break`.

`idx == -1` → not found error.

**Status Toggle:**
Current status string create:
```java
String statusStr = (batchStatusArray[idx] == ENROLLMENTOPEN) ? "ENROLLMENT OPEN" : "ENROLLMENT CLOSED";
```

Confirm ෙෙෙ Y ෙෙෙ:
```java
batchStatusArray[idx] = (batchStatusArray[idx] == ENROLLMENTOPEN) ? ENROLLMENTCLOSED : ENROLLMENTOPEN;
```
ෙෙ ternary ෙෙෙ: current OPEN ෙෙෙ? → CLOSED ෙෙෙ set. CLOSED ෙෙෙ? → OPEN ෙෙෙ set. ෙෙෙෙෙ toggle ෙෙෙ.

---

## 🔧 Method 24 — `viewBatches()`

```java
public static void viewBatches()
```

`batchNameArray` ෙෙෙ for loop ෙෙෙ iterate ෙෙෙෙෙ. ෙෙ iteration ෙෙෙ:
- `batchStatusArray[i]` ෙෙෙ check ෙෙෙ status string ෙෙෙෙෙ
- `getStudentCountForBatch(batchNameArray[i])` ෙෙෙ call ෙෙෙ student count ෙෙෙෙෙ
- `printf()` ෙෙෙ formatted table row print

`printf("%-6d%-12d%-15d%-20s\n", ...)` → `-` ෙෙෙ left-align, number ෙෙෙ minimum column width ෙෙෙෙෙ table neat ෙෙෙ.

---

## 🔧 Method 25 — `gradeManagement()`

```java
public static void gradeManagement()
```

Grade menu:
- `case 1` → `prfMarksUpdate()`
- `case 2` → `dbmsMarksUpdate()`
- `case 3` → `return`

---

## 🔧 Method 26 — `prfMarksUpdate()`

```java
public static void prfMarksUpdate()
```

**Step 1:** Reg No input, `findStudentIndex()` call. Not found → retry.

**Step 2:** Student info display.

**Step 3 — Existing Marks Check:**

```java
boolean performUpdate = true;

if (prfArray[idx] >= 0) {
    // Marks already exist
    System.out.println("PRF Marks : " + prfArray[idx]);
    // Confirmation Y/N
    if (!conf.equalsIgnoreCase("Y")) {
        performUpdate = false;  // Update cancel
    }
} else if (prfArray[idx] == -1) {
    // Absent — update allowed without extra confirmation
    System.out.println("Student was absent...");
}
// -2 (not conducted) — directly falls through to update
```

`performUpdate` flag ෙෙෙ use ෙෙෙෙෙ — marks already ෙෙෙෙ user confirm ෙෙ ෙෙ "N" ෙෙෙ update skip ෙෙෙෙෙ.

**Step 4 — Input Validation Loop:**
```java
int newMark = -3;
while (true) {
    newMark = scanner.nextInt();
    if (newMark == -1 || (newMark >= 0 && newMark <= 100)) {
        break;  // Valid input — loop exit
    }
    System.out.println("Invalid marks...");  // Loop again
}
```
`-3` ෙෙෙ invalid sentinel value ෙෙෙ. Valid input ෙෙෙ ෙෙ `-1` (absent) ෙෙ `0-100` range. ෙෙෙ valid ෙෙෙෙ `break` ෙෙෙ loop exit. ෙෙෙෙෙ loop continue.

**Step 5:** `prfArray[idx] = newMark` — directly update.

---

## 🔧 Method 27 — `dbmsMarksUpdate()`

```java
public static void dbmsMarksUpdate()
```

`prfMarksUpdate()` ෙෙෙ exact same logic. ෙෙෙෙෙ ෙෙෙෙෙ `prfArray` ෙෙ `dbmsArray` ෙෙෙ use ෙෙෙෙෙ, display text ෙෙෙ "PRF" ෙෙ "DBMS" ෙෙෙ වෙෙෙස.

---

## 🔧 Method 28 — `reportGenerator()`

```java
public static void reportGenerator()
```

Report menu:
- `case 1` → `studentRegistrationReport()`
- `case 2` → `batchWiseStudentReport()`
- `case 3` → `industryTrainingEligibilityReport()`
- `case 4` → `return`

---

## 🔧 Method 29 — `studentRegistrationReport()`

```java
public static void studentRegistrationReport()
```

ෙෙ report ෙෙෙ students alphabetically sorted ෙෙෙ table ෙෙෙ display ෙෙෙෙෙ. **Direct array sorting ෙෙ** — index-based sorting technique.

**Step 1 — Index Array:**
```java
int[] tempIndices = new int[nameArray.length];
for (int i = 0; i < tempIndices.length; i++) {
    tempIndices[i] = i;  // {0, 1, 2, 3, ...}
}
```
`tempIndices` ෙෙෙ `{0, 1, 2, 3, ...}` ෙෙෙ initialize. ෙෙ array ෙෙෙ sort ෙෙෙෙ, actual data arrays ෙෙ modify ෙෙ ෙෙ.

**Step 2 — Bubble Sort:**
```java
for (int i = 0; i < tempIndices.length - 1; i++) {
    for (int j = i + 1; j < tempIndices.length; j++) {
        if (nameArray[tempIndices[i]].compareToIgnoreCase(nameArray[tempIndices[j]]) > 0) {
            // Swap indices (not actual data!)
            int temp = tempIndices[i];
            tempIndices[i] = tempIndices[j];
            tempIndices[j] = temp;
        }
    }
}
```

Outer loop `i` ෙෙ inner loop `j` — ෙෙ pair ෙෙෙ compare. `nameArray[tempIndices[i]]` → ෙෙෙ `i` position index ෙෙෙ name ෙෙෙෙෙ. `compareToIgnoreCase()` → alphabetically compare. Result > 0 ෙෙෙ? ෙෙෙෙෙ `i` ෙෙෙ name ෙෙ `j` ෙෙෙ ෙෙ bigger → swap ෙෙෙෙෙ. **Swap ෙෙෙෙෙ ෙෙෙ names ෙෙ, indices!**

**Step 3 — Print:**
```java
for (int i = 0; i < tempIndices.length; i++) {
    int idx = tempIndices[i];  // sorted order ෙෙෙ index
    double gpa = (getGPA(prfArray[idx]) + getGPA(dbmsArray[idx])) / 2.0;
    System.out.printf("%-5d%-18s%-30s...\n", (i+1), regNoArray[idx], nameArray[idx], ...);
}
```

`tempIndices[i]` ෙෙෙ sorted order ෙෙෙ index ෙෙෙෙෙ, ෙෙ use ෙෙෙෙ all arrays ෙෙෙ correct student data ෙෙෙෙෙ.

---

## 🔧 Method 30 — `batchWiseStudentReport()`

```java
public static void batchWiseStudentReport()
```

Loop ෙෙෙ `batchNameArray` iterate ෙෙෙ available batches list print ෙෙෙෙෙ:
```java
for (int i = 0; i < batchNameArray.length; i++) {
    System.out.println("[" + (i+1) + "] " + batchNameArray[i] + " Batch");
}
System.out.println("[" + (batchNameArray.length + 1) + "] Exit");
```
Last option dynamically generate ෙෙෙෙෙ. User choice ෙෙෙෙ:
- `option == batchNameArray.length + 1` → Exit
- `1` ෙෙ `batchNameArray.length` ෙෙෙෙ range ෙෙෙ → `showBatchReport(batchNameArray[option - 1])` call
- ෙෙෙෙෙ → invalid option

---

## 🔧 Method 31 — `showBatchReport(int batchNum)` *(private)*

```java
private static void showBatchReport(int batchNum)
```

**Step 1 — Count students:**
```java
int count = 0;
for (String regNo : regNoArray) {
    if (regNo.length() >= 7 && regNo.substring(4, 7).equals(batchStr)) {
        count++;
    }
}
```

**Step 2 — Collect indices:**
```java
int[] batchIndices = new int[count];
int k = 0;
for (int i = 0; i < regNoArray.length; i++) {
    if (regNoArray[i].length() >= 7 && regNoArray[i].substring(4, 7).equals(batchStr)) {
        batchIndices[k++] = i;
    }
}
```
`k++` → ෙෙෙෙ `k` value use ෙෙෙ ෙෙෙ increment — post-increment. Match ෙෙෙ student ෙෙෙ index `batchIndices` ෙෙෙ store.

**Step 3 — Bubble Sort (same as Report 1):** Name alphabetical sort by index swapping.

**Step 4 — Print:** sorted ෙෙෙ table.

---

## 🔧 Method 32 — `industryTrainingEligibilityReport()`

```java
public static void industryTrainingEligibilityReport()
```

Industry Training ෙෙෙ eligible ෙෙෙෙෙ ෙෙ criteria 3ක ෙෙෙ satisfy ෙෙෙෙ.

**Eligibility Check:**
```java
double gpa = (getGPA(prfArray[i]) + getGPA(dbmsArray[i])) / 2.0;
if (gpa > 3.25 && prfArray[i] > 50 && dbmsArray[i] > 50) {
    count++;
}
```

3 conditions **AND** ෙෙෙ connected:
| Condition | Meaning |
|-----------|---------|
| `gpa > 3.25` | GPA strictly 3.25 ෙෙ ෙෙෙ |
| `prfArray[i] > 50` | PRF marks 51+ |
| `dbmsArray[i] > 50` | DBMS marks 51+ |

**Two-pass approach:**
- **First pass** → eligible count ෙෙෙෙෙ (array size decide ෙෙෙෙ)
- `count == 0` → "No eligible students" message
- **Second pass** → eligible students print

ෙෙ passes ෙෙෙ `count == 0` ෙෙෙ ෙෙ print block skip ෙෙෙෙෙ.

---

## 🔧 Method 33 — `main(String[] args)`

```java
public static void main(String args[])
```

JVM ෙෙෙ program run ෙෙෙෙෙ invoke ෙෙෙ entry point. `homePage()` ෙෙෙ call ෙෙෙෙෙ. `homePage()` infinite `do-while(true)` loop ෙෙෙ ෙෙ `exit()` call ෙෙ program terminate ෙෙෙ main ෙෙෙ never returns.

---

## 📊 Methods Summary Table

| # | Method | Return | ෙෙෙ කෙරෙෙ |
|---|--------|--------|-----------|
| 1 | `clearConsole()` | void | OS-specific console clear |
| 2 | `exit()` | void | Program terminate |
| 3 | `getGPA(int)` | double | Marks → GPA grade scale |
| 4 | `formatMarks(int)` | String | -1/-2 → Absent/Not conducted |
| 5 | `findStudentIndex(String)` | int | RegNo ෙෙෙ index ෙෙෙෙෙ |
| 6 | `findStudentIndexByNIC(String)` | int | NIC ෙෙෙ index ෙෙෙෙෙ |
| 7 | `checkBadgeStatus(int)` | int | Batch enrollment status |
| 8 | `isDuplicateNIC(String)` | boolean | NIC already exists? |
| 9 | `checkNIC(String)` | boolean | isDuplicateNIC wrapper |
| 10 | `getStudentCountForBatch(int)` | int | Batch student count |
| 11 | `generateStudentID(int, bool)` | String | Auto Reg No generate |
| 12 | `addStudentToArray(...)` | void | Arrays resize + append |
| 13 | `deleteStudentFromArray(int)` | void | Arrays resize + skip |
| 14 | `addBatchToArray(int)` | void | Batch arrays resize + append |
| 15 | `homePage()` | void | Main menu loop |
| 16 | `studentManagement()` | void | Student sub-menu loop |
| 17 | `addStudent()` | void | Multi-layer validation + add |
| 18 | `updateStudent()` | void | Name/NIC update |
| 19 | `veiwStudent()` | void | Profile display |
| 20 | `deleteStudent()` | void | Confirm + delete |
| 21 | `batchManagement()` | void | Batch sub-menu loop |
| 22 | `addBatch()` | void | Duplicate check + add |
| 23 | `updateBatch()` | void | Status toggle |
| 24 | `viewBatches()` | void | Table display |
| 25 | `gradeManagement()` | void | Grade sub-menu loop |
| 26 | `prfMarksUpdate()` | void | PRF marks + validation |
| 27 | `dbmsMarksUpdate()` | void | DBMS marks + validation |
| 28 | `reportGenerator()` | void | Report sub-menu loop |
| 29 | `studentRegistrationReport()` | void | Index-sort + full report |
| 30 | `batchWiseStudentReport()` | void | Batch selection menu |
| 31 | `showBatchReport(int)` | void | Filter + sort + print |
| 32 | `industryTrainingEligibilityReport()` | void | 3-criteria eligibility |
| 33 | `main(String[])` | void | JVM entry point |

---

## 🔄 Program Flow

```
main()
  └── homePage()  [infinite loop]
        ├── [1] studentManagement()  [sub-loop]
        │     ├── [1] addStudent()       ← batch check → NIC check → generate ID → add
        │     ├── [2] updateStudent()    ← find → name/NIC update
        │     ├── [3] veiwStudent()      ← find → GPA calc → display
        │     └── [4] deleteStudent()    ← find → confirm → delete
        ├── [2] batchManagement()  [sub-loop]
        │     ├── [1] addBatch()         ← duplicate check → add
        │     ├── [2] updateBatch()      ← find → toggle status
        │     └── [3] viewBatches()      ← count → table print
        ├── [3] gradeManagement()  [sub-loop]
        │     ├── [1] prfMarksUpdate()   ← find → validate → update
        │     └── [2] dbmsMarksUpdate()  ← same logic, DBMS array
        ├── [4] reportGenerator()  [sub-loop]
        │     ├── [1] studentRegistrationReport()       ← index sort → print all
        │     ├── [2] batchWiseStudentReport()          ← select batch
        │     │         └── showBatchReport(batchNum)   ← filter → sort → print
        │     └── [3] industryTrainingEligibilityReport() ← 3-criteria → print
        └── [5] exit()  ← System.exit(0)
```

---

## ⚠️ Special Values Reference

| Value | Context | Meaning |
|-------|---------|---------|
| `-1` | marks | Absent |
| `-2` | marks | Not conducted |
| `0` | batch status | ENROLLMENT CLOSED |
| `1` | batch status | ENROLLMENT OPEN |
| `-1` | index return | Not found |
| `-3` | prfMarksUpdate sentinel | Invalid/unset mark (temp variable) |

---

*Source: [StudentManagementSystem.java](file:///D:/Coding/Projects/iCET/Coursework/Coursework%202/StudentManagementSystem.java)*
