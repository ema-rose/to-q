# short notes 7 february 2020
## _StringBuilder objects & Recursion_

### traversing a list
**Array-Based**
```java
for(int i=0; i<num; i++) {
  operation on vals[i]
}
```

**Linked List**
```java
Node curr = head;
while(curr != null) {
  //operation
  curr = curr.next;
}
```

### iterator ADT
"my finger, and then stuff I'd like to do while traversing the iterator" - DB   
   
- boolean hasNext()
- T next()  //returns and advances
- void remove()  //optional, removes most recent
   
**ListIterator: hasPrevious, previous, nextIndex, previousIndex, add(T), set(T)**    
```java
List<T> stuff = ...; // or other Collection
  Iterator<T> it = stuff.iterator();
  while(it.hasNext()) {
  T val = it.next();
  //do something with val
}
```

### for each loop
- for each of these in the loop, do this   
- creates an iterator on your thing
```java
for(String s stuff) {
  //insert stuff here
}
```

### Recall: String
- a string is a sequence of chars, indexed
- immutable, you can return a new string, but you can't change this one
- common ops:
	- equals()
	- length()
	- +
	- sustring(), substring()
	- charAt()
	- indexOf()

### java.util.StringBuilder
- designed for operations that change a String
- a 'better' way of operating on Strings
- do modify the string, don't always make a copy
- "ArrayList for chars"
- sequence of chars w/ extra space so that it can grow as needed     
   
Common ops:
- length()
- append()
- substring()
- charAt()
- indexOf()
- insert()
- replace()
- toString()

---

## _Recursion_
### the basics...
"you will not understand it this week or even this term, but... the beatings will continue until morale improves" - DB (though self-admittedly not his joke)   
**Recursion is a method that calls itself**   
   
- check for base case
- otherwise, break the problem into 1 or more smaller problem instances
	- solved by calling the same method and using the results to solve the original problem
   
Example:
```java
public static void countDown(int n) {
  //prints numbers from n down to 1
  System.out.println(n);
  if(n > 1)
    countDown(n-1);
}
```
