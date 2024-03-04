#### list of entrez databases
##entrez_dbs()
## general description of gds database which is GEO database
entrez_db_summary("gds")
## Searchable fields for gds database 
entrez_db_searchable("gds")
### To return the linked databases with gds database
entrez_db_links("gds")
#### searching term 
term<-"(gse[ETYP]) AND (high-throughput sequencing[PTYP]) AND
(Serum[Title/Abstract/SRC/SFIL] OR plasma[Title/Abstract/SRC/SFIL] OR circulat* [Title/Abstract/SRC/SFIL] OR blood[Title/Abstract/SRC/SFIL]) AND (human[Organism]) AND (2000/01/01[PDAT] : 2023/07/19[PDAT])"



api<-"01b5cbc1ccc16bfbd940e9a02ef8ebaf040a"
search <- entrez_search(db="gds", term=term, use_history=TRUE)


iteration<-ceiling(count/500)
c<-0
summary<-list()
for(i in 1:iteration){
  
  summary[[i]]<-entrez_summary(db="gds", web_history=search$web_history, api_key =api, retstart=c, retmax=500)
  c<-c+500

  ####. The number of features that can be extracted
features<-c("uid", "accession", "gds", "title", "summary", "gpl", "gse", "taxon","entrytype","gdstype","ptechtype", "valtype",
            "ssinfo","subsetinfo","pdat","suppfile",     
            "samples", "relations", "extrelations", "n_samples", "seriestitle",  "platformtitle", "platformtaxa","samplestaxa"  
            ,"pubmedids","projects","ftplink","geo2r")  



df.original<-lapply(summary, function(x) extract_from_esummary(x, features))
df.original<-do.call(cbind, df.original)
##head(df[,1:5])
df.original<-t(df.original)
nrow<-nrow(df.original)

##df$samples[1:2]
df.study<-data.frame(seq(1:nrow))
for(i in 1:28)
{
  temp<-unlist(df.original[,i])
  
  if(!is.null(temp)&&length(temp)==nrow)
  { 
  df.study<-cbind(df.study,temp)
  y<-ncol(df.study)
  colnames(df.study)[y]<-colnames(df.original)[i]
  } 
 
}
  
##### 
df.study<-df.study[,-1]
write.csv(df.study, file="df.study.csv")
write.csv(df.original, file="df.original.csv")



  



