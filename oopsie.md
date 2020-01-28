# oopsie
## a collection of common errors and mistakes
_The purpose of this document is to provide a starting point for addressing issues by providing general stratigies one may utilize to solve them._

### doing too much
it may be that the statement is trying to do too much. hard coding in more than one constraint, or multiple constraints, increases the pobability that there will be an exception
_try separating out each constraint into separate statements_
this way, anything that may be falling through the cracks because it doesn't meet _every_ constraint will still be accounted for

### out of bounds exception
have you clearly defined where the beging and end of what you're testing is?
in the case of an array, this is most likely looking for an object that isn't within the scope of the array: either before index 0 or after the last object in the array
_try isolating each possible type of 'problem' the program may be looking at_

### are you over-extending?
for example, if you're looping through an array, are you asking the program to looks past where you have values
are you asking an unecessary task?
if there's no values past a certain index, it doesn't need to loop past then

### null pointer exception
you are asking a null value to do something
it doesn't exist, it can't do anything

---
28/01/2020
