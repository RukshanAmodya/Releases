# iCD122 / iCD125 — Java Programming Fundamentals (PRF)
## Complete Student Lecture & Practical Guide — Full A4 Page-by-Page Edition
*Prepared for Institute of Computer Engineering Technology (iCET) Students*

---

# 📄 PAGE 1 — Introduction to Java, Environment & Setup

## 1.1 What is Java?
Java is a versatile, secure, concurrent, class-based, and Object-Oriented Programming (OOP) language created by **James Gosling** at **Sun Microsystems** in 1995 (later acquired by Oracle).

Java was built on the core philosophy:
> **WORA** — *Write Once, Run Anywhere*

This means code written on a Windows PC can run without any modification on Linux, macOS, or any other operating system that has a compatible Java runtime environment.

```
+--------------------------+        +--------------------+        +-----------------------+
|  Example.java            | javac  |  Example.class     |  JVM   |  Native Machine Code  |
|  (Human-readable Source) | -----> |  (Java Bytecode)   | -----> |  (Windows / Linux/Mac)|
+--------------------------+        +--------------------+        +-----------------------+
```

---

## 1.2 JDK vs. JRE vs. JVM Architecture
To write and run Java programs, we must understand the three core pillars of Java architecture:

```
+-----------------------------------------------------------------------------------+
|  JDK (Java Development Kit)                                                       |
|  [ For Developers: javac, javadoc, jar, debugger + JRE ]                          |
|                                                                                   |
|  +-----------------------------------------------------------------------------+  |
|  |  JRE (Java Runtime Environment)                                             |  |
|  |  [ For Running Code: Core Java Class Libraries (rt.jar) + JVM ]             |  |
|  |                                                                             |  |
|  |  +-----------------------------------------------------------------------+  |  |
|  |  |  JVM (Java Virtual Machine)                                           |  |  |
|  |  |  * ClassLoader Subsystem                                              |  |  |
|  |  |  * JVM Memory (Heap, Stack, Method Area, PC Registers)                |  |  |
|  |  |  * Execution Engine (Interpreter + JIT Compiler + Garbage Collector)   |  |  |
|  |  +-----------------------------------------------------------------------+  |  |
|  +-----------------------------------------------------------------------------+  |
+-----------------------------------------------------------------------------------+
```

1. **JDK (Java Development Kit):**
   The complete software development environment needed to develop Java applications. It includes compiler (`javac`), archive tools (`jar`), documentation tools (`javadoc`), and the JRE.
2. **JRE (Java Runtime Environment):**
   Provides the minimum runtime environment needed solely to execute Java bytecode. It bundles the standard Java class library set and the JVM.
3. **JVM (Java Virtual Machine):**
   The virtual engine that loads, verifies, interprets, and executes bytecode by converting it to machine-specific binary instructions.

---

## 1.3 Step-by-Step: Writing, Compiling & Executing Your First Program

### Step 1: Open Command Prompt (CMD)
Navigate to your project directory or drive:
```cmd
Microsoft Windows [Version 10.0.26200]
(c) Microsoft Corporation. All rights reserved.

C:\Users\Student> D:
D:\> mkdir PRF_Java
D:\> cd PRF_Java
D:\PRF_Java>
```

### Step 2: Create and Open Source File in Notepad
```cmd
D:\PRF_Java> notepad Example.java
```
*(When prompted to create a new file, click **Yes**).*

### Step 3: Write the Source Code
```java
class Example {
    public static void main(String args[]) {
        System.out.println("Hello World !");
    }
}
```

### Step 4: Save & Compile with `javac`
```cmd
D:\PRF_Java> javac Example.java
```
- If there are no syntax errors, `javac` creates a binary bytecode file named `Example.class`.

### Step 5: Execute with `java`
```cmd
D:\PRF_Java> java Example
```
**Output:**
```text
Hello World !
```

---

## 1.4 Common Beginner Errors & Fixes
| Error Message | Root Cause | Solution |
| :--- | :--- | :--- |
| `'javac' is not recognized as an internal or external command` | JDK `bin` folder is not added to the Windows System `PATH` Environment Variable. | Add `C:\Program Files\Java\jdk-xx\bin` to System PATH. |
| `Error: Could not find or load main class Example` | 1. Class name does not match file name.<br>2. Running `java Example.class` instead of `java Example`. | Run `java Example` (do not add `.class` extension). Ensure the class has a valid `main` method. |
| `class Example is public, should be declared in a file named Example.java` | The class was marked `public` but saved under a different file name. | Rename file to match public class name exactly. |

---

# 📄 PAGE 2 — The Anatomy of a Java Class & The `main` Method

## 2.1 Anatomy of a Java Source File
```java
// 1. Class Declaration
class Example {

    // 2. The main method signature
    public static void main(String[] args) {
        
        // 3. Execution statement
        System.out.println("Welcome to Java Programming!");
    }
}
```

### Detailed Breakdown:
- `class`: Reserved Java keyword used to define a blueprint/type. In Java, **all executable instructions must live inside a class**.
- `Example`: An identifier denoting the name of the class. By convention, class names use **PascalCase** (e.g. `StudentRegistry`, `Calculator`).
- `public`: An access modifier specifying that this method is globally accessible to any outside entity (specifically the JVM launcher).
- `static`: Indicates that the method belongs to the class itself rather than an instance/object of the class. This allows the JVM to invoke `main()` without creating an object using the `new` keyword.
- `void`: The return type of the method. `void` explicitly tells the compiler and JVM that `main()` does not return any value back upon termination.
- `main`: The designated entry point name that the JVM runtime specifically looks for to begin program execution.
- `String[] args`: An array of String objects that collects any command-line arguments passed to the application during startup.
- `{ ... }`: Curly braces define code blocks. Every opening brace `{` must have a matching closing brace `}`.

