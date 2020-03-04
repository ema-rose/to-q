# short notes 4 march 2020
## _radix sort and hashing_

### recall -- bucket sort
- works really well if numbers are between 0-4, not so well if numbers are between 0-10000000
- because this will create a gigantic array

### radix sort
- perform bucket sort one digit at a time
- **do the least significant digit first** 
    
_Ex._
    
|Orig.|
|---|
|42|
|13
|2|
|20|
|21|
|14|
|24|
|30|
    
What columns (or buckets) do the numbers go into? Answer below:
    
|0|1|2|3|4|
|---|---|---|---|---|
|20, 30|21|42, 2|13|14, 24|
   
Taking 42 for example, the most significant digit in 42 is 4, the least significant digit is 2.
 Thus, the number 42 will be sorted into 2. We sort the least significant digit first, moving to the most significant.
    
In the above examples, the most significant digit is in the 10s place.
    
This is then used to generate another list, and the process is repeated:
    
|Orig.|Pass 1|
|---|---|
|42|20|
|13|30|
|2|21|
|20|42|
|21|2|
|14|13|
|24|14|
|30|24|
   
Sort using the above list but not with the next most significant digit:
    
|0|1|2|3|4|
|---|---|---|---|---|
|2|13, 14|20, 21, 24|30|42|
    
This generates our final list (since we only have 2-digit numbers), the final list now sorted.
    
|Orig.|Pass 1|Final Sort|
|---|---|---|
|42|20|2|
|13|30|13|
|2|21|14|
|20|42|20|
|21|2|21|
|14|13|24|
|24|14|30|
|30|24|42|
    
### radix sort in short
![diagram](https://i.ytimg.com/vi/nu4gDuFabIM/maxresdefault.jpg)    
[More Info](https://www.geeksforgeeks.org/radix-sort/)
    
---
    
### what is hashing and why do you care
- because it's on the final
    
- it's very similar to bucket sort
   

### hashing in general
- the hash function is a way of converting a key into a number
- always uses an array
- hash function converts into a number and you use that number to put it in an array
    
_The following two sections are examples of hashing._
    
---
#### closed addressing
    
My application is Set and Map.    
- we're going to store numbers in an array of length 10
- if the val is 6, store it in index 6
- use mod to account for numbers outside your array range
- 96 can also be stored in 6
	- 96%6 == 0?... yep, store it here
    
What happens when you want to store both 6 and 96 in index 6?
- have each cell in the array hold a data type that can contain multiple vals
- like a list, for example
- however... this gives terrible running time... potentially linear
    
The way to avoid this bad running time by using more memory.
- you make the array bigger to support your values, thus, each index holds a smaller list
- you trade running time for memory space
    
**Running time: O(constant + (load/2))**
    
#### open addressing
- my 6 goes in cell 6, 96 is going to collide, what do i do?
	- linear probing: try the next cell
		- you keep going (and potentially wrap around) until you find an empty cell
		- to find a val: you hash through the array looking for it until you find an empty cell (which means there's no more vals)
	- by doing this, you end up with one key per cell, but the key may not necessarily in the correct place
