## 2024年10月31日，分析于靖和黄小轶数据
## Revised on 20241205 分析数据
## Revised on 20250225 重新计算了CO2的累计排放量
## Revised on 20250422 重新计算了CO2随着时间的变化
## By Chao Wang

# 设置工作空间
rm(list = ls())
setwd("~/Documents/Research/Diversity of microbe /R analysis_v2")
dir()

#### 绘制各变量图 ####
library(ggplot2)
library(ggthemes)
library(ggpubr)
library(rcartocolor)

# 导入数据 
data1=read.csv("Dataset.csv", sep=",", header = T)
names(data1)
str(data1)

#设置分类变量
#data1$Plot <- as.factor(data1$Plot)
data1$Diversity <- factor(data1$Diversity, levels = c("O", "D0", "D2","D4","D8"), ordered= T)
data1$Landuse <- factor(data1$Landuse, levels = c("Forest", "Grassland", "Cropland"), ordered= T)
str(data1)

# CO2累计排放量图
fig_CO2 <- ggboxplot(data1,
                         x = "Diversity",
                         y = "CO2",
                         combine= TRUE,
                         add = "jitter",
                         fill = "Diversity", 
                         scales = "free",
                         palette = "uchicago")+ 
  #geom_jitter(size = 2, width = 0, height = 0) +
  scale_y_continuous(limits = c(0, 800))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA),  # 设置图形背景透明
        panel.background = element_rect(fill = "transparent", color = NA))+
        border(color = "black", size = 1.5)
fig_CO2
ggsave("CO2.png", plot = fig_CO2, device = "png", width = 6, height = 6, dpi = 300, bg = "transparent")
#ggsave("CO2-2.png", plot = fig_CO2, device = "jpeg", width = 6, height = 6, dpi = 300, bg = "transparent")


## CO2 by Landuse
fig2_CO2 <- ggboxplot(data1,
                     x = "Diversity",
                     y = "CO2",
                     combine= TRUE,
                     add = "jitter",
                     fill = "Diversity", 
                    #scales = "free",
                     palette = "uchicago",
                     facet.by = c("Landuse"))+
  #scale_y_continuous(limits = c(0, 700))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)
fig2_CO2
ggsave("CO2_landuse.jpg", plot = fig2_CO2, device = "jpeg", width = 18, height = 7, dpi = 300)


# qCO2累计排放量图
fig_qco2 <- ggboxplot(data1,
                     x = "Diversity",
                     y = "qco2",
                     combine= TRUE,
                     add = "jitter",
                     fill = "Diversity", 
                    # scales = "free",
                     palette = "uchicago")+ 
  #geom_jitter(size = 2, width = 0, height = 0) +
  scale_y_continuous(limits = c(0, 2000))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        #axis.line = element_line(size = 1),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA),  # 设置图形背景透明
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1.5)

fig_qco2
ggsave("qco2.png", plot = fig_qco2, device = "png", width = 6, height = 6, dpi = 300, bg = "transparent")

## qCO2 by Landuse
fig2_qco2 <- ggboxplot(data1,
                      x = "Diversity",
                      y = "qco2",
                      combine= TRUE,
                      add = "jitter",
                      fill = "Diversity", 
                      #scales = "free",
                      palette = "uchicago",
                      facet.by = c("Landuse"))+ 
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)
fig2_qco2
ggsave("qco2_landuse.jpg", plot = fig2_qco2, device = "jpeg", width = 18, height = 7, dpi = 300)

## growth rate
fig_Growth <- ggboxplot(data1,
                     x = "Diversity",
                     y = "Growth",
                     combine= TRUE,
                     add = "jitter",
                     fill = "Diversity", 
                     scales = "free",
                     palette = "uchicago")+ 
  #geom_jitter(size = 2, width = 0, height = 0) +
  scale_y_continuous(limits = c(0, 300))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        #axis.line = element_line(size = 1),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1.5)
fig_Growth
ggsave("growth.png", plot = fig_Growth, device = "png", width = 6, height = 6, dpi = 300, bg = "transparent")


## Growth by Landuse
fig2_growth <- ggboxplot(data1,
                      x = "Diversity",
                      y = "Growth",
                      combine= TRUE,
                      add = "jitter",
                      fill = "Diversity", 
                      scales = "free",
                      palette = "uchicago",
                      facet.by = c("Landuse"))+ 
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)

fig2_growth
ggsave("growth_landuse.jpg", plot = fig2_growth, device = "jpeg", width = 18, height = 7, dpi = 300)


## CUE
fig_CUE <- ggboxplot(data1,
                     x = "Diversity",
                     y = "CUE",
                     combine= TRUE,
                     add = "jitter",
                     fill = "Diversity", 
                     scales = "free",
                     palette = "uchicago")+ 
  #geom_jitter(size = 2, width = 0, height = 0) +
  scale_y_continuous(limits = c(0, 0.8))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        #axis.line = element_line(size = 1),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1.5)
fig_CUE
ggsave("CUE.png", plot = fig_CUE, device = "png", width = 6, height = 6, dpi = 300, bg = "transparent")

## CUE by Landuse
fig2_CUE <- ggboxplot(data1,
                       x = "Diversity",
                       y = "CUE",
                       combine= TRUE,
                       add = "jitter",
                       fill = "Diversity", 
                      # scales = "free",
                       palette = "uchicago",
                       facet.by = c("Landuse"))+ 
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)

fig2_CUE
ggsave("CUE_landuse2.jpg", plot = fig2_CUE, device = "jpeg", width = 18, height = 7, dpi = 300)

# NUE
fig_NUE <- ggboxplot(data1,
                     x = "Diversity",
                     y = "NUE",
                     combine= TRUE,
                     add = "jitter",
                     fill = "Diversity", 
                     scales = "free",
                     palette = "uchicago")+ 
  #geom_jitter(size = 2, width = 0, height = 0) +
  scale_y_continuous(limits = c(0, 0.8))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        #axis.line = element_line(size = 1),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1.5)

fig_NUE
ggsave("NUE.png", plot = fig_NUE, device = "png", width = 6, height = 6, dpi = 300, bg = "transparent")

## CUE by Landuse
fig2_NUE <- ggboxplot(data1,
                      x = "Diversity",
                      y = "NUE",
                      combine= TRUE,
                      add = "jitter",
                      fill = "Diversity", 
                      #scales = "free",
                      palette = "uchicago",
                      facet.by = c("Landuse"))+ 
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)

fig2_NUE
ggsave("NUE_landuse2.jpg", plot = fig2_NUE, device = "jpeg", width = 18, height = 7, dpi = 300)

# Turnover
fig_Turnover <- ggboxplot(data1,
                     x = "Diversity",
                     y = "Turnover",
                     combine= TRUE,
                     add = "jitter",
                     fill = "Diversity", 
                     scales = "free",
                     palette = "uchicago")+ 
  #geom_jitter(size = 2, width = 0, height = 0) +
   scale_y_continuous(limits = c(0, 6),labels = scales::number_format(accuracy = 0.1))+
   theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        #axis.line = element_line(size = 1),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1.5)
fig_Turnover
ggsave("Turnover.png", plot = fig_Turnover, device = "png", width = 6, height = 6, dpi = 300, bg = "transparent")

## NUE by Landuse
fig2_Turnover <- ggboxplot(data1,
                      x = "Diversity",
                      y = "Turnover",
                      combine= TRUE,
                      add = "jitter",
                      fill = "Diversity", 
                      #scales = "free",
                      palette = "uchicago",
                      facet.by = c("Landuse"))+ 
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)

fig2_Turnover
ggsave("Turnover_landuse2.jpg", plot = fig2_Turnover, device = "jpeg", width = 18, height = 7, dpi = 300)


# MBC
fig_MBC <- ggboxplot(data1,
                          x = "Diversity",
                          y = "MBC",
                          combine= TRUE,
                          add = "jitter",
                          fill = "Diversity", 
                          scales = "free",
                          palette = "uchicago")+ 
  scale_y_continuous(breaks = seq(0, 1400, by = 200))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        #axis.line = element_line(size = 1),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 12, face = "bold"),
        legend.title = element_blank())+
  border(color = "black", size = 1.5)
fig_MBC
ggsave("MBC.jpg", plot = fig_MBC, device = "jpeg", width = 6, height = 6, dpi = 300)

## MBC by Landuse
fig2_MBC <- ggboxplot(data1,
                           x = "Diversity",
                           y = "MBC",
                           combine= TRUE,
                           add = "jitter",
                           fill = "Diversity", 
                           #scales = "free",
                           palette = "uchicago",
                           facet.by = c("Landuse"))+ 
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 18, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", linewidth = 0.2))+
  border(color = "black", size = 1.5)

fig2_MBC
ggsave("MBC_landuse2.jpg", plot = fig2_MBC, device = "jpeg", width = 18, height = 7, dpi = 300)

#### CO2 with time ####
#导入数据
data_time_CO2=read.csv("Time_CO2.csv", sep=",", header = T)
names(data_time_CO2)

#设置分类变量
data_time_CO2$Diversity <- factor(data_time_CO2$Diversity, levels = c("O", "D0", "D2","D4","D8"), ordered= T)
data_time_CO2$Landuse <- factor(data_time_CO2$Landuse, levels = c("Forest", "Grassland", "Cropland"), ordered= T)
str(data_time_CO2)

## CO2 with time
Time_CO2 <- ggline(data_time_CO2, 
                   x = "Time", y = "CO2", 
       add = "mean_se", 
       color = "Diversity",
       facet.by = c("Landuse"),
       #scales = "free",
       palette = "uchicago",
       size = 2)+ 
  scale_y_continuous(limits = c(0, 650))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 16, face = "bold"),
        strip.background = element_rect(fill = "grey", color = "black", size = 0.2))+ 
  border(color = "black", size = 1.5)

Time_CO2
ggsave("CO2_Time.jpg", plot = Time_CO2, device = "jpeg", width = 18, height = 7, dpi = 300)

#### 分析变量间的相关性 ####
library(tidyverse)
library(reshape2)
library(ggcorrplot)
library(ggplot2)
library(corrplot)

# 读入数据 
data1=read.csv("Dataset.csv", sep=",", header = T) # 这里的O处理名称变“C”
names(data1)
str(data1)

####相关性分析，做热图
col2 = colorRampPalette(c('#053061', '#2166AC', '#4393C3', '#92C5DE',
                          '#D1E5F0', '#FFFFFF', '#FDDBC7', '#F4A582',
                          '#D6604D', '#B2182B', '#67001F'))

#没有标准化数据的热图
data_heat <- data1 %>% dplyr::select("qco2",
                                      "ShannonB","ShannonF",
                                      "Turnover","CUE","NUE",
                                      "BAS_q","PTA_q","JAS_q",
                                      "PTT_q","GT_q","HZT_q","CS_q")

cormat <- round(cor(data_heat),2)
p.mat <- cor_pmat(data_heat)

M <- cor(data_heat, method = "spearman")
corheatmap = corrplot(M, col = col2(100),type = "lower", 
                      diag = FALSE, insig = "blank", 
                      method = 'circle',p.mat = p.mat)
corheatmap
png("correlation_plot.png", width = 800, height = 800) 

# 导出图片
tiff("corrplot_output.tiff", width = 2000, height = 2000, res = 300, compression = "lzw")
corrplot(cormat, method = "circle")
dev.off()



#### 线性混合模型####
library(tibble)
library(lmerTest)
library(lme4)
library(MASS)
library(tidyverse)
library(sjPlot) 
library(MuMIn)
library(performance)
library(dplyr)
library(ggplot2)
library(ggthemes)
library(ggpubr)
library(rcartocolor)

# 读入数据 
data1=read.csv("Dataset.csv", sep=",", header = T) # 这里的O处理名称变“C”
names(data1)
str(data1)

# 选择数据建立交互项目
data2 <- data1 %>% dplyr::select("Name","ShannonB", 
                                 "ShannonF","Turnover","CUE", "NUE")
names(data2)

# 进行标准化
rownames(data2) <- data2$Name
data2 <- data2 %>% dplyr::select(-"Name")
data2_z <- as.data.frame(scale(data2))
data2_z$Name <- rownames(data2_z)
str(data2_z)

# 具有Landuse的标准化数据库
# data3读入的数据是从data1里面选出来的,包括CUE NUE TURNOVER等，但是名字后面加1
data3=read.csv("Dataset2.csv", sep=",", header = T) 
names(data3)

# 合并data3 和data2_z
data4 <- merge(data2_z,data3,by = "Name")
names(data4)
str(data4)

#创建NUE和turnover的交互项
data4$turnoverNUE <- data4$Turnover*data4$NUE
data4$turnoverCUE <- data4$Turnover*data4$CUE
names(data4)
str(data4)

# 方法1-不进行转换，直接用data4的数据进行模型

# # 方法2-用as.factor对diversity进行转换
# data4$Plot <- as.factor(data4$Plot)
# data4$Diversity <- as.factor(data4$Diversity)
# data4$Landuse <- as.factor(data4$Landuse)
# str(data4)


# # 方法3-用factor对diversity进行转换
# data4$Diversity <- factor(data4$Diversity, levels = c("O", "D0", "D2","D4","D8"), ordered= T)
# data4$Landuse <- factor(data4$Landuse, levels = c("Forest", "Grassland", "Cropland"), ordered= T)

#### CO2的模型####
LMM_CO2<-lmer(CO2~Diversity+(1|Landuse),data=data4)
shapiro.test(resid(LMM_CO2))
summary(LMM_CO2)
tab_model(LMM_CO2)
anova(LMM_CO2,ddf="Kenward-Roger")
r_squared <- r.squaredGLMM(LMM_CO2)
print(r_squared)
AIC(LMM_CO2)

# 高度共线性，模型不能使用
LMM_CO2_1<-lmer(CO2~Diversity+ShannonB+ShannonF+(1|Landuse),data=data4)
shapiro.test(resid(LMM_CO2_1))
summary(LMM_CO2_1)
tab_model(LMM_CO2_1)
anova(LMM_CO2_1,ddf="Kenward-Roger")
r_squared_1 <- r.squaredGLMM(LMM_CO2_1)
print(r_squared_1)
AIC(LMM_CO2_1)
plot(check_collinearity(LMM_CO2_1))

# 高度共线性，模型不能使用
LMM_CO2_2<-lmer(CO2~Diversity+ShannonB+ShannonF+MBC+(1|Landuse),data=data4)
shapiro.test(resid(LMM_CO2_2))
summary(LMM_CO2_2)
tab_model(LMM_CO2_2)
anova(LMM_CO2_2,ddf="Kenward-Roger")
r_squared_2 <- r.squaredGLMM(LMM_CO2_2)
print(r_squared_2)
AIC(LMM_CO2_2)
plot(check_collinearity(LMM_CO2_2))

#
LMM_CO2_3<-lmer(CO2~Diversity+MBC+CUE+NUE+Turnover+(1|Landuse),data=data4)
shapiro.test(resid(LMM_CO2_3))
summary(LMM_CO2_3)
tab_model(LMM_CO2_3)
anova(LMM_CO2_3,ddf="Kenward-Roger")
r_squared_3 <- r.squaredGLMM(LMM_CO2_3)
print(r_squared_3)
AIC(LMM_CO2_3)
plot(check_collinearity(LMM_CO2_3))

# 高度共线性，模型不能使用
LMM_CO2_4<-lmer(CO2~Diversity+ShannonB+ShannonF+MBC+CUE+NUE+Turnover+(1|Landuse),data=data4)
shapiro.test(resid(LMM_CO2_4))
summary(LMM_CO2_4)
tab_model(LMM_CO2_4)
anova(LMM_CO2_4,ddf="Kenward-Roger")
r_squared_4 <- r.squaredGLMM(LMM_CO2_4)
print(r_squared_4)
AIC(LMM_CO2_4)
plot(check_collinearity(LMM_CO2_4))

#
LMM_CO2_5<-lmer(CO2~Diversity+MBC+CUE+NUE*Turnover+(1|Landuse),data=data4)
shapiro.test(resid(LMM_CO2_5))
summary(LMM_CO2_5)
tab_model(LMM_CO2_5)
anova(LMM_CO2_5,ddf="Kenward-Roger")
r_squared_5 <- r.squaredGLMM(LMM_CO2_5)
print(r_squared_5)
AIC(LMM_CO2_5)
plot(check_collinearity(LMM_CO2_5))

#### qCO2的模型####
LMM_qCO2_1<-lmer(log(qco2)~Diversity+(1|Landuse),data=data4)
shapiro.test(resid(LMM_qCO2_1))
summary(LMM_qCO2_1)
tab_model(LMM_qCO2_1)
anova(LMM_qCO2_1,ddf="Kenward-Roger")
r_squared_q1 <- r.squaredGLMM(LMM_qCO2_1)
print(r_squared_q1)
AIC(LMM_qCO2_1)

# High collinearity and so abundant it 
LMM_qCO2_2<-lmer(log(qco2)~Diversity+ShannonB+ShannonF+(1|Landuse),data=data4)
shapiro.test(resid(LMM_qCO2_2))
summary(LMM_qCO2_2)
tab_model(LMM_qCO2_2)
anova(LMM_qCO2_2,ddf="Kenward-Roger")
r_squared_q2 <- r.squaredGLMM(LMM_qCO2_2)
print(r_squared_q2)
AIC(LMM_qCO2_2)
plot(check_collinearity(LMM_qCO2_2))

# 
LMM_qCO2_3<-lmer(log(qco2)~Diversity+CUE+NUE+Turnover+(1|Landuse),data=data4)
shapiro.test(resid(LMM_qCO2_3))
summary(LMM_qCO2_3)
tab_model(LMM_qCO2_3)
anova(LMM_qCO2_3,ddf="Kenward-Roger")
r_squared_q3 <- r.squaredGLMM(LMM_qCO2_3)
print(r_squared_q3)
AIC(LMM_qCO2_3)
plot(check_collinearity(LMM_qCO2_3))

# 考虑了NUE * tunover交互作用，这个模型为最优模型
LMM_qCO2_5<-lmer(log(qco2)~Diversity+CUE+NUE+Turnover+turnoverNUE+(1|Landuse),data=data4)
shapiro.test(resid(LMM_qCO2_5))
summary(LMM_qCO2_5)
tab_model(LMM_qCO2_5)
anova(LMM_qCO2_5,ddf="Kenward-Roger")
r_squared_q5 <- r.squaredGLMM(LMM_qCO2_5)
print(r_squared_q5)
AIC(LMM_qCO2_5)
plot(check_collinearity(LMM_qCO2_5))

# 
LMM_qCO2_4<-lmer(log(qco2)~ShannonB+ShannonF+CUE+NUE+Turnover+(1|Landuse),data=data4)
shapiro.test(resid(LMM_qCO2_4)) 
summary(LMM_qCO2_4) 
tab_model(LMM_qCO2_4)
anova(LMM_qCO2_4,ddf="Kenward-Roger")
r_squared_q4 <- r.squaredGLMM(LMM_qCO2_4) 
print(r_squared_q4)  
AIC(LMM_qCO2_4) 
plot(check_collinearity(LMM_qCO2_4))

#
LMM_qCO2_6<-lmer(log(qco2)~ShannonB+ShannonF+CUE+NUE*Turnover+(1|Landuse),data=data4)
shapiro.test(resid(LMM_qCO2_6))
summary(LMM_qCO2_6)
tab_model(LMM_qCO2_6)
anova(LMM_qCO2_6,ddf="Kenward-Roger")
r_squared_q6 <- r.squaredGLMM(LMM_qCO2_6)
print(r_squared_q6)
AIC(LMM_qCO2_6)
plot(check_collinearity(LMM_qCO2_6))