---

## 2.2 Legal vs. Illegal `main` Method Signatures

### ✅ Legal `main` Method Declarations
```java
// Form 1: Standard industry convention
public static void main(String[] args) { }

// Form 2: Order of 'public' and 'static' swapped (Both are legal modifiers)
static public void main(String[] args) { }

// Form 3: C/C++ style array brackets placed after variable name
public static void main(String args[]) { }

// Form 4: Space between type, bracket, and identifier
public static void main(String []args) { }

// Form 5: Any identifier name can be used instead of 'args'
public static void main(String[] niroth) { }

// Form 6: Varargs (Variable arguments) syntax (Introduced in Java 5)
public static void main(String... args) { }
```

### ❌ Illegal / Invalid `main` Method Declarations
| Code Example | What Is Wrong? | Result |
| :--- | :--- | :--- |
| `public void main(String[] args)` | Missing `static` keyword | Runtime error: `Main method is not static in class Example` |
| `static void main(String[] args)` | Missing `public` access modifier | Runtime error: `Main method not found in class Example` |
| `public static void Main(String[] args)` | Capital `M` in `Main` (Java is strictly case-sensitive) | Runtime error: `Main method not found in class Example` |
| `public static int main(String[] args)` | Return type is `int` instead of `void` | Runtime error: `Main method must return a value of type void` |
| `public static void main()` | Parameter list is empty | Runtime error: `Main method not found in class Example` |
| `public static void main(String args)` | Parameter is a single `String`, not an array (`String[]`) | Runtime error: `Main method not found in class Example` |
| `public static void main(String[])` | Array parameter has no identifier name | Compile Error: `<identifier> expected` |
| `public static main void (String[] args)` | Return type `void` placed after method name | Compile Error: `invalid method declaration` |

---

# 📄 PAGE 3 — Java Syntax Rules, Semicolons & Comments

## 3.1 Semicolons (`;`) — Statement Terminators
In Java, a semicolon is a statement terminator. Every single individual instruction (variable declaration, assignment, method invocation, expression statement) must end with a semicolon.

### ❌ Example: Missing Semicolon
```java
class Example {
    public static void main(String[] args) {
        System.out.println("Line 1");
        System.out.println("Line 2")   // ❌ ERROR: Semicolon missing here
        System.out.println("Line 3");
    }
}
```
**Compiler Output:**
```text
Example.java:5: error: ';' expected
        System.out.println("Line 2")
                                    ^
1 error
```

> **📌 Important Rule:**
> Block structures such as `class Example { }`, `if (...) { }`, `for (...) { }`, and method declarations **do not** end with a semicolon after the closing brace `}`.

---

## 3.2 Java Comments
Comments are human-readable explanations embedded in source code. The Java compiler (`javac`) strips out all comments during lexical analysis; comments have **zero impact on bytecode size or program performance**.

### 1. Single-Line Comments (`//`)
Everything from `//` to the end of that specific line is completely ignored.
```java
class Example {
    public static void main(String[] args) {
        System.out.println("1"); // Prints number 1
        // System.out.println("2"); // This entire line is skipped by the compiler
        System.out.println("3"); // Prints number 3
    }
}
```
**Output:**
```text
1
3
```

### 2. Multi-Line / Block Comments (`/* ... */`)
Used for commenting out multiple lines or large paragraphs of code.
```java
class Example {
    public static void main(String[] args) {
        System.out.println("Start");
        /*
        System.out.println("Hidden A");
        System.out.println("Hidden B");
        System.out.println("Hidden C");
        */
        System.out.println("End");
    }
}
```
**Output:**
```text
Start
End
```

> **⚠️ Warning:** Multi-line comments cannot be nested inside one another (e.g. `/* /* nested */ */` causes a compile error).

---

# 📄 PAGE 4 — Console Output: `print()` vs. `println()`

## 4.1 Understanding Output Streams
Java provides standard output capabilities via `System.out`:
- `System`: A built-in class in the `java.lang` package.
- `out`: A `static` field in `System` representing the standard output stream (instance of `PrintStream`).
- `print(...)` / `println(...)`: Methods used to write data onto the console.

---

## 4.2 Detailed Comparison

| Method | Cursor Behavior | Example | Screen Output |
| :--- | :--- | :--- | :--- |
| `System.out.print("...")` | Prints text and keeps cursor at the **end of the current line**. | `System.out.print("A");`<br>`System.out.print("B");` | `AB` |
| `System.out.println("...")` | Prints text and moves cursor to the **beginning of the next line**. | `System.out.println("A");`<br>`System.out.println("B");` | `A`<br>`B` |
| `System.out.println()` | Prints an empty line (newline character only). | `System.out.println();` | *(Blank line)* |

---

## 4.3 Step-by-Step Code Walkthroughs

### Example 1: Pure `println()`
```java
class Example {
    public static void main(String[] args) {
        System.out.println("1");
        System.out.println("2");
        System.out.println("3");
    }
}
```
**Console Output:**
```text
1
2
3
```

### Example 2: Pure `print()`
```java
class Example {
    public static void main(String[] args) {
        System.out.print("1");
        System.out.print("2");
        System.out.print("3");
    }
}
```
**Console Output:**
```text
123
```

### Example 3: Mixed `print()` and `println()` Practice
```java
class Example {
    public static void main(String[] args) {
        System.out.print("1");
        System.out.print("2");
        System.out.println("3"); // Prints '3' and jumps to line 2
        System.out.println("4"); // Prints '4' and jumps to line 3
        System.out.print("5");
        System.out.println("6"); // Prints '6' and jumps to line 4
    }
}
```
**Console Output:**
```text
123
4
56
```

---

# 📄 PAGE 5 — Escape Sequences & Character Formatting

## 5.1 What is an Escape Sequence?
An escape sequence is a character combination consisting of a backslash (`\`) followed by a letter or symbol. It is used to represent non-printable characters or special characters that would otherwise conflict with Java syntax.

---

## 5.2 Escape Sequences Reference Table

| Escape Sequence | Name / Action | Practical Meaning | Example Code | Console Output |
| :--- | :--- | :--- | :--- | :--- |
| `\n` | Newline (Line Feed) | Moves cursor to the start of next line | `System.out.print("A\nB");` | `A`<br>`B` |
| `\t` | Horizontal Tab | Moves cursor forward to next tab stop (8 spaces) | `System.out.print("A\tB");` | `A       B` |
| `\b` | Backspace | Moves cursor back 1 position, erasing previous char | `System.out.print("ABCD\bE");` | `ABCE` |
| `\r` | Carriage Return | Moves cursor to the beginning of the current line | `System.out.print("Hello\rJava");` | `Javao` |
| `\'` | Single Quote | Escapes single quotation mark in char literals | `System.out.print('\'');` | `'` |
| `\"` | Double Quote | Escapes double quotation mark inside Strings | `System.out.print("\"Hello\"");` | `"Hello"` |
| `\\` | Backslash | Prints a single literal backslash | `System.out.print("C:\\test");` | `C:\test` |

---

## 5.3 Practical Code Examples

### Example 1: Handling Quotes in Output
```java
class Example {
    public static void main(String args[]) {
        System.out.println("She said, \"Java is awesome!\"");
        System.out.println("It\'s a sunny day.");
    }
}
```
**Output:**
```text
She said, "Java is awesome!"
It's a sunny day.
```

### Example 2: Printing Complex File Paths
Suppose you want to print: `C:\Program Files\Java\"bin"\javac.exe`
```java
class Example {
    public static void main(String args[]) {
        System.out.println("C:\\Program Files\\Java\\\"bin\"\\javac.exe");
    }
}
```
**Output:**
```text
C:\Program Files\Java\"bin"\javac.exe
```

> **⚠️ Common Exam Trap:**
> Writing `System.out.println("D:\test\notes");` results in a **Compile Error** because `\t` is treated as a tab and `\n` is treated as a newline. You must write: `System.out.println("D:\\test\\notes");`.

---

# 📄 PAGE 6 — Java Literals & Number Representation Systems

## 6.1 What is a Literal?
A **literal** is a fixed, constant value directly typed into the source code without requiring computation.

### Categories of Java Literals:
1. **Integer Literals:** `100`, `-45`, `0`
2. **Floating-Point Literals:** `3.14159`, `0.005`, `1.5e3`
3. **Character Literals:** `'A'`, `'9'`, `'$'`, `'\n'` (Single quotes)
4. **String Literals:** `"Niroth"`, `"iCET"`, `"12345"` (Double quotes)
5. **Boolean Literals:** `true`, `false` (Lowercase keywords only)
6. **Null Literal:** `null`

---

## 6.2 Number Representation Systems (Bases)
Java allows integer literals to be expressed in four different numerical bases:

| Number Base | Base Name | Allowed Digits | Prefix in Java | Example in Code | Evaluated Decimal Value |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Base 10** | Decimal | `0 - 9` | *(No prefix)* | `100` | 100 |
| **Base 2** | Binary | `0, 1` | `0b` or `0B` | `0b1100100` | 100 |
| **Base 8** | Octal | `0 - 7` | `0` | `0144` | 100 |
| **Base 16** | Hexadecimal | `0 - 9, A - F` | `0x` or `0X` | `0x64` | 100 |

### Code Demonstration:
```java
class Example {
    public static void main(String[] args) {
        int dec = 100;
        int bin = 0b1100100;
        int oct = 0144;
        int hex = 0x64;
        
        System.out.println("Decimal     : " + dec);
        System.out.println("Binary      : " + bin);
        System.out.println("Octal       : " + oct);
        System.out.println("Hexadecimal : " + hex);
    }
}
```
**Output:**
```text
Decimal     : 100
Binary      : 100
Octal       : 100
Hexadecimal : 100
```

> **⚠️ Octal Trap:**
> If you write `int x = 085;`, it produces a **Compile Error** (`integer number too large`) because `8` is not a valid digit in the Octal (Base 8) system (valid digits are `0` through `7`).

---

# 📄 PAGE 7 — Variables, Declarations & Memory Concepts

## 7.1 What is a Variable?
A variable is a named storage location in computer memory (RAM) designed to hold a value of a specific data type during program execution.

```
       Variable Name: 'age'
      +--------------------+
RAM:  |         21         |  <--- Value stored
      +--------------------+
      Data Type: int (4 Bytes)
```

---

## 7.2 The Three-Step Rule: Declare → Assign → Use

```java
class Example {
    public static void main(String args[]) {
        // Step 1: DECLARATION (Allocates named memory slot)
        int x;

        // Step 2: ASSIGNMENT (Stores data inside the slot)
        x = 100;

        // Step 3: USAGE (Reads value from slot)
        System.out.println(x);
    }
}
```

