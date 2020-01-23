# short notes 22 jan 2020
## _minipulating linked lists_

### diagram
head --> node 1    
`_` `_` -->  `_` `_`   

### practice _contains() method_
How do you write the contains() method -- takes `T s` and returns if node contains `s`?
```
public boolean contains(T s) {
  //returns if the list contains value s
	
  Node curr = head;
  while(curr != null) {
    if(curr.value.equals(s))
      return ture;
      curr = curr.next;
    }
  return false;
}
```

### what will empty the list?
_concept check_   

`size = 0;`   
No. This isn't an array, thus we don't have a size value.
 It would have to be created.   

`head = null;`   
Yes. If you drop the first element, the list goes away.   

`head.next = null;`   
No. Everything after the first node has been dropped but the first node is there.
 This is the "change size to 1 method."   

```
Node curr - head;
while(curr != null) {
  curr.value = null;
  curr = curr.next;
}
```
No, this empties each node, however, it leaves the nodes behind.
 Thus, the size method will still think there's a list as it counts the nodes and not
 their contents.

### what will remove a value?
_concept check_   

What additional information is needed to successfully remove a node?   
a) Nothing additional   
b) A reference to the prior node   
c) A reference to the following node   
d) Both b) and c)   
   
Answer: b

**Basic idea for this:**   
method remove(T)
- curr: reference to the current node used to find the node to remove
- prev: reference to node preceding it
   
```
public boolean remove(T val) {
  Node curr = head;
  Node prev = null; //there isn't anything in Node before curr
  while(curr != null) {
		
    if(curr.value.equals(val)) {	//if my current node has the thing I want to delete
      //remove curr node
      prev.next = cur.next; //we want the node following our prev to now point to the node following curr
      return true;	
    }
    prev = curr; //these two lines together advance as a pair
    curr = curr.next;
  }
  return false;
}
```
