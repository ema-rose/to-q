# Generics and Bag Implementations w/ Arrays
_Reading Notes --- Java Interlude 1 & Chapter 2_
##### Contents
- Generic Types and Classes
- Fixed Arrays and Core Methods
- Security and Safe Programming
- Testing

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

### Core Methods
Identify the **core methods** to both implement and test before continuing to define the class.
 These methods, also called a **core group** should be central to the purpose of the class.
 Some examples of core methods include:
- addToArray()  -->  public boolean add(T newEntry)
- newArray()  -->  public T[] createArray()
- isArrayFull()  -->  private boolean isArrayFull()
- contructors
This core allows for the construction of a bag, adding objects, and viewing results.
 Remove isn't included as it can't be tested until add is functional.   

Potential **data fields** for this class:
```
private final T[] bag;
private int numberOfEntries;
private static final int DEFAULT_CAPACITY = 25;
```
Here, bag is declared as a final data type to prevent malicious damage.
 By declaring it final, a user is unable to access the bag except outside of methods particular to bag.

### The Constructor
The use of a generic type impacts how the constructor is implemented.
 You cannot use a generic data type when allocating an array, so `bag = new T[capacity];` is incorrect.
 Instead, an array must be allocated using type Object.
 However, since the class is set up to accept a data type of `T`, the program is looking for an array of type T: `T[]`.
 Thus, allocating the array with `Object[]` would return an incompatible error.
 A cast is necessary to resolve this issue, but presents it's own problem.
 When compiled, this presents an unchecked cast warning -- the compiler wants to ensure that casting each entry in the array is safe.
 Since the array is comprised of all null values, it is safe.
 Thus, `@SuppressWarnings("unckecked")` can be used before the statement to prevent the warning:
```
@SupressWarnings("unchecked")
T[] tempBag = (T[])new Object[capacity];
bag = tempBag;
```

### toArray()
```
public T[] toArray() {
  @SupressWarnings("unchecked")
  T[] result = (T[])new Object[numberOfEntries];
  for(int i=0; i<numberOfEntries; i++) {
    result[index] = bag[index];
  } 
  return result;
}
```
The reason to return a new array to the user, rather than the already made bag array, primairily has to do with security.
 If the private bag array is returned to the user it provides an oportunity to minipulate the private variable directly.
 Something that should be avoided.
 Thus, a new array is returned to the user.   

***Do not return a reference to a private data field, instead return a copy***

### Safe Programming
One can practice **fail-safe programming** by including checks for anticipated errors within the program.
 **Safe and secure programming** extends this concept by validating any input data and arguments to a method, eliminating a method's side effects, and making no assumptions of the actions of clients and users.   

Security is especially important as the risk of hackers and unauthorized intrusions grow.
 Mistakes and oversights make code vulnerable to attack.   

In ADTs specifically, weak points include:
- when a constructor does not execute compleatly, leaving a partially constructed object
- when a user tries to create a bag that exceeds the given limit

### Addressing Security in ADTs
```
private boolean integrityOK;
private static final int MAX_CAPACITY = 10000;
```
Add the two above variables can help address these security risks, both of which involve the constructor.   

To ensure that the client cannot create a bag that is too large, the bag's desired capacity should be checked against `MAX_CAPACITY`.
 If the test doesn't pass, the constructor can throw an exception.   
To prevent a hacker from using a partially initilized object, each vital method of the class can check
 the status of the field `integrityOK` before it preforms its operation.
 This way, the method's action can be disabled for malformed objects.
 For correctly formed objects, the constructor would set the integrity check to true (after initializing it).   

An example of such a constructor:
```
public ArrayBag(int desiredCapacity) {
  integrityOK = false;
  if(desiredCapacity <= MAX_CAPACITY) {
    //create temp bag as seen above
    numberOfEntries = 0;
    integrityOK = true;
    //a malformed object would cause the code to break before here
  }
}
```
Following this, any methods that minipulate or retrieve the data should check the integrity check before executing.
 Such a condition would look similar to the following:
```
if(integrityOK) {
  //method task here
}
else {
  throw new SecurityException("ArrayBag object is corrupt.");
}
```
To prevent repitition, define the integrity check in a separate method and call it from any method elsewhere in the class.
 `private void` should be used in the method definition.

### General Security
- declare most, if not all, data fields of a class as private
- public data fields should be static and final and have constant values
- avoid choosing clever logic over safety
- avoid duplicate code, instead encapsulate into a method and use method calls
- when a constructor calls a method, ensure that the method cannot be overridden

In the use of ArrayBag:
- ArrrayBag is declared as a final class, meaning it cannot be extended as a superclass or base class
- as such, a programer cannot use inheritance to modify its behavior, making it more secure   

### Testing
Testing while in the process of programming usually involves an incomplete definition of the methods being temporarily ignored.
 Such a definition is called **stub**.
 One way of completing a stub is to return a dummy value, in order to pass the syntax checker when the program is compiled.
 Tag these dummy values with a `//STUB` comment.   
When the method returns a void, simply comment `//STUB` in the body.   

_When called, Stubs should report that they were invoked by displaying a message._   

When testing, one should always include tests outside of the legal range of the parameter.

---
##### Carrano, Frank M., and Timothy M. Henry. _Data Structures and Abstractions with Java._ 5th ed. Boston: Pearson Education, Inc., 2018.
_11/01/2020_