### ❌ Critical Error: Reading Uninitialized Local Variables
```java
class Example {
    public static void main(String args[]) {
        int x;
        System.out.println(x); // ❌ COMPILE ERROR
    }
}
```
**Compiler Output:**
```text
Example.java:4: error: variable x might not have been initialized
        System.out.println(x);
                           ^
```
> **Rule:** In Java, local variables (variables defined inside methods) **DO NOT** receive default values. You must assign a value before reading it.

---

## 7.3 Declaration & Assignment Patterns

```java
// Pattern 1: Inline Initialization
int age = 22;

// Pattern 2: Multiple Variable Declaration of Same Type
int a = 10, b = 20, c = 30;

// Pattern 3: Separate Declaration, Chained Assignment
int x, y, z;
x = y = z = 500; // All three receive value 500 ✅ Legal

// ❌ Illegal Chained Declaration:
// int p = q = r = 100; // Error: cannot find symbol q, r
```

---

# 📄 PAGE 8 — String Concatenation & Text Formatting

## 8.1 The Dual Behavior of the `+` Operator
In Java, the plus operator (`+`) performs two completely distinct tasks depending on the data types of its operands:
1. **Numeric Addition:** When both operands are numbers.
2. **String Concatenation (Joining):** When at least one operand is a `String`.

Evaluation always proceeds strictly **from Left to Right** (unless modified with parentheses `()`).

---

## 8.2 Detailed Evaluation Examples

```java
class Example {
    public static void main(String args[]) {
        System.out.println(10 + 20);          // 30    (Addition)
        System.out.println("10" + "20");      // 1020  (String Concatenation)
        System.out.println("10" + 20);        // 1020  (String Concatenation)
        System.out.println(10 + "20");        // 1020  (String Concatenation)
        
        System.out.println(10 + 20 + "Java"); // "30Java"  (10+20=30 -> 30+"Java")
        System.out.println("Java" + 10 + 20); // "Java1020" ("Java"+10="Java10" -> "Java10"+20)
        System.out.println("Java" + (10 + 20));// "Java30"   (Parentheses evaluated first)
    }
}
```

---

## 8.3 Practical Output Labeling

```java
class Example {
    public static void main(String args[]) {
        int itemPrice = 250;
        int quantity = 4;
        int total = itemPrice * quantity;

        System.out.println("Unit Price : Rs. " + itemPrice);
        System.out.println("Quantity   : " + quantity);
        System.out.println("Total Cost : Rs. " + total);
    }
}
```
**Output:**
```text
Unit Price : Rs. 250
Quantity   : 4
Total Cost : Rs. 1000
```

---

# 📄 PAGE 9 — Primitive Data Types & Memory Sizes

Java provides **8 Primitive Data Types**, strictly predefined by the language specification:

```
                            +-------------------------------------------------------------+
                            |                 JAVA PRIMITIVE DATA TYPES                   |
                            +-------------------------------------------------------------+
                                       |                                    |
                        +--------------+--------------+             +-------+-------+
                        |  Numeric Data Types         |             | Non-Numeric   |
                        +-----------------------------+             +---------------+
                           |                       |                   |         |
                  +--------+-------+       +-------+-------+        +--+---+  +--+----+
                  | Integers       |       | Floating-Point|        | char |  |boolean|
                  | (byte, short,  |       | (float,       |        +------+  +-------+
                  |  int, long)    |       |  double)      |
                  +----------------+       +---------------+
```

---

## 9.1 Data Types Specification Table

| Data Type | Category | Size in Bits | Size in Bytes | Min Value / Range | Max Value | Default Value | Example |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| `byte` | Integer | 8 bits | 1 Byte | $-128$ ($-2^7$) | $127$ ($2^7 - 1$) | `0` | `byte b = 100;` |
| `short` | Integer | 16 bits | 2 Bytes | $-32,768$ ($-2^{15}$) | $32,767$ ($2^{15} - 1$) | `0` | `short s = 5000;` |
| `int` | Integer | 32 bits | 4 Bytes | $-2,147,483,648$ ($-2^{31}$) | $2,147,483,647$ ($2^{31} - 1$) | `0` | `int i = 75000;` |
| `long` | Integer | 64 bits | 8 Bytes | $-2^{63}$ | $2^{63} - 1$ | `0L` | `long l = 99999999L;` |
| `float` | Decimal | 32 bits | 4 Bytes | $\approx \pm 1.4 \times 10^{-45}$ | $\approx \pm 3.4 \times 10^{38}$ (~7 digits) | `0.0f` | `float f = 12.5f;` |
| `double` | Decimal | 64 bits | 8 Bytes | $\approx \pm 4.9 \times 10^{-324}$| $\approx \pm 1.7 \times 10^{308}$ (~15 digits)| `0.0d` | `double d = 12.5;` |
| `char` | Unicode | 16 bits | 2 Bytes | `0` (`'\u0000'`) | `65,535` (`'\uffff'`) | `'\u0000'` | `char ch = 'A';` |
| `boolean` | Logical | 1 bit / JVM | JVM dep. | `false` | `true` | `false` | `boolean ok = true;` |

---

## 9.2 Critical Literal Suffixes
- **Float Literal:** By default, every decimal literal is treated as `double`. Appending `F` or `f` is mandatory:
  ```java
  float f1 = 3.14;   // ❌ Compile Error: possible loss of precision
  float f2 = 3.14f;  // ✅ Legal
  ```
- **Long Literal:** Append `L` or `l` for values exceeding the standard 32-bit `int` range:
  ```java
  long big = 999999999999L; // ✅ Required 'L' suffix
  ```

---

# 📄 PAGE 10 — Type Conversion & Type Casting

Type Conversion is the process of converting a value of one data type into another.

```
       WIDENING (Implicit Conversion) - No Data Loss, Automatic
------------------------------------------------------------------------>
 byte  ===>  short  ===>  int  ===>  long  ===>  float  ===>  double
               ^
  char --------+

<------------------------------------------------------------------------
       NARROWING (Explicit Casting) - Potential Data Loss / Truncation
```

---

## 10.1 Widening / Implicit Conversion
- Occurs automatically when smaller data types are placed into larger data type containers.
- Safe operation; no loss of magnitude.

```java
int a = 100;
double d = a;   // Automatically promoted to 100.0
char ch = 'A';  // ASCII value 65
int code = ch;  // Automatically promoted to 65
```

---

## 10.2 Narrowing / Explicit Casting
- Required when forcing a larger data type into a smaller data type container.
- Syntax: `target_variable = (target_type) source_value;`

```java
double pi = 3.14159;
int truncatedPi = (int) pi; // Drops fractional part -> 3

int val = 130;
byte b = (byte) val; // 130 wraps around byte range [-128..127] -> -126
```

### Overflow Formula for Explicit Byte Cast:
$$ \text{Result} = (num + 128) \pmod{256} - 128 $$
For $130$: $130 - 256 = -126$.

---

## 10.3 Automatic Type Promotion in Expressions
When evaluating an expression:
1. `byte`, `short`, and `char` are automatically promoted to `int` before arithmetic operations.
2. If any operand is `long`, the entire expression becomes `long`.
3. If any operand is `float`, the result is `float`.
4. If any operand is `double`, the result is `double`.

```java
byte b1 = 10;
byte b2 = 20;
// byte b3 = b1 + b2; // ❌ Compile Error: b1+b2 results in int!
byte b3 = (byte)(b1 + b2); // ✅ Legal
```

---

# 📄 PAGE 11 — Arithmetic Operators & Division Rules

## 11.1 Standard Arithmetic Operators

| Operator | Symbol | Description | Example ($a=17, b=5$) | Result |
| :--- | :--- | :--- | :--- | :--- |
| Addition | `+` | Adds two values | `a + b` | `22` |
| Subtraction | `-` | Subtracts right from left | `a - b` | `12` |
| Multiplication | `*` | Multiplies two values | `a * b` | `85` |
| Division | `/` | Divides left by right | `a / b` | `3` (Integer division) |
| Modulus | `%` | Returns division remainder | `a % b` | `2` |

---

## 11.2 Integer vs. Floating-Point Division

```java
class Example {
    public static void main(String args[]) {
        System.out.println(5 / 2);     // 2   (Integer / Integer -> Integer truncated)
        System.out.println(5.0 / 2);   // 2.5 (Double / Integer -> Double)
        System.out.println(5 / 2.0);   // 2.5 (Integer / Double -> Double)
        System.out.println((double)5/2);// 2.5 (Explicit cast)
    }
}
```

> **📌 Golden Rule:**
> If both operands are integers, Java discards the decimal remainder. To get an accurate fractional result, cast at least one operand to `double` or `float`.

---

# 📄 PAGE 12 — Increment & Decrement Operators (`++`, `--`)

## 12.1 Prefix vs. Postfix Operations

| Form | Operator | Name | Execution Order |
| :--- | :--- | :--- | :--- |
| **Prefix** | `++x` / `--x` | Pre-Increment / Pre-Decrement | 1. Modify variable value first.<br>2. Use the new value in expression. |
| **Postfix** | `x++` / `x--` | Post-Increment / Post-Decrement | 1. Use current value in expression first.<br>2. Modify variable value afterward. |

---

## 12.2 Step-by-Step Code Tracing

### Example 1: Postfix vs Prefix Evaluation
```java
class Example {
    public static void main(String args[]) {
        int a = 10;
        int b = a++; // b gets 10, then a becomes 11
        System.out.println("a: " + a + ", b: " + b); // a: 11, b: 10

        int x = 10;
        int y = ++x; // x becomes 11 first, then y gets 11
        System.out.println("x: " + x + ", y: " + y); // x: 11, y: 11
    }
}
```

### Example 2: Complex Expression Tracing
```java
class Example {
    public static void main(String args[]) {
        int i = 5;
        int result = i++ + ++i + i--; 
        // Step 1: i++ -> uses 5, i becomes 6
        // Step 2: ++i -> i becomes 7, uses 7
        // Step 3: i-- -> uses 7, i becomes 6
        // result = 5 + 7 + 7 = 19
        System.out.println("result: " + result); // 19
        System.out.println("final i: " + i);     // 6
    }
}
```

---

# 📄 PAGE 13 — Relational & Logical Operators

## 13.1 Relational (Comparison) Operators
Used to test relationships between operands. Always evaluate to a `boolean` (`true` or `false`).

| Operator | Meaning | Example | Result |
| :--- | :--- | :--- | :--- |
| `>` | Greater than | `10 > 5` | `true` |
| `<` | Less than | `10 < 5` | `false` |
| `>=` | Greater than or equal to | `10 >= 10` | `true` |
| `<=` | Less than or equal to | `5 <= 3` | `false` |
| `==` | Exactly equal to | `10 == 10` | `true` |
| `!=` | Not equal to | `10 != 5` | `true` |

> **⚠️ Warning:** Always use double equals `==` to compare. A single `=` is the assignment operator!

