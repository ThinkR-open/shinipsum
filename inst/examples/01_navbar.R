library(shiny)
library(shinipsum)
library(ggplot2)
library(plotly)
ui <- navbarPage(
  "A random App",
  tabPanel(
    "DT",
    h2("A Random DT"),
    dataTableOutput("data_table")),
  tabPanel("Image",
           h2("A Random Image"),
           plotOutput("image")),
  tabPanel("Plot",
           h2("A Random Plot"),
           plotlyOutput("plot")),
  tabPanel("Print",
           h2("A Random Print"),
           verbatimTextOutput("print")),
  tabPanel("Table",
           h2("A Random Table"),
           tableOutput("table")),
  tabPanel("Text",
           h2("A Random Text"),
           tableOutput("text"))
)

server <- function(input, output, session) {
  output$data_table <- renderDataTable({
    random_table(10, 5)
  })
  output$image <- renderImage({
    random_image()
  })
  output$plot <- renderPlotly({
    random_ggplotly()
  })
  output$print <- renderPrint({
    random_print("model")
  })
  output$table <- renderTable({
    random_table(10, 5)
  })
  output$text <- renderText({
    random_text(nwords = 50)
  })
}
shinyApp(ui, server)
