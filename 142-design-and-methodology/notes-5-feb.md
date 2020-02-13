# short notes 5 february 2020
## _queue implementation_

### recall - queue implementation
- array with front element of queue at index 0
- attribute rear is index of first unoccupied cell   
   
-or-   
   
- array with rear element of queue at index 0
- attribute front is index of the first unoccupied cell after the queue    

### shifting elements to the right on enqueue()
```java
public void engueue(E element) {
  //potential issue if full, for now, assume there's room
  for(int i=front; i>0; i--) {
    array[i-1] = array[i];
  }
  array[0] = element;
  front++;
}
```
Summary:   
- queue ADT
	- enqueue adds an element at the back
	- dequeue removed from the front
- array-based queue implements
	- put the front in cell 0: bad for dequeue
	- put the back in cell 0: bad for enqueue

### implement dequeue() in a circular array
```java
public E dequeue() {
  //assume not empty
  size--;
  E e = array[front];
  front++; //add to front so that we no longer see the prior front value
  if(front == array.length)
    front = 0; //because it's a circular array: if we walk off the end, go back to the begining
  return e;
}
```

### implement enqueue() in a circular array
```java
public void enqueue(E e) {
  //assume not full
  rear++;
  if(rear == array.length)
    rear = 0;
  array[rear] = e; 
  size++;
}
```

### which are not legal values for front and rear?
Suppose we have a Queue implemented with a circular array.
 The capacity is 10 and the size is 5.
 Which are not legal values for front and rear?

| | front | rear |
|---|---|---|
|A|0|4|
|B|5|9|
|C|7|2|
|D|9|3|
     
**The correct answer is C**

### array-based queue
- possible using a circular array
- need to wrap indices
	- modular arithmic:
	- increment: i = (i+1) % vals.length;
	- decrement: i = (i-1 + vals.length) % vals.length;   
- easier with linked lists b/c local changes are possible   

### queue running times
||enqueue|dequeue|
|---|---|---|
|circular array|linear (con. am)|constant|
|linked list (enqueue to last)|linear|constant|
   
||enqueue|dequeue|
|---|---|---|
|circular array|linear (con. am)|constant|
|linked list w/ tail pointer (enqueue to last)|constant|constant|