# 多个qco2模型比较，LMM_qCO2_5 IS THE BEST MODEL, SO IT WAS USED IN THE FOLLOWING PARTIAL ANALYSIS
AIC(LMM_qCO2_1,LMM_qCO2_2,LMM_qCO2_3,LMM_qCO2_4,LMM_qCO2_5,LMM_qCO2_6) # 模型5是最好的模型
r.squaredGLMM(LMM_qCO2_1) # 模型1的R2相对模型5低很多
r.squaredGLMM(LMM_qCO2_5)## this model is the best one

#### 分析模型5各参数与qCO2的关系 ####
##分析turnover * NUE变量对CO2的影响
library(data.table)
head(data4)
LMM_data_1<-data.table(qco2=c(resid(LMM_qCO2_5)+
                         fixef(LMM_qCO2_5)[1]+
                         (fixef(LMM_qCO2_5)["turnoverNUE"]*LMM_qCO2_5@frame[,"turnoverNUE"])),
                turnoverNUE=c(LMM_qCO2_5@frame[,"turnoverNUE"]+mean(data4$turnoverNUE)),
                Landuse= LMM_qCO2_5@frame[,"Landuse"],
                Diversity= LMM_qCO2_5@frame[,"Diversity"])
LMM_data_1[,Pre_qco2:=exp(qco2)]

# qco2 vs turnoverNUE
fig_CO2_turnNUE <- ggscatter(LMM_data_1,
                          x = "turnoverNUE",
                          y = "Pre_qco2",
                          # add = "reg.line",
                          #conf.int = TRUE, 
                          #cor.coef = TRUE,
                          size = 5,
                          palette = "uchicago",
                          color = "Diversity",
                          cor.coef.coord = c(4, 75),
                          cor.coef.size =6)+ 
  scale_y_continuous(breaks = seq(0, 650, by = 150), limits = c(0, 650))+
  stat_smooth(method = "lm", color = "Black", se = TRUE)+  # 添加回归线并设置回归线颜色
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 14, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))
fig_CO2_turnNUE
ggsave("qco2_turnoverNUE.png", plot = fig_CO2_turnNUE, device = "png", width = 6, height = 7, dpi = 300, bg = "transparent")

##分析turnover变量对CO2的影响
LMM_data_2<-data.table(qco2=c(resid(LMM_qCO2_5)+
                          fixef(LMM_qCO2_5)[1]+
                          (fixef(LMM_qCO2_5)["Turnover"]*LMM_qCO2_5@frame[,"Turnover"])),
                Turnover=c(LMM_qCO2_5@frame[,"Turnover"]+mean(data4$Turnover)),
                Landuse= LMM_qCO2_5@frame[,"Landuse"],
                Diversity= LMM_qCO2_5@frame[,"Diversity"]
                )
LMM_data_2[,Pre_qco2:=exp(qco2)]

## 进行数据合并
data4_1 <- data4 %>% dplyr::select("Landuse","Diversity", "Turnover",
                                   "Turnover1")

data4_1 %>%
  dplyr::mutate(Landuse = as.character(Landuse),
                Diversity = as.character(Diversity)) %>%
  dplyr::arrange(Landuse, Diversity, Turnover) %>% 
  dplyr::bind_cols(LMM_data_2 %>% 
                     dplyr::mutate(Landuse = as.character(Landuse),
                                   Diversity = as.character(Diversity)) %>% 
                     dplyr::arrange(Landuse, Diversity, Turnover)) -> tmp1
head(tmp1)

# qco2 vs turnover
fig_CO2_turn <- ggscatter(tmp1,
                     x = "Turnover1",
                     y = "Pre_qco2",
                    # add = "reg.line",
                     #conf.int = TRUE, 
                     #cor.coef = TRUE,
                     size = 5,
                     palette = "uchicago",
                     color = "Diversity...2",
                    cor.coef.coord = c(-1, 140),
                    cor.coef.size =6)+ 
 scale_y_continuous(breaks = seq(0, 1200, by = 300), limits = c(0, 1200))+
  stat_smooth(method = "lm", color = "Black", se = TRUE)+  # 添加回归线并设置回归线颜色
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 14, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))
  #border(color = "black", size = 1.5)
fig_CO2_turn
ggsave("qco2_turnover.png", plot = fig_CO2_turn, device = "png", width = 6, height = 7, dpi = 300, bg = "transparent")


##分析CUE变量对CO2的影响
LMM_data_3<-data.table(qco2=c(resid(LMM_qCO2_5)+
                         fixef(LMM_qCO2_5)[1]+
                         (fixef(LMM_qCO2_5)["CUE"]*LMM_qCO2_5@frame[,"CUE"])),
                CUE=c(LMM_qCO2_5@frame[,"CUE"]+mean(data4$CUE)),
                Landuse= LMM_qCO2_5@frame[,"Landuse"],
                Diversity= LMM_qCO2_5@frame[,"Diversity"])
LMM_data_3[,Pre_qco2:=exp(qco2)]


## 进行数据合并
data4_2 <- data4 %>% dplyr::select("Landuse","Diversity", 
                                   "CUE","CUE1")

data4_2 %>%
  dplyr::mutate(Landuse = as.character(Landuse),
                Diversity = as.character(Diversity)) %>%
  dplyr::arrange(Landuse, Diversity, CUE) %>% 
  dplyr::bind_cols(LMM_data_3 %>% 
                     dplyr::mutate(Landuse = as.character(Landuse),
                                   Diversity = as.character(Diversity)) %>% 
                     dplyr::arrange(Landuse, Diversity, CUE)) -> tmp3
head(tmp3)

# qco2 vs cue
fig_CO2_CUE <- ggscatter(tmp3,
                          x = "CUE1",
                          y = "Pre_qco2",
                         # add = "reg.line",
                          #conf.int = TRUE, 
                          #cor.coef = TRUE,
                          palette = "uchicago",
                          size = 5,
                          color = "Diversity...2",
                         cor.coef.coord = c(0.5,75),
                         cor.coef.size = 6)+ 
                       #scale_y_continuous(limits = c(0, 80))+
                       scale_x_continuous(limits = c(0, 0.65))+
  scale_y_continuous(breaks = seq(0, 800, by = 200), limits = c(0, 800))+
  stat_smooth(method = "lm", color = "Black", se = TRUE)+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 14, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))
fig_CO2_CUE
ggsave("qco2_CUE.png", plot = fig_CO2_CUE, device = "png", width = 6, height = 7, dpi = 300, bg = "transparent")

##分析NUE变量对CO2的影响
LMM_data_4<-data.table(qco2=c(resid(LMM_qCO2_5)+
                         fixef(LMM_qCO2_5)[1]+
                         (fixef(LMM_qCO2_5)["NUE"]*LMM_qCO2_5@frame[,"NUE"])),
                NUE=c(LMM_qCO2_5@frame[,"NUE"]+mean(data4$NUE)),
                Landuse= LMM_qCO2_5@frame[,"Landuse"],
                Diversity= LMM_qCO2_5@frame[,"Diversity"])
LMM_data_4[,Pre_qco2:=exp(qco2)]


## 进行数据合并
data4_3 <- data4 %>% dplyr::select("Landuse","Diversity", 
                                   "NUE","NUE1")
data4_3 %>%
  dplyr::mutate(Landuse = as.character(Landuse),
                Diversity = as.character(Diversity)) %>%
  dplyr::arrange(Landuse, Diversity, NUE) %>% 
  dplyr::bind_cols(LMM_data_4 %>% 
                     dplyr::mutate(Landuse = as.character(Landuse),
                                   Diversity = as.character(Diversity)) %>% 
                     dplyr::arrange(Landuse, Diversity, NUE)) -> tmp4
head(tmp4)

# qco2 vs NUE
fig_CO2_NUE <- ggscatter(tmp4,
                         x = "NUE1",
                         y = "Pre_qco2",
                        # add = "reg.line",
                         #conf.int = TRUE, 
                         #cor.coef = TRUE,
                         palette = "uchicago",
                         size = 5,
                         color = "Diversity...2",
                        cor.coef.coord = c(-0.5, 75),
                        cor.coef.size = 6)+ 
  scale_y_continuous(breaks = seq(100, 700, by = 150), limits = c(100, 700))+
  stat_smooth(method = "lm", color = "Black", se = TRUE)+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 14, face = "bold"),
        legend.title = element_blank(),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))
fig_CO2_NUE
ggsave("qco2_NUE.png", plot = fig_CO2_NUE, device = "png", width = 6, height = 7, dpi = 300, bg = "transparent")


#合并三个图
library(cowplot)
figure_2 <- plot_grid(fig_CO2_CUE, fig_CO2_NUE, fig_CO2_turn, ncol = 3)
ggsave("qco2_vs_pred.jpg", plot = figure_2, width = 17, height = 7,device = "jpeg", dpi = 300)


#### 用SEM分析CUE等与呼吸的关系 #########
library(piecewiseSEM)
library(tidyverse)
library(nlme)
library(lme4)
library(brms)
library(ape)
library(caper)
library(semPlot)
library(car) 

# 读入数据 
data1=read.csv("Dataset.csv", sep=",", header = T) # 这里的O处理名称变“C”
names(data1)
str(data1)

# 选择数据进行标准化
data2 <- data1 %>% dplyr::select("Name","ShannonB", "ShannonF","Turnover","CUE", "NUE","MBC")
rownames(data2) <- data2$Name
data2 <- data2 %>% dplyr::select(-"Name")
data1_z <- as.data.frame(scale(data2))
data1_z$Name <- rownames(data1_z)
str(data1_z)

# 具有Landuse的标准化数据库
data3 <- data1 %>% dplyr::select("Name","Landuse","Diversity2","Diversity1","Diversity","Plot","CO2","qco2")
data4 <- merge(data3,data1_z,by = "Name")
names(data4)
str(data4)

#创建NUE和turnover的交互项
data4$turnoverNUE <- data4$Turnover*data4$NUE
data4$turnoverCUE <- data4$Turnover*data4$CUE
str(data4)

## 构建SEM模型
qco2_sem<-psem(
  lme(log(qco2)~ShannonB+ShannonF+CUE+Turnover*NUE, random = ~ 1 | Landuse,data= data4),
  lme(CUE~ShannonB+ShannonF+Turnover, random = ~ 1 | Landuse,data= data4),
  lme(NUE~ShannonB+ShannonF+Turnover, random = ~ 1 | Landuse,data= data4),
  lme(Turnover~ShannonB+ShannonF, random = ~ 1 | Landuse,data= data4),
  lme(ShannonB~Diversity2, random = ~ 1 | Landuse,data= data4),
  lme(ShannonF~Diversity2, random = ~ 1 | Landuse,data= data4),
  data=data4)


summary(qco2_sem)
vif(qco2_sem)
basisSet(qco2_sem)
dSep(qco2_sem)#conditioning=T,显示所有自变量
fisherC(qco2_sem)#
coefs(qco2_sem)#intercept=T,给出截距
rsquared(qco2_sem)#默认方法是delta,可改为method="theoretical"则是用的日本人的方法计算R2了
AIC(qco2_sem)
plot(qco2_sem,node_attrs = list(shape = "rectangle", color = "Bule",
                                     fillcolor = "Red"))
##结束piecewise SEM

#### 底物随着多样性变化的分析  ########
library(corrplot)
library(Hmisc)
library(relaimpo)
library(PerformanceAnalytics)
library(FactoMineR)
library(MuMIn)
library(piecewiseSEM)
library(ggplot2)
library(doBy)
library(ggpubr) #绘制条形图需要的包
library(rstatix) #做参数检验需要的包
library(ggforce)
library(tidyverse)
library(data.table)
library(dplyr)

#导入底物呼吸数据
dir()
data_sub=read.csv("Sub_long.csv", sep=",", header = T)
str(data_sub)
head(data_sub)

##把单位转换从 ug C per MBC 成 mg C per gram MBC
data_sub$qSubCO2 <- data_sub$qSubCO2/1000

##变量排序
data_sub$Diversity <- factor(data_sub$Diversity,levels=c("O","D0","D2","D4","D6","D8"))
data_sub$Landuse <- factor(data_sub$Landuse,levels=c("Forest","Grassland","Cropland"))
str(data_sub)
head(data_sub)

## 如果是长表格，再进行排序 ##
data_sub$Sub_label <- factor(data_sub$Sub_label,
                       levels=c("No substrate","L-Alanine",
                                "L-Arginine","N-Acetyl-D-glucosamine",
                                "D-Fructose","D-Trehalose",
                                "D-Glucose","Oxalic acid"))
data_sub$Cat <- factor(data_sub$Cat,
                           levels=c("Water","Amino acids","Carbohydrates","Carboxylic Acids"))

# 使用 subset 函数根据条件去掉行
# data_sub <- subset(data_sub, Sub != "Water")
# str(data_sub)

## 底物随着多样性的变化规律
str(data_sub)
fig_sub_land <- ggboxplot(data_sub,
                          x = "Diversity",
                          y = "qSubCO2",
                          combine= TRUE,
                          add = "jitter",
                          fill = "Diversity", 
                          scales = "free",
                          palette = "uchicago",
                          facet.by = c("Sub_label"))+ 
  facet_wrap(~ Sub_label, nrow = 2, ncol = 4)+
  scale_y_continuous(limits = c(0, 1.5),labels = scales::number_format(accuracy = 0.1))+
  # 由于不同底物下呼吸的差异，对y进行2个尺度的划分，0-1.5和0-3
  #scale_y_continuous(limits = c(0, 3),labels = scales::number_format(accuracy = 0.1))+
  theme(axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        strip.text = element_text(size = 14, face = "bold"),
        plot.background = element_rect(fill = "transparent", color = NA), 
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1)

