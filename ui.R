library(shiny)

shinyUI(fluidPage(
    titlePanel("Measures of Obesity and Metabolic Complications"),
    sidebarPanel(
        sliderInput('height', 'Height (inches)', value=68, min=54, max=84, step=1),
        sliderInput('weight', 'Weight (lbs)', value=140, min=80, max=400, step=1),
        radioButtons('gender', 'Gender', c("Female"="female", "Male"="male"), selected="female", inline=TRUE),
        sliderInput('waist', 'Waist Circumference (inches)', value=30, min=20, max=60, step=1),
        sliderInput('hip', 'Hip Circumference (inches)', value=32, min=20, max=60, step=1),
        actionButton("calcButton", "Calculate")
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("Results", 
                     verbatimTextOutput("height"),
                     verbatimTextOutput("weight"),
                     verbatimTextOutput("gender"),
                     verbatimTextOutput("waist"),
                     verbatimTextOutput("hip"),
                     strong(verbatimTextOutput("some_txt")),
                     strong(verbatimTextOutput("bmi"), style="color:blue"),
                     strong(verbatimTextOutput("wh_ratio"), style="color:blue")
                     ),
            tabPanel("Documentation",
                     h4("This application:"),
                     tags$ul(
                         tags$li("Calculates body mass index (BMI)."),
                         tags$li("Provides BMI category."),
                         tags$li("Calculates waist-to-hip ratio."),
                         tags$li("Provides risk of metabolic complications.")
                         ),
                     br(),
                     h4("Instructions:"),
                     tags$ul(
                         tags$li("Waist circumference measurement should be taken at the level of the umbilicus or navel (belly button)."),
                         tags$li("Hip circumference measurement should be taken around the widest portion of the buttocks.")
                         )
                     )
        )
    )
))
