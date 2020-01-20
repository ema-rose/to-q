# short notes 17 jan 2020
## _review! & lists and links_

### reviewing lab 2
- an interface in a sentence: An interface is used to specify operations but not implementation.
- try-catch in testing:
```
public void test() {
  try {
    queue.nextJob(); //should throw an error since queue is empty
    fail(); //fail is the previous line executes
  }
  catch(NoSuchElementException e) {
    //do nothing
  }
}
```

### review question
_concept check_   
Which of the following correctly implements clear (i.e. empties the list)?
- we have a string array vals
- num is the number of strings that have been added to the bag

```
i. vals.clear();
ii. vals = new String[3];
iii. num = 0;
iv. for(i=0; i<vals.length; i++)
	vals[i] = null;
```
Answer:
i. there are no methods on array's, so this won't work   
ii. we aren't clearing num, so adding to the new array would throw an error   
iii. yes - in the perspective of the bag, the array is cleared (though you are taking up memory)   
iv. would work except i isn't declared as an int, will throw a syntax error   
	(in addition, iv doesn't clear num like ii)

### incorporating **generics**
- `T` is a **type variable** and thus, can be used to indicate a generic type of the Bag contents
- rather than signify that methods are taking a specific type of object, using `<T>` essentially says:
 of type whatever
- allows for more versatile code
	- an intelligent design choice as it saves time and effort
	- reduces the amount of 'copy code'     
***QUESTION: can a condition be set within a generic method that will execute a statement only if T is of type String?
 Or will this throw an error because T is not yet known?***   
_Remember:_ creating a generic array requires an @SuppressWarnings() -
 and toArray must return `Object[]`   
Bug in Java?

---

### list ADT
- like a bag, but values are ordered
- will expand to fit as many values as needed
	- in some ways more useful than arrays
- size, clear, and remove(T) remain the same 
- lists are meant to be in order
	- thus, an item can't just be deleted by replacing the last value
	- the value must be removed by shifting every other following value over one   
_Lists must be in order according to the order in which they were added._

### throw
_concept check_
- when you use `throw` you're making an object
- thus, `throw new exception` is the correct implementation

### LinkedList
- each node is an object
- a linked list is an object with a head, that points to following values
- the head points to the first node
- then each object is stored in separate nodes, pointing at the next node
- an empty pointer indicates the end of the list
