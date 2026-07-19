# Java Repetition Statements Assignment Answers
**Institute of Computer Engineering Technology (iCET)**  
**Module:** Programming Fundamentals  

---

### 01. Write a Java program to print “Hello World” 10 times using a for-loop.
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            System.out.println("Hello World");
        }
    }
}
```

---

### 02. Write a Java program to print integer numbers from 1 to 100 using a for-loop.
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 1; i <= 100; i++) {
            System.out.println(i);
        }
    }
}
```

---

### 03. Write a Java program to print integer numbers from 100 to 1 using a for-loop.
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 100; i >= 1; i--) {
            System.out.println(i);
        }
    }
}
```

---

### 04. Write a Java program to print even numbers between 1 and 100.
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 2; i <= 100; i += 2) {
            System.out.println(i);
        }
    }
}
```

---

### 05. Write a Java program to print 10 random numbers between 0 to 100.
```java
import java.util.Random;

public class Example {
    public static void main(String[] args) {
        Random rand = new Random();
        for (int i = 0; i < 10; i++) {
            System.out.println(rand.nextInt(101)); // 0 to 100 inclusive
        }
    }
}
```

---

### 06. Write a Java program to generate 50 random numbers between 0 to 100 and print only the odd numbers.
```java
import java.util.Random;

public class Example {
    public static void main(String[] args) {
        Random rand = new Random();
        for (int i = 0; i < 50; i++) {
            int num = rand.nextInt(101);
            if (num % 2 != 0) {
                System.out.println(num);
            }
        }
    }
}
```

---

### 07. Write a Java program to print all characters A to Z using a single “System.out.println()” line by line.
```java
public class Example {
    public static void main(String[] args) {
        for (char ch = 'A'; ch <= 'Z'; ch++) {
            System.out.println(ch);
        }
    }
}
```

---

### 08. Write a Java program to find the factorial of a given integer number.
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num = sc.nextInt();
        int factorial = 1;
        for (int i = num; i >= 1; i--) {
            factorial *= i;
        }
        System.out.println("Factorial: " + factorial);
    }
}
```

---

### 09. Write a Java program to input 50 integer numbers from the keyboard, find and print how many numbers which are greater than 100.
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int count = 0;
        for (int i = 1; i <= 50; i++) {
            System.out.print("Enter number " + i + ": ");
            int num = sc.nextInt();
            if (num > 100) {
                count++;
            }
        }
        System.out.println("Numbers greater than 100: " + count);
    }
}
```

---

### 10. Write a Java program to input 10 marks (type int) for subjects from the keyboard, find the total and average of the marks.
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int total = 0;
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;
        
        for (int i = 1; i <= 10; i++) {
            System.out.print("Enter mark " + i + ": ");
            int mark = sc.nextInt();
            total += mark;
            if (mark > max) max = mark;
            if (mark < min) min = mark;
        }
        
        double average = total / 10.0;
        System.out.println("Total   : " + total);
        System.out.println("Max     : " + max);
        System.out.println("Min     : " + min);
        System.out.println("Average : " + average);
    }
}
```

---

### 11. A school is doing a check on the height and weight of all its students. The school has 100 students. Write a program which:
#### a. Input height and weight of all students
#### b. Output the average height and weight
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        double totalHeight = 0;
        double totalWeight = 0;
        
        for (int i = 1; i <= 100; i++) {
            System.out.print("Enter height for student " + i + ": ");
            double height = sc.nextDouble();
            System.out.print("Enter weight for student " + i + ": ");
            double weight = sc.nextDouble();
            
            totalHeight += height;
            totalWeight += weight;
        }
        
        System.out.println("Average Height: " + (totalHeight / 100.0));
        System.out.println("Average Weight: " + (totalWeight / 100.0));
    }
}
```

---

### 12. Write a Java program to print “Hello World” 10 times using for-loop and while-loop.
```java
public class Example {
    public static void main(String[] args) {
        System.out.println("--- Using For Loop ---");
        for (int i = 0; i < 10; i++) {
            System.out.println("Hello World");
        }
        
        System.out.println("--- Using While Loop ---");
        int count = 0;
        while (count < 10) {
            System.out.println("Hello World");
            count++;
        }
    }
}
```

---

