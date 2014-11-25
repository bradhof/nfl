load("HS.rda")
load("RS.rda")

shinyServer(
     function(input, output) {
          output$teamHeader <- renderText({
               away <- input$awayTeam
               home <- input$homeTeam
               paste(away, '@', home)
          
          })
          
          output$gamedetails <- renderUI({
               HTML(paste("Game Details",
                   "<li>Vegas Line: ", input$line, 
                   "<li>Surface: ", input$surface,
                   "<li>Temp: ", input$temp, "F",
                   "<li>Weather: ", input$condition))
          })

               
          output$homescore <- renderText({
               if (input$awayTeam == input$homeTeam)
               {
                    "ERROR: HOME TEAM AND AWAY TEAM CAN NOT BE THE SAME"
               }
               else
               {
                    
                    ds <- data.frame(home.team=input$homeTeam,
                                     away.team=input$awayTeam,
                                     Line=input$line,
                                     Surface=input$surface,
                                     temp=input$temp,
                                     condition=input$condition
                                     )
                    
                    hs <- round(predict(fit1, ds)[1])
                    rs <- round(predict(fit2, ds)[1])
                         
                    paste(input$awayTeam, ": ", rs, "\n",
                          input$homeTeam, ": ", hs, sep="")
               }
               
          })
          
          output$models <- renderPlot({
               plot(fit1)
               
          })
          
     }
)