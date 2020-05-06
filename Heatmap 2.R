library(ggplot2)
library(ggTimeSeries)
library(readxl)
library(data.table)
library(gridExtra)

#Definindo a Área de Trabalho
setwd("C:/Users/allan/Documents/R/Heatmap Projects")

#Importando os dados do excel
tabela <- read_excel("dados_calheatmap.xlsx")

# DADOS indicados por dX
# dANPEC
dANPEC = ggplot_calendar_heatmap(
        tabela,
        'Data', 'ANPEC',
        dayBorderSize = 1, dayBorderColour = "#fafafa",
        monthBorderSize = 1, monthBorderColour = "#fafafa")

#dTCC
dTCC = ggplot_calendar_heatmap(
  tabela,
  'Data', 'TCC',
  dayBorderSize = 1, dayBorderColour = "#fafafa",
  monthBorderSize = 1, monthBorderColour = "#fafafa")

dRprog = ggplot_calendar_heatmap(
  tabela,
  'Data', 'Rprog',
  dayBorderSize = 1, dayBorderColour = "#fafafa",
  monthBorderSize = 1, monthBorderColour = "#fafafa")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# Plot
# pANPEC
pANPEC = dANPEC + 
  ylab(NULL) + 
  xlab("ANPEC") + 
  scale_fill_steps(low = "#fafafa", high = "#009133", limits = c(0,4)) + 
  facet_wrap(~Year, ncol = 1) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = 'none')
  
pTCC = dTCC + 
  ylab(NULL) +
  xlab("TCC") +
  scale_fill_steps(low = "#222222", high = "#000594", limits = c(0,4)) +
  theme(axis.text = element_blank(),
        axis.ticks = element_blank(),
        legend.position = 'none')

pRprog = dRprog+
    ylab(NULL) +
    xlab("Rprog")+
      scale_fill_steps(low ="#fafafa", high = "#ff001e", limits = c(0,4))+
      theme(axis.text = element_blank(),
            axis.ticks = element_blank(),
            legend.position = 'none')
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
grid.arrange(pANPEC, pTCC, pRprog, nrow = 3)