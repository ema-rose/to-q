# short notes 14 febuary 2020
## _more recusion_

(methods written in class)
---

### implementing contains() for a linked list
for an EmptyNode:   
```java
public boolean contains(T val) {
    return false;
}
```
   
for a NonEmptyNode:    
```java
public boolean contains(T val) {
    if(this.value.equals(val)) //checking if this node has the value, 'this' is optional
        return true;
    return next.contains(val); //if not, checking the rest of the list
}
```
    
Another implementation of this for a NonEmpty Node:
```java
public boolean contains(T val) {
    return value.equals(val) || next.contains(val);
}
```
    
_To access the above implementations, call the method on the list in an outside class
 written for user interaction._
    
### implementing get() for a linked list
EmptyNode:   
```java
public T get(int index) {
    throw new IndexOutOfBoundsException(); //there's no value to ask for, so just throw an error
}
```
    
NonEmptyNode:
```java
public T get(int index) {
    if(index == 0) //this is the current value, if we've subtracted down to 0 we're at the correct index
        return this.value; //again, 'this' is optional b/c we don't have a local variable
    return next.get(index-1); //not correct value, subtract 1 b/c we've check one and recurse
}
```
    
### implementing indexOf() for a linked list
EmptyNode:
```java
public int indexOf(T val) {
    return -1;
}
```
    
NonEmptyNode:
```java
public int indexOf(T val) {
    if(this.value.equals(val)) //if this is the correct val, return this
        return 0;
    if(next.indexOf(val) == -1)
        return -1;
    return next.indexOf(val)+1; //else, go to the next index and add 1 to keep tack
}
```