---

## 13.2 Logical Operators & Short-Circuit Evaluation

| Operator | Name | Logic / Condition |
| :--- | :--- | :--- |
| `&&` | Short-Circuit AND | Returns `true` ONLY if **both** sides are `true`. If left is `false`, right is **never executed**. |
| `\|\|` | Short-Circuit OR | Returns `true` if **at least one** side is `true`. If left is `true`, right is **never executed**. |
| `!` | Logical NOT | Inverts the boolean result (`!true` becomes `false`). |

### Short-Circuit Tracing Example:
```java
class Example {
    public static void main(String args[]) {
        int x = 10;
        if (x > 20 && ++x > 10) {
            System.out.println("Inside");
        }
        System.out.println("x = " + x); // x is STILL 10 because ++x was skipped!
    }
}
```

---

# 📄 PAGE 14 — User Input with `Scanner` Class

## 14.1 The 5-Step Process to Read Input

```java
// Step 1: Import the Scanner class
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        // Step 2: Create Scanner object bound to System.in
        Scanner input = new Scanner(System.in);

        // Step 3: Prompt the user
        System.out.print("Enter your age: ");

        // Step 4: Read input from keyboard
        int age = input.nextInt();

        // Step 5: Process and display
        System.out.println("You are " + age + " years old.");
    }
}
```

---

## 14.2 Scanner Methods Reference

| Method | Reads |
| :--- | :--- |
| `input.nextInt()` | 32-bit Integer (`int`) |
| `input.nextDouble()` | 64-bit Decimal (`double`) |
| `input.nextFloat()` | 32-bit Decimal (`float`) |
| `input.nextLong()` | 64-bit Integer (`long`) |
| `input.next()` | Single word (reads up to whitespace/space) |
| `input.nextLine()` | Entire line of text (including spaces, up to Enter key) |

---

## 14.3 The `nextLine()` Buffer Trap (Crucial Practical Issue!)
When `nextInt()` reads a number, it leaves the trailing `\n` (newline character from pressing Enter) in the buffer. A subsequent `nextLine()` immediately consumes this empty newline without waiting for input!

```java
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);

        System.out.print("Enter Student ID: ");
        int id = input.nextInt();

        input.nextLine(); // ⚠️ BUFFER CLEAR: Consumes leftover '\n' character!

        System.out.print("Enter Full Name: ");
        String name = input.nextLine();

        System.out.println("Registered ID: " + id + " for " + name);
    }
}
```

---

# 📄 PAGE 15 — Conditional Statements: `if`, `if-else`, and `else-if`

## 15.1 Selection Structures
Decision-making statements control the flow of execution based on boolean conditions.

```
                  +--------------------+
                  | Is Condition True? |
                  +--------------------+
                        /        \
                 YES   /          \   NO
                      v            v
             [ Execute True ]     [ Execute False ]
             [ Code Block   ]     [ Code Block    ]
```

---

## 15.2 Syntaxes & Code Examples

### 1. `if - else` Statement
```java
int marks = 65;
if (marks >= 50) {
    System.out.println("Result: PASS");
} else {
    System.out.println("Result: FAIL");
}
```

### 2. Multi-Branch `if - else if - else` Ladder
```java
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Marks (0-100): ");
        int marks = input.nextInt();

        if (marks >= 75) {
            System.out.println("Grade: A");
        } else if (marks >= 65) {
            System.out.println("Grade: B");
        } else if (marks >= 50) {
            System.out.println("Grade: C");
        } else if (marks >= 35) {
            System.out.println("Grade: S");
        } else {
            System.out.println("Grade: F");
        }
    }
}
```

---

## 15.3 Ternary Operator (`?:`)
Shorthand alternative to `if-else`:
```java
String result = (marks >= 50) ? "PASS" : "FAIL";
```

---

# 📄 PAGE 16 — The `switch-case` Statement

## 16.1 `switch` Statement Mechanics
The `switch` statement tests a variable for equality against a list of constant values (`cases`).

```java
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter Month Number (1-12): ");
        int month = input.nextInt();

        switch (month) {
            case 1: case 3: case 5: case 7: case 8: case 10: case 12:
                System.out.println("Has 31 Days");
                break; // Exits switch block
            case 4: case 6: case 9: case 11:
                System.out.println("Has 30 Days");
                break;
            case 2:
                System.out.println("Has 28 or 29 Days");
                break;
            default:
                System.out.println("Invalid Month Number!");
                break;
        }
    }
}
```

---

## 16.2 Essential `switch` Rules
1. **Allowed Data Types:** `byte`, `short`, `char`, `int`, `String` (Java 7+), and `enum`.
2. **Disallowed Data Types:** `float`, `double`, `long`, `boolean`.
3. **The `break;` Keyword:** Terminates the switch statement. Without `break`, execution falls through into subsequent cases (**Fallthrough behavior**).
4. **The `default` Block:** Optional; executes when none of the cases match.

---

# 📄 PAGE 17 — Iteration Structures: The `for` Loop

## 17.1 Loop Mechanics
Loops repeat a block of code until a specified boolean condition evaluates to `false`.

```java
for (initialization; termination_condition; update_expression) {
    // Repeated statement body
}
```

```
     1. Initialization (Runs ONCE)
              │
              ▼
     2. Condition Check  ───(False)───► [ Exit Loop ]
              │ (True)
              ▼
     3. Execute Body
              │
              ▼
     4. Update (i++ / i--) ──► Loops back to (2. Condition Check)
```

---

## 17.2 Practical `for` Loop Implementations

