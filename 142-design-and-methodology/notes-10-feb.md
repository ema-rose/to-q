# short notes 10 february 2020
## _Recursion_

### recall: recursive methods
- check for the base case
- otherwise, break the problem into smaller instances
- solve by calling the same method then put the results together

---

### recursively find subsets (2^n)
```java
public static int subsets(int n) {
  //base case
  if(n == 0)
    return 1;

  //non base case
  int withoutN = subsets(n-1); //number w/out n
  int includingN = subsets(n-1); //number that includes n

  return 0;
}
```

### recursively find num subsetsSizeK
```java
public static int subsetsSizeK(int n, int k) {
  //returns # of subsets 1 through n (inclusive) of size k
  //assumes k<=0
  
  if((k==n) || (k==0))
    return 1; // if its all or none of them, there's only one

  int withoutN = subsetsSizeK(n-1, k ); // had n numbers, know we're not picking one of them
  int withN = subsetsSizeK(n-1, k-1); //because i need k things, i've already choosen one of them

  return withoutN + withN;
}
```

### process
- find the smallest case and write an if statement
- ask: starting from the largest argument, how do you get a smaller problem

---

### recursion using linked lists
- the main class no longer does all the work, rather, it delegates it to the nodes
- they call each other recursively and do a small amount of work each
