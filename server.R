library(ggplot2)
library(dplyr)
library(tidyr)
library(broom)
library(forcats)
library(magrittr)
library(scales)
library(ggjoy)
library(purrr)
theme_set(theme_bw())

library(shiny)

shinyServer(function(input, output) {
  
  source('1_pull_reformat.R')

  timeplot <- reactive({
    
   p =  mydata %>%
      filter(redcap_data_access_group.factor %in% input$dag) %>% 
      mutate(Record = 'Record') %>% 
      ggplot(aes(text = paste('ID:', record_id), x = date, fill = is_complete, y = Record)) +
      geom_quasirandom(shape=21, colour='#878787', size=2) +
      facet_wrap(~redcap_data_access_group.factor, ncol = 1) +
      theme_bw() +
      #coord_flip() +
      scale_fill_manual('', values = c('#377eb8', '#e41a1c'), drop = FALSE) +
      #scale_fill_brewer(palette = 'Paired') +
      ylab('') +
      xlab('') +
      theme(axis.text.y = element_blank(),
            axis.ticks.y = element_blank(),
            panel.grid.major.y = element_blank(),
            legend.position = 'top',
            axis.text.x = element_text(colour='black', size = 14),
            #strip.text = element_text(size = 20),
            legend.text = element_text(size = 25)) +
      #ggtitle(mytitle$mytitle)  +
      scale_x_datetime(date_breaks = '1 month',
                       limits = dmy(c('1/1/1980', '1/01/1981')),
                       date_labels = '%b',
                       expand = c(0,0))
    
    p
    
  })
  
  output$timeplot <- renderPlot({
    
    p = timeplot()

    
    print(p)
    
  })

  output$timeplotly <- renderPlotly({
    
  p = timeplot()
  
  plotly::ggplotly(p)

  })
  
  
  output$joyplot <- renderPlot({
    
    mydata %>% 
      filter(redcap_data_access_group.factor %in% input$dag) %>% 
      ggplot(aes(x = as.numeric(date), y = redcap_data_access_group.factor, fill = ..x..)) +
      geom_joy_gradient(scale = 4, alpha = 0.8) + theme_joy() +
      scale_y_discrete(expand = c(0.01, 0)) +   # will generally have to set the `expand` option
      scale_x_continuous(expand = c(0, 0)) +
      scale_fill_distiller(palette = 'PiYG', guide = F) +
      xlab('Time') +
      ylab('') +
      ggtitle('Records entered over time') +
      theme(axis.text.x = element_blank())
    
  })

})
