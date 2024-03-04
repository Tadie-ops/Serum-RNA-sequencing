############################################################################
### loading sequence metadata and alignment summary 
meta.depth<-read.csv("/Users/u7594296/Library/CloudStorage/OneDrive-AustralianNationalUniversity/Documents/PhD_works/GEO/Feb_22_2024_orgnized/meta.depth_length.csv")
xx<-unique(meta.depth$file)
m<-match(xx, meta.depth$file)
meta.depth<-meta.depth[m,]
meta.depth.paired<-meta.depth[meta.depth$paired,]
dim(meta.depth.paired)
plot(density(meta.depth.paired$len1))
plot(density(meta.depth.paired$len2))
meta.depth.single<-meta.depth[!meta.depth$sample%in%meta.depth.paired$sample,]
dim(meta.depth.single)
plot(density(meta.depth.single$len2))
plot(density(meta.depth.single$len1))
### paired end read 364
##. single and read 2502
### total 2866

single<-ggdensity(meta.depth.single, 
          x = "len1",
   palette = c("#00AFBB", "#E7B800"),
    rug = TRUE, fill = "green",
        # title = "Single end sequencing", 
         xlab = "Average sequence length [bp]",
         ylab = "Density")

paired<-ggdensity(meta.depth.paired, 
          x = "len1",
   palette = c("#00AFBB", "#E7B800"),
    rug = TRUE, fill = "blue",
        # title = "Paired end sequencing", 
         xlab = "Average sequence length [bp]",
         ylab = "Density")

figure2 <- ggarrange(single, paired,
                     labels = c("A", "B"),
                    ncol = 2, nrow = 1)
figure2
ggsave(figure2, file="/Users/u7594296/Library/CloudStorage/OneDrive-AustralianNationalUniversity/Documents/PhD_works/GEO/Feb_22_2024_orgnized/figure3.pdf")

sort(meta.depth.paired$len2)[1]
meta.depth.paired$dep<-meta.depth.paired$depth/1000000
meta.depth.single$dep<-meta.depth.single$depth/1000000
paired.dep<-ggdensity(meta.depth.paired, 
          x = "dep",
   palette = c("#00AFBB", "#E7B800"),
    rug = TRUE, fill = "blue",
        # title = "Paired end sequencing", 
         xlab = "Sequencing depth [in million] ",
         ylab = "Density")


single.dp<-ggdensity(meta.depth.single, 
          x = "dep",
   palette = c("#00AFBB", "#E7B800"),
    rug = TRUE, fill = "blue",
        # title = "Paired end sequencing", 
         xlab = "Sequencing depth [in million] ",
         ylab = "Density")

figure3 <- ggarrange(single.dp, paired.dep,
                     labels = c("A", "B"),
                    ncol = 2, nrow = 1)
figure3
ggsave(figure3, file="/Users/u7594296/Library/CloudStorage/OneDrive-AustralianNationalUniversity/Documents/PhD_works/GEO/Feb_22_2024_orgnized/figure4.pdf")