fig_sub_land
ggsave("fig_sub_land.png", plot = fig_sub_land, device = "png", width = 13, height = 7, dpi = 300, bg = "transparent")
#ggsave("fig_sub_land2.png", plot = fig_sub_land, device = "png", width = 13, height = 7, dpi = 300, bg = "transparent")


#### 底物变化对CO2的影响 ####
#导入底物呼吸数据
dir()
data_sub_wide=read.csv("Sub_wide.csv", sep=",", header = T)
str(data_sub_wide)
#data_sub_wide$Diversity <- factor(data_sub_wide$Diversity, levels = c("O", "D0", "D2","D4","D8"), ordered= T)

library(randomForest)
library(rfPermute)
library(ggplot2)
library(ggpubr)
library(pdp)
library(MASS)
library(A3)
library(lme4)
library(tibble)

set.seed(123)
model_sub_co2 <- randomForest(log(qco2)~
                               BAS_q_log+
                               PTA_q_log+
                               JAS_q_log+
                               PTT_q_log+
                               GT_q_log+
                               HZT_q_log+
                               CS_q_log,
                           data = data_sub_wide,
                           ntree=1000,
                           ntry =2,
                           importance=TRUE,
                           proximity=TRUE
                          )
summary(model_sub_co2)
varImpPlot(model_sub_co2)

# 进行变量的显著性分析
set.seed(123) 
RF_model_sub_2 <- rfPermute(log(qco2)~
                              BAS_q_log+
                              PTA_q_log+
                              JAS_q_log+
                              PTT_q_log+
                              GT_q_log+
                              HZT_q_log+
                              CS_q_log,
                            data = data_sub_wide,
                            importance=TRUE,            
                            ntree=1000,            
                            nrep=100,           
                            num.cores = 1)            
summary(RF_model_sub_2)    
imp.3 <- importance(RF_model_sub_2)            
imp.3

# 读入数据，数据从随机森林模型获取，手工录入excel，然后进行下面绘图
data_rf_sub=read.csv("FR_sub.csv", sep=",", header = T)
names(data_rf_sub)
str(data_rf_sub)

data_rf_sub$Sub <- reorder(data_rf_sub$Sub, -data_rf_sub$value)
data_rf_sub$Sub <- factor(data_rf_sub$Sub, levels = c("N-Acetyl-D-glucosamine", 
                                                      "L-Arginine", 
                                                      "L-Alanine",
                                                      "Oxalic acid",
                                                      "D-Fructose",
                                                      "D-Trehalose",
                                                      "D-Glucose"), ordered= T)

data_rf_sub$Sub <- factor(data_rf_sub$Sub, levels = c("D-Glucose",
                                                      "D-Trehalose",
                                                      "D-Fructose",
                                                      "Oxalic acid",
                                                      "L-Alanine",
                                                      "L-Arginine",
                                                      "N-Acetyl-D-glucosamine"), ordered= T)

# 绘制横向柱状图，并调整坐标轴位置
rf_sub_qco2 <- ggbarplot(data_rf_sub, 
                         x = "Sub", 
                         y = "value",
                         fill = "steelblue",
                         orientation = "horiz",
                         palette = "uchicago") +
  scale_y_continuous(position = "right") +  # Y轴在左侧
  # scale_x_discrete(position = "bottom") +
  #scale_y_continuous(expand = c(0, 0))+# 将柱状图水平显示
  theme_bw()+
  theme(
    #panel.border = element_rect(colour = "black", fill = NA, size = 1),
    axis.text.x = element_text(size = 15),
    axis.text.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )
rf_sub_qco2
ggsave("rf_sub_qco2.png", plot = rf_sub_qco2, device = "png", width = 5, height = 6, dpi = 300, bg = "transparent")

####从随时森林里面获得sub与QCO2的偏相关关系
## PTA 绘图
PTA_q_log <- partial(model_sub_co2,
                     pred.var = "PTA_q_log",
                     plot = TRUE,
                     rug = TRUE)
PTA_q_log

PTA_q_log <- partial(model_sub_co2, 
                   pred.var = "PTA_q_log", 
                   plot = FALSE)
head(PTA_q_log)

