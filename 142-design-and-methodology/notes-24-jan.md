# short notes 24 jan 2020
## _list implementations_

### midterm next week
- writing test cases
- array-based implementation
- linked list implementation

- know how to write the array-based implementation and the linked list based implementation

### get() method with for loop
```
public T get(int index) {
  if((index < 0) || (index >= size()))
    throw new IndexOutOfBoundsException();

  Node curr = head;
  for(int i=0; i<index; i++)
    curr = curr.next;

  return curr.value;
}
```
The if statement with the thrown exception is necessary in the case that the index is negative
 or the index is asking to look outside the existence of the list.   

### alternate remove() method
- previously, we've looked at the remove method as marching two counters down the list
 along with the current node.
- the alternate method only looks at the previous node

```
public boolean remove(T val) {
  Node prev = head;
  if(head == null)  //what if it's empty
    return false;
  if(head.value.equals(val)) {  //special case, return first value
    head = head.next;
    return true
  }
  while(prev.next != null) {
    if (prev.next.value.equals(val)) {
      prev.next = prev.next.next;
      return true;
    }      
    prev = prev.next;
  }
  return false;
}
```
