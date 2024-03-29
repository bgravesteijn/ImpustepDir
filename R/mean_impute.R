mean_impute <-
function(data=NULL){
  for(i in 1:ncol(data)){
    if(sum(is.na(data[,i]))!=0){
      if(class(data[,i])=="factor"){
        mode_val <- names(which(table(data[,i])==max(table(data[,i]))))
        meani[,i][is.na(data[,i])] <- mode_val
      }else{
        mean_val <- median(data[,i], na.rm=TRUE)
        data[,i][is.na(data[,i])] <- mean_val
      }
    }
  }
  return(data)
}