### Example 1: Calculating the Factorial of a Number
```java
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter number: ");
        int n = input.nextInt();

        long fact = 1;
        for (int i = 1; i <= n; i++) {
            fact *= i;
        }
        System.out.println(n + "! = " + fact);
    }
}
```

### Example 2: Printing Multiplication Table
```java
int table = 5;
for (int i = 1; i <= 10; i++) {
    System.out.println(table + " x " + i + " = " + (table * i));
}
```

---

# 📄 PAGE 18 — The `while` & `do-while` Loops

## 18.1 Entry-Controlled vs. Exit-Controlled Loops

| Feature | `while` Loop | `do-while` Loop |
| :--- | :--- | :--- |
| **Control Type** | Entry-Controlled (Pre-test) | Exit-Controlled (Post-test) |
| **Condition Checked** | Checked **BEFORE** executing body | Checked **AFTER** executing body |
| **Minimum Iterations** | **0** (May never run if condition is false) | **1** (Always executes at least once) |

---

## 18.2 Practical Implementations

### Example 1: Sum of Digits using `while`
```java
int num = 4567;
int sum = 0;
while (num > 0) {
    int digit = num % 10; // Extract last digit
    sum += digit;
    num /= 10;           // Drop last digit
}
System.out.println("Sum of digits: " + sum); // 22
```

### Example 2: Number Reversal using `do-while`
```java
int num = 12345;
System.out.print("Reversed: ");
do {
    System.out.print(num % 10);
    num /= 10;
} while (num != 0);
System.out.println(); // Output: 54321
```

---

# 📄 PAGE 19 — Loop Control: `break`, `continue` & Nested Loops

## 19.1 `break` vs. `continue`

| Statement | Action |
| :--- | :--- |
| `break;` | **Immediately terminates** the entire loop and jumps to the code following the loop. |
| `continue;` | **Skips the remainder** of the current iteration and jumps directly to the next loop cycle. |

```java
class Example {
    public static void main(String args[]) {
        for (int i = 1; i <= 6; i++) {
            if (i == 3) continue; // Skip printing 3
            if (i == 5) break;    // Stop loop when reaching 5
            System.out.print(i + " ");
        }
    }
}
```
**Output:**
```text
1 2 4 
```

---

## 19.2 Nested Loops & Star Patterns

### Star Pattern: Right-Angled Triangle
```java
class Example {
    public static void main(String args[]) {
        int rows = 5;
        for (int r = 1; r <= rows; r++) {
            for (int c = 1; c <= r; c++) {
                System.out.print("* ");
            }
            System.out.println();
        }
    }
}
```
**Output:**
```text
* 
* * 
* * * 
* * * * 
* * * * * 
```

---

# 📄 PAGE 20 — Algorithmic Problem Solving: Prime Numbers & Fibonacci

## 20.1 Checking for Prime Numbers
A prime number is an integer greater than 1 with no positive divisors other than 1 and itself.

```java
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter integer: ");
        int num = input.nextInt();

        boolean isPrime = (num > 1);
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                isPrime = false;
                break;
            }
        }

        if (isPrime) {
            System.out.println(num + " is a Prime Number.");
        } else {
            System.out.println(num + " is NOT a Prime Number.");
        }
    }
}
```

---

## 20.2 Fibonacci Series Generation
```java
// Prints first 10 Fibonacci numbers: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
int n = 10;
int first = 0, second = 1;

System.out.print("Fibonacci: ");
for (int i = 1; i <= n; i++) {
    System.out.print(first + " ");
    int next = first + second;
    first = second;
    second = next;
}
```

---

# 📄 PAGE 21 — Java Methods: Declaration & Invocation

## 21.1 What is a Method?
A method is a reusable, self-contained block of code designed to perform a specific operation.

```java
[access_modifier] [static] [return_type] methodName(parameter_list) {
    // Method body
    return returnValue; // Required if return_type is not void
}
```

---

## 21.2 Methods with `void` vs. Value Returning

```java
class Example {
    // 1. Void Method (Performs action without returning value)
    public static void printHeader() {
        System.out.println("================================");
        System.out.println("   iCET STUDENT PORTAL - PRF    ");
        System.out.println("================================");
    }

    // 2. Value-Returning Method
    public static int calculateTotal(int num1, int num2) {
        return num1 + num2;
    }

    public static void main(String args[]) {
        printHeader(); // Invoking void method

        int sum = calculateTotal(45, 55); // Receiving returned value
        System.out.println("Calculated Sum: " + sum);
    }
}
```

---

# 📄 PAGE 22 — Parameter Passing & Pass-By-Value Mechanics

## 22.1 Java's Strict Pass-By-Value Principle
Java is **strictly Pass-By-Value**.
- When passing **primitives** (`int`, `double`, `char`, etc.), a duplicate copy of the literal value is placed onto the method's local call stack.
- Modifying the parameter variable inside the method **never modifies the caller's original variable**.

```
  Caller Stack (main):       Callee Stack (changeValue):
  +------------------+       +------------------+
  |  val = 10        | ====> |  x = 10 -> 999   | (Only local x changes)
  +------------------+       +------------------+
```

```java
class Example {
    public static void modifyValue(int x) {
        x = 999; // Changes local variable 'x' only
    }

    public static void main(String args[]) {
        int val = 10;
        modifyValue(val);
        System.out.println("val in main: " + val); // Remains 10!
    }
}
```

---

# 📄 PAGE 23 — Method Overloading & Scope

