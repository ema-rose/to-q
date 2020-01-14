# short notes 13 jan 2020
## _test cases and exceptions_

### test cases
_When your test cases fail, one of two things is wrong:
 your code isn't working, or your test cases aren't.
 Don't forget to check your test cases._

### example test case
```
@Before
public void setUp() throws Exception {
  b = new OurBag90;
}

/*
Test case 1.1: verify the size() method is working correctly
*/
@Test
public void testSize() { //this test case is only for size()
  assertEquals(0, b.size()); //call method size() on b, it should return 0
  b.add("Hello"); //add object to the bag
  assertEquals(1, b.size()); //b.size() should return 1, as we've added an object
}

/*
Test case 2.1: verify the array will expand to fit the needed size
*/
@Test
public void testAddLots() {
  for(int i=0; i<10000; i++)
    b.add("item" + i);
  assertEquals(10000, b.size()); //should return 10000 if the bag expands for use
}
```
Each method should have a separate test case;
 allowing you to trace the error to a particular method.

### programming by contract
- class descriptions can be viewed as a contract between the implementer and the user
- if the user meets preconditions, the method will work as advertised

### test-driven development
- write stub code so that it compiles
- test each method, check that it works
- testing for desired functionality
- allows implementation of that functionality

### exceptions
- errors that aren't explained with the method's return value
  - what should the method return
  - what assumptions are made?
    - ex. if using a remove() function, assumes the bag isn't empty
    - implies the bag doesn't contain null   
   
The **try-catch** exception is helpful for this.   
Another useful tool is the `fail();` test case.
 This, when used in a test case, tells the program that if everything above this point executes,
 fail here.
 _Useful for testing behavior that shouldn't be possible._

### how to generate test cases
- generate a list of tasks the program should perform
- and/or ways in which it should function
- then generate a test case for each of these assertions
  - think of the reverse test case, if needed
- if the assertions require a parameter, what happens if the parameter doesn't work
