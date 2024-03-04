######### Condition bar graph
na<-names(sort(table(meta$purpose_cat), decreasing=T))
freq<-c()
for(i in na){
  temp<-meta[meta$purpose_cat==i,]
 freq<- c(freq,length(unique(temp$accession)))
}
names(freq)<-na
condition<-meta%>%group_by(purpose_cat)%>%summarise(Freq=n())%>%mutate(purpose_cat=dplyr::recode(purpose_cat, 'Healthy population' = "Method comparison"))%>%arrange(desc(Freq))%>%mutate(nStudy=freq)%>%ggplot(aes(x=reorder(purpose_cat, Freq), y=Freq))+ geom_bar(stat = "identity", fill="#E7B800")+
 geom_text(position="stack",aes(purpose_cat,Freq+43,label=paste("N=",Freq,sep="")),size=2)+
   theme_classic()+
  theme(axis.text.x = element_text(angle=90, vjust = 1, hjust=1,size=6),
        axis.text.y = element_text( vjust = 1, hjust=1,size=6),
      #axis.text=element_text(size=20), #change font size of axis text
        axis.title=element_text(size=6), #change font size of axis titles
        plot.title=element_text(size=6), #change font size of plot title
        legend.text=element_text(size=6), #change font size of legend text
        legend.title=element_text(size=6) )+
  xlab("Study context")+
  ylab("Number of samples")+
  #ggtitle("Healthy control sample distribution among comparator conditions")+
   guides(fill=guide_legend(title="Number of studies"))+
  coord_flip()

##################################

################################################################
### platform bar graph 
na.plat<-names(sort(table(meta$platform), decreasing=T))
plat<-c()
for(i in na.plat){
  temp<-meta[meta$platform==i,]
 plat<- c(plat,length(unique(temp$accession)))
}
names(plat)<-na.plat
platform<-meta%>%group_by(platform)%>%summarise(Freq=n())%>%arrange(desc(Freq))%>%mutate(plat=plat)%>%ggplot(aes(x=reorder(platform, Freq), y=Freq))+ geom_bar(stat = "identity", fill="steelblue")+
   geom_text(position="stack",aes(platform,Freq+55,label=paste("N=",plat)),size=2)+
 # geom_text(position="stack",aes(purpose_cat,Freq+3,label=Freq),size=5)+
      theme_classic()+
  theme(axis.text.x = element_text(angle = 90,vjust = 1, hjust=1,size=8),
        axis.text.y = element_text(vjust = 1, hjust=1,size=6),
      axis.text=element_text(size=20), #change font size of axis text
        axis.title=element_text(size=8), #change font size of axis titles
        plot.title=element_text(size=8), #change font size of plot title
        legend.text=element_text(size=8), #change font size of legend text
       # legend.title=element_text(size=8),
      #legend.text=element_blank(), #change font size of legend text
        legend.title=element_blank()
      # axis.text.y=element_blank(),
       # axis.ticks.y=element_blank(),
      #axis.title.y=element_blank()
      )+
  xlab("Sequencing platform")+
  ylab("Number of samples")+
  #ggtitle("Sequencing platform distribution")+
  guides(fill=guide_legend(title="Number of studies"))+
  coord_flip()

#####################################################################
#### sample type 

na.sample<-names(sort(table(meta$sampleType), decreasing=T))
sample<-c()
for(i in na.sample){
  temp<-meta[meta$sampleType==i,]
 sample<- c(sample,length(unique(temp$accession)))
}

sampleType<-meta%>%group_by(sampleType)%>%summarise(Freq=n())%>%mutate(sample=sample)%>%ggplot(aes(x=reorder(sampleType, Freq), y=Freq))+ geom_bar(stat = "identity", fill="#00AFBB")+
  geom_text(position="stack",aes(sampleType,Freq+120,label=paste("N=",sample)),size=2)+
   theme_classic()+
  theme(axis.text.x = element_text(angle = 90,vjust = 1, hjust=1,size=8),
        axis.text.y = element_text(vjust = 1, hjust=1,size=8),
      axis.text=element_text(size=20), #change font size of axis text
        axis.title=element_text(size=8), #change font size of axis titles
        plot.title=element_text(size=8), #change font size of plot title
        legend.text=element_text(size=8), #change font size of legend text
        legend.title=element_text(size=8)
      # axis.text.y=element_blank(),
       # axis.ticks.y=element_blank(),
     # axis.title.y=element_blank()
      )+
  
 xlab("Sample type")+
  ylab("Number of samples")+
  #ggtitle("Sequencing platform distribution")+
  guides(fill=guide_legend(title="Sample type"))+
  coord_flip()


################################################################
#### sequencing type bar graph
na.seq<-names(sort(table(meta$sequencingType), decreasing=T))
seq<-c()
for(i in na.seq){
  temp<-meta[meta$sequencingType==i,]
 seq<- c(seq,length(unique(temp$accession)))
}
sequencingType<-meta%>%group_by(sequencingType)%>%summarise(Freq=n())%>%mutate(Sequencing=seq)%>%ggplot(aes(x=reorder(sequencingType, Freq), y=Freq))+ geom_bar(stat = "identity", fill="#FC4E07")+
  geom_text(position="stack",aes(sequencingType,Freq+120,label=paste("N=",Sequencing)),size=2)+
  #ggtitle("Sequencing library distribution claimed by the authors (n=2931)")+
  guides(fill=guide_legend(title="Sequencing library"))+
#coord_polar("y", start=0)+
     theme_classic()+
  theme(axis.text.x = element_text(angle = 90,vjust = 1, hjust=1,size=8),
        axis.text.y = element_text(vjust = 1, hjust=1,size=8),
      axis.text=element_text(size=20), #change font size of axis text
        axis.title=element_text(size=8), #change font size of axis titles
        plot.title=element_text(size=8), #change font size of plot title
        legend.text=element_text(size=8), #change font size of legend text
        legend.title=element_text(size=8)
      # axis.text.y=element_blank(),
        #axis.ticks.y=element_blank(),
     # axis.title.y=element_blank()
      )+
    ylab("Number of samples")+
   xlab("Sequencing type")+
  #ggtitle("Sequencing platform distribution")+
  guides(fill=guide_legend(title="Sample type"))+
  coord_flip()
  


####################################################
#combing the for graph 

figure <- ggarrange(condition, platform,  sampleType,sequencingType,
                   labels = c("A", "B", "C", "D"),
                    ncol = 2, nrow = 2)
figure
ggsave(figure, file="/Users/u7594296/Library/CloudStorage/OneDrive-AustralianNationalUniversity/Documents/PhD_works/GEO/Feb_22_2024_orgnized/figure2.pdf")