### 13. Write a java program to print integer numbers from 1 to 100 using while-loop.
```java
public class Example {
    public static void main(String[] args) {
        int i = 1;
        while (i <= 100) {
            System.out.println(i);
            i++;
        }
    }
}
```

---

### 14. Write a Java program to print even numbers between 1 and 100 using a while loop.
```java
public class Example {
    public static void main(String[] args) {
        int i = 2;
        while (i <= 100) {
            System.out.println(i);
            i += 2;
        }
    }
}
```

---

### 15. Write a Java program to find the sum of digits of a given number using a for loop.
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter an integer: ");
        String numberStr = sc.next();
        int sum = 0;
        for (int i = 0; i < numberStr.length(); i++) {
            sum += numberStr.charAt(i) - '0';
        }
        System.out.println("Sum of digits: " + sum);
    }
}
```

---

### 16. What is the result of attempting to compile and run the following program? (Explain your answer)
**Explanation:** The code compiles and runs successfully. Each separate block executes one after the other. Here are the printed values of each loop:
* `for(int i = 0; i < 10; i++)`: Prints integers from `0` to `9`.
* `for(int i = 0; i < 10; i++)` with `System.out.println(i++)`: Prints even numbers `0`, `2`, `4`, `6`, `8`.
* `for(int i = 0; i < 10; i++)` with `System.out.println(++i)`: Prints odd numbers `1`, `3`, `5`, `7`, `9`.
* `while(j<10)` with `j++`: Prints `0` to `9`.
* `while(k<10)` with `k++`: Prints `0` to `9`.
* `while(m<10)` with `++m`: Prints `1` to `10`.
* `while(n++<10)`: Prints `1` to `10`.
* `while(++p<10)`: Prints `1` to `9`.
* `do { q++ } while(q<10)`: Prints `0` to `9`.
* `do { ++s } while(s<10)`: Prints `1` to `10`.
* `do { t } while(t++<10)`: Prints `0` to `10`.
* `do { u } while(++u<10)`: Prints `0` to `9`.

---

### 17. Accountant Salary Note Breakdown Program
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input number of Employees: ");
        int n = sc.nextInt();
        
        int r5000 = 0, r2000 = 0, r1000 = 0, r500 = 0, r200 = 0, r100 = 0;
        int r50 = 0, r20 = 0, r10 = 0, r5 = 0, r2 = 0, r1 = 0;
        
        for (int i = 1; i <= n; i++) {
            System.out.print("Input salary " + i + " : ");
            int sal = sc.nextInt();
            
            r5000 += sal / 5000; sal %= 5000;
            r2000 += sal / 2000; sal %= 2000;
            r1000 += sal / 1000; sal %= 1000;
            r500 += sal / 500;   sal %= 500;
            r200 += sal / 200;   sal %= 200;
            r100 += sal / 100;   sal %= 100;
            r50 += sal / 50;     sal %= 50;
            r20 += sal / 20;     sal %= 20;
            r10 += sal / 10;     sal %= 10;
            r5 += sal / 5;       sal %= 5;
            r2 += sal / 2;       sal %= 2;
            r1 += sal / 1;
        }
        
        System.out.println("Output Format");
        System.out.println("======================");
        System.out.println("R5000 notes : " + r5000);
        System.out.println("R2000 notes : " + r2000);
        System.out.println("R1000 notes : " + r1000);
        System.out.println("R500 notes  : " + r500);
        System.out.println("R200 notes  : " + r200);
        System.out.println("R100 notes  : " + r100);
        System.out.println("R50 notes   : " + r50);
        System.out.println("R20 notes   : " + r20);
        System.out.println("R10 coins   : " + r10);
        System.out.println("R5 coins    : " + r5);
        System.out.println("R2 coins    : " + r2);
        System.out.println("R1 Coins    : " + r1);
    }
}
```

---

### 18. Given code (Short Circuit Evaluation)
**Answer:** **C. Prints: 8 2**
**Explanation:** 
* `i = 0, 1`: `++x > 2` evaluates to false, so `++y > 2` is evaluated. `x` and `y` become 2.
* `i = 2, 3, 4`: `++x > 2` evaluates to true, so due to short-circuit `||`, `++y` is NOT evaluated. Thus `y` remains `2`, while `x` increments by 2 per loop (one in check, one inside if block) resulting in `8`.

