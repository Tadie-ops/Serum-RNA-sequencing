load("/Users/u7594296/Library/CloudStorage/OneDrive-AustralianNationalUniversity/Documents/PhD_works/GEO/merged.all_srx_srr.RDA", verbose = T)

meta$purpose<-trimws(meta$purpose)

meta$purpose_cat<-gsub("cancer|Liver cancer|pancriatic cancer|breast cancer|neuroblastoma|lung cancer|Lung adenocarcinoma|colorectal cancer|thyroid cancer|FMR1 mutation|Nasopharyngeal cancer|ovarian cancer|gastric neoplasia|Glioblastoma|Cancer|Gastric Cancer|BRCA1/2 mutation|lynch syndrome", "Cancer", meta$purpose) 

 meta$purpose_cat<-gsub("RNA seq profile of body fluids|RNA seq profile of blood cells and blood products|method evaluation|Method comparison|atlas|Platform comaprison|Health|spaceflight|air pollution|Exercise|astronauts","Healthy",meta$purpose_cat)
 

 meta$purpose_cat<-gsub("Fulminant myocarditis|cardiac|Fulminant myocarditis|fulminant cardiac|artrial fibrillation|myocardial infarction|Cardiovascular disease|CAD|Cardiomyopathy|Acute ischemic stroke|chronic thromboembolic pulmonary hypertension","Cardiac problem",meta$purpose_cat)
 
 meta$purpose_cat<-gsub("aging|Aging","Aging",meta$purpose_cat)
 
 
  meta$purpose_cat<-gsub("lateral sclerosis|Alzheimer|Parkinson|Cerebral disease|ALS|cerebral cavernous|ataxia|scelorosis|PTSD|Epilepsy|depression","Neurological disorders",meta$purpose_cat)

 
  
   meta$purpose_cat<-gsub("liver damage|NFLD","Liver problem",meta$purpose_cat)

   meta$purpose_cat<-gsub("Sepsis|HBV|pneumonia|Tuberculosis","Infectious disease",meta$purpose_cat)

   meta$purpose_cat<-gsub("Ankylosing|sarcoidosis|atopic dermatitis|Ulcerative colitis", "Inflamatory disease", meta$purpose_cat)
 meta$purpose_cat<-gsub("smoking|methamphetamine addicts|acetaminophen overdose", "Addiction",meta$purpose_cat)
   meta$purpose_cat<-gsub("Subarachnoid haemorrahage|mild Traumatic Brain Injury","Brain Injury",meta$purpose_cat)
  meta$purpose_cat<-gsub("Gastric Cancer", "Cancer", meta$purpose_cat)
meta$purpose_cat<-gsub("Alchohol use disorder", "Addiction", meta$purpose_cat)

meta$purpose_cat<-gsub("Covid19", "COVID-19", meta$purpose_cat)
meta$purpose_cat<-gsub("pregnancy", "Pregnancy", meta$purpose_cat)
meta$purpose_cat<-gsub("acromaegaly", "Acromaegaly", meta$purpose_cat)
meta$purpose_cat<-gsub("vitiligo", "Vitiligo", meta$purpose_cat)
meta$purpose_cat<-gsub("diabetic", "Diabetic", meta$purpose_cat)
meta$purpose_cat<-gsub("Healthy", "Healthy population", meta$purpose_cat)
meta$purpose_cat<-gsub("muscular dystrophies", "Muscular dystrophy", meta$purpose_cat)
meta$purpose_cat<-gsub("polycystic ovary syndrome", "Polycystic ovary syndrome", meta$purpose_cat)

length(sort(table(meta$purpose_cat), decreasing = T))

colnames(meta)[c(2,3)]<-c("GSM.1","SRX.1")
