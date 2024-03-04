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

  
features<-c("uid", "accession", "gds", "title", "summary", "gpl", "gse", "taxon","entrytype","gdstype","ptechtype", "valtype",
            "ssinfo","subsetinfo","pdat","suppfile",     
            "samples", "relations", "extrelations", "n_samples", "seriestitle",  "platformtitle", "platformtaxa","samplestaxa"  
            ,"pubmedids","projects","ftplink","geo2r")  

####. The number of features that can be extracted

features



  



