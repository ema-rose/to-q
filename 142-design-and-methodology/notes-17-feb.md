# short notes 17 february 2020
## _recursion and sorting_

### recurrence relations
- T(n) = time to run countdown on n numbers
- T(n) = 1 + T(n-1)
	- 1 is the constant time to print n
	- n-1 is by definition, the time for the recursive call
- T(1) = 1
     
_an example in fibanoacci numbers..._
```
F0 = 0
F1 = 1
Fn = Fn-1 + Fn-2 for n > 1
```

This can be rendered as a recursive function:   
```java
public int fib(int n) {
  if(n <= 1)
    return n;
  return fib(n-1) + fib(n-2);
}
```    
_However, this should never be computed this way.
 Done this way, it will technically work but will compute the same thing over and over again,
 leading to a huge run time._

### sorting
- where you have a collection of objects (numbers, strings, etc.) and want to put them into a defined order   
     
**Types of sorts:**    
- Selection sort
	- Grow sorted part of the array by finding the smallest value in the remaining
- Insertion sort
	- Grow sorted part of the array by inserting new values into the proper place
- Bubble sort
	- Repeatedly find out-of-order pairs and swap them

### selection sort
- grow sorted part of the array by finding the smallest value in the remaining    
**code from Wikipedia**   
```java
for(int i=0; i < A.length-1; i++) {
  int minIndex = i; //index of min
  for(int j=i+1; j < A.length; j++) { //find the min
    if(A[j] < A[minIndex])
      minIndex = j;
  }
  swap A[i] and A[minIndex];
} 
``` 

### insertion sort
- Keep sorted portion of the array and grow it by inserting new values into the proper place
**code from Wikipedia**
```java
for(int i=0; i< A.length; i++) { //add value A[i]
  int j = i; //iterator to seek possible places
  while((j > 0) && (A[j-1] > A[j])) {
    swap A[j] and A[j-1];
    j--;
  }
}
```

### bubble sort
- Repeatedly find out-of-order pairs and swap them
**code from Wikipedia**
```java
boolean swapped = true;
  while(swapped) {
  swapped = false;
  for(int i=0; i < A.length-1; i++)
    if(A[i] > A[i+1]) {
    swap A[i] and A[i+1];
    swapped = true;
  }
}
```
