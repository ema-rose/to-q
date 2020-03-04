# short notes 2 march 2020
## _more on priority queues and sorting_

### _concept check_
Considering each of the following, what is the running times of enqueue and dequeue respectively?
|||
|---|----------|   
|A. | O(1) and O(log n) |
|B. | O(1) and O(n) |
|C. | O(n) and O(1) |
|D. | O(n) and O(n) |
|E. | None of the above |
    
- a priority queue is implemented using an **unsorted** linked list    
ANSWER: **B. O(1) and O(n)**    
Because the list isn't sorted, so enqueue can add at the front.
 As for dequeue, since the list isn't sorted you have to traverse the list.
    
- a priority queue with a **sorted** linked list is implemented    
ANSWER: **C. O(n) and O(1)**    
Because the list is sorted, enqueue must traverse the list.
 As for dequeue, the priority node should already be sorted.

### heaps
- data structure specifically for priority queues
- displayed as a complete binary tree (two
 children for every node except possibly nodes
 on the right of the bottom level)
    
- each parent is <= either child (by Comparator)
- missing nodes must all be on the bottom right
- the parent node must be less than or equal to the child nodes

### efficient representation of a heap
- vals stored in an array indexed from 1
- root stored at 1 (not how most programming langs do arrays)
- navigate the tree via index arithmetic (which is why we need to start at index 1)
	- left child of val in index i: index 2i
	- right child of val in index i: index 2i+1
	- parent of val in index i: index i/2
    
![heap rules explained](https://i.ytimg.com/vi/W81Qzuz4qH0/maxresdefault.jpg)
    
Because of this, we no longer need a node class, we can just have an array.
    
### upheap
```java
void upheap(int i) {
    //i is index that may need to move up
    while((i > 1) && (A[i/2] > A[i])) {
        swap A[i] and A[i/2]
        i = i / 2;
    }
}
```
- this takes O(log n) because you're decreasing your serach area by 1/2 each time

### downheap
```java
void downheap(int i) {
    while(2*i <= size) {
        int j = 2*i; //smaller child’s index (val to replace A[i])
        if((j < size) && (A[j] > A[j+1]))
            j++;
        if(A[i] <= A[j])
            break;
        swap A[i] and A[j]
        i = j;
    }
}
```
- this takes O(log n) because you're starting at the top of the tree and each time you go down you cut
 your search area by half.

### implementing heap sort
- can turn array into heap by running downheap, starting at end
	- i.e. "heapify" the array
- as vals are removed from the heap it shrinks
 and frees up space in the array
- running time of O(n log n)
    
[How To Heapify an Array](https://www.codespeedy.com/building-heap-from-an-array-in-java/)    
_this will be on the exam_
    

### bucket sort
- use an array to store the num of elements that have each val
- count of val x goes into cell x
- traverse the array, print num of copies of each val
    
Ex.    
Elements: 012212001    
    
|Index:   |0|1|2|
|---|---|---|
|Array:   |3|3|3|
    
The array stores a representation of the num of vals that were given.
 So the index of 0 in the array holds the val 3 to represent the 3 0's that were given.
 Likewise, index 1 and 2 also hold vals of 3.
    
Ex. 2
Elements: 01112002111
    
|Index:   |0|1|2|
|---|---|---|
|Array:   |3|6|2|
