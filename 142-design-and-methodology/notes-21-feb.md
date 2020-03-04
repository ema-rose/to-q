### short notes 21 february 2020
## _binary search, personal toString, and personal .equals_

### recall: quicksort
- O(n log n) is the best running time you can get with a comparison
- quicksort has such a run time on average and best case
- however, it has a run time of O(n^2) for worst-case

### what does it mean to 'compare' something?
- Comparable<T> interface
	- int compareTo(T other)
	- negative: this < other
	- positive: this > other
	- zero: this == other
- Comparator<T> interface
	- int compare(T o1, T o2)
	- similar to the above method, with o1 taking role of “this”

### inheritance (extends)
- implementing is for an interface, which means there's no code in the interface
- extends is for a class/method -- there is code in there
- a superclass variable can refer to a subclass object
     
- extends: makes the class a subtype of another
	- terminology: subclass and superclass
	- a subclass has all attributes and methods of the superclass
		- however, a subclass can override methods it wants to change
	- references to subclass can be stored in superclass-typed variables
    
### private, public, protected
- access control
	- public: anyone can access it
	- private: can only access from within the class
	- protected: accessible from within class or a subclass
    
**As a general rule, be as restrictive as possible**

### toString method
- the toString method is inherited from Object
	- called when an object is printed
	- comes with default implementation, but can be overridden by something more useful
     
- this is the same thing as the .equals method
- the Object class defines .equals just as it defines toString
- this means that like toString, you can write your own .equals to override the default
    
Ex.
```java
public class Pair { //represents a pair of ints
    private int x; private int y;
    ...
    public boolean equals(Object o) {
    if(o instanceof Pair) {
        Pair p = (Pair) o;
        return (x == p.x) && (y == p.y);
    }
    return false;
    }
}
```

### binary search
- represents an unordered set of values
```java
int rank(E key) { //returns where key goes in keys
    int lo = 0; //lowest index that could have key
    int hi = size-1; //highest index that could have key
    while(lo <= hi) {
        int mid = lo + (hi – lo) / 2;
        int cmp = key.compareTo(keys[mid]);
        if(cmp < 0) hi = mid – 1;
        else if(cmp > 0) lo = mid + 1;
        else return mid;
    }
    return lo;
}
```
**Running Time: O(log n)**
