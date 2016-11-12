# appleCalculatorCloneIOS
Clone of the inbuilt calculator app on ios.

![image](http://i.imgur.com/3zliQPJ.gif)

##iOS Task 
Custom calculator</p>

<p>You have to create a custom calculator. There are a number of features of the calculator that your program must implement.</p>

<p>When the calculator is first started, it will have a 0 in the display.</p>

<p>Your program must be able to handle floating point numbers.</p>

<p>Your program must be able to handle the following arithmetic operators + - * / % ^ <br>
The % operator is the modulus operator, not the percentage, and the ^ operator is the power operator. <br>
E.g. 3^2 = 9. It must also handle the unary + and – operators.</p>

<p>The CE button will remove the last button entry from the display. <br>
E.g. If you have entered 1.23 then pressing the CE button will leave 1.2.  <br>
If pressing the button ends up removing all characters shown in the display it will always leave a 0 in its place. <br>
E.g. If 7 is entered in the display then pressing CE will result in 0 being displayed.</p>

<p>The CL button will clear all characters displayed and leave a 0 in its place. <br>
E.g. If there is 3+6%2.3 and the CL button is pressed then 0 will be displayed.</p>

<p>After the = button is pressed, the calculator will evaluate the string in the display and either display the calculated result or an error message if there is invalid input. <br>
E.g. Division by zero, etc.</p>

<p>If the result is a numerical value then, if the user presses an operator button, the previous result will stay and be used as part of the next calculation. In all other cases, the display will be cleared and the button pressed will be part of a new calculation. <br>
E.g 1. After pressing the = button, 7.6 is displayed. If the + is pressed the display will show 7.6+ <br>
E.g 2. After pressing the = button, 7.6 is displayed. If the 4 button is pressed the display will show 4</p>

<p>Whenever the calculator starts with a 0 in its display, entering a number will clear the 0 and display the number. <br>
E.g. If the display has 0 displayed, entering 4 will display 4, not 04. <br>
However, if you enter a . the 0 will be kept. <br>
E.g. If the display has 0 and we enter . we will get 0.</p>

<p>The program must follow the usual rules of arithmetic which says <br>
1. The ^ operator must be evaluated first, then the * / and % operators must be <br>
evaluated second before the + and – operators are evaluated third.</p>

<ol>
<li>Operators of equal precedence must be evaluated from left to right. <br>
For example <br>
-6-5+4*3^2 <br>
becomes <br>
-6-5+4*9 (after using rule 1) which becomes <br>
-6-5+36 (after using rule 1) <br>
which becomes <br>
-11+36 (after using rule 2) <br>
which results in <br>
25</li>
</ol>

<p>Note : <br>
As part of the design of your program you should split your code into sensible classes.</p>

![image](https://i.imgur.com/nUZ1GWz.jpg)
![image](https://i.imgur.com/Q5mgTE2.jpg)

