library(reshape2)
library(ggplot2)
v1=60
v2=50
v3=40
v4=30
v5=20
v6=10
v7=1
v8=10
v9=20
v10=30
v11=40
v12=50
v13=60

a=data.frame(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13)
amelt=melt(a)
colnames(a)="A"
aplot=ggplot(amelt,aes(x=variable,fill=variable,y=value))+geom_bar(stat="identity")+theme_bw()+xlab("")+ylab("")+

theme(panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
panel.border = element_blank(),
legend.position="none",
axis.text.x = element_blank(),
axis.text.y = element_blank(),
axis.ticks=element_blank()
)
 
aplot
