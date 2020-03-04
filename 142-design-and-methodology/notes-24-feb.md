# short notes 24 february 2020
## _trees and binary search trees (BSTs)_

### previous Set implementations --  _summary_
- Array w/ vals in arbitrary order, but no duplicates
	- O(n) add, O(n) contains
- Array with values in sorted order
	- Allows binary search, but slow insertion
- Linked list
	- Can more easily add in the middle, but contains is slow

### some tree terminology
- the **depth** of a node is the number of edges between it and the tree’s root
- the **height** of a tree is the maximum number of edges from the root to a leaf
- A tree is **balanced** if its height is O(log n)

### binary search trees
- tree with key stored at each node
	- every node has 2 children (l and r)
		- children can be null (nodes have 0, 1, and 2 actual children)
	- All keys in a node’s right subtree are greater than its key and all in the left subtree are less
    
![the anatomy of a search tree](https://www.chercher.tech/java-data-structures/images/trees-java-data-structures.png)
[example of a simple binary search tree](https://inginious.info.ucl.ac.be/course/LSINF1252/BST)

### implementing a bst
```java
public class BST<E extends Comparable<E>> {
    Node root;

    private class Node {
        Node left;
        Node right;
        E key;
    }
}
```

### contains() in a bst
```java
boolean contains(E key) {
    Node curr = root;
    while(curr != null) {
        int cmp = key.compareTo(curr.key) ;
        if(cmp < 0) curr = curr.left;
        else if(cmp > 0) curr = curr.right;
        else return true;
    }
    return false;
}
```

### recursevely
```java
boolean contains(E key) {
    return contains_helper(root, key);
    }

boolean contains_helper(Node curr, E key) {
    if(curr == null) return false;
    int cmp = key.compareTo(curr.key) ;
    if(cmp < 0) return contains_helper(curr.left, key);
    else if(cmp > 0) returns contains_helper(curr.right, key);
    else return true;
}
```

### implementing add()
theory behind it...
- follow contains until curr is about to become a null reference
	- in other words, until you're about to fall "off"
- then, replace that null with the new node
    
The best possible running time for add in a bst is **O(tree height)**

### implementing remove()
_Steps for remove() in a bst..._
1. find the node with the key to remove
2. case 1: this node has 0 or 1 non-null children
	1. remove the node and replace it with child or null 
	- it takes O(1) to move a subtree whose parent is removed
3. case 2: this node has 2 non-null children
	1. replace the key with its **in-order successor** (i.e. the next key in sorted order)
	2. remove the successor
    
**The best running time for remove() in a balenced bst is O(log n)**

### advancing a node reference to the next key
1. case 1: Node has right subtree
	1. go one step right and then left as far as possible
2. case 2: right subtree is null
	1. go up tree until reaching a node whose left child is the ancestor of your starting place
	2. this requires parent references in the Node
	3. if you try to go up from the root, there is no next key
