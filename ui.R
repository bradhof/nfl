load("awayteams.rda")
load("hometeams.rda")
load("condition.rda")
load("surfaces.rda")


shinyUI(fluidPage(
     headerPanel("NFL Game Prediction"),
     sidebarPanel(
          helpText("This app predicts the output of future NFL games using a linear model"),
          helpText("Select the teams and attributes of a game to predict"),
          hr(),
          selectInput('awayTeam','Away Team', levels(awayTeams)),
          selectInput('homeTeam','Home Team', levels(homeTeams), selected=levels(homeTeams)[2]), 
          sliderInput('temp','Temperature (F)', value=72, min=0, max=100, step=1),
          selectInput('condition','Weather', levels(conditions), selected=levels(conditions)[2]),
          selectInput('surface','Surface', levels(surfaces)),
          sliderInput('line','Home Point Spread', value=-3, min=-14, max=14, step=0.5)
     ),
     mainPanel(
          h3("Game Prediction"),
          textOutput("teamHeader"),
          verbatimTextOutput("homescore"),
          br(),
          htmlOutput("gamedetails"),
          br(),
          br(),
          plotOutput("models")

     )
))