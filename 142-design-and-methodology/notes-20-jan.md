# short notes 20 jan 2020
## _review on linked lists_

### linked lists  
- there's a sequence of node objects in a line
- each holds one value and points to the next node
- a null pointer indicates the list is over   

The basic structure for this is below:
```
public class MyLinkedList<T> implements List<T> {
  private Node head;
  //optional

  public class Node {
    public T value;
    public Node next;
  }

  public class Node(T value, Node next) {
    this.value = value;
    this.next = next;
   }
}
```
