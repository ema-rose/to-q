# short notes 3 february 2020
## _stacking up the queues_

### recall - stack ADT
- stores a collection of items in order opposite if their addition
	- supports push, pop, peek, isEmpty, size
- implements:
	- array-based, oldest val at 0
	- linked memory, keep reference to Node at top

### practice questions
What is the running time of the array-based implementation of Stack's push() method?
    
_push adds to the end_   
a) constant time   
b) linear time   
   
Answer: B, behaves as constant time but is actually constant amortized time, thus the worst case is linear   
Because you use num to keep track of the number of items in the array.
 Thus, there are no needed loops, so constant...
 There's a caveat that if the array is full you have to create a bigger array.
 In this case, you have to copy everything in the array to a new array, which is linear.
 So it's constant amortized time.

---

Stack's pop() method?   
   
Answer: constant time   

---

|   | push | pop |
|--------------|---------------------:|--------------------:|
|array-based|linear (constant amortized)|constant|
|linked list|constant|constant|

### post-fix notation
_aka Reverse Polish Notation_   
- way to write arithmetic expressions where operators appear after the operands
   
```
1 2 +			// 1+2 = 3
1 2 + 3 *		// (1+2)*3 = 9

21 5 3 * +		// (5*3)+21 = 36 
5 1 - 4 5 + *		// (5-1)(4+5) = 36
2 2 1 + + 9 3 1 - - *	// (2+(2+1))*(9-(3-1)) = 35
```

### queue ADT
- stores a collection of items in the order they were added to the queue
- supports:
	- Queue()
	- void enqueue(Item i)
	- Item dequeue()
	- boolean isEmpty()
	- int size()

### implementation
**Queue Implementation 1**    
- array with from element of queue at index 0
- attribute rear is index of first unoccupied cell
	- Empty queue denoted by rear being 0