f_PTA_q_log <- ggplot(PTA_q_log, aes(x = PTA_q_log, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
   theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
f_PTA_q_log
ggsave("f_PTA_q_log.jpg", plot = f_PTA_q_log, device = "jpeg", width = 4, height = 4, dpi = 300)


## JAS 绘图
JAS_q_log <- partial(model_sub_co2, pred.var = "JAS_q_log", plot = TRUE, rug = TRUE,
                     main = "Partial Dependence of medv on rm",
                     xlab = "Average Number of Rooms per Dwelling (rm)",
                     ylab = "Predicted medv")
JAS_q_log

JAS_q_log <- partial(model_sub_co2, 
                     pred.var = "JAS_q_log", 
                     plot = FALSE)
head(JAS_q_log)

f_JAS_q_log <- ggplot(JAS_q_log, aes(x = JAS_q_log, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
f_JAS_q_log
ggsave("f_JAS_q_log.jpg", plot = f_JAS_q_log, device = "jpeg", width = 4, height = 4, dpi = 300)

### BAS绘图
BAS_q_log <- partial(model_sub_co2, pred.var = "BAS_q_log", plot = TRUE, rug = TRUE,
                     main = "Partial Dependence of medv on rm",
                     xlab = "Average Number of Rooms per Dwelling (rm)",
                     ylab = "Predicted medv")
BAS_q_log

BAS_q_log <- partial(model_sub_co2, 
                     pred.var = "BAS_q_log", 
                     plot = FALSE)
head(BAS_q_log)

f_BAS_q_log <- ggplot(BAS_q_log, aes(x = BAS_q_log, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
f_BAS_q_log
ggsave("f_BAS_q_log.jpg", plot = f_BAS_q_log, device = "jpeg", width = 4, height = 4, dpi = 300)

## 草酸绘图
CS_q_log <- partial(model_sub_co2, pred.var = "CS_q_log", plot = TRUE, rug = TRUE,
                     main = "Partial Dependence of medv on rm",
                     xlab = "Average Number of Rooms per Dwelling (rm)",
                     ylab = "Predicted medv")
CS_q_log


CS_q_log <- partial(model_sub_co2, 
                     pred.var = "CS_q_log", 
                     plot = FALSE)
head(CS_q_log)

f_CS_q_log <- ggplot(CS_q_log, aes(x = CS_q_log, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
f_CS_q_log
ggsave("f_CS_q_log.jpg", plot = f_CS_q_log, device = "jpeg", width = 4, height = 4, dpi = 300)

#### 微生物门对CO2的影响####
library(randomForest)
library(rfPermute)
library(ggplot2)
library(ggpubr)
library(pdp)
library(MASS)
library(A3)
library(caret)# 检验模型显著性
# 导入数据 
dir()
data_asv=read.csv("Dataset.csv", sep=",", header = T)
names(data_asv)
str(data_asv)
## 分析微生物门对qCO2的影响
set.seed(123)
RF_model_taxa <- randomForest(qco2~Chloroflexi+
                             Proteobacteria+
                             Actinobacteriota+
                             Verrucomicrobiota+
                             Bacteroidota+
                             Planctomycetota+
                             Acidobacteriota+
                             Gemmatimonadota+
                             Deinococcota+
                             Myxococcota+
                             Ascomycota+
                             Mortierellomycota+
                             Basidiomycota+
                             Chytridiomycota+
                             Rozellomycota,
                           data = data_asv,
                           ntree=1000,
                           ntry =2,
                           importance=TRUE,
                           proximity=TRUE)
summary(RF_model_taxa)
varImpPlot(RF_model_taxa)
plot(RF_model_taxa)
importance(RF_model_taxa)

# 各门显著性分析
set.seed(123) 
RF_model_taxa2 <- rfPermute(qco2~Chloroflexi+
                          Proteobacteria+
                          Actinobacteriota+
                          Verrucomicrobiota+
                          Bacteroidota+
                          Planctomycetota+
                          Acidobacteriota+
                          Gemmatimonadota+
                          Deinococcota+
                          Myxococcota+
                          Ascomycota+
                          Mortierellomycota+
                          Basidiomycota+
                          Chytridiomycota+
                          Rozellomycota,
                        data = data_asv,
                        importance=TRUE,            
                        ntree=1000,            
                        nrep=100,           
                        num.cores = 1)            
print(RF_model_taxa2)    
imp.000 <- importance(RF_model_taxa2,scale = TRUE)            
imp.000

## 绘图微生物门对呼吸影
# 读入数据，数据从随机森林模型获取，手工录入excel，然后进行下面绘图
data_rf_taxa=read.csv("FR_taxa.csv", sep=",", header = T)
names(data_rf_taxa)
str(data_rf_taxa)
data_rf_taxa$Taxa <- factor(data_rf_taxa$Taxa, levels = c("Ascomycota", 
                                                          "Basidiomycota",
                                                          "Gemmatimonadota",
                                                          "Chloroflexi",
                                                          "Chytridiomycota",
                                                          "Rozellomycota",
                                                          "Actinobacteriota",
                                                          "Myxococcota",
                                                          "Mortierellomycota",
                                                          "Verrucomicrobiota",
                                                          "Deinococcota",
                                                          "Acidobacteriota",
                                                          "Bacteroidota",
                                                          "Planctomycetota",
                                                          "Proteobacteria"), 
                                                     ordered= T)
# 每个微生物随机森林对qco2影响的图
rf_taxa_qco2 <- ggbarplot(data_rf_taxa, 
                         x = "Taxa", 
                         y = "value",
                         fill = "steelblue",
                         orientation = "horiz",
                         palette = "uchicago") +
  scale_y_continuous(position = "right") +  # Y轴在左侧
  # scale_x_discrete(position = "bottom") +
  #scale_y_continuous(expand = c(0, 0))+# 将柱状图水平显示
  theme_bw()+
  theme(
    #panel.border = element_rect(colour = "black", fill = NA, size = 1),
    axis.text.x = element_text(size = 15),
    axis.text.y = element_text(size = 14),
    axis.title.x = element_text(size = 14),
    axis.title.y = element_text(size = 14)
  )
rf_taxa_qco2
ggsave("rf_taxa_qco2.png", plot = rf_taxa_qco2, device = "png", width = 5, height = 6, dpi = 300, bg = "transparent")

## 随机森林的partial analysis
## Proteobacteria
Proteobacteria <- partial(RF_model_taxa, pred.var = "Proteobacteria", plot = TRUE, rug = TRUE,
                       main = "Partial Dependence of medv on rm",
                       xlab = "Average Number of Rooms per Dwelling (rm)",
                       ylab = "Predicted medv")
Proteobacteria

Proteobacteria <- partial(RF_model_taxa, 
                    pred.var = "Proteobacteria", 
                    plot = FALSE)
head(Proteobacteria)

Proteobacteria <- ggplot(Proteobacteria, aes(x = Proteobacteria, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Proteobacteria
ggsave("fig_Proteobacteria.jpg", plot = Proteobacteria, device = "jpeg", width = 3, height = 4, dpi = 300)


## Planctomycetota
Planctomycetota <- partial(RF_model_taxa, pred.var = "Planctomycetota", plot = TRUE, rug = TRUE,
                       main = "Partial Dependence of medv on rm",
                       xlab = "Average Number of Rooms per Dwelling (rm)",
                       ylab = "Predicted medv")
Planctomycetota

Planctomycetota <- partial(RF_model_taxa, 
                          pred.var = "Planctomycetota", 
                          plot = FALSE)
head(Planctomycetota)

Planctomycetota <- ggplot(Planctomycetota, aes(x = Planctomycetota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Planctomycetota
ggsave("fig_Planctomycetota.jpg", plot = Planctomycetota, device = "jpeg", width = 3, height = 4, dpi = 300)

## Bacteroidota
Bacteroidota <- partial(RF_model_taxa, pred.var = "Bacteroidota", plot = TRUE, rug = TRUE,
                           main = "Partial Dependence of medv on rm",
                           xlab = "Average Number of Rooms per Dwelling (rm)",
                           ylab = "Predicted medv")
Bacteroidota

Bacteroidota <- partial(RF_model_taxa, 
                           pred.var = "Bacteroidota", 
                           plot = FALSE)
head(Bacteroidota)

Bacteroidota <- ggplot(Bacteroidota, aes(x = Bacteroidota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Bacteroidota
ggsave("fig_Bacteroidota.jpg", plot = Bacteroidota, device = "jpeg", width = 3, height = 4, dpi = 300)

## Acidobacteriota
Acidobacteriota <- partial(RF_model_taxa, pred.var = "Acidobacteriota", plot = TRUE, rug = TRUE,
                        main = "Partial Dependence of medv on rm",
                        xlab = "Average Number of Rooms per Dwelling (rm)",
                        ylab = "Predicted medv")
Acidobacteriota

Acidobacteriota <- partial(RF_model_taxa, 
                        pred.var = "Acidobacteriota", 
                        plot = FALSE)
head(Acidobacteriota)

Acidobacteriota <- ggplot(Acidobacteriota, aes(x = Acidobacteriota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Acidobacteriota
ggsave("fig_Acidobacteriota.jpg", plot = Acidobacteriota, device = "jpeg", width = 3, height = 4, dpi = 300)

## Deinococcota
Deinococcota <- partial(RF_model_taxa, pred.var = "Deinococcota", plot = TRUE, rug = TRUE,
                           main = "Partial Dependence of medv on rm",
                           xlab = "Average Number of Rooms per Dwelling (rm)",
                           ylab = "Predicted medv")
Deinococcota

Deinococcota <- partial(RF_model_taxa, 
                           pred.var = "Deinococcota", 
                           plot = FALSE)
head(Deinococcota)

Deinococcota <- ggplot(Deinococcota, aes(x = Deinococcota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Deinococcota
ggsave("fig_Deinococcota.jpg", plot = Deinococcota, device = "jpeg", width = 3, height = 4, dpi = 300)

## Verrucomicrobiota
Verrucomicrobiota <- partial(RF_model_taxa, pred.var = "Verrucomicrobiota", plot = TRUE, rug = TRUE,
                           main = "Partial Dependence of medv on rm",
                           xlab = "Average Number of Rooms per Dwelling (rm)",
                           ylab = "Predicted medv")
Verrucomicrobiota

Verrucomicrobiota <- partial(RF_model_taxa, 
                        pred.var = "Verrucomicrobiota", 
                        plot = FALSE)
head(Verrucomicrobiota)

Verrucomicrobiota <- ggplot(Verrucomicrobiota, aes(x = Verrucomicrobiota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Verrucomicrobiota
ggsave("fig_Verrucomicrobiota.jpg", plot = Verrucomicrobiota, device = "jpeg", width = 3, height = 4, dpi = 300)

## Mortierellomycota
Mortierellomycota <- partial(RF_model_taxa, pred.var = "Mortierellomycota", plot = TRUE, rug = TRUE,
                           main = "Partial Dependence of medv on rm",
                           xlab = "Average Number of Rooms per Dwelling (rm)",
                           ylab = "Predicted medv")
Mortierellomycota

Mortierellomycota <- partial(RF_model_taxa, 
                             pred.var = "Mortierellomycota", 
                             plot = FALSE)
head(Mortierellomycota)

Mortierellomycota <- ggplot(Mortierellomycota, aes(x = Mortierellomycota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Mortierellomycota
ggsave("fig_Mortierellomycota.jpg", plot = Mortierellomycota, device = "jpeg", width = 3, height = 4, dpi = 300)

## Myxococcota
Myxococcota <- partial(RF_model_taxa, pred.var = "Myxococcota", plot = TRUE, rug = TRUE,
                             main = "Partial Dependence of medv on rm",
                             xlab = "Average Number of Rooms per Dwelling (rm)",
                             ylab = "Predicted medv")
Myxococcota

Myxococcota <- partial(RF_model_taxa, 
                             pred.var = "Myxococcota", 
                             plot = FALSE)
head(Myxococcota)

Myxococcota <- ggplot(Myxococcota, aes(x = Myxococcota, y = yhat)) +
  geom_line(color = "black", size = 1)+
  theme_bw()+
  theme(
    axis.text.x = element_text(size = 18,color = "black"),  
    axis.text.y = element_text(size = 18,color = "black"),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    legend.text = element_text(size = 12, color = "brown"),  
    legend.title = element_text(size = 14, color = "brown"),
    axis.line = element_line(size = 1, color = "black"),
    axis.ticks = element_line(size = 1))
Myxococcota
ggsave("fig_Myxococcota.jpg", plot = Myxococcota, device = "jpeg", width = 3, height = 4, dpi = 300)


#### 微生物多样性随着梯度的变化绘图 ####
# 导入数据 
library(scales)
dir.create("Alpha_Out")
data_div=read.csv("diversity_graph.csv", sep=",", header = T)
names(data_div)
str(data_div)

#设置分类变量
data_div$Diversity <- factor(data_div$Diversity, levels = c("O", "D0", "D2","D4","D8"), ordered= T)
data_div$Landuse <- factor(data_div$Landuse, levels = c("Forest", "Grassland", "Cropland"), ordered= T)
str(data_div)
head(data_div)

# Bacteria
Bac_diversity <- ggbarplot(data_div,
                           x = "Diversity",
                           y = "Shannon_B",
                           #color = "Diversity",
                           add = "mean_se",
                           palette = "uchicago",
                           fill = "Diversity",
                           facet.by = "Landuse")+
  scale_y_continuous(limits = c(0, 10.5))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 24, face = "bold"),
        legend.title = element_blank(),
        legend.position = "none",
        strip.text = element_text(size = 22, face = "bold"),
        strip.background = element_rect(color = "black", 
                                        size = 1, fill = "transparent"),
        plot.background = element_rect(fill = "transparent", color = NA),  # 设置图形背景透明
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1)
Bac_diversity

ggsave("~/Documents/Research/Diversity of microbe /R analysis_v2/Alpha_Out/Bac_diversity2.png", 
       plot = Bac_diversity, 
       device = "png", 
       width = 10, 
       height = 4, 
       dpi = 300, 
       bg = "transparent")
 

# Fungi 真菌
Fun_diversity <- ggbarplot(data_div,
                           x = "Diversity",
                           y = "Shannon_F",
                           #color = "Diversity",
                           add = "mean_sd",
                           palette = "uchicago",
                           fill = "Diversity",
                           facet.by = "Landuse")+
  scale_y_continuous(limits = c(0, 8),labels = number_format(accuracy = 0.1))+
  theme(axis.text.x = element_text(size = 18),
        axis.text.y = element_text(size = 18),
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        axis.ticks = element_line(size = 1),
        legend.key.size = unit(1, "cm"),
        legend.text = element_text(size = 20, face = "bold"),
        legend.title = element_blank(),
        legend.position = "none",
        strip.text = element_text(size = 22, face = "bold"),
        strip.background = element_rect(color = "black", 
                                        size = 1, fill = "transparent"),
        plot.background = element_rect(fill = "transparent", color = NA),  # 设置图形背景透明
        panel.background = element_rect(fill = "transparent", color = NA))+
  border(color = "black", size = 1)
Fun_diversity
ggsave("~/Documents/Research/Diversity of microbe /R analysis_v2/Alpha_Out/Fungi_diversity.png", 
       plot = Fun_diversity, 
       device = "png", 
       width = 10, 
       height = 4, 
       dpi = 300, 
       bg = "transparent")

## Analysis end