## 23.1 What is Method Overloading?
Creating multiple methods within the same class that share the **exact same name** but have **different parameter lists** (by parameter count, parameter types, or sequence of types).

```java
class Example {
    // 1. Two integers
    public static int add(int a, int b) {
        return a + b;
    }

    // 2. Three integers (Different parameter count)
    public static int add(int a, int b, int c) {
        return a + b + c;
    }

    // 3. Two doubles (Different parameter types)
    public static double add(double a, double b) {
        return a + b;
    }

    public static void main(String args[]) {
        System.out.println(add(10, 20));       // Calls (int, int) -> 30
        System.out.println(add(10, 20, 30));   // Calls (int, int, int) -> 60
        System.out.println(add(12.5, 7.5));    // Calls (double, double) -> 20.0
    }
}
```

> **⚠️ Rule:** Changing only the return type (e.g. `int add(...)` vs `double add(...)`) without altering parameters is **NOT** valid overloading and causes a compile error.

---

# 📄 PAGE 24 — 1D Arrays: Memory Allocation & Indexing

## 24.1 What is an Array?
An array is a fixed-size, indexed, homogeneous collection of data elements stored contiguously in memory.

```
  Index:       [0]      [1]      [2]      [3]      [4]
            +--------+--------+--------+--------+--------+
  Array:    |   85   |   90   |   78   |   92   |   60   |
            +--------+--------+--------+--------+--------+
  Length: 5  (Indices always run from 0 to length - 1)
```

---

## 24.2 Declaration, Creation & Default Values

```java
// Method 1: Declaration followed by instantiation
int[] marks = new int[5]; // Allocated in Heap with default zeros: [0, 0, 0, 0, 0]

// Method 2: Array Literal Initialization
int[] scores = {85, 90, 78, 92, 60};

// Accessing length
System.out.println("Total elements: " + scores.length); // 5
```

### Default Array Element Values:
- `byte`, `short`, `int`, `long`: `0`
- `float`, `double`: `0.0`
- `char`: `'\u0000'`
- `boolean`: `false`
- `String` / Objects: `null`

---

# 📄 PAGE 25 — Array Operations: Min, Max, Sum & Average

## 25.1 Traversing & Computing Array Statistics

```java
import java.util.Scanner;

class Example {
    public static void main(String args[]) {
        Scanner input = new Scanner(System.in);
        System.out.print("Enter number of students: ");
        int n = input.nextInt();

        int[] marks = new int[n];
        int sum = 0;

        // Reading elements
        for (int i = 0; i < marks.length; i++) {
            System.out.print("Enter mark for Student " + (i + 1) + ": ");
            marks[i] = input.nextInt();
            sum += marks[i];
        }

        // Computing Min and Max
        int max = marks[0];
        int min = marks[0];
        for (int i = 1; i < marks.length; i++) {
            if (marks[i] > max) max = marks[i];
            if (marks[i] < min) min = marks[i];
        }

        double avg = (double) sum / n;
        System.out.println("Sum     : " + sum);
        System.out.println("Average : " + avg);
        System.out.println("Highest : " + max);
        System.out.println("Lowest  : " + min);
    }
}
```

---

# 📄 PAGE 26 — Array Manipulations: In-Place Reverse & Linear Search

## 26.1 Reversing an Array In-Place
Efficiently swaps elements symmetrically up to the midpoint `array.length / 2`.

```java
class Example {
    public static void main(String args[]) {
        int[] ar = {10, 20, 30, 40, 50};

        for (int i = 0; i < ar.length / 2; i++) {
            int temp = ar[i];
            ar[i] = ar[ar.length - 1 - i];
            ar[ar.length - 1 - i] = temp;
        }

        // Printing reversed array
        System.out.print("Reversed: ");
        for (int val : ar) {
            System.out.print(val + " ");
        }
        // Output: 50 40 30 20 10
    }
}
```

---

## 26.2 Linear Search Algorithm
Sequentially checks every element until the target `key` is found.

```java
public static int linearSearch(int[] ar, int key) {
    for (int i = 0; i < ar.length; i++) {
        if (ar[i] == key) {
            return i; // Target found at index i
        }
    }
    return -1; // Target not found
}
```

---

# 📄 PAGE 27 — Complete Examination Cheat Sheet & Diagnostic Guide

## 27.1 Quick Syntax Reference

| Concept | Correct Syntax ✅ | Common Mistake ❌ |
| :--- | :--- | :--- |
| **Main Signature** | `public static void main(String[] args)` | `public void main(String args)` |
| **Float Assignment**| `float f = 12.5f;` | `float f = 12.5;` |
| **Equality Check** | `if (a == b)` | `if (a = b)` |
| **Array Length** | `arr.length` (Property) | `arr.length()` (Not a method for arrays) |
| **Array Start Index**| `arr[0]` | `arr[1]` |
| **Scanner Buffer** | `input.nextLine();` after `nextInt()` | Omitting flush causes empty name string |

---

## 27.2 Common Java Exceptions & Fixes

| Exception | Root Cause | Solution |
| :--- | :--- | :--- |
| `java.lang.ArrayIndexOutOfBoundsException` | Attempting to access index $< 0$ or $\ge \text{length}$. | Ensure loop condition is `i < array.length`. |
| `java.util.InputMismatchException` | Passing non-numeric text into `input.nextInt()`. | Ensure input matches expected data type. |
| `java.lang.NullPointerException` | Accessing methods or length of a `null` reference. | Initialize array/object before access. |
| `java.lang.ArithmeticException: / by zero` | Integer division by zero (`10 / 0`). | Validate divisor is not zero before dividing. |
