# Generics and Bag Implementations w/ Arrays
_Reading Notes --- Java Interlude 1 & Chapter 2_

## Interlude 1
_Generics allow a developer to write a "placeholder" rather than an actual class type, within the definition of a class or interface.
 This is particularly useful in cases when dealing with several collections of different data types
 (a collection of Strings, collection of Student objects, etc.).
 In Java, rather than writing a class for each collection, one can utilize this "placeholder."_

### Generic Types Within an Interface
- genertic types create a placeholder instead of class type within the definition of a class/interface
- placeholder: **generic data type**
	- also known as a **generic type** or **type parameter**
- with a generic type: when writing a class which holds various data collections, it's unecessary to give a data type for the objects in these collections
- rather, the developer is defining a **generic class** where the client chooses the data type
```
public interface interfaceName<T> {
  public T getFirst();
  public T getSecond();
  public void changeOrder();
}
```
The above example defines an interface, `Pairable`, that specifices a `Pairable` object - each of which contains two objects of the generic type `T`.  

### Generic Classes
The following is an example of a class which implements this interface, T represents the data type of the two private data fields, constructor, and return type:
```
public class OrderedPair<T> implements Pairable<T> {
  private T first, second;

  public OrderedPair(T firstI, T secondI) {  //constructor
    first = firstI;
    second = secondI;
  }

  public T getFirst() { //returns first object in this pair
    return first;
  }

  //etc., etc.
}
```

Creating an ordered pair with `OrderedPair`:
```
OrderedPair<String> desk = new OrderedPair<String>("brown", "long");
```
The second `<String>` is optional, `OrderedPair<>` is also excepted.  

Now the object `desk`, which contains the pair of objects `brown` and `long`, can be minipulated with the OrderedPair methods.
 For example, `desk.getFirst();` would return an output of "brown."   
Because `desk` expects strings, you cannot assign it a pair of objects that are not strings.
 For example, `desk = new OrderedPair<Integer>(1, 2);` would return an error.   

However, because `OrderedPair` is a generic class, a separate object with an ordered pair of integers can be created -- similar to the example with `desk` above.   

## Chapter 2
_When using an array to implement a bag, it is said to be array based.
The array can either be fixed, meaning the bag could become full.
Or, the array could expand to meet your needs, meaning the bag is never full._

### Using a Fixed Array
Thinking of a 'full' array where an object is removed presents an interesting problem.
 Removing the object at `array[5]` doesn't shift the remaining objects in the array back one.
 Rather, index 5 is now empty.
 If the array has been set up to add new objects at the next index by use of a counter, there will be no aparent open spots even though index 5 is avalible.
 The array will apeare full even though it's not.

---
Carrano, Frank M., and Timothy M. Henry. _Data Structures and Abstractions with Java._ 5th ed. Boston: Pearson Education, Inc., 2018.

---
11/01/2020
