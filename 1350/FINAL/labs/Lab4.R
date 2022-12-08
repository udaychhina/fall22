##Shanti stein-Gagnon
##A01229344, set B
##Jan 25th, 2022
#lab 4: MATH 1350



#the birthday problem

max.people <- 730

n.people <- 3 #starting number, will increase if failed

for(n in 1:max.people){
  true.births <- 0#if 3 same birthdays, count
  for(num in 1:10000){ 
  count.births <- c() #keeps track of all birthdays
  for(i in 1:n.people){
    count.births[i] <- sample(365, 1)
  }
  largest_occur <- max(table(count.births))
  if(3 <= largest_occur){
    true.births <- true.births+1 
  }}
  percent.births <- (true.births/10000)*100
  print(paste("people count:", n.people," percent:", percent.births, "%"))
  if(percent.births >= 50){
    break
  }
  else{
    n.people <- n.people+1 #increase if the percent is <50
  }
  
}
