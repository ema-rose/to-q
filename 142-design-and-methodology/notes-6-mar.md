# short notes 6 march 2020
## _practice hashing and linear probing_

### concept check
Which cell would be examined first when adding 12 to
 the following hash table?
    
|||||||||
|---|---|---|---|---|---|---|---|
|0|1|2|3|4|5|6|7|
    
a) 0    
b) 2    
c) 4    
d) 6    
e) none of the above    
    
**ANSWER: c) 4**    
Because it's 12%8 (you have a length of 8), which gives you a remainder of 4.
   
If the table were size 16, you would use cell 12 because there is no remainder.
     
### linear probing
- dumping all the values in one cell, if the cell is full, it
 linear probes to the next available cell, eventually wrapping around
- searching takes a long time (especially the bigger the clump)
	- you jump in to search, then have to continue looking
	- sorted but not really
    
**Running times:**    
- a successful search: approx. 1/2(1+(1/1-load))
	- load = keys/cells
	- as the load approaches one, the time explodes
	- so long as your load as small, running time will be fine
- an unsuccessful search: 1/2(1+(1/(1-load)^2))

### quadratic probing
- try the cell you're going to go to, then +1, then +4, +9
	- linear probing with x^2
- helps and doesn't help
	- doesn't look like a clump since they're not next to each other
	- but if everything hashes to the same place, you're still screwed
	- but it does help if you have two values that hash to different cells
	- they might collide initially, but eventually, they'll spread out

### double hashing
- you're going to try something indicated by the hash function, if occupied...
- you have a second hash function and you increment by that hash function
- two values may have the same first hash value, but more likely than not their second
 hash function value will be different.
    
- fist hash: h(x) = x
- second hash: g(x) = 3+x
- then you mod this and put it into the hash
    
---
    
_The ideal property for a hash function is that they spread things out._
