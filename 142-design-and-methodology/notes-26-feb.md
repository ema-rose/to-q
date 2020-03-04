# short notes 26 february 2020
## _traversing trees and recursion_

### dictionary/map ADT
Map<K,V> //key type K, value type V
- V put(K,V)
- V remove(K)
- V get(K)
- boolean contains(K)
- Set<K> keySet()
- Collection<V> values()
- boolean isEmpty()
- int size()
- void clear()

### tree traversals
```java
void traverse(Node n) {
    if(n == null) return;
    //preorder: print here
    traverse(n.left);
    //inorder: print here
    traverse(n.right);
    //postorder: print here
}
```

#### understanding preorder, inorder, and postorder
![comparison of all orders](https://computersciencewiki.org/images/7/7c/Binary_tree_traversal.png)
    
**how to traverse:**
|Type|1||2||3|
|---------------|---|---|---|---|---|
|Preorder|root|->|left|->|right|
|Inorder|left|->|root|->|right|
|Postorder|left|->|right|->|root|

### level order traversal (alternate)
- Visits the nodes one level at a time
	- i.e. the root, its children, its grandchildren...
- go down the tree from top to bottom
- implemented using a queue

 
### priority queue
- store collection of values and read them out in priority order (as given by a Comparator)
- we're storing stuff and we want to pull it out in order of value
    
_operations..._
- void enqueue(value) //add value to collection
- value dequeue() //remove & return next val
- value peek() //return next val w/o removing
- int size() //get collection size
    
---
    
_look into Huffman encoding?_
[optional further reading](https://www.geeksforgeeks.org/huffman-coding-greedy-algo-3/)
