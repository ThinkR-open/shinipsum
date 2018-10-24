library(shiny)
library(shinipsum)
ui <- fluidPage(
  h2("A Random DT"),
  dataTableOutput("data_table"),
  h2("A Random Image"),
  plotOutput("image"),
  h2("A Random Plot"),
  plotOutput("plot"),
  h2("A Random Print"),
  verbatimTextOutput("print"),
  h2("A Random Table"),
  tableOutput("table"),
  h2("A Random Text"),
  tableOutput("text")
)
server <- function(input, output, session) {
  output$data_table <- renderDataTable({
    random_table(10, 5)
  })
  output$image <- renderImage({
    random_image()
  })
  output$plot <- renderPlot({
    random_ggplot()
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
