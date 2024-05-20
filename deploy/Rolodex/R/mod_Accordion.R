#' Accordion UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList



mod_Accordion_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("accord"))

  )

}

#' Accordion Server Functions
#'
#' @noRd
mod_Accordion_server <- function(id, selector, title, data, Visible){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    info<-ns

    if(Visible == F){
      output$accord<-renderUI({})
    } else {
      output$accord<-renderUI({
        tagList(
          f7AccordionItem(multiCollapse = F,f7Block(br(),
                                                    mod_info_ui(id),
                                                    hr()

          ),

          title = title, open=F))




      })
    }
  }) # Closes moduleServer
}



## To be copied in the UI
# mod_Accordion_ui("Accordion_1")

## To be copied in the server
# mod_Accordion_server("Accordion_1")
