library(shiny)
library("ggplot2")
server <- function(input, output, session) {
  Data <- reactive({
    file <- input$file1
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "csv", "Please upload a csv file"))
    read.csv(file$datapath, header = input$header)
  })
  
  output$contents <- renderTable({
    file <- input$file1
    ext <- tools::file_ext(file$datapath)
    
    req(file)
    validate(need(ext == "csv", "Please upload a csv file"))
    
    data = read.csv(file$datapath, header = input$header)
    head(data,5)
  })
  observe({
    x <- input$file1
    
    updateSelectInput(session, "inSelect",
                      label = "Select X var",
                      choices = colnames(Data()),
                      selected = NULL
    )
  })
  
  observe({
    x <- input$file1
    
    updateSelectInput(session, "inSelect2",
                      label = "Select Y var",
                      choices = colnames(Data()),
                      selected = NULL
    )
  })
  output$plot1 <-renderPlot(
    if(input$plottype=="dot"){
      ggplot(Data(), aes_string(x=input$inSelect, y=input$inSelect2)) + geom_point()
    }else if(input$plottype=="box"){
      ggplot(Data(), aes_string(x=input$inSelect, y=input$inSelect2)) + geom_boxplot()
    }
  )
}