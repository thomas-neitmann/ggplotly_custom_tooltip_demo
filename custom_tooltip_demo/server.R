library(shiny)
library(plotly)
library(ggplot2)

shinyServer(function(input, output) {

    d <- mtcars %>%
        group_by(cyl) %>%
        summarise(n = n()) %>%
        mutate(perc = n / sum(n) * 100,
               tooltip = paste0(n, " (", round(perc , 1), "%)"),
               cyl = reorder(cyl, perc))

    output$default <- renderPlotly({

        p <- ggplot(d, aes(cyl, n)) +
            geom_col(width = 0.7) +
            coord_flip()

        ggplotly(p)

    })

    output$custom <- renderPlotly({

        p <- ggplot(d, aes(cyl, n, text = tooltip)) +
            geom_col(width = 0.7) +
            coord_flip()

        ggplotly(p, tooltip = "text")

    })

})
