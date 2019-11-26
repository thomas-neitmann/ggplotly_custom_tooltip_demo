library(shiny)
library(plotly)
library(shinycustomloader)

shinyUI(fluidPage(
    titlePanel("Customizing Tooltips"),
    fluidRow(
        column(
            width = 6,
            h4("Default Tooltip")
        ),
        column(
            width = 6,
            h4("Custom Tooltip")
        )
    ),
    fluidRow(
        column(
            width = 6,
            wellPanel(withLoader(plotlyOutput("default")))
        ),
        column(
            width = 6,
            wellPanel(withLoader(plotlyOutput("custom"), loader = "pacman"))
        )
    )
))
