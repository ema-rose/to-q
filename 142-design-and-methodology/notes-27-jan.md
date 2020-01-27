# short notes 27 jan 2020
## _running time & doubly-linked lists_

### running times
- constant time
	- method takes the same amount of time no matter how big the list is
- linear time
	- method takes time proportional to the number of items in the list   
(_both assume code goes through the longest path, i.e., we're retrieving an item that will take the longest possible time_)   

**Array-Based:**   

Constant time example:
```
vals[num] = toAdd();
num++;
```
Linear time example:
```
if(num == vals.length) {
  //resize
}
vals[num] = toAdd();
num++;
```
If you double the array -- resizes are rare enough that
 any sequence of operations takes constant time per operation on average.
 We call this constant _amortized time_.   

**Linked List Based:**   

Constant time example:
```
public boolean addFront() {
   //adding a node to the front
}
```
Adding to the front makes the operation constant, as it doesn't need to cycle through to find the end of the list.
 It only needs to allocate a node and change two pointers (head and end pointer).   

Linear time example:
```
public boolean add() {
  //adding to the end, must first loop through the list and
  //determine how large it is
}
```

### tail pointer
The **tail pointer**, i.e. tail references, refers to the last Node in the list.
- helpful in adding to the end (makes it constant time)
- does not help with removing from the end (still linear)
- if used, it is important to make certain the pointer is always up to date
	- while having the attribute is helpful in removing, it is harmful in maintaining
	- it takes more effort to maintain the correct value for the tail
- the head Node for myLinkedList will now contain a reference for head as well as tail
	- the head points to the 1st node in the list
	- the tail points to the last node in the list

### double-linked lists
**Concept Check**   
_Write code to add a node n after the node referenced by curr._   
```
public class Node {
  T val;
  Node next;
  Node prev;
  
  public void add(T newVal) {
    n = new Node(newVal, curr.next, curr); //value, next pointer, prev pointer
    curr.next.prev = n; //changing the pointers
    curr.next = n;
  }
}
```
_Now for remove..._
```
public class Node {
  T val;
  Node next;
  Node prev;

  public void remove(T value) {
    curr.next.prev = curr.prev;
    curr.prev.next = curr.next;
  }
}
```

### counting runs
| line   | statement           | run  |
| ------ |:-------------------:| -----:|
| 1 | if(x = 2) |   |
| 2 |   n++; | 1 |
| 3 | else |   |
| 4 |   n--; | 1 |
| 5 | x = 5+4; | 1 |
| 6 | while(time > 10) | n+1 |
| 7 |   time--;  | n |
|   |        | 2n + 4 |
   
_When counting, you want to ignore..._
- multiplicative constants
- behavior at 'small' n

**Known as Big O Notation**