---

### 19. Which of the following code fragments are legal?
**Answer:** **B. for(int i=0;i<10;i++){} for(int i=0;i<10;i++){}**  
*(Note: A, C are invalid block syntax, and D creates double declarations in the same scope if not insulated).*

---

### 20. Which of the following code fragments can be used to print integer numbers 100 to 109.
**Answer:** **A. for(int i=100;i<110;i++){ System.out.println(i); }** and **C. for(int i=0;i<10;i++){ int k=100; System.out.println(i+k); }**

---

### 21. Output of code fragments:
* **A:** Infinite loop printing `i : 0`, `i : 1`, `i : 2` ...
* **B:** Prints `i : 0` to `i : 9`.
* **C:** Prints even numbers `i : 0`, `i : 2`, `i : 4`, `i : 6`, `i : 8`.
* **D:** Prints characters `ch : A` to `ch : Z`.
* **E:** Prints:
  ```
  0 10
  1 9
  2 8
  3 7
  4 6
  5 5
  ```
* **F:** Prints character symbols alongside their numeric values from 0 to 127.
* **G:** Prints `101` ten times (since `k` is re-initialized to 100 in each loop iteration).

---

### 22. Which of the following loop declarations are legal?
**Answer:** **A, D, E, F, G, J, K** are legal declarations.

---

### 23. Write a Java program that inputs positive numbers (-1 to terminate) and outputs statistics:
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int lessThan1000 = 0;
        int greaterThan1000 = 0;
        
        while (true) {
            System.out.print("Enter number: ");
            int num = sc.nextInt();
            if (num == -1) break;
            
            if (num < 1000) lessThan1000++;
            else if (num > 1000) greaterThan1000++;
        }
        
        System.out.println("Numbers less than 1000: " + lessThan1000);
        System.out.println("Numbers greater than 1000: " + greaterThan1000);
    }
}
```

---

### 24. Coin Tossing Simulation (10 times)
```java
import java.util.Random;

public class Example {
    public static void main(String[] args) {
        Random rand = new Random();
        int heads = 0, tails = 0;
        for (int i = 0; i < 10; i++) {
            if (rand.nextBoolean()) {
                System.out.println("HEAD");
                heads++;
            } else {
                System.out.println("TAIL");
                tails++;
            }
        }
        System.out.println("Statistics: " + heads + " Heads and " + tails + " Tails");
    }
}
```

---

### 25. Roll a 6-sided dice 5 times
```java
import java.util.Random;

public class Example {
    public static void main(String[] args) {
        Random rand = new Random();
        for (int i = 0; i < 5; i++) {
            System.out.print((rand.nextInt(6) + 1) + " ");
        }
        System.out.println();
    }
}
```

---

### 26. Roll dice until desired number is rolled
```java
import java.util.Scanner;
import java.util.Random;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();
        System.out.print("Enter target number (1-6): ");
        int target = sc.nextInt();
        
        while (true) {
            int roll = rand.nextInt(6) + 1;
            System.out.println(roll);
            if (roll == target) break;
        }
    }
}
```

---

### 27. Sum of digits of an input number
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num = sc.nextInt();
        int sum = 0;
        while (num > 0) {
            sum += num % 10;
            num /= 10;
        }
        System.out.println("Sum of digits: " + sum);
    }
}
```

---

### 28. Reverse any integer input by the user
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num = sc.nextInt();
        int reversed = 0;
        while (num != 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        System.out.println("Reversed: " + reversed);
    }
}
```

---

### 29. 99 Bottles of Beer lyrics
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("How many bottles of beer are on the wall: ");
        int n = sc.nextInt();
        
        for (int i = n; i > 0; i--) {
            System.out.println(i + " bottles of beer on the wall, " + i + " bottles of beer.");
            String nextBottles = (i - 1 == 0) ? "no more bottles" : String.valueOf(i - 1);
            System.out.println("Take one down, pass it around, " + nextBottles + " bottles of beer on the wall.\n");
        }
    }
}
```

---

