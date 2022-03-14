library(shiny)
ui <- fluidPage(
  headerPanel("这是一个轻量级数据可视化网站"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "上传CSV文件", accept = ".csv"),
      checkboxInput("header", "Header", TRUE),
      selectInput("plottype","Select plot type",c("dot","box")),
      selectInput("inSelect", "Select X var",c("")),
      selectInput("inSelect2", "Select Y var",c("")),
    ),
    mainPanel(
      tableOutput("contents"),
      plotOutput("plot1")
    )
  ),
)