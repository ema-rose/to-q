# short notes 29 jan 2020
## _running time & stack ADT_

### O() notation example
_What O() most accurately characterizes the growth rate of the running time?_
```java
public int fun(int[] arr) {
  int cnt=0;
  for (int i=0; i<arr.length; i=i+5)
    for (int j=arr.length-1; j>=0; j--)
      if(arr[i] == arr[j])
        cnt++
  return cnt;
}
```
_insert!_
---
```
f(n) = 2^n + 14n^2 + 4n^3
```
Notation:   
f(n) = O(2^n)    
_Due to the fact that 2^n is the fastest growing rate,
 and thus surpasses both n^2 and n^3_
---
```
f(n) = 100
```
Notation:   
f(n) = O(1)   
_Here, the function is constant; it doesn't grow at all.
 The expression for this is O(1). However, technically it's also O() of everything larger._   
- O(2^n)
- O(n^2)
- O(n^3)   
   
However, for the sake of simplicity use O(1),
 just know that this is not the only applicable notation.   


##### The fastest known algorithm is n^2

### concept check
`f() = O(g())` essentially asks, is f() <= g().   
If so, this is the correct notation.
 However, it must be kept in mind that this is looking at the larger values of the function.
 If f() !<= g() at first, it will still apply.    
Ignore constant factors.   

---

### stack ADT
- stores a collection of items in the order oposite to the one they were stored in
- supports:
	- void push(Item i)
	- Item pop()
	- Item peek()
	- boolean isEmpty()
	- int size()    
    
Example of a stack ADT:   
**program stack**   
- each function call is represented by an _activation record_ or _activation frame_ stored in a stack in memory
	- contains values of local variables and return addresses
- new function calls are pushed onto the stack and returning calls pop it off
   
**undo**   
- the undo button in an application
	- complicated buttons allow more than one undo
- can use a stack to support repeated undo's
- the most recent thing that was last touched is on the top of the stack
- redo is also a stack (pulling from the undo stack implementation)   
   
### implementing a stack
- array-based
	- store values with oldest at cell 0
	- keep track of top index (like num)
- linked memory
	- keep reference (top) to Node at top of the stack