### 30. Check whether the number is palindrome or not
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num = sc.nextInt();
        int original = num;
        int reversed = 0;
        while (num > 0) {
            reversed = reversed * 10 + num % 10;
            num /= 10;
        }
        if (original == reversed) {
            System.out.println("Palindrome");
        } else {
            System.out.println("Not a Palindrome");
        }
    }
}
```

---

### 31. Principal teacher evaluation program
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int studentsCount = 0;
        int totalMarks = 0;
        int max = Integer.MIN_VALUE;
        int min = Integer.MAX_VALUE;
        
        while (true) {
            System.out.print("Enter student mark (-1 to terminate): ");
            int mark = sc.nextInt();
            if (mark == -1) break;
            
            studentsCount++;
            totalMarks += mark;
            if (mark > max) max = mark;
            if (mark < min) min = mark;
        }
        
        double avg = (double) totalMarks / studentsCount;
        System.out.println("No of Students : " + studentsCount);
        System.out.println("Total marks    : " + totalMarks);
        System.out.println("Maximum        : " + max);
        System.out.println("Minimum        : " + min);
        System.out.printf("Average        : %.3f\n", avg);
    }
}
```

---

### 32. Reverse any word input by the user
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter word: ");
        String word = sc.nextLine();
        String reversed = "";
        for (int i = word.length() - 1; i >= 0; i--) {
            reversed += word.charAt(i);
        }
        System.out.println("Reverse word - " + reversed);
    }
}
```

---

### 33. Check if a string is a palindrome
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter string: ");
        String str = sc.nextLine().toLowerCase();
        
        boolean palindrome = true;
        int len = str.length();
        for (int i = 0; i < len / 2; i++) {
            if (str.charAt(i) != str.charAt(len - 1 - i)) {
                palindrome = false;
                break;
            }
        }
        System.out.println("Is Palindrome: " + palindrome);
    }
}
```

---

### 34. Find occurrences of a character in a string
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter string: ");
        String str = sc.nextLine();
        System.out.print("Enter character: ");
        char target = sc.next().charAt(0);
        
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == target) {
                count++;
            }
        }
        System.out.println("Occurrences: " + count);
    }
}
```

---

### 35. Find power of a number (Do not use built-in methods)
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter base: ");
        int base = sc.nextInt();
        System.out.print("Enter exponent: ");
        int exp = sc.nextInt();
        
        long result = 1;
        for (int i = 0; i < exp; i++) {
            result *= base;
        }
        System.out.println("Result: " + result);
    }
}
```

---

### 36. Count vowels and consonants in a string
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter string: ");
        String str = sc.nextLine().toLowerCase();
        
        int vowels = 0, consonants = 0;
        for (int i = 0; i < str.length(); i++) {
            char ch = str.charAt(i);
            if (ch >= 'a' && ch <= 'z') {
                if (ch == 'a' || ch == 'e' || ch == 'i' || ch == 'o' || ch == 'u') {
                    vowels++;
                } else {
                    consonants++;
                }
            }
        }
        System.out.println("Vowels: " + vowels);
        System.out.println("Consonants: " + consonants);
    }
}
```

---

### 37. Greatest Common Divisor (GCD)
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter first integer: ");
        int n1 = sc.nextInt();
        System.out.print("Enter second integer: ");
        int n2 = sc.nextInt();
        
        int gcd = 1;
        for (int i = 1; i <= n1 && i <= n2; i++) {
            if (n1 % i == 0 && n2 % i == 0) {
                gcd = i;
            }
        }
        System.out.println("GCD: " + gcd);
    }
}
```

---

### 38. Trace Loop Output
**Answer:** **B. 012**  
**Explanation:**  
* The `do-while` loop executes the body first, printing `0`.
* The condition `j++ < 2` is evaluated. `0 < 2` is true, so `j` increments to `1`.
* In the next loop, `1` is printed. Condition `1 < 2` is true, `j` increments to `2`.
* In the next loop, `2` is printed. Condition `2 < 2` is false, `j` increments to `3`, and the loop terminates.
* Output is `012`.

---

### 39. Trace Loop Output
**Answer:** **1 2**  
**Explanation:**  
* `j++ < 2` checks if `j < 2` first.
* First check: `0 < 2` is true. `j` increments to `1` and prints `1 `.
* Second check: `1 < 2` is true. `j` increments to `2` and prints `2 `.
* Third check: `2 < 2` is false. `j` increments to `3` and loop terminates.
* Output is `1 2 `.

---

### 40. Pre-increment and Post-increment conditional
**Answer:** **B. int y = 11;**  
**Explanation:** For `x` to output `12`, the post-increment conditional `x++ < y` must evaluate to false when `x` is `11` (which increments it to `12` and exits). If `y = 11`, `11 < 11` is false, incrementing `x` to `12`.

---

### 41. Write a java program to print the outputs using two for-loops.
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 0; i < 5; i++) {
            System.out.printf("%d%d\t%d%d\t%d%d\t%d%d\n", i, i, i, (5-i)%5, 5+i, i, 5+i, (5-i)%5);
        }
    }
}
```

---

### 42. Print square pattern of '*'
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 0; i < 10; i++) {
            for (int j = 0; j < 10; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }
    }
}
```

---

### 43. Print left triangle pattern of '*'
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 1; i <= 10; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }
    }
}
```

---

### 44. Print inverted triangle pattern of '*'
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 10; i >= 1; i--) {
            for (int j = 1; j <= i; j++) {
                System.out.print("* ");
            }
            System.out.println();
        }
    }
}
```

---

### 45. Multiplication Table
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter size: ");
        int size = sc.nextInt();
        
        System.out.print("* | ");
        for (int i = 1; i <= size; i++) {
            System.out.print(i + " ");
        }
        System.out.println("\n-------------------------");
        
        for (int i = 1; i <= size; i++) {
            System.out.print(i + " | ");
            for (int j = 1; j <= size; j++) {
                System.out.print((i * j) + " ");
            }
            System.out.println();
        }
    }
}
```

---

### 46. Guess the random number
```java
import java.util.Scanner;
import java.util.Random;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();
        int target = rand.nextInt(100) + 1;
        
        while (true) {
            System.out.print("Enter your guess: ");
            int guess = sc.nextInt();
            if (guess > target) {
                System.out.println("Too high, try again.");
            } else if (guess < target) {
                System.out.println("Too low, try again.");
            } else {
                System.out.println("Correct!");
                break;
            }
        }
    }
}
```

---

### 47. Number triangle pattern
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Input number of rows : ");
        int rows = sc.nextInt();
        for (int i = 1; i <= rows; i++) {
            for (int j = 1; j <= i; j++) {
                System.out.print(j + " ");
            }
            System.out.println();
        }
    }
}
```

---

### 48. Print prime numbers between 1 and 100 using while loop.
```java
public class Example {
    public static void main(String[] args) {
        int i = 2;
        while (i <= 100) {
            boolean isPrime = true;
            int j = 2;
            while (j <= i / 2) {
                if (i % j == 0) {
                    isPrime = false;
                    break;
                }
                j++;
            }
            if (isPrime) {
                System.out.print(i + " ");
            }
            i++;
        }
        System.out.println();
    }
}
```

---

### 49. Check Armstrong number or not
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num = sc.nextInt();
        int original = num;
        int sum = 0;
        
        while (num > 0) {
            int digit = num % 10;
            sum += digit * digit * digit;
            num /= 10;
        }
        
        if (original == sum) {
            System.out.println("Armstrong number");
        } else {
            System.out.println("Not an Armstrong number");
        }
    }
}
```

---

### 50. Sum of multiples of 3 or 5 below 1000
```java
public class Example {
    public static void main(String[] args) {
        int sum = 0;
        for (int i = 1; i < 1000; i++) {
            if (i % 3 == 0 || i % 5 == 0) {
                sum += i;
            }
        }
        System.out.println("Sum: " + sum);
    }
}
```

---

### 51. Smallest positive number evenly divisible by all numbers from 1 to 20
```java
public class Example {
    public static void main(String[] args) {
        long num = 20;
        while (true) {
            boolean found = true;
            for (int i = 1; i <= 20; i++) {
                if (num % i != 0) {
                    found = false;
                    break;
                }
            }
            if (found) {
                System.out.println("Smallest number: " + num);
                break;
            }
            num += 20;
        }
    }
}
```

---

### 52. Count vowels in a set of words
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter words: ");
        String str = sc.nextLine().toLowerCase();
        int count = 0;
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') {
                count++;
            }
        }
        System.out.println("Number of vowels: " + count);
    }
}
```

---

### 53. Power of a number (Base & Exponent)
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter base: ");
        int base = sc.nextInt();
        System.out.print("Enter exponent: ");
        int exp = sc.nextInt();
        
        long result = 1;
        for (int i = 0; i < exp; i++) {
            result *= base;
        }
        System.out.println("Result: " + result);
    }
}
```

---

### 54. Print prime numbers between 1 and 100 using a for loop.
```java
public class Example {
    public static void main(String[] args) {
        for (int i = 2; i <= 100; i++) {
            boolean isPrime = true;
            for (int j = 2; j <= i / 2; j++) {
                if (i % j == 0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) {
                System.out.print(i + " ");
            }
        }
        System.out.println();
    }
}
```

---

### 55. Points in Unit Circle simulation
```java
public class Example {
    public static void main(String[] args) {
        while (true) {
            double x = (Math.random() * 2) - 1; // Range -1.0 to 1.0
            double y = (Math.random() * 2) - 1; // Range -1.0 to 1.0
            System.out.printf("Point: (%.4f, %.4f)\n", x, y);
            if ((x * x + y * y) > 1.0) {
                System.out.println("Point fell outside the unit circle.");
                break;
            }
        }
    }
}
```

---

### 56. Loop print assignments output trace
**Answer:**
* **a = 9** (for-loop runs 10 times, final `a = i` value is 9)
* **b = 10** (`j++ < 10` terminates when `j` is 11, so `b = 10` is final assigned value)
* **c = 11** (since `j` is 11, do-while executes once `c = 11`, terminates)
* **d = 0**
* **e = 0**

---

### 57. Display factors of an integer number
```java
import java.util.Scanner;

public class Example {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter number: ");
        int num = sc.nextInt();
        for (int i = 1; i <= num; i++) {
            if (num % i == 0) {
                System.out.print(i + (i == num ? "" : ", "));
            }
        }
        System.out.println();
    }
}
```

---

### 58. Trace do-while boolean logic
**Answer:** **E. The code will compile without error and will print 3 when run.**  
**Explanation:** First iteration `i` becomes 2, `b` becomes true. Second iteration `i` becomes 3, `b` becomes false. Loop terminates, prints 3.

---

### 59. Trace break and continue statement
**Answer:** **C. The program will print 4, 3 when run if break is replaced by continue.**  
**Explanation:** If break is replaced by continue, `i=2` skips `l++`, but `i=3` runs and increments `k` to 4, `l` to 3.

---

### 60. Valid Java Statement Blocks
**Answer:** **A. {{}} is a valid statement block.** and **C. block: { break block; } is a valid statement block.**

---

### 61. Switch case remainder output
**Answer:** **D. A B 2 A B 2 A B 2 A**  
**Explanation:** Remainder sequence of `i % 3` is `0, 1, 2, 0, 1, 2, 0, 1, 2, 0` which maps to outputs `A`, `B`, `2`, `A`, `B`, `2`, `A`, `B`, `2`, `A`.

---

### 62. Nested loop with labeled break/continue
**Answer:** **A. i=1, j=0** and **D. i=2, j=1**  
**Explanation:** When `i == j` executes, control jumps to next outer iteration, skipping print. Thus, `i=0, j=0` and `i=1, j=1` and `i=2, j=2` are skipped.

---

### 63. Break target evaluation
**Answer:** **C. Error at line 3**  
**Explanation:** You cannot use `break` to exit an `if` block, only loop blocks or switch statements.

---

### 64. Continue in loop trace
**Answer:** **C. Only 5 is printed**  
**Explanation:** `continue` statement is triggered for all numbers `i < 5`, skipping the print line. When `i = 5`, `continue` is bypassed, printing `5`.

---

### 65. Switch and multi-level loop trace
**Answer:** **A. 1 0 1 1 2 2 2 3 3 4**  
**Explanation:**  
* `i=1, j=0`: prints `1 0 `, case 1 continues label2.
* `i=1, j=1`: prints `1 1 `, case 2 continues label1.
* `i=2, j=2`: prints `2 2 `, case 4 breaks label3 (returns to loop label2).
* `i=2, j=3`: prints `2 3 `, case 5 breaks label2 (returns to loop label1).
* `i=3, j=4`: prints `3 4 `, case default breaks label1 (exits program).
