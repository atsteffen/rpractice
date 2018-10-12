# https://www.r-bloggers.com/call-by-reference-in-r/

# Dummy function demonstrating ability to append to multiple collections through a function
duoAppend <-function(key, value, list1, list2) {
  list11 <- list1 # must create new local variable or substitute will not work
  list22 <- list2 # duplicates the memory 
  list11[[key]] <- value
  list22[[key]] <- value
  eval.parent(substitute(list1<-list11))
  eval.parent(substitute(list2<-list22))
}

listA <- {}
listB <- {}
print(listA)
print(listB)

duoAppend("key1", "value1", listA, listB)
print(listA)
print(listB)

duoAppend("key2", "value2", listA, listB)
print(listA)
print(listB)

