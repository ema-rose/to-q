# short notes 8 jan 2020
## _unit testing and the interface_

### ADTs - abstract data types cont.
- know what you want to implement before you choose a language
- languages typically have certain types of problems they solve well

### interface
- *a list of method signatures*
- or - essentially a list of methods, it does not provide implementation
- it will tell you what the method does, but not how to implement it
- the interface could be implemented by an array list, for example
- _in the context of this course, an interface tells us what the ADT does_

### using an interface
```
public class Circle implements Measurable {
  //must have methods for all promised signatures
}
```
- _allows variable to store any implementing type_
```
public void wrap(Measurable m) {
  //m can be from any class implementing Measurable
  //can only use properties of m in Measurable
}
```

### comparing objects, or ".equals" vs. "=="
- if you are comparing two objects, like Strings, use .equals to compare
- when you compare use == you are asking: are these two strings exactly the same object
- this is different than the Stings containing the same character sequence and case-type
- using == when comparing objects asks: do these two things live in memory at the same location

### the braces are optional!
- for loops and if statements, the braces are optional if it's a one-line statement

### automated testing
- runs through a series of tests to check code
- very useful for complex and large projects, every change can be checked against the rest of the project
- allows you to quickly check if changes have broken the code
- _this relies on thorough test cases_

### unit testing
- testing every important unit (small section) of a software system
- _in this course, we will utilize JUnit_
- @test will mark something as a test case, called an annotation
- test fixture; initial state
- @Before is run to set up to run test methods
- @After cleans up after a test

### testing for this course
- select new junit test case in eclipse
- use JUnit 4
- declare object references as attributes
- create objects in @Before
- write test methods @Test, with assertions
	- as in: `assertEquals(x, y) //fail if x does not equal y`
