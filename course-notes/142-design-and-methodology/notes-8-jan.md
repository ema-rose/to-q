# short notes 8 jan 2020
## reviewing java concepts and introducing ADTs

### declare vs. initialize
when a variable is declared, you are reserving a space in memory
'int[] = nums;'
initializing assigns a value to that place holder
'nums = new int[10];'

### method returns
'public Dwelling getResident(Person p);'
when the method 'getResident' is called, it will take a type 'Person' called 'p' as an argument
then use it to return a 'Dwelling'

### .length or .length() _concept check_
.length() is called on a method
'nums.length' //where nums is an int[], is correct

### return(x >= 5); _concept check_
both >= <= == != and && || statements return booleans
thus, the following statement correctly checks for numbers between 5 and 10 and returns true, if true
'return ((x >= 5)&&(x <= 10));' 
this is also correct:
'return !((x < 5) || (x > 10));'

### abstract data types (ADTs) _NEEDS WORK_
a set of operations that are supported on a particular kind of data
	ex. Bag is an ADT - it stores an unordered collection of objects
	    (supports operations to add objects, remove, count, etc.)
language independent
can have different implementations that optimize different operations

*set of operations == what the bag can do*
an example of an operation within the ADT would be a size operation that returns the number of values in the bag
the ADT is a collection of these operations


