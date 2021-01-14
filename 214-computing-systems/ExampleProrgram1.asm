#branches say wheb you're DONE with the loop, so typically, you reverse from reg code

#readin value of size
addi $v0, $zero, 5 #syscall 5 reads in a value
syscall #the reading syscall reads into v0
addi $s1, $v0, 0 #s1 is size, read it in from prior call

addi $s0, $zero, 2  #s0 is 2

addi $t0, $zero, 0 #t0 is i

while_i: #outer while loop
bge $t0, $s1, exit #check i less than size by saying: if i greater than size, exit loop
addi $t1, $zero, 0 #t1 is j

while_j: #inner while j loop -- we loop back up here to test the condition's still true
addi $t2, $t0, 1 #storeing i+1 for the next line
bge $t1, $t2, printNL #check that j<i+1 else branch to printNL

#if statement
add $t2, $t0, $t1 #WHY are we adding these?
addi $s3, $zero, 2 #storing 2 in register
rem $t2, $t2, $s3 #t2 stores the remainder

bne $t2, $zero, else #brnach not equall
#print period
addi $a0, $zero, 46 #the a register stores chars, we use the ascii for period to store the symbol at a
addi $v0, $zero, 11 #we're going to use this to make the print syscall
syscall #going to use the system call that prints a char (syscall 11)

b inc_j

else: #print asterick
addi $a0, $zero, 42 #the a register stores chars, we use the ascii for period to store the symbol at a
addi $v0, $zero, 11 #we're going to use this to make the print syscall
syscall #going to use the system call that prints a char (syscall 11)

inc_j: #bottom of j loop, inc j by 1
addi $t1, $t1, 1
b while_j #now we want to loop back to the inner j loop

printNL: #below the j loop, we're not moving to the next line
addi $a0, $zero, 10 #the a register stores chars, we use the ascii for newline to store the symbol at a
addi $v0, $zero, 11 #we're going to use this to make the print syscall
syscall 

addi $t0, $t0, 1 #i++
b while_i #go back to begining of the loop

exit: #exit
addi $v0, $zero, 10
syscall
