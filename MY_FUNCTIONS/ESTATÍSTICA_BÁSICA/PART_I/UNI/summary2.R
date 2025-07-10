summary2 <- function(x,limtrim=c(.01,.99), pop=FALSE, na.rm=TRUE, ...){
  
  #ARGUMENTOS
  # x: Vetor com os dados
  # limtrim: vetor com os limites para a média truncada
  # pop: valor lógico: TRUE determina 'n' e FALSE, 'n-1' (para a variância)
  # na.rm: valor lógico: TRUE remove os outliers e FALSE, mantém
  
  pop=TRUE 
  na.rm=TRUE
  newsumm<-matrix(NA,nrow=dim(as.matrix(x))[2],ncol=11)
  x<-as.matrix(x)
  newsumm[,1]<-apply(x,2,function(...){return(dim(x)[1])})
  newsumm[,2:7]<-t(apply(as.data.frame(x),2,summary))
  newsumm[,8]<-apply(x,2,function(...){mean(x[x>quantile(x,probs=0.01) & 
                                                x<quantile(x,probs=0.99)])})
  if (pop==TRUE & na.rm==TRUE){ # calcula var_n desconsiderando os missings
    n<-sum(!is.na(x))
    newsumm[,9]<-var(x,na.rm=na.rm)*(n-1)/n
  }
  else
  {
    if(pop==TRUE & na.rm==FALSE ){
      n<-length(x)
      newsumm[,9]<-var(x)*(n-1)/n
    }
    else {
      if(pop==FALSE & na.rm==TRUE){
        n<-sum(!is.na(x))
        newsumm[,9]<-var(x,na.rm=TRUE)
      }
      else
      {
        n<-length(x)
        newsumm[,9]<-var(x)
      }
    }
  }
  newsumm[,1]<-n
  newsumm[,10]<-sqrt(newsumm[,9])
  newsumm[,11]<-sqrt(newsumm[,10]/newsumm[,1])
  colnames(newsumm)<-c("N", "Min.","1st Qu.","Median","Mean","3rd Qu.","Max.","Tr Mean","Var","StDev","SE Mean")
  return(t(newsumm))
}