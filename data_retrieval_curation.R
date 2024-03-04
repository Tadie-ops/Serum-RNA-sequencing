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



