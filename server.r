bmi <- function(height,weight)
    round((weight/(height^2))*703,1)

wh_ratio <- function(waist,hip)
    round(waist/hip,2)

bmi_risk <- function(bmi)
    if (bmi <= 15.0) {
        "Very severely underweight"
    } else if (bmi <= 16.0) {
        "Severely underweight"
    } else if (bmi <= 18.5) {
        "Underweight"
    } else if (bmi <= 25.0) {
        "Normal (healthy weight)"
    } else if (bmi <= 30.0) {
        "Overweight"
    } else if (bmi <= 35.0) {
        "Obese Class I (Moderately obese)"
    } else if (bmi <= 40.0) {
        "Obese Class II (Severely obese)"
    } else {
        "Obese Class III (Very severely obese)"
    }

ratio_risk <- function(gender,waist,ratio)
    if (gender == "female") {
        if (waist > 34 | ratio >= 0.85) {
            "Substantially increased risk of metabolic complications"
        } else if (waist >= 31) {
            "Increased risk of metabolic complications"
        } else {
            "No increase in risk of metabolic complications"
        }
    } else if (gender == "male") {
        if (waist >= 40 | ratio >= 0.90) {
            "Substantially increased risk of metabolic complications"
        } else if (waist > 37) {
            "Increased risk of metabolic complications"
        } else {
            "No increase in risk of metabolic complications"
        }
    }

shinyServer(
    function(input, output) {
        output$height <- renderText({paste0("Height = ",input$height%/%12,"'",input$height%%12,"\"")})
        output$weight <- renderText({paste0("Weight = ",input$weight," lbs")})
        output$gender <- renderText({paste0("Gender = ",input$gender)})
        output$waist <- renderText({paste0("Waist = ",input$waist,"\"")})
        output$hip <- renderText({paste0("Hip = ",input$hip,"\"")})
        output$some_txt <- renderText({
            if (input$calcButton==0) { "" }
            else { "Based on these parameters, your results are:" }
            })
        output$bmi <- renderText({
            if (input$calcButton==0) { "" }
            else isolate(paste0("Body Mass Index (BMI) = ",bmi(input$height,input$weight)," [",bmi_risk(bmi(input$height,input$weight)),"]"))
            })
        output$wh_ratio <- renderText({
            if (input$calcButton==0) { "" }
            else isolate(paste0("Waist-to-Hip Ratio = ",wh_ratio(input$waist,input$hip)," [",ratio_risk(input$gender,input$waist,wh_ratio(input$waist,input$hip)),"]"))
            })
    }
)
