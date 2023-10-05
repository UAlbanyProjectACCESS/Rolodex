#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @importFrom stats na.omit
#' @noRd
app_server <- function(input, output, session) {


  # Loading Data ------------------------------------------------

  observeEvent(input$tab,{
    req(input$tab=="Tab1")
    data<-as.data.frame(data)
    PMHdata<-data[data$Type == 'PhysMH',]
  })





  # Welcome Page ------------------------------------------------------------
  observeEvent(input$helppopup, {
    f7Popup(id="NewUserintro1", title= f7Align(h3("Quick Introduction"), side=c("center")), swipeToClose = T, closeButton = T,
            f7Block(
              f7Shadow(
                intensity = 30,
                hover = F,
                f7Card(f7BlockHeader(text="Navigating ACCESS"),
                       f7Align(h4("Use the buttons at the bottom of the screen to navigate to the different tabs"), side=c("center")),
                       hairlines = F, strong = T, inset =
                         F, tablet = FALSE))),
            f7Block(
              f7Shadow(
                intensity = 30,
                hover = F,
                f7Card(f7BlockHeader(text="What do the buttons do?"),
                       h5(f7Icon("search"),"- Search for resources"),
                       h5(f7Icon("calendar_badge_plus"), "- Project ACCESS appointments"),
                       h5(f7Icon("logo_instagram"), "- Follow us on Instagram"),
                       hairlines = F, strong = T, inset =
                         F, tablet = FALSE)),
              br(),
              br(),
              br(),
              br(),
              br(),
              br(),
              f7BlockFooter(f7Align(h4("Swipe up to close this popup"), side=c("center"))))
    )
  })
  observe({
    f7Popup(id="NewUserintro", title= f7Align(h3("Quick Introduction"), side=c("center")), swipeToClose = T, closeButton = T,
            f7Block(
              f7Shadow(
                intensity = 30,
                hover = F,
                f7Card(f7BlockHeader(text="Navigating ACCESS"),
                       f7Align(h4("Use the buttons at the bottom of the screen to navigate to the different tabs"), side=c("center")),
                       hairlines = F, strong = T, inset =
                         F, tablet = FALSE))),
            f7Block(
              f7Shadow(
                intensity = 30,
                hover = F,
                f7Card(f7BlockHeader(text="What do the buttons do?"),
                       h5(f7Icon("search"),"- Search for resources"),
                       h5(f7Icon("calendar_badge_plus"), "- Project ACCESS appointments"),
                       h5(f7Icon("logo_instagram"), "- Follow us on Instagram"),
                       hairlines = F, strong = T, inset =
                         F, tablet = FALSE)),
              br(),
              br(),
              br(),
              br(),
              br(),
              br(),
              f7BlockFooter(f7Align(h4("Swipe up to close this popup"), side=c("center"))))
    )
  })



  output$welcome <- renderUI({
    tagList(
      f7Accordion(id=NULL, multiCollapse = F,
                  f7AccordionItem(title = "About Us", open=F,
                                  f7Block(h3("Project ACCESS is a health service initiative at UAlbany funded by a grant from the federal government and our mission is to help you find and decide on what kind of resources and services might help you."),
                                          hr(),
                                          h4("We offer appointments with peer-navigators to explore free on- and off-campus resources,
                                            education events that help you thrive as a student and in life, and connections to confidential and anonymous on-campus STI testing provided by our community partners"),
                                          HTML('<center><iframe width="auto" height="auto" src="https://www.youtube.com/embed/mbkk2nPw8gY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>'),
                                          f7Align(h6("DEVELOPED IN PART UNDER GRANT NUMBER 1H79SP082142-01 FROM THE SUBSTANCE ABUSE AND MENTAL HEALTH SERVICES ADMINISTRATION (SAMHSA) U.S. DEPARTMENT OF HEALTH AND HUMAN SERVICES (HHS)."), side=c("center")),
                                          hr()
                                  )
                  ),

                  f7AccordionItem(title = "HIV/STI Info", open=F,
                                  f7Block(br(),
                                          f7Align(h3("Check out the video below for up-to-date information about HIV and other STIs common on college campuses"), side=c("center")),
                                          hr(),
                                          br(),
                                          HTML('<center><iframe width="auto" height="auto" src="https://www.youtube.com/embed/PyGk5kYbU-E" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>'),
                                          br(),
                                          hr()
                                  )
                  ),


                  f7AccordionItem(title = "Project Leaders", open=F,
                                  f7Block(f7Align(h2("M. Dolores Cimini, PhD"), side=c("center")),
                                          HTML('<center><img src="https://www.albany.edu/sites/default/files/styles/person_page_thumbnail/public/2022-04/EDU_CiminiMDolores_2021.JPG?h=fdd95cf8&itok=bGHgRgGr" width=60%></center>'),
                                          h5("Dr. M. Dolores Cimini is a New York State licensed psychologist and Director of the Center for Behavioral Health Promotion and Applied Research and Senior Research Scientist in the Department of Educational and Counseling Psychology. She is the former Director of the nationally recognized Middle Earth Peer Assistance Program.
                                Dr. Cimini has led comprehensive efforts in research-to-practice translation at the University at Albany since 1990 with over $10 million in support from the National Institute on Alcohol Abuse and Alcoholism (NIAAA), National Institute on Drug Abuse (NIDA), Substance Abuse and Mental Health Services Administration (SAMHSA), U.S. Department of Education, U.S. Department of Justice’s Office on Violence Against Women, and New York State Office of Addiction Services and Supports."),
                                          hr(),
                                          f7Align(h2("Jessica L. Martin, PhD"), side=c("center")),
                                          HTML('<center><img src="https://www.albany.edu/sites/default/files/styles/person_page_thumbnail/public/2022-10/Martin.jpg?h=8c719d1f&itok=DZ_UoVte" width=60%></center>'),
                                          h5("Jessica L. Martin is a licensed psychologist, a Research Fellow for the School of Education at the University at Albany, SUNY, and a Senior Research Associate for the Research Foundation for SUNY. She was a tenured faculty member in Counseling Psychology at the University at Albany for 11 years before transitioning to research roles and clinical work in private practice.

Dr. Martin’s research expertise is in substance use and other health-risk behaviors among young adults and college students. Specifically, she investigates individual, psychosocial, cultural, and contextual risk and protective factors for substance use and co-occurring disorders and health-risk behaviors (e.g., disordered eating, risky sexual behavior) and health disparities as they relate to substance use."),
                                          hr(),

                                          f7Align(h2("Laura L. Longo, PhD"), side=c("center")),
                                          HTML('<center><img src="https://www.albany.edu/sites/default/files/styles/person_page_thumbnail/public/2023-02/Laura%20Longo.png?h=c4434bf3&itok=ookWO5g4" width=60%></center>'),
                                          h5("Laura M. Longo is a licensed psychologist, and a Senior Research Specialist for the Research Foundation for SUNY. Outside of the Center for Behavioral Health Promotion and Applied Research, Dr. Longo works in a private practice providing psychotherapy and evaluation services. Dr. Longo’s expertise is in the development, implementation, and evaluation of health communication campaigns, and prevention and early intervention services that address substance misuse and suicide prevention. Dr. Longo is passionate about understanding individual, sociocultural, and systemic factors that impact substance use, other areas of mental health, and recovery. Dr. Longo is a recovery ally and an avid social justice advocate."),
                                          hr()
                                  )
                  ),


                  f7AccordionItem(title = "Join Project ACCESS", open=F,
                                  f7Block(br(),
                                          f7Align(h2("We're looking for student all stars with lived experience to join our Peer Advisory Board!"), side=c("left")),
                                          hr(),
                                          f7Align(h4(strong("What is the Peer Advisory Board?")), side=c("center")),
                                          f7Align(h5("The Peer Advisory Board is a group of undergraduate UAlbany students who attend meetings with members of the Project ACCESS team."), side=c("center")),
                                          f7Align(h4(strong("When are the meetings?")), side=c("center")),
                                          f7Align(h5("There are two meetings a month, and meetings last about one hour."), side=c("center")),
                                          f7Align(h4(strong("What are the meetings like?")), side=c("center")),
                                          f7Align(h5("In these meetings, we ask for your feedback about our work (e.g., merchandise design, tabling events, workshops, etc.) and offer opportunities to participate in our work."), side=c("center")),
                                          hr(),
                                          f7Align(h5("Being involved in the Peer Advisory Board is a great item to include on your resume and is a rewarding way to get involved on campus!"), side=c("center")),
                                          hr(),
                                          f7Align(div(f7Link("Join Now!", href="https://forms.gle/dMeVgC7zLxvEpXRk9")), side=c("center"))



                                  )
                  )

      )
    )
  })



  # Install App Instructions Card -------------------------------------------
  output$installapp <- renderUI({
    tagList(
      f7Accordion(id=NULL,
                  f7AccordionItem(title = "iPhone", open=F, multiCollapse=F,
                                  f7Block(br(),
                                          h4("Step 1: Open the website in Safari"),
                                          h4("Step 2: Tap the share button", f7Icon("square_arrow_up"), "at the bottom of the screen"),
                                          h4("Step 3: Scroll down and click 'Add to Home Screen'"),
                                          h4("Step 4: Find the ACCESS app on your homescreen and open up the app"),
                                          f7Align(div(f7Link("Instructions with screenshots", href="https://www.cdc.gov/niosh/mining/content/hearingloss/installPWA.html")),side=c("center")))),


                  f7AccordionItem(title = "Android", open=F, multiCollapse=F,
                                  f7Block(br(),
                                          h4("Step 1: Open the website in Chrome"),
                                          h4("Step 2: Tap the menu in the upper right corner of the screen"),
                                          h4("Step 3: Scroll down and click 'Add to Home Screen', change the name to 'ACCESS'"),
                                          h4("Step 4: Find the ACCESS app on your homescreen and open up the app"),
                                          f7Align(div(f7Link("Instructions with screenshots", href="https://www.cdc.gov/niosh/mining/content/hearingloss/installPWA.html")),side=c("center"))

                                  )))

    )
  })


  # Navigator & STI Appointment Page ----------------------------------------------
  observeEvent(input$tab,{
    req(input$tab=="ApptTab")
    output$appts<- renderUI({
      tagList(
        f7Accordion(id=NULL,
                    f7AccordionItem(title = "Navigator Appointments", open=F,
                                    f7Block(hr(),
                                            f7Align(h3("What can you expect in a Navigator Appointment?"), side=c("center")),
                                            hr(),
                                            f7Align(h5("A non-judgmental environment"), side=c("center")),
                                            f7Align(h5("To learn more about heatlh and wellbeing"), side=c("center")),
                                            f7Align(h5("To connect to on- and off-campus resources"), side=c("center")),
                                            f7Align(h5("To explore options and overcome barriers"), side=c("center")),
                                            f7Align(div(f7Link("Schedule a Navigator Appointment", href="https://calendly.com/d/g6j-syy-7z5")),side=c("center")),
                                            br(),
                                            hr()

                                    )
                    ),


                    f7AccordionItem(title = "HIV/STI Testing Appointments", open=F,
                                    f7Block(hr(),
                                            f7Align(h3("How to Schedule"), side=c("center")),
                                            hr(),
                                            f7Align(h5("Click the link below"), side=c("center")),
                                            f7Align(h5("Pick an available date and time"), side=c("center")),
                                            f7Align(h5("Use a FAKE name, but a REAL Phone Number"), side=c("center")),
                                            f7Align(h5("Receive a video with the discrete Campus Center location via text 24 hours & 1 hour before your appointment"), side=c("center")),
                                            f7Align(div(f7Link("Schedule a Testing Appointment", href="https://calendly.com/ualbanyprojectaccess/testing")), side=c("center")),
                                            f7Align(h5("Appointments are free, confidential, and totally anonymous"), side=c("center")),
                                            hr()
                                    )
                    ),

                    f7AccordionItem(title = "PrEP Intake Appointments", open=F,
                                    f7Block(hr(),
                                            f7Align(h3("What is PrEP?"), side=c("center")),
                                            hr(),
                                            h5("Pre-exposure Prophylaxis (PrEP) is medicine people at risk for HIV take to prevent getting HIV from sex or injection drug use. PrEP can stop HIV from taking hold and spreading throughout your body. Currently, there are two FDA-approved daily oral medications for PrEP. A long-acting injectable form of PrEP has also been approved by the FDA."),
                                            f7Align(div(f7Link("Learn More about PrEP", href="https://www.hiv.gov/hiv-basics/hiv-prevention/using-hiv-medication-to-reduce-risk/pre-exposure-prophylaxis/")), side=c("center")),
                                            br(),
                                            hr(),
                                            f7Align(h3("How to Schedule a PrEP Intake Appointment on-campus with an Albany Medical Center Health Provider"), side=c("center")),
                                            hr(),
                                            f7Align(h5("Click the link below"), side=c("center")),
                                            f7Align(h5("Pick an available date and time"), side=c("center")),
                                            f7Align(h5("Use a FAKE name, but a REAL Phone Number"), side=c("center")),
                                            f7Align(h5("Receive a video with the discrete Campus Center location via text 24 hours & 1 hour before your appointment"), side=c("center")),
                                            f7Align(div(f7Link("Schedule a PrEP Intake Appointment", href="https://calendly.com/ualbanyprojectaccess/prep")), side=c("center")),
                                            f7Align(h5("PrEP Intakes are free, confidential, and totally anonymous"), side=c("center")),
                                            hr()
                                    )
                    )




        )
      )
    })
    output$events<- renderUI({
      tagList(
        f7Accordion(id=NULL,
                    f7AccordionItem(title = "Events on EngageUAlbany", open=F,
                                    f7Block(hr(),
                                            f7Align(div(f7Link("Click to View and Register for Upcoming Events", href="https://albany.galaxydigital.com/agency/detail/?agency_id=152179")),side=c("center")),
                                            hr()

                                    ))))

    })


  })






  # Instagram Link ----------------------------------------------------------
  observeEvent(input$tab,{
    req(input$tab=="Insta")
    output$instalink<-renderUI({
      tagList(
        h3("What we post:"),
        h4("Updated information about Project ACCESS events"),
        h4("Tips on how to enhance your health and wellbeing"),
        h4("Important resources on- and off-campus"),
        h4("Alerts from the DEA and other agencies about dangerous and potentially deadly substances being sold in the Albany area"),
        f7Align(div(f7Link("Follow us on Instagram", href="https://www.instagram.com/ualbanyprojectaccess")),side=c("center"))
      )

    })
  })






















  #####################
  ### PHM Accordian ###
  #####################
  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Physical Health")
    PMHdata<-data[data$Type == 'PhysMH',]
    # SHS Accordian -----------------------------------------------------------

    output$SHSaccord<-renderUI({

      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(multiCollapse = F,f7Block(br(),
                                                    textOutput("SHSinfo2"),
                                                    uiOutput("SHSinfo3"),
                                                    uiOutput("SHSinfo4"),
                                                    textOutput("SHSinfo5"),
                                                    textOutput("SHSinfo9"),
                                                    hr()

          ),

          title = "Student Health Services", open=F))


      }





    })



    # SHS Info ----------------------------------------------------------------


    output$SHSinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Health Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$SHSinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Health Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SHSinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Health Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SHSinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Health Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$SHSinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Health Services",9])
        text<-na.omit(text)
        text
      }


    })




    # SCS Accordian -----------------------------------------------------------


    output$SCSaccord<-renderUI({

      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(multiCollapse = F,f7Block(br(),
                                                    textOutput("SCSinfo2"),
                                                    uiOutput("SCSinfo3"),
                                                    uiOutput("SCSinfo4"),
                                                    textOutput("SCSinfo5"),
                                                    textOutput("SCSinfo9"), hr()

          ),

          title = "Student Care Services", open=F))


      }





    })






    # SCS Info ----------------------------------------------------------------


    output$SCSinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Care Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$SCSinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Care Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SCSinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Care Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SCSinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Care Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$SCSinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Student Care Services",9])
        text<-na.omit(text)
        text
      }


    })




    # SHAPE Accordian ---------------------------------------------------------

    output$SHAPEaccord<-renderUI({

      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SHAPEinfo2"),
                                  uiOutput("SHAPEinfo3"),
                                  uiOutput("SHAPEinfo4"),
                                  textOutput("SHAPEinfo5"),
                                  textOutput("SHAPEinfo9"), hr()

          ),

          title = "Project SHAPE", open=F))


      }





    })


    # SHAPE Info --------------------------------------------------------------
    output$SHAPEinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Project SHAPE (Sexual Health and Peer Education)",2])
        text<-na.omit(text)
        text
      }


    })


    output$SHAPEinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Project SHAPE (Sexual Health and Peer Education)",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SHAPEinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Project SHAPE (Sexual Health and Peer Education)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SHAPEinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Project SHAPE (Sexual Health and Peer Education)",5])
        text<-na.omit(text)
        text
      }


    })

    output$SHAPEinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Project SHAPE (Sexual Health and Peer Education)",9])
        text<-na.omit(text)
        text
      }


    })


    # Project SHAPE (Sexual Health and Peer Education)


    ## OFF CAMPUS ##



    ## Off Campus ##

    # IOOV Accordian -----------------------------------------------------------


    output$IOOVaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("IOOVinfo2"),
                                  uiOutput("IOOVinfo3"),
                                  uiOutput("IOOVinfo4"),
                                  textOutput("IOOVinfo5"),
                                  textOutput("IOOVinfo9"), hr()

          ),

          title = "In Our Own Voices", open=F))


      }





    })






    # IOOV Info ----------------------------------------------------------------


    output$IOOVinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="In Our Own Voices",2])
        text<-na.omit(text)
        text
      }


    })


    output$IOOVinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="In Our Own Voices",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$IOOVinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="In Our Own Voices",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$IOOVinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="In Our Own Voices",5])
        text<-na.omit(text)
        text
      }


    })

    output$IOOVinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="In Our Own Voices",9])
        text<-na.omit(text)
        text
      }


    })








    # Ellis Accordian -----------------------------------------------------------


    output$ELLISaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("ELLISinfo2"),
                                  uiOutput("ELLISinfo3"),
                                  uiOutput("ELLISinfo4"),
                                  textOutput("ELLISinfo5"),
                                  textOutput("ELLISinfo9"), hr()

          ),

          title = "Ellis Medicine Insurance Programs", open=F))


      }





    })






    # Ellis Info ----------------------------------------------------------------


    output$ELLISinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Ellis Medicine Medicaid/Health Insurance Programs",2])
        text<-na.omit(text)
        text
      }


    })


    output$ELLISinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Ellis Medicine Medicaid/Health Insurance Programs",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$ELLISinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Ellis Medicine Medicaid/Health Insurance Programs",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$ELLISinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Ellis Medicine Medicaid/Health Insurance Programs",5])
        text<-na.omit(text)
        text
      }


    })

    output$ELLISinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Ellis Medicine Medicaid/Health Insurance Programs",9])
        text<-na.omit(text)
        text
      }


    })









    # AMC Accordian -----------------------------------------------------------


    output$AMCaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("AMCinfo2"),
                                  uiOutput("AMCinfo3"),
                                  uiOutput("AMCinfo4"),
                                  textOutput("AMCinfo5"),
                                  textOutput("AMCinfo9"), hr()

          ),

          title = "Albany Medical Center", open=F))


      }





    })






    # AMC Info ----------------------------------------------------------------


    output$AMCinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Medical Center",2])
        text<-na.omit(text)
        text
      }


    })


    output$AMCinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Medical Center",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$AMCinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Medical Center",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$AMCinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Medical Center",5])
        text<-na.omit(text)
        text
      }


    })

    output$AMCinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Medical Center",9])
        text<-na.omit(text)
        text
      }


    })








    # AMCWASH Accordian -----------------------------------------------------------


    output$AMCWASHaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("AMCWASHinfo2"),
                                  uiOutput("AMCWASHinfo3"),
                                  uiOutput("AMCWASHinfo4"),
                                  textOutput("AMCWASHinfo5"),
                                  textOutput("AMCWASHinfo9"), hr()

          ),

          title = "Albany Med (Washington Ave)", open=F))


      }





    })






    # AMCWASH Info ----------------------------------------------------------------


    output$AMCWASHinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Med (Washington Ave)",2])
        text<-na.omit(text)
        text
      }


    })


    output$AMCWASHinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Med (Washington Ave)",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$AMCWASHinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Med (Washington Ave)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$AMCWASHinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Med (Washington Ave)",5])
        text<-na.omit(text)
        text
      }


    })

    output$AMCWASHinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Albany Med (Washington Ave)",9])
        text<-na.omit(text)
        text
      }


    })










    # EMURG Accordian -----------------------------------------------------------


    output$EMURGaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EMURGinfo2"),
                                  uiOutput("EMURGinfo3"),
                                  uiOutput("EMURGinfo4"),
                                  textOutput("EMURGinfo5"),
                                  textOutput("EMURGinfo9"), hr()

          ),

          title = "Colonie EmUrgentCare", open=F))


      }





    })






    # EMURG Info ----------------------------------------------------------------


    output$EMURGinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="EmUrgentCare at Colonie",2])
        text<-na.omit(text)
        text
      }


    })


    output$EMURGinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="EmUrgentCare at Colonie",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EMURGinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="EmUrgentCare at Colonie",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$EMURGinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="EmUrgentCare at Colonie",5])
        text<-na.omit(text)
        text
      }


    })

    output$EMURGinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="EmUrgentCare at Colonie",9])
        text<-na.omit(text)
        text
      }


    })





    # STPETE Accordian -----------------------------------------------------------


    output$STPETEaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("STPETEinfo2"),
                                  uiOutput("STPETEinfo3"),
                                  uiOutput("STPETEinfo4"),
                                  textOutput("STPETEinfo5"),
                                  textOutput("STPETEinfo9"), hr()

          ),

          title = "St. Peter's Hospital", open=F))


      }





    })






    # STPETE Info ----------------------------------------------------------------


    output$STPETEinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="St. Peter's Hospital",2])
        text<-na.omit(text)
        text
      }


    })


    output$STPETEinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="St. Peter's Hospital",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$STPETEinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="St. Peter's Hospital",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$STPETEinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="St. Peter's Hospital",5])
        text<-na.omit(text)
        text
      }


    })

    output$STPETEinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="St. Peter's Hospital",9])
        text<-na.omit(text)
        text
      }


    })














    # SAMARITAN Accordian -----------------------------------------------------------


    output$SAMARITANaccord<-renderUI({

      if(input$PMHselector == "Physical Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SAMARITANinfo2"),
                                  uiOutput("SAMARITANinfo3"),
                                  uiOutput("SAMARITANinfo4"),
                                  textOutput("SAMARITANinfo5"),
                                  textOutput("SAMARITANinfo9"), hr()

          ),

          title = "Samaritan Hospital", open=F))


      }





    })






    # SAMARITAN Info ----------------------------------------------------------------


    output$SAMARITANinfo2<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Samaritan Hospital - Albany Memorial Campus",2])
        text<-na.omit(text)
        text
      }


    })


    output$SAMARITANinfo3<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Samaritan Hospital - Albany Memorial Campus",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SAMARITANinfo4<- renderUI({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Samaritan Hospital - Albany Memorial Campus",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SAMARITANinfo5<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Samaritan Hospital - Albany Memorial Campus",5])
        text<-na.omit(text)
        text
      }


    })

    output$SAMARITANinfo9<- renderText({
      if(input$PMHselector == "Physical Health"){

        if(input$OffCampus == F){
          PMHdata1<-PMHdata[PMHdata$Loc == "On",]
        } else {
          PMHdata1<-PMHdata
        }

        text<-c(PMHdata1[PMHdata1=="Samaritan Hospital - Albany Memorial Campus",9])
        text<-na.omit(text)
        text
      }


    })













  })


  ####################
  ### MH Resources ###
  ####################
  ## ON CAMPUS ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Mental Health (MH)")
    MHdata<-data[data$Type == 'MH',]

    # CAPS Accordian -----------------------------------------------------------


    output$CAPSaccord<-renderUI({

      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("CAPSinfo2"),
                                  uiOutput("CAPSinfo3"),
                                  uiOutput("CAPSinfo4"),
                                  textOutput("CAPSinfo5"),
                                  textOutput("CAPSinfo9"), hr()

          ),

          title = "Counseling & Psych Services (CAPS)", open=F))


      }





    })



    # CAPS Info ----------------------------------------------------------------


    output$CAPSinfo2<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Counseling and Psychological Services Center (CAPS)",2])
        text<-na.omit(text)
        text
      }


    })


    output$CAPSinfo3<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Counseling and Psychological Services Center (CAPS)",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$CAPSinfo4<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Counseling and Psychological Services Center (CAPS)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$CAPSinfo5<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Counseling and Psychological Services Center (CAPS)",5])
        text<-na.omit(text)
        text
      }


    })

    output$CAPSinfo9<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Counseling and Psychological Services Center (CAPS)",9])
        text<-na.omit(text)
        text
      }


    })











    # ME Accordian -----------------------------------------------------------


    output$MEaccord<-renderUI({

      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("MEinfo2"),
                                  uiOutput("MEinfo3"),
                                  uiOutput("MEinfo4"),
                                  textOutput("MEinfo5"),
                                  textOutput("MEinfo9"), hr()

          ),

          title = "Middle Earth", open=F))


      }





    })



    # ME Info ----------------------------------------------------------------


    output$MEinfo2<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Middle Earth",2])
        text<-na.omit(text)
        text
      }


    })


    output$MEinfo3<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Middle Earth",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$MEinfo4<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Middle Earth",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$MEinfo5<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Middle Earth",5])
        text<-na.omit(text)
        text
      }


    })

    output$MEinfo9<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Middle Earth",9])
        text<-na.omit(text)
        text
      }


    })












    ## Off Campus ##


    ## OFF CAMPUS ##

    # Psychology Today Accordian -----------------------------------------------------------


    output$PsychTodayaccord<-renderUI({

      if(input$PMHselector == "Mental Health (MH)" && input$OffCampus == T){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("PsychTodayinfo4"),
                                  textOutput("PsychTodayinfo9"), hr()

          ),

          title = "Find a Therapist (Psych Today)", open=F))


      }





    })



    # Psychology Today Info ----------------------------------------------------------------


    output$PsychTodayinfo4<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Find a Therapist (Psych Today)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$PsychTodayinfo9<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Find a Therapist (Psych Today)",9])
        text<-na.omit(text)
        text
      }


    })


    # NYSPA Find a Psychologist Accordian -----------------------------------------------------------


    output$NYSPApsychaccord<-renderUI({

      if(input$PMHselector == "Mental Health (MH)" && input$OffCampus == T){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("NYSPApsychinfo4"),
                                  textOutput("NYSPApsychinfo9"), hr()

          ),

          title = "Find a Psychologist (NYSPA)", open=F))


      }





    })



    # NYSPA Find a Psychologist Info ----------------------------------------------------------------


    output$NYSPApsychinfo4<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Find a Psychologist (NYSPA)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NYSPApsychinfo9<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Find a Psychologist (NYSPA)",9])
        text<-na.omit(text)
        text
      }


    })




    # PRIDE1 Accordian -----------------------------------------------------------


    output$PRIDE1accord<-renderUI({

      if(input$PMHselector == "Mental Health (MH)" && input$OffCampus == T){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("PRIDE1info2"),
                                  uiOutput("PRIDE1info3"),
                                  uiOutput("PRIDE1info4"),
                                  textOutput("PRIDE1info5"),
                                  textOutput("PRIDE1info9"), hr()

          ),

          title = "Pride Center of the Capital Region", open=F))


      }





    })



    # PRIDE1 Info ----------------------------------------------------------------


    output$PRIDE1info2<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Pride Center of the Capital Region",2])
        text<-na.omit(text)
        text
      }


    })


    output$PRIDE1info3<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Pride Center of the Capital Region",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$PRIDE1info4<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Pride Center of the Capital Region",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$PRIDE1info5<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Pride Center of the Capital Region",5])
        text<-na.omit(text)
        text
      }


    })

    output$PRIDE1info9<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="Pride Center of the Capital Region",9])
        text<-na.omit(text)
        text
      }


    })















    # SUICIDEPREV Accordian -----------------------------------------------------------


    output$SUICIDEPREVaccord<-renderUI({

      if(input$PMHselector == "Mental Health (MH)" && input$OffCampus == T){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SUICIDEPREVinfo2"),
                                  uiOutput("SUICIDEPREVinfo3"),
                                  uiOutput("SUICIDEPREVinfo4"),
                                  textOutput("SUICIDEPREVinfo5"),
                                  textOutput("SUICIDEPREVinfo9"), hr()

          ),

          title = "Suicide Prevention Foundation", open=F))


      }





    })



    # SUICIDEPREV Info ----------------------------------------------------------------


    output$SUICIDEPREVinfo2<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="American Foundation for Suicide Prevention Capital Region",2])
        text<-na.omit(text)
        text
      }


    })


    output$SUICIDEPREVinfo3<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="American Foundation for Suicide Prevention Capital Region",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SUICIDEPREVinfo4<- renderUI({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="American Foundation for Suicide Prevention Capital Region",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SUICIDEPREVinfo5<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="American Foundation for Suicide Prevention Capital Region",5])
        text<-na.omit(text)
        text
      }


    })

    output$SUICIDEPREVinfo9<- renderText({
      if(input$PMHselector == "Mental Health (MH)"){

        if(input$OffCampus == F){
          MHdata1<-MHdata[MHdata$Loc == "On",]
        } else {
          MHdata1<-MHdata
        }

        text<-c(MHdata1[MHdata1=="American Foundation for Suicide Prevention Capital Region",9])
        text<-na.omit(text)
        text
      }


    })













  })

  ###############################
  ### Sexual Health Resources ###
  ###############################
  ## ON CAMPUS ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Sexual Health")
    STIdata<-data[data$Type == 'HIVSTI',]

    # SHS_sex Accordian -----------------------------------------------------------


    output$SHS_sexaccord<-renderUI({

      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SHS_sexinfo2"),
                                  uiOutput("SHS_sexinfo3"),
                                  uiOutput("SHS_sexinfo4"),
                                  textOutput("SHS_sexinfo5"),
                                  textOutput("SHS_sexinfo9"), hr()

          ),

          title = "Student Health Services", open=F))


      }





    })



    # SHS_sex Info ----------------------------------------------------------------


    output$SHS_sexinfo2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Student Health Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$SHS_sexinfo3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Student Health Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SHS_sexinfo4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Student Health Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SHS_sexinfo5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Student Health Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$SHS_sexinfo9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Student Health Services",9])
        text<-na.omit(text)
        text
      }


    })










    ## Off Campus ##

    # AMCYAP Accordian -----------------------------------------------------------


    output$AMCYAPaccord<-renderUI({

      if(input$PMHselector == "Sexual Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("AMCYAPinfo2"),
                                  uiOutput("AMCYAPinfo3"),
                                  uiOutput("AMCYAPinfo4"),
                                  textOutput("AMCYAPinfo5"),
                                  textOutput("AMCYAPinfo9"), hr()

          ),

          title = "Albany Med Young Adult Program", open=F))


      }





    })



    # AMCYAP Info ----------------------------------------------------------------


    output$AMCYAPinfo2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Albany Med Young Adult Program",2])
        text<-na.omit(text)
        text
      }


    })


    output$AMCYAPinfo3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Albany Med Young Adult Program",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$AMCYAPinfo4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Albany Med Young Adult Program",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$AMCYAPinfo5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Albany Med Young Adult Program",5])
        text<-na.omit(text)
        text
      }


    })

    output$AMCYAPinfo9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Albany Med Young Adult Program",9])
        text<-na.omit(text)
        text
      }


    })















    # APH Accordian -----------------------------------------------------------


    output$APHaccord<-renderUI({

      if(input$PMHselector == "Sexual Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("APHinfo2"),
                                  uiOutput("APHinfo3"),
                                  uiOutput("APHinfo4"),
                                  textOutput("APHinfo5"),
                                  textOutput("APHinfo9"), hr()

          ),

          title = "Alliance for Positive Health", open=F))


      }





    })



    # APH Info ----------------------------------------------------------------


    output$APHinfo2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Alliance for Positive Health",2])
        text<-na.omit(text)
        text
      }


    })


    output$APHinfo3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Alliance for Positive Health",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$APHinfo4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Alliance for Positive Health",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$APHinfo5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Alliance for Positive Health",5])
        text<-na.omit(text)
        text
      }


    })

    output$APHinfo9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Alliance for Positive Health",9])
        text<-na.omit(text)
        text
      }


    })














    # DC Accordian -----------------------------------------------------------


    output$DCaccord<-renderUI({

      if(input$PMHselector == "Sexual Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("DCinfo2"),
                                  uiOutput("DCinfo3"),
                                  uiOutput("DCinfo4"),
                                  textOutput("DCinfo5"),
                                  textOutput("DCinfo9"), hr()

          ),

          title = "Damien Center", open=F))


      }





    })



    # DC Info ----------------------------------------------------------------


    output$DCinfo2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Damien Center",2])
        text<-na.omit(text)
        text
      }


    })


    output$DCinfo3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Damien Center",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$DCinfo4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Damien Center",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$DCinfo5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Damien Center",5])
        text<-na.omit(text)
        text
      }


    })

    output$DCinfo9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Damien Center",9])
        text<-na.omit(text)
        text
      }


    })















    # UHPP Accordian -----------------------------------------------------------


    output$UHPPaccord<-renderUI({

      if(input$PMHselector == "Sexual Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("UHPPinfo2"),
                                  uiOutput("UHPPinfo3"),
                                  uiOutput("UHPPinfo4"),
                                  textOutput("UHPPinfo5"),
                                  textOutput("UHPPinfo9"), hr()

          ),

          title = "Upper Hudson Planned Parenthood", open=F))


      }





    })



    # UHPP Info ----------------------------------------------------------------


    output$UHPPinfo2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Upper Hudson Planned Parenthood",2])
        text<-na.omit(text)
        text
      }


    })


    output$UHPPinfo3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Upper Hudson Planned Parenthood",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$UHPPinfo4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Upper Hudson Planned Parenthood",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$UHPPinfo5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Upper Hudson Planned Parenthood",5])
        text<-na.omit(text)
        text
      }


    })

    output$UHPPinfo9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Upper Hudson Planned Parenthood",9])
        text<-na.omit(text)
        text
      }


    })





















    # WYH Accordian -----------------------------------------------------------


    output$WYHaccord<-renderUI({

      if(input$PMHselector == "Sexual Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("WYHinfo2"),
                                  uiOutput("WYHinfo3"),
                                  uiOutput("WYHinfo4"),
                                  textOutput("WYHinfo5"),
                                  textOutput("WYHinfo9"), hr()

          ),

          title = "Whitney Young Health", open=F))


      }





    })



    # WYH Info ----------------------------------------------------------------


    output$WYHinfo2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Whitney Young Health",2])
        text<-na.omit(text)
        text
      }


    })


    output$WYHinfo3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Whitney Young Health",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$WYHinfo4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Whitney Young Health",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$WYHinfo5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Whitney Young Health",5])
        text<-na.omit(text)
        text
      }


    })

    output$WYHinfo9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Whitney Young Health",9])
        text<-na.omit(text)
        text
      }


    })























    # PRIDE2 Accordian -----------------------------------------------------------


    output$PRIDE2accord<-renderUI({

      if(input$PMHselector == "Sexual Health" && input$OffCampus == T){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("PRIDE2info2"),
                                  uiOutput("PRIDE2info3"),
                                  uiOutput("PRIDE2info4"),
                                  textOutput("PRIDE2info5"),
                                  textOutput("PRIDE2info9"), hr()

          ),

          title = "Pride Center of the Capital Region", open=F))


      }





    })



    # PRIDE2 Info ----------------------------------------------------------------


    output$PRIDE2info2<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Pride Center of the Capital Region",2])
        text<-na.omit(text)
        text
      }


    })


    output$PRIDE2info3<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Pride Center of the Capital Region",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$PRIDE2info4<- renderUI({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Pride Center of the Capital Region",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$PRIDE2info5<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Pride Center of the Capital Region",5])
        text<-na.omit(text)
        text
      }


    })

    output$PRIDE2info9<- renderText({
      if(input$PMHselector == "Sexual Health"){

        if(input$OffCampus == F){
          STIdata1<-STIdata[STIdata$Loc == "On",]
        } else {
          STIdata1<-STIdata
        }

        text<-c(STIdata1[STIdata1=="Pride Center of the Capital Region",9])
        text<-na.omit(text)
        text
      }


    })






















  })

  ######################
  ### AOD Resources ###
  #####################
  ## ON CAMPUS ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Alcohol and Other Drug Concerns")
    AODdata<-data[data$Type == 'AOD',]

    # CRP Accordian -----------------------------------------------------------


    output$CRPaccord<-renderUI({

      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("CRPinfo2"),
                                  uiOutput("CRPinfo3"),
                                  uiOutput("CRPinfo4"),
                                  textOutput("CRPinfo5"),
                                  textOutput("CRPinfo9"), hr()

          ),

          title = "Collegiate Recovery Program", open=F))


      }





    })



    # CRP Info ----------------------------------------------------------------


    output$CRPinfo2<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Collegiate Recovery Program",2])
        text<-na.omit(text)
        text
      }


    })


    output$CRPinfo3<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Collegiate Recovery Program",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$CRPinfo4<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Collegiate Recovery Program",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$CRPinfo5<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Collegiate Recovery Program",5])
        text<-na.omit(text)
        text
      }


    })

    output$CRPinfo9<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Collegiate Recovery Program",9])
        text<-na.omit(text)
        text
      }


    })











    ## OFF CAMPUS ##





    # NUA Accordian -----------------------------------------------------------


    output$NUAaccord<-renderUI({

      if(input$PMHselector == "Alcohol and Other Drug Concerns" && input$OffCampus == T){
        AODdata1<-AODdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("NUAinfo3"),
                                  uiOutput("NUAinfo4"),
                                  textOutput("NUAinfo9"), hr()

          ),

          title = "Never Use Alone (Anonymous Hotline)", open=F))


      }





    })



    # NUA Info ----------------------------------------------------------------




    output$NUAinfo3<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){
        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }


        text<-c(AODdata1[AODdata1=="Never Use Alone",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$NUAinfo4<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Never Use Alone",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NUAinfo9<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Never Use Alone",9])
        text<-na.omit(text)
        text
      }


    })
















    # Equinox Accordian -----------------------------------------------------------


    output$EQUINOXaccord<-renderUI({

      if(input$PMHselector == "Alcohol and Other Drug Concerns" && input$OffCampus == T){
        AODdata1<-AODdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EQUINOXinfo2"),
                                  uiOutput("EQUINOXinfo3"),
                                  uiOutput("EQUINOXinfo4"),
                                  textOutput("EQUINOXinfo5"),
                                  textOutput("EQUINOXinfo9"), hr()

          ),

          title = "Equinox", open=F))


      }





    })


    # Equinox Info ----------------------------------------------------------------



    output$EQUINOXinfo2<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Equinox",2])
        text<-na.omit(text)
        text
      }


    })


    output$EQUINOXinfo3<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Equinox",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EQUINOXinfo4<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Equinox",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$EQUINOXinfo5<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Equinox",5])
        text<-na.omit(text)
        text
      }


    })

    output$EQUINOXinfo9<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Equinox",9])
        text<-na.omit(text)
        text
      }


    })
















    # AOD Care Center Accordian -----------------------------------------------------------


    output$AODCAREaccord<-renderUI({

      if(input$PMHselector == "Alcohol and Other Drug Concerns" && input$OffCampus == T){
        AODdata1<-AODdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("AODCAREinfo2"),
                                  uiOutput("AODCAREinfo3"),
                                  uiOutput("AODCAREinfo4"),
                                  textOutput("AODCAREinfo5"),
                                  textOutput("AODCAREinfo9"), hr()

          ),

          title = "Addictions Care Center of Albany", open=F))


      }





    })


    # AOD Care Center Info ----------------------------------------------------------------



    output$AODCAREinfo2<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Addictions Care Center of Albany",2])
        text<-na.omit(text)
        text
      }


    })


    output$AODCAREinfo3<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Addictions Care Center of Albany",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$AODCAREinfo4<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Addictions Care Center of Albany",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$AODCAREinfo5<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Addictions Care Center of Albany",5])
        text<-na.omit(text)
        text
      }


    })

    output$AODCAREinfo9<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="Addictions Care Center of Albany",9])
        text<-na.omit(text)
        text
      }


    })
















    # OASAS Treatment Locator Accordian -----------------------------------------------------------


    output$OASASlocatoraccord<-renderUI({

      if(input$PMHselector == "Alcohol and Other Drug Concerns" && input$OffCampus == T){
        AODdata1<-AODdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("OASASlocator3"),
                                  uiOutput("OASASlocator4"),
                                  textOutput("OASASlocator9"), hr()

          ),

          title = "OASAS Treatment Locator", open=F))


      }





    })


    # OASAS Treatment Locator Info ----------------------------------------------------------------



    output$OASASlocator3<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="OASAS Treatment Locator",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$OASASlocator4<- renderUI({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="OASAS Treatment Locator",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$OASASlocator9<- renderText({
      if(input$PMHselector == "Alcohol and Other Drug Concerns"){

        if(input$OffCampus == F){
          AODdata1<-AODdata[AODdata$Loc == "On",]
        } else {
          AODdata1<-AODdata
        }

        text<-c(AODdata1[AODdata1=="OASAS Treatment Locator",9])
        text<-na.omit(text)
        text
      }


    })


  })

  #
  #   ##################################
  #   ### Problem Gambling Resources ###
  #   ##################################


  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Problem Gambling")
    GAMBdata<-data[data$Type == 'GAMB',]


    # GAMB NYS Gamblers Hotline Accordian -----------------------------------------------------------


    output$GAMBNYSgambHLaccord<-renderUI({

      if(input$PMHselector == "Problem Gambling"){
        GAMBdata1<-GAMBdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("GAMBNYSgambHLinfo2"),
                                  uiOutput("GAMBNYSgambHLinfo3"),
                                  uiOutput("GAMBNYSgambHLinfo4"),
                                  textOutput("GAMBNYSgambHLinfo5"),
                                  textOutput("GAMBNYSgambHLinfo9"), hr()

          ),

          title = "New York State Gambler's Hotline", open=F))


      }





    })


    # GAMB NYS Gamblers Hotline Info ----------------------------------------------------------------



    output$GAMBNYSgambHLinfo2<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="New York State Gambler's Hotline",2])
        text<-na.omit(text)
        text
      }


    })

    output$GAMBNYSgambHLinfo3<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="New York State Gambler's Hotline",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$GAMBNYSgambHLinfo4<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="New York State Gambler's Hotline",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$GAMBNYSgambHLinfo5<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="New York State Gambler's Hotline",5])
        text<-na.omit(text)
        text
      }

    })



    output$GAMBNYSgambHLinfo9<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="New York State Gambler's Hotline",9])
        text<-na.omit(text)
        text
      }

    })



    # GAMB NYS Gambling E-Screener Accordian -----------------------------------------------------------


    output$NYSGAMBescreeneraccord<-renderUI({

      if(input$PMHselector == "Problem Gambling"){
        GAMBdata1<-GAMBdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("NYSGAMBescreenerinfo2"),
                                  uiOutput("NYSGAMBescreenerinfo3"),
                                  uiOutput("NYSGAMBescreenerinfo4"),
                                  textOutput("NYSGAMBescreenerinfo5"),
                                  textOutput("NYSGAMBescreenerinfo9"), hr()

          ),

          title = "NYS Gambling E-Screener (Free)", open=F))


      }





    })


    # GAMB NYS Gambling E-Screener Info ----------------------------------------------------------------



    output$NYSGAMBescreenerinfo2<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="NYS Gambling E-Screener",2])
        text<-na.omit(text)
        text
      }


    })

    output$NYSGAMBescreenerinfo3<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="NYS Gambling E-Screener",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$NYSGAMBescreenerinfo4<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="NYS Gambling E-Screener",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NYSGAMBescreenerinfo5<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="NYS Gambling E-Screener",5])
        text<-na.omit(text)
        text
      }

    })



    output$NYSGAMBescreenerinfo9<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="NYS Gambling E-Screener",9])
        text<-na.omit(text)
        text
      }

    })





    # GAMB National Gambler Support Line Accordian -----------------------------------------------------------


    output$NationalGambSupportaccordion<-renderUI({

      if(input$PMHselector == "Problem Gambling"){
        GAMBdata1<-GAMBdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("NATLGAMBsupportinfo2"),
                                  uiOutput("NATLGAMBsupportinfo3"),
                                  uiOutput("NATLGAMBsupportinfo4"),
                                  textOutput("NATLGAMBsupportinfo5"),
                                  textOutput("NATLGAMBsupportinfo9"), hr()

          ),

          title = "National Gambler Support Line", open=F))


      }

    })


    # GAMB National Gambler Support Line Info ----------------------------------------------------------------



    output$NATLGAMBsupportinfo2<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="National Gambler Support Line",2])
        text<-na.omit(text)
        text
      }


    })

    output$NATLGAMBsupportinfo3<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="National Gambler Support Line",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$NATLGAMBsupportinfo4<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="National Gambler Support Line",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NATLGAMBsupportinfo5<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="National Gambler Support Line",5])
        text<-na.omit(text)
        text
      }

    })



    output$NATLGAMBsupportinfo9<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="National Gambler Support Line",9])
        text<-na.omit(text)
        text
      }

    })




    # GAMB Gamblers Anonymous Accordian -----------------------------------------------------------


    output$GamblersAnonymousaccordion<-renderUI({

      if(input$PMHselector == "Problem Gambling"){
        GAMBdata1<-GAMBdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("GamblersAnonymousinfo2"),
                                  uiOutput("GamblersAnonymousinfo4"),
                                  textOutput("GamblersAnonymousinfo9"), hr()

          ),

          title = "Gamblers Anonymous", open=F))


      }

    })


    # GAMB Gamblers Anonymous Info ----------------------------------------------------------------



    output$GamblersAnonymousinfo2<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="Gamblers Anonymous",2])
        text<-na.omit(text)
        text
      }


    })


    output$GamblersAnonymousinfo4<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="Gamblers Anonymous",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$GamblersAnonymousinfo9<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="Gamblers Anonymous",9])
        text<-na.omit(text)
        text
      }

    })



    # GAMB Gam-Anon Accordian -----------------------------------------------------------


    output$GamAnonaccordion<-renderUI({

      if(input$PMHselector == "Problem Gambling"){
        GAMBdata1<-GAMBdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("GamAnoninfo2"),
                                  uiOutput("GamAnoninfo4"),
                                  textOutput("GamAnoninfo9"), hr()

          ),

          title = "Gam-Anon (For Friends & Family)", open=F))


      }

    })


    # GAMB Gam-Anon Info ----------------------------------------------------------------



    output$GamAnoninfo2<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="Gam-Anon",2])
        text<-na.omit(text)
        text
      }


    })


    output$GamAnoninfo4<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="Gam-Anon",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$GamAnoninfo9<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="Gam-Anon",9])
        text<-na.omit(text)
        text
      }

    })





    # GAMB OASAS Gambling Treatment Locator Accordian -----------------------------------------------------------


    output$GambTxtLocatoraccordion<-renderUI({

      if(input$PMHselector == "Problem Gambling"){
        GAMBdata1<-GAMBdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("GambTxtLocinfo2"),
                                  uiOutput("GambTxtLocinfo4"),
                                  textOutput("GambTxtLocinfo5"),
                                  textOutput("GambTxtLocinfo9"), hr()

          ),

          title = "Problem Gambling Treatment Locator", open=F))


      }

    })


    # GAMB OASAS Gambling Treatment Locator Info ----------------------------------------------------------------



    output$GambTxtLocinfo2<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="OASAS Problem Gambling Treatment Locator",2])
        text<-na.omit(text)
        text
      }


    })


    output$GambTxtLocinfo4<- renderUI({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="OASAS Problem Gambling Treatment Locator",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$GambTxtLocinfo5<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="OASAS Problem Gambling Treatment Locator",5])
        text<-na.omit(text)
        text
      }

    })

    output$GambTxtLocinfo9<- renderText({
      if(input$PMHselector == "Problem Gambling"){

        GAMBdata1<-GAMBdata


        text<-c(GAMBdata1[GAMBdata1=="OASAS Problem Gambling Treatment Locator",9])
        text<-na.omit(text)
        text
      }

    })



  })








  #####################################################
  ### Mental Health Resources for Black Communities ###
  #####################################################
  ## OFF CAMPUS ONLY ##


  observeEvent(input$PMHselector,{
    req(input$PMHselector == "MH Resources (Black Communities)")
    MHBCdata	<-	data[data$Type == 'MHBC',]

    # AAKOMA Accordian -----------------------------------------------------------


    output$AAKOMAaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("AAKOMAinfo4"),
                                  textOutput("AAKOMAinfo9"), hr()

          ),

          title = "AAKOMA Project", open=F))


      }





    })



    # AAKOMA Project Info ----------------------------------------------------------------





    output$AAKOMAinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="AAKOMA Project",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$AAKOMAinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="AAKOMA Project",9])
        text<-na.omit(text)
        text
      }


    })

















    # Black Emotional and Mental Health Collective (BEAM) Accordian -----------------------------------------------------------


    output$BEAMaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("BEAMinfo4"),
                                  textOutput("BEAMinfo9"), hr()

          ),

          title = "Black Mental Wellness", open=F))


      }





    })



    # Black Emotional and Mental Health Collective (BEAM) Project Info ----------------------------------------------------------------





    output$BEAMinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Black Emotional and Mental Health Collective (BEAM)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$BEAMinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Black Emotional and Mental Health Collective (BEAM)",9])
        text<-na.omit(text)
        text
      }


    })


















    # The Boris Lawrence Henson Foundation Accordian -----------------------------------------------------------


    output$BLHFaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("BLHFinfo4"),
                                  textOutput("BLHFinfo9"), hr()

          ),

          title = "The Boris Lawrence Henson Foundation", open=F))


      }





    })



    # The Boris Lawrence Henson Foundation Project Info ----------------------------------------------------------------





    output$BLHFinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="The Boris Lawrence Henson Foundation",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$BLHFinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="The Boris Lawrence Henson Foundation",9])
        text<-na.omit(text)
        text
      }


    })
















    # Brother, You are on My Mind Accordian -----------------------------------------------------------


    output$BYOMMaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("BYOMMinfo4"),
                                  textOutput("BYOMMinfo9"), hr()

          ),

          title = "Brother, You are on My Mind", open=F))


      }





    })



    # Brother, You are on My Mind Info ----------------------------------------------------------------





    output$BYOMMinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Brother, You are on My Mind",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$BYOMMinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Brother, You are on My Mind",9])
        text<-na.omit(text)
        text
      }


    })

















    # Inclusive Therapists Accordian -----------------------------------------------------------


    output$ITaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("ITinfo4"),
                                  textOutput("ITinfo9"), hr()

          ),

          title = "Inclusive Therapists", open=F))


      }





    })



    # Inclusive Therapists Info ----------------------------------------------------------------





    output$ITinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Inclusive Therapists",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$ITinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Inclusive Therapists",9])
        text<-na.omit(text)
        text
      }


    })




















    # The Loveland Foundation Accordian -----------------------------------------------------------


    output$LFaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("LFinfo4"),
                                  textOutput("LFinfo9"), hr()

          ),

          title = "The Loveland Foundation", open=F))


      }





    })



    # The Loveland Foundation Info ----------------------------------------------------------------





    output$LFinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="The Loveland Foundation",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$LFinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="The Loveland Foundation",9])
        text<-na.omit(text)
        text
      }


    })





















    # Melanin and Mental Health Accordian -----------------------------------------------------------


    output$MMHaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("MMHinfo4"),
                                  textOutput("MMHinfo9"), hr()

          ),

          title = "Melanin and Mental Health", open=F))


      }





    })



    # Melanin and Mental Health Info ----------------------------------------------------------------





    output$MMHinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Melanin and Mental Health",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$MMHinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Melanin and Mental Health",9])
        text<-na.omit(text)
        text
      }


    })





















    # National Organization for People of Color Against Suicide Accordian -----------------------------------------------------------


    output$POCASaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("POCASinfo4"),
                                  textOutput("POCASinfo9"), hr()

          ),

          title = "People of Color Against Suicide", open=F))


      }





    })



    # National Organization for People of Color Against Suicide Info ----------------------------------------------------------------





    output$POCASinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="National Organization for People of Color Against Suicide",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$POCASinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="National Organization for People of Color Against Suicide",9])
        text<-na.omit(text)
        text
      }


    })






















    # National Queer & Trans Therapists of Color Network Accordian -----------------------------------------------------------


    output$QTPOCaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("QTPOCinfo4"),
                                  textOutput("QTPOCinfo9"), hr()

          ),

          title = "Queer & Trans Therapists of Color", open=F))


      }





    })



    # National Queer & Trans Therapists of Color Network Info ----------------------------------------------------------------





    output$QTPOCinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="National Queer & Trans Therapists of Color Network",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$QTPOCinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="National Queer & Trans Therapists of Color Network",9])
        text<-na.omit(text)
        text
      }


    })























    # Therapy for Black Girls Accordian -----------------------------------------------------------


    output$TBGaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("TBGinfo4"),
                                  textOutput("TBGinfo9"), hr()

          ),

          title = "Therapy for Black Girls", open=F))


      }





    })


    # Therapy for Black Girls Info ----------------------------------------------------------------





    output$TBGinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Therapy for Black Girls",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$TBGinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Therapy for Black Girls",9])
        text<-na.omit(text)
        text
      }


    })
























    # Therapy for Black Men Accordian -----------------------------------------------------------


    output$TBMaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Black Communities)"){
        MHBCdata1<-MHBCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("TBMinfo4"),
                                  textOutput("TBMinfo9"), hr()

          ),

          title = "Therapy for Black Men", open=F))


      }





    })


    # Therapy for Black Men Info ----------------------------------------------------------------





    output$TBMinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Therapy for Black Men",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$TBMinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Black Communities)"){

        MHBCdata1<-MHBCdata


        text<-c(MHBCdata1[MHBCdata1=="Therapy for Black Men",9])
        text<-na.omit(text)
        text
      }


    })




























  })

  ########################################################
  ### Mental Health Resources for Hispanic Communities ###
  ########################################################
  ## OFF CAMPUS ONLY ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "MH Resources (Hispanic Communities)")
    MHLCdata	<-	data[data$Type == 'MHLC',]

    # Capital District Latinos Accordian -----------------------------------------------------------


    output$CDLaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("CDLinfo2"),
                                  uiOutput("CDLinfo3"),
                                  uiOutput("CDLinfo4"),
                                  textOutput("CDLinfo5"),
                                  textOutput("CDLinfo9"), hr()

          ),

          title = "Capital District Latinos", open=F))


      }





    })


    # Capital District Latinos Info ----------------------------------------------------------------



    output$CDLinfo2<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Capital District Latinos",2])
        text<-na.omit(text)
        text
      }


    })

    output$CDLinfo3<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Capital District Latinos",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$CDLinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Capital District Latinos",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$CDLinfo5<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Capital District Latinos",5])
        text<-na.omit(text)
        text
      }


    })
    output$CDLinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Capital District Latinos",9])
        text<-na.omit(text)
        text
      }


    })























    # Inclusive Therapists (Hispanic) Accordian -----------------------------------------------------------


    output$ITHISPANICaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("ITHISPANICinfo4"),
                                  textOutput("ITHISPANICinfo9"), hr()

          ),

          title = "Inclusive Therapists", open=F))


      }





    })



    # Inclusive Therapists (Hispanic) Info ----------------------------------------------------------------





    output$ITHISPANICinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Inclusive Therapists",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$ITHISPANICinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Inclusive Therapists",9])
        text<-na.omit(text)
        text
      }


    })





















    # Life is Precious Accordian -----------------------------------------------------------


    output$LIPaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("LIPinfo4"),
                                  textOutput("LIPinfo9"), hr()

          ),

          title = "Life is Precious", open=F))


      }





    })



    # Life is Precious Info ----------------------------------------------------------------





    output$LIPinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Life is Precious",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$LIPinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Life is Precious",9])
        text<-na.omit(text)
        text
      }


    })























    # Latinx Therapy Accordian -----------------------------------------------------------


    output$LXTaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("LXTinfo4"),
                                  textOutput("LXTinfo9"), hr()

          ),

          title = "Latinx Therapy", open=F))


      }





    })



    # Latinx Therapy Info ----------------------------------------------------------------





    output$LXTinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Latinx Therapy",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$LXTinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="Latinx Therapy",9])
        text<-na.omit(text)
        text
      }


    })



























    # MANA, A National Latina Organization Accordian -----------------------------------------------------------


    output$MANAaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("MANAinfo4"),
                                  textOutput("MANAinfo9"), hr()

          ),

          title = "National Latina Organization", open=F))


      }





    })



    # MANA, A National Latina Organization Info ----------------------------------------------------------------





    output$MANAinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="MANA, A National Latina Organization",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$MANAinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="MANA, A National Latina Organization",9])
        text<-na.omit(text)
        text
      }


    })








    # National Alliance for Hispanic Health Accordian -----------------------------------------------------------


    output$NAHHaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("NAHHinfo4"),
                                  textOutput("NAHHinfo9"), hr()

          ),

          title = "National Alliance for Hispanic Health", open=F))


      }





    })



    # National Alliance for Hispanic Health Info ----------------------------------------------------------------





    output$NAHHinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Alliance for Hispanic Health",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$NAHHinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Alliance for Hispanic Health",9])
        text<-na.omit(text)
        text
      }


    })


























    # National Latinx Psychological Association Accordian -----------------------------------------------------------


    output$NLXPaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("NLXPinfo4"),
                                  textOutput("NLXPinfo9"), hr()

          ),

          title = "Latinx Psych. Association", open=F))


      }





    })



    # National Latinx Psychological Association Info ----------------------------------------------------------------





    output$NLXPinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Latinx Psychological Association",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$NLXPinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Latinx Psychological Association",9])
        text<-na.omit(text)
        text
      }


    })









    # National Organization for People of Color Against Suicide (HISPANIC) Accordian -----------------------------------------------------------


    output$POCASHISPANICaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHBCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("POCASHISPANICinfo4"),
                                  textOutput("POCASHISPANICinfo9"), hr()

          ),

          title = "People of Color Against Suicide", open=F))


      }





    })



    # National Organization for People of Color Against Suicide (HISPANIC) Info ----------------------------------------------------------------





    output$POCASHISPANICinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Organization for People of Color Against Suicide",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$POCASHISPANICinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Organization for People of Color Against Suicide",9])
        text<-na.omit(text)
        text
      }


    })
























    # National Queer & Trans Therapists of Color Network (HISPANIC) Accordian -----------------------------------------------------------


    output$QTPOCHISPANICaccord<-renderUI({

      if(input$PMHselector == "MH Resources (Hispanic Communities)"){
        MHLCdata1<-MHLCdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("QTPOCHISPANICinfo4"),
                                  textOutput("QTPOCHISPANICinfo9"), hr()

          ),

          title = "Queer & Trans Therapists of Color", open=F))


      }





    })



    # National Queer & Trans Therapists of Color Network (HISPANIC) Info ----------------------------------------------------------------





    output$QTPOCHISPANICinfo4<- renderUI({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Queer & Trans Therapists of Color Network",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$QTPOCHISPANICinfo9<- renderText({
      if(input$PMHselector == "MH Resources (Hispanic Communities)"){

        MHLCdata1<-MHLCdata


        text<-c(MHLCdata1[MHLCdata1=="National Queer & Trans Therapists of Color Network",9])
        text<-na.omit(text)
        text
      }


    })


























  })

  ##########################
  ### Academic Resources ###
  ##########################
  ## ON CAMPUS ONLY ##
  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Academic Support")
    Acadata	<-	data[data$Type == 'Aca',]

    # University Libraries Accordian -----------------------------------------------------------


    output$UALIBaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("UALIBinfo2"),
                                  uiOutput("UALIBinfo3"),
                                  uiOutput("UALIBinfo4"),
                                  textOutput("UALIBinfo5"),
                                  textOutput("UALIBinfo9"), hr()

          ),

          title = "University Libraries", open=F))


      }





    })


    # University Libraries Info ----------------------------------------------------------------



    output$UALIBinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University Libraries",2])
        text<-na.omit(text)
        text
      }


    })

    output$UALIBinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University Libraries",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$UALIBinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University Libraries",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$UALIBinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University Libraries",5])
        text<-na.omit(text)
        text
      }


    })
    output$UALIBinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University Libraries",9])
        text<-na.omit(text)
        text
      }


    })
























    # Disability Access and Inclusion Student Services Accordian -----------------------------------------------------------


    output$DAISSaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("DAISSinfo2"),
                                  uiOutput("DAISSinfo3"),
                                  uiOutput("DAISSinfo4"),
                                  textOutput("DAISSinfo5"),
                                  textOutput("DAISSinfo9"), hr()

          ),

          title = "Disability and Inclusion Services", open=F))


      }





    })


    # Disability Access and Inclusion Student Services Info ----------------------------------------------------------------



    output$DAISSinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Disability Access and Inclusion Student Services",2])
        text<-na.omit(text)
        text
      }


    })

    output$DAISSinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Disability Access and Inclusion Student Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$DAISSinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Disability Access and Inclusion Student Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$DAISSinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Disability Access and Inclusion Student Services",5])
        text<-na.omit(text)
        text
      }


    })
    output$DAISSinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Disability Access and Inclusion Student Services",9])
        text<-na.omit(text)
        text
      }


    })

























    # Writing Center Accordian -----------------------------------------------------------


    output$WCaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("WCinfo2"),
                                  uiOutput("WCinfo3"),
                                  uiOutput("WCinfo4"),
                                  textOutput("WCinfo5"),
                                  textOutput("WCinfo9"), hr()

          ),

          title = "Writing Center", open=F))


      }





    })


    # Writing Center Info ----------------------------------------------------------------



    output$WCinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Writing Center",2])
        text<-na.omit(text)
        text
      }


    })

    output$WCinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Writing Center",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$WCinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Writing Center",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$WCinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Writing Center",5])
        text<-na.omit(text)
        text
      }


    })
    output$WCinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Writing Center",9])
        text<-na.omit(text)
        text
      }


    })

























    # Tutoring Accordian -----------------------------------------------------------


    output$Tutoringaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("Tutoringinfo2"),
                                  uiOutput("Tutoringinfo3"),
                                  uiOutput("Tutoringinfo4"),
                                  textOutput("Tutoringinfo5"),
                                  textOutput("Tutoringinfo9"), hr()

          ),

          title = "Tutoring", open=F))


      }





    })


    # Tutoring Info ----------------------------------------------------------------



    output$Tutoringinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Tutoring",2])
        text<-na.omit(text)
        text
      }


    })

    output$Tutoringinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Tutoring",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$Tutoringinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Tutoring",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$Tutoringinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Tutoring",5])
        text<-na.omit(text)
        text
      }


    })
    output$Tutoringinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Tutoring",9])
        text<-na.omit(text)
        text
      }


    })


























    # Project Excel Accordian -----------------------------------------------------------


    output$ProjEXCELaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("ProjEXCELinfo2"),
                                  uiOutput("ProjEXCELinfo3"),
                                  uiOutput("ProjEXCELinfo4"),
                                  textOutput("ProjEXCELinfo5"),
                                  textOutput("ProjEXCELinfo9"), hr()

          ),

          title = "Project Excel", open=F))


      }





    })


    # Project Excel Info ----------------------------------------------------------------



    output$ProjEXCELinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Project Excel",2])
        text<-na.omit(text)
        text
      }


    })

    output$ProjEXCELinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Project Excel",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$ProjEXCELinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Project Excel",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$ProjEXCELinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Project Excel",5])
        text<-na.omit(text)
        text
      }


    })
    output$ProjEXCELinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Project Excel",9])
        text<-na.omit(text)
        text
      }


    })


























    # Collegiate Science and Technology Entry Program (CSTEP) Accordian -----------------------------------------------------------


    output$CSTEPaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("CSTEPinfo2"),
                                  uiOutput("CSTEPinfo3"),
                                  uiOutput("CSTEPinfo4"),
                                  textOutput("CSTEPinfo5"),
                                  textOutput("CSTEPinfo9"), hr()

          ),

          title = "Science & Technology Entry Program (CSTEP)", open=F))


      }





    })


    # Collegiate Science and Technology Entry Program (CSTEP) Info ----------------------------------------------------------------



    output$CSTEPinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Collegiate Science and Technology Entry Program (CSTEP)",2])
        text<-na.omit(text)
        text
      }


    })

    output$CSTEPinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Collegiate Science and Technology Entry Program (CSTEP)",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$CSTEPinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Collegiate Science and Technology Entry Program (CSTEP)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$CSTEPinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Collegiate Science and Technology Entry Program (CSTEP)",5])
        text<-na.omit(text)
        text
      }


    })
    output$CSTEPinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Collegiate Science and Technology Entry Program (CSTEP)",9])
        text<-na.omit(text)
        text
      }


    })



























    # University at Albany Summer Research Program Accordian -----------------------------------------------------------


    output$UAResearchaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("UAResearchinfo2"),
                                  uiOutput("UAResearchinfo3"),
                                  uiOutput("UAResearchinfo4"),
                                  textOutput("UAResearchinfo5"),
                                  textOutput("UAResearchinfo9"), hr()

          ),

          title = "University at Albany Summer Research Program", open=F))


      }





    })


    # University at Albany Summer Research Program Info ----------------------------------------------------------------



    output$UAResearchinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University at Albany Summer Research Program",2])
        text<-na.omit(text)
        text
      }


    })

    output$UAResearchinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University at Albany Summer Research Program",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$UAResearchinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University at Albany Summer Research Program",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$UAResearchinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University at Albany Summer Research Program",5])
        text<-na.omit(text)
        text
      }


    })
    output$UAResearchinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="University at Albany Summer Research Program",9])
        text<-na.omit(text)
        text
      }


    })



























    # Dean of Students Accordian -----------------------------------------------------------


    output$DOSaccord<-renderUI({

      if(input$PMHselector == "Academic Support"){
        Acadata1<-Acadata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("DOSinfo2"),
                                  uiOutput("DOSinfo3"),
                                  uiOutput("DOSinfo4"),
                                  textOutput("DOSinfo5"),
                                  textOutput("DOSinfo9"), hr()

          ),

          title = "Dean of Students", open=F))


      }





    })


    # Dean of Students Info ----------------------------------------------------------------



    output$DOSinfo2<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Dean of Students",2])
        text<-na.omit(text)
        text
      }


    })

    output$DOSinfo3<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Dean of Students",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$DOSinfo4<- renderUI({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Dean of Students",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$DOSinfo5<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Dean of Students",5])
        text<-na.omit(text)
        text
      }


    })
    output$DOSinfo9<- renderText({
      if(input$PMHselector == "Academic Support"){

        Acadata1<-Acadata


        text<-c(Acadata1[Acadata1=="Dean of Students",9])
        text<-na.omit(text)
        text
      }


    })




























  })

  #####################
  ### EOP Resources ###
  #####################
  ## ON CAMPUS ONLY ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "EOP Support")
    EOPdata	<-	data[data$Type == 'EOP',]

    # EOP Academic Counseling Accordian -----------------------------------------------------------


    output$EOPCounselingaccord<-renderUI({

      if(input$PMHselector == "EOP Support"){
        EOPdata1<-EOPdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EOPCounselinginfo2"),
                                  uiOutput("EOPCounselinginfo3"),
                                  uiOutput("EOPCounselinginfo4"),
                                  textOutput("EOPCounselinginfo5"),
                                  textOutput("EOPCounselinginfo9"), hr()

          ),

          title = "Academic Counseling", open=F))


      }





    })


    # EOP Academic Counseling Info ----------------------------------------------------------------



    output$EOPCounselinginfo2<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Academic Counseling",2])
        text<-na.omit(text)
        text
      }


    })

    output$EOPCounselinginfo3<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Academic Counseling",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EOPCounselinginfo4<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Academic Counseling",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$EOPCounselinginfo5<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Academic Counseling",5])
        text<-na.omit(text)
        text
      }


    })
    output$EOPCounselinginfo9<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Academic Counseling",9])
        text<-na.omit(text)
        text
      }


    })





























    # EOP Peer Tutoring Program Accordian -----------------------------------------------------------


    output$EOPpeerTutoraccord<-renderUI({

      if(input$PMHselector == "EOP Support"){
        EOPdata1<-EOPdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EOPpeerTutorinfo2"),
                                  uiOutput("EOPpeerTutorinfo3"),
                                  uiOutput("EOPpeerTutorinfo4"),
                                  textOutput("EOPpeerTutorinfo5"),
                                  textOutput("EOPpeerTutorinfo9"), hr()

          ),

          title = "Peer Tutoring Program", open=F))


      }





    })


    # EOP Peer Tutoring Program Info ----------------------------------------------------------------



    output$EOPpeerTutorinfo2<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Peer Tutoring Program",2])
        text<-na.omit(text)
        text
      }


    })

    output$EOPpeerTutorinfo3<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Peer Tutoring Program",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EOPpeerTutorinfo4<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Peer Tutoring Program",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$EOPpeerTutorinfo5<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Peer Tutoring Program",5])
        text<-na.omit(text)
        text
      }


    })
    output$EOPpeerTutorinfo9<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Peer Tutoring Program",9])
        text<-na.omit(text)
        text
      }


    })




























    # EOP Computer Lab Accordian -----------------------------------------------------------


    output$EOPcomp<-renderUI({

      if(input$PMHselector == "EOP Support"){
        EOPdata1<-EOPdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EOPcompinfo2"),
                                  uiOutput("EOPcompinfo3"),
                                  uiOutput("EOPcompinfo4"),
                                  textOutput("EOPcompinfo5"),
                                  textOutput("EOPcompinfo9"), hr()

          ),

          title = "Computer Lab", open=F))


      }





    })


    # EOP Computer Lab Info ----------------------------------------------------------------



    output$EOPcompinfo2<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Computer Lab",2])
        text<-na.omit(text)
        text
      }


    })

    output$EOPcompinfo3<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Computer Lab",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EOPcompinfo4<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Computer Lab",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$EOPcompinfo5<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Computer Lab",5])
        text<-na.omit(text)
        text
      }


    })
    output$EOPcompinfo9<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Computer Lab",9])
        text<-na.omit(text)
        text
      }


    })




























    # EOP Personal & Career Growth Workshops Accordian -----------------------------------------------------------


    output$EOPworkshops<-renderUI({

      if(input$PMHselector == "EOP Support"){
        EOPdata1<-EOPdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EOPworkshopsinfo2"),
                                  uiOutput("EOPworkshopsinfo3"),
                                  uiOutput("EOPworkshopsinfo4"),
                                  textOutput("EOPworkshopsinfo5"),
                                  textOutput("EOPworkshopsinfo9"), hr()

          ),

          title = "Personal & Career Growth Workshops", open=F))


      }





    })


    # EOP Personal & Career Growth Workshops Info ----------------------------------------------------------------



    output$EOPworkshopsinfo2<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Personal & Career Growth Workshops",2])
        text<-na.omit(text)
        text
      }


    })

    output$EOPworkshopsinfo3<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Personal & Career Growth Workshops",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EOPworkshopsinfo4<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Personal & Career Growth Workshops",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$EOPworkshopsinfo5<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Personal & Career Growth Workshops",5])
        text<-na.omit(text)
        text
      }


    })
    output$EOPworkshopsinfo9<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="Personal & Career Growth Workshops",9])
        text<-na.omit(text)
        text
      }


    })





























    # EOP Writing Center Accordian -----------------------------------------------------------


    output$EOPWC<-renderUI({

      if(input$PMHselector == "EOP Support"){
        EOPdata1<-EOPdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("EOPWCinfo2"),
                                  uiOutput("EOPWCinfo3"),
                                  uiOutput("EOPWCinfo4"),
                                  textOutput("EOPWCinfo5"),
                                  textOutput("EOPWCinfo9"), hr()

          ),

          title = "EOP Writing Center", open=F))


      }





    })


    # EOP Writing Center Info ----------------------------------------------------------------



    output$EOPWCinfo2<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="EOP Writing Center",2])
        text<-na.omit(text)
        text
      }


    })

    output$EOPWCinfo3<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="EOP Writing Center",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$EOPWCinfo4<- renderUI({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="EOP Writing Center",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$EOPWCinfo5<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="EOP Writing Center",5])
        text<-na.omit(text)
        text
      }


    })
    output$EOPWCinfo9<- renderText({
      if(input$PMHselector == "EOP Support"){

        EOPdata1<-EOPdata


        text<-c(EOPdata1[EOPdata1=="EOP Writing Center",9])
        text<-na.omit(text)
        text
      }


    })






























  })

  ########################
  ### LGBTQ+ Resources ###
  ########################
  ## ON CAMPUS ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "LGBTQ+ Resources")
    SLGBTdata	<-	data[data$Type == 'SLGBT',]

    # SHAPE2 Accordian ---------------------------------------------------------

    output$SHAPE2accord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SHAPE2info2"),
                                  uiOutput("SHAPE2info3"),
                                  uiOutput("SHAPE2info4"),
                                  textOutput("SHAPE2info5"),
                                  textOutput("SHAPE2info9"), hr()

          ),

          title = "Project SHAPE", open=F))


      }





    })


    # SHAPE2 Info --------------------------------------------------------------
    output$SHAPE2info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Project SHAPE (Sexual Health and Peer Education)",2])
        text<-na.omit(text)
        text
      }


    })


    output$SHAPE2info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Project SHAPE (Sexual Health and Peer Education)",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SHAPE2info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Project SHAPE (Sexual Health and Peer Education)",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SHAPE2info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Project SHAPE (Sexual Health and Peer Education)",5])
        text<-na.omit(text)
        text
      }


    })

    output$SHAPE2info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Project SHAPE (Sexual Health and Peer Education)",9])
        text<-na.omit(text)
        text
      }


    })





    # LEGAL (LGBTQ+) Accordian ---------------------------------------------------------

    output$Legal1<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("Legal1info2"),
                                  uiOutput("Legal1info3"),
                                  uiOutput("Legal1info4"),
                                  textOutput("Legal1info5"),
                                  textOutput("Legal1info9"), hr()

          ),

          title = "Student Legal Services", open=F))


      }





    })


    # LEGAL (LGBTQ+) Info --------------------------------------------------------------
    output$Legal1info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Student Legal Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$Legal1info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Student Legal Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$Legal1info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Student Legal Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$Legal1info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Student Legal Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$Legal1info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Student Legal Services",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##
    # PRIDE3 Accordian -----------------------------------------------------------


    output$PRIDE3accord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("PRIDE3info2"),
                                  uiOutput("PRIDE3info3"),
                                  uiOutput("PRIDE3info4"),
                                  textOutput("PRIDE3info5"),
                                  textOutput("PRIDE3info9"), hr()

          ),

          title = "Pride Center of the Capital Region", open=F))


      }





    })



    # PRIDE3 Info ----------------------------------------------------------------


    output$PRIDE3info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Pride Center of the Capital Region",2])
        text<-na.omit(text)
        text
      }


    })


    output$PRIDE3info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Pride Center of the Capital Region",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$PRIDE3info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Pride Center of the Capital Region",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$PRIDE3info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Pride Center of the Capital Region",5])
        text<-na.omit(text)
        text
      }


    })

    output$PRIDE3info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Pride Center of the Capital Region",9])
        text<-na.omit(text)
        text
      }


    })





    # IOOV2 Accordian -----------------------------------------------------------


    output$IOOV2accord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("IOOV2info2"),
                                  uiOutput("IOOV2info3"),
                                  uiOutput("IOOV2info4"),
                                  textOutput("IOOV2info5"),
                                  textOutput("IOOV2info9"), hr()

          ),

          title = "In Our Own Voices", open=F))


      }





    })






    # IOOV2 Info ----------------------------------------------------------------


    output$IOOV2info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="In Our Own Voices",2])
        text<-na.omit(text)
        text
      }


    })


    output$IOOV2info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="In Our Own Voices",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$IOOV2info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="In Our Own Voices",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$IOOV2info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="In Our Own Voices",5])
        text<-na.omit(text)
        text
      }


    })

    output$IOOV2info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="In Our Own Voices",9])
        text<-na.omit(text)
        text
      }


    })






























    # APH2 Accordian -----------------------------------------------------------


    output$APH2accord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("APH2info2"),
                                  uiOutput("APH2info3"),
                                  uiOutput("APH2info4"),
                                  textOutput("APH2info5"),
                                  textOutput("APH2info9"), hr()

          ),

          title = "Alliance for Positive Health", open=F))


      }





    })



    # APH2 Info ----------------------------------------------------------------


    output$APH2info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Alliance for Positive Health",2])
        text<-na.omit(text)
        text
      }


    })


    output$APH2info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Alliance for Positive Health",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$APH2info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Alliance for Positive Health",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$APH2info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Alliance for Positive Health",5])
        text<-na.omit(text)
        text
      }


    })

    output$APH2info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Alliance for Positive Health",9])
        text<-na.omit(text)
        text
      }


    })


















    # DC2 Accordian -----------------------------------------------------------


    output$DC2accord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("DC2info2"),
                                  uiOutput("DC2info3"),
                                  uiOutput("DC2info4"),
                                  textOutput("DC2info5"),
                                  textOutput("DC2info9"), hr()

          ),

          title = "Damien Center", open=F))


      }





    })



    # DC2 Info ----------------------------------------------------------------


    output$DC2info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Damien Center",2])
        text<-na.omit(text)
        text
      }


    })


    output$DC2info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Damien Center",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$DC2info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Damien Center",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$DC2info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Damien Center",5])
        text<-na.omit(text)
        text
      }


    })

    output$DC2info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Damien Center",9])
        text<-na.omit(text)
        text
      }


    })
















    # UHPP2 Accordian -----------------------------------------------------------


    output$UHPP2accord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("UHPP2info2"),
                                  uiOutput("UHPP2info3"),
                                  uiOutput("UHPP2info4"),
                                  textOutput("UHPP2info5"),
                                  textOutput("UHPP2info9"), hr()

          ),

          title = "Upper Hudson Planned Parenthood", open=F))


      }





    })



    # UHPP2 Info ----------------------------------------------------------------


    output$UHPP2info2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Upper Hudson Planned Parenthood",2])
        text<-na.omit(text)
        text
      }


    })


    output$UHPP2info3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Upper Hudson Planned Parenthood",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$UHPP2info4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Upper Hudson Planned Parenthood",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$UHPP2info5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Upper Hudson Planned Parenthood",5])
        text<-na.omit(text)
        text
      }


    })

    output$UHPP2info9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Upper Hudson Planned Parenthood",9])
        text<-na.omit(text)
        text
      }


    })
























    # Inclusive Therapists (LGBTQ) Accordian -----------------------------------------------------------


    output$ITLGBTQaccord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){
        SLGBTdata1<-SLGBTdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("ITLGBTQinfo4"),
                                  textOutput("ITLGBTQinfo9"), hr()

          ),

          title = "Inclusive Therapists", open=F))


      }





    })



    # Inclusive Therapists (LGBTQ) Info ----------------------------------------------------------------





    output$ITLGBTQinfo4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        SLGBTdata1<-SLGBTdata


        text<-c(SLGBTdata1[SLGBTdata1=="Inclusive Therapists",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$ITLGBTQinfo9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        SLGBTdata1<-SLGBTdata


        text<-c(SLGBTdata1[SLGBTdata1=="Inclusive Therapists",9])
        text<-na.omit(text)
        text
      }


    })






















    # National Queer & Trans Therapists of Color Network (LGBTQ) Accordian -----------------------------------------------------------


    output$QTPOClgbtqaccord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){
        SLGBTdata1<-SLGBTdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  uiOutput("QTPOClgbtqinfo4"),
                                  textOutput("QTPOClgbtqinfo9"), hr()

          ),

          title = "Queer & Trans Therapists of Color", open=F))


      }





    })



    # National Queer & Trans Therapists of Color Network (LGBTQ) Info ----------------------------------------------------------------





    output$QTPOClgbtqinfo4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        SLGBTdata1<-SLGBTdata


        text<-c(SLGBTdata1[SLGBTdata1=="National Queer & Trans Therapists of Color Network",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })



    output$QTPOClgbtqinfo9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        SLGBTdata1<-SLGBTdata


        text<-c(SLGBTdata1[SLGBTdata1=="National Queer & Trans Therapists of Color Network",9])
        text<-na.omit(text)
        text
      }


    })

























    # Legal Aid Society Accordian ---------------------------------------------------------

    output$LASaccord<-renderUI({

      if(input$PMHselector == "LGBTQ+ Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("LASinfo2"),
                                  uiOutput("LASinfo3"),
                                  uiOutput("LASinfo4"),
                                  textOutput("LASinfo5"),
                                  textOutput("LASinfo9"), hr()

          ),

          title = "Legal Aid Society NE New York", open=F))


      }





    })


    # Legal Aid Society Info --------------------------------------------------------------
    output$LASinfo2<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Legal Aid Society Northeastern New York",2])
        text<-na.omit(text)
        text
      }


    })


    output$LASinfo3<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Legal Aid Society Northeastern New York",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$LASinfo4<- renderUI({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Legal Aid Society Northeastern New York",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$LASinfo5<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Legal Aid Society Northeastern New York",5])
        text<-na.omit(text)
        text
      }


    })

    output$LASinfo9<- renderText({
      if(input$PMHselector == "LGBTQ+ Resources"){

        if(input$OffCampus == F){
          SLGBTdata1<-SLGBTdata[SLGBTdata$Loc == "On",]
        } else {
          SLGBTdata1<-SLGBTdata
        }

        text<-c(SLGBTdata1[SLGBTdata1=="Legal Aid Society Northeastern New York",9])
        text<-na.omit(text)
        text
      }


    })







  })

  #######################
  ### Legal Resources ###
  #######################
  ## ON CAMPUS ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Legal Resources")
    Legaldata	<-	data[data$Type == 'Legal',]

    # LEGAL LEGAL Accordian ---------------------------------------------------------

    output$Legal2<-renderUI({

      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("Legal2info2"),
                                  uiOutput("Legal2info3"),
                                  uiOutput("Legal2info4"),
                                  textOutput("Legal2info5"),
                                  textOutput("Legal2info9"), hr()

          ),

          title = "Student Legal Services", open=F))


      }





    })


    # LEGAL LEGAL Info --------------------------------------------------------------
    output$Legal2info2<- renderText({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Student Legal Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$Legal2info3<- renderUI({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Student Legal Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$Legal2info4<- renderUI({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Student Legal Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$Legal2info5<- renderText({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Student Legal Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$Legal2info9<- renderText({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Student Legal Services",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##






    # Legal Aid Society LEGAL Accordian ---------------------------------------------------------

    output$LASLEGALaccord<-renderUI({

      if(input$PMHselector == "Legal Resources" && input$OffCampus == T){

        if(input$OffCampus == F){
          SLGBTdata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("LASLEGALinfo2"),
                                  uiOutput("LASLEGALinfo3"),
                                  uiOutput("LASLEGALinfo4"),
                                  textOutput("LASLEGALinfo5"),
                                  textOutput("LASLEGALinfo9"), hr()

          ),

          title = "Legal Aid Society NE New York", open=F))


      }





    })


    # Legal Aid Society LEGAL Info --------------------------------------------------------------
    output$LASLEGALinfo2<- renderText({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Legal Aid Society Northeastern New York",2])
        text<-na.omit(text)
        text
      }


    })


    output$LASLEGALinfo3<- renderUI({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Legal Aid Society Northeastern New York",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$LASLEGALinfo4<- renderUI({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Legal Aid Society Northeastern New York",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$LASLEGALinfo5<- renderText({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Legal Aid Society Northeastern New York",5])
        text<-na.omit(text)
        text
      }


    })

    output$LASLEGALinfo9<- renderText({
      if(input$PMHselector == "Legal Resources"){

        if(input$OffCampus == F){
          Legaldata1<-Legaldata[Legaldata$Loc == "On",]
        } else {
          Legaldata1<-Legaldata
        }

        text<-c(Legaldata1[Legaldata1=="Legal Aid Society Northeastern New York",9])
        text<-na.omit(text)
        text
      }


    })










  })

  ####################
  ### SV Resources ###
  ####################
  ## ON CAMPUS ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Sexual Violence Related")
    SVdata	<-	data[data$Type == 'SV',]

    # LEGAL SV Accordian ---------------------------------------------------------

    output$LegalSV<-renderUI({

      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("LegalSVinfo2"),
                                  uiOutput("LegalSVinfo3"),
                                  uiOutput("LegalSVinfo4"),
                                  textOutput("LegalSVinfo5"),
                                  textOutput("LegalSVinfo9"), hr()

          ),

          title = "Student Legal Services", open=F))


      }





    })


    # LEGAL SV Info --------------------------------------------------------------
    output$LegalSVinfo2<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Student Legal Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$LegalSVinfo3<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Student Legal Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$LegalSVinfo4<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Student Legal Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$LegalSVinfo5<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Student Legal Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$LegalSVinfo9<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Student Legal Services",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##









    # SV Support/Advocacy Accordian ---------------------------------------------------------

    output$SVSA<-renderUI({

      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SVSAinfo2"),
                                  uiOutput("SVSAinfo3"),
                                  uiOutput("SVSAinfo4"),
                                  textOutput("SVSAinfo5"),
                                  textOutput("SVSAinfo9"), hr()

          ),

          title = "Sexual Violence Support & Advocacy", open=F))


      }





    })


    # SV Support/Advocacy SV Info --------------------------------------------------------------
    output$SVSAinfo2<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Sexual Violence Support & Advocacy Services",2])
        text<-na.omit(text)
        text
      }


    })


    output$SVSAinfo3<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Sexual Violence Support & Advocacy Services",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SVSAinfo4<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Sexual Violence Support & Advocacy Services",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SVSAinfo5<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Sexual Violence Support & Advocacy Services",5])
        text<-na.omit(text)
        text
      }


    })

    output$Legal1info9<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Sexual Violence Support & Advocacy Services",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##














    # 24-Hour Sexual Assault Hotline Accordian ---------------------------------------------------------

    output$SAH1<-renderUI({

      if(input$PMHselector == "Sexual Violence Related" && input$OffCampus == T){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SAH1info2"),
                                  uiOutput("SAH1info3"),
                                  uiOutput("SAH1info4"),
                                  textOutput("SAH1info5"),
                                  textOutput("SAH1info9"), hr()

          ),

          title = "24-Hour Sexual Assault Hotline", open=F))


      }





    })


    # 24-Hour Sexual Assault Hotline Info --------------------------------------------------------------
    output$SAH1info2<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="24-Hour Sexual Assault Hotline",2])
        text<-na.omit(text)
        text
      }


    })


    output$SAH1info3<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="24-Hour Sexual Assault Hotline",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SAH1info4<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="24-Hour Sexual Assault Hotline",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$SAH1info5<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="24-Hour Sexual Assault Hotline",5])
        text<-na.omit(text)
        text
      }


    })

    output$SAH1info9<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="24-Hour Sexual Assault Hotline",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##














    # RAINN Accordian ---------------------------------------------------------

    output$RAINN<-renderUI({

      if(input$PMHselector == "Sexual Violence Related" && input$OffCampus == T){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("RAINNinfo2"),
                                  uiOutput("RAINNinfo3"),
                                  uiOutput("RAINNinfo4"),
                                  textOutput("RAINNinfo5"),
                                  textOutput("RAINNinfo9"), hr()

          ),

          title = "RAINN Sexual Violence", open=F))


      }





    })


    # RAINN Info --------------------------------------------------------------
    output$RAINNinfo2<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="RAINN Sexual Violence",2])
        text<-na.omit(text)
        text
      }


    })


    output$RAINNinfo3<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="RAINN Sexual Violence",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$RAINNinfo4<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="RAINN Sexual Violence",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$RAINNinfo5<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="RAINN Sexual Violence",5])
        text<-na.omit(text)
        text
      }


    })

    output$RAINNinfo9<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="RAINN Sexual Violence",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##















    # CVSVC Accordian ---------------------------------------------------------

    output$CVSVC<-renderUI({

      if(input$PMHselector == "Sexual Violence Related" && input$OffCampus == T){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("CVSVCinfo2"),
                                  uiOutput("CVSVCinfo3"),
                                  uiOutput("CVSVCinfo4"),
                                  textOutput("CVSVCinfo5"),
                                  textOutput("CVSVCinfo9"), hr()

          ),

          title = "Sexual Violence Center", open=F))


      }





    })


    # CVSVC Info --------------------------------------------------------------
    output$CVSVCinfo2<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Crime Victim and Sexual Violence Center",2])
        text<-na.omit(text)
        text
      }


    })


    output$CVSVCinfo3<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Crime Victim and Sexual Violence Center",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$CVSVCinfo4<- renderUI({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Crime Victim and Sexual Violence Center",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$CVSVCinfo5<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Crime Victim and Sexual Violence Center",5])
        text<-na.omit(text)
        text
      }


    })

    output$CVSVCinfo9<- renderText({
      if(input$PMHselector == "Sexual Violence Related"){

        if(input$OffCampus == F){
          SVdata1<-SVdata[SVdata$Loc == "On",]
        } else {
          SVdata1<-SVdata
        }

        text<-c(SVdata1[SVdata1=="Crime Victim and Sexual Violence Center",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##
















  })

  ######################
  ### FHF Resources ###
  #####################
  ## ON CAMPUS ONLY ##

  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Food, Housing, & Financial")
    FHFdata	<-	data[data$Type == 'FHF',]

    # Financial Aid Office Accordian -----------------------------------------------------------


    output$FAOaccord<-renderUI({

      if(input$PMHselector == "Food, Housing, & Financial"){
        FHFdata1<-FHFdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("FAOinfo2"),
                                  uiOutput("FAOinfo3"),
                                  uiOutput("FAOinfo4"),
                                  textOutput("FAOinfo5"),
                                  textOutput("FAOinfo9"), hr()

          ),

          title = "Financial Aid Office", open=F))


      }





    })


    # Financial AID Office Info ----------------------------------------------------------------



    output$FAOinfo2<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Financial Aid Office",2])
        text<-na.omit(text)
        text
      }


    })

    output$FAOinfo3<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Financial Aid Office",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$FAOinfo4<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Financial Aid Office",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$FAOinfo5<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Financial Aid Office",5])
        text<-na.omit(text)
        text
      }


    })
    output$FAOinfo9<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Financial Aid Office",9])
        text<-na.omit(text)
        text
      }


    })



























    # Purple Pantry Accordian -----------------------------------------------------------


    output$PURPLEPANTRYaccord<-renderUI({

      if(input$PMHselector == "Food, Housing, & Financial"){
        FHFdata1<-FHFdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("PURPLEPANTRYinfo2"),
                                  uiOutput("PURPLEPANTRYinfo3"),
                                  uiOutput("PURPLEPANTRYinfo4"),
                                  textOutput("PURPLEPANTRYinfo5"),
                                  textOutput("PURPLEPANTRYinfo9"), hr()

          ),

          title = "Purple Pantry", open=F))


      }





    })


    # Purple Pantry Info ----------------------------------------------------------------



    output$PURPLEPANTRYinfo2<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Pantry",2])
        text<-na.omit(text)
        text
      }


    })

    output$PURPLEPANTRYinfo3<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Pantry",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$PURPLEPANTRYinfo4<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Pantry",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$PURPLEPANTRYinfo5<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Pantry",5])
        text<-na.omit(text)
        text
      }


    })
    output$PURPLEPANTRYinfo9<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Pantry",9])
        text<-na.omit(text)
        text
      }


    })


























    # Purple Threads Accordian -----------------------------------------------------------


    output$PURPLETHREADSaccord<-renderUI({

      if(input$PMHselector == "Food, Housing, & Financial"){
        FHFdata1<-FHFdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("PURPLETHREADSinfo2"),
                                  uiOutput("PURPLETHREADSinfo3"),
                                  uiOutput("PURPLETHREADSinfo4"),
                                  textOutput("PURPLETHREADSinfo5"),
                                  textOutput("PURPLETHREADSinfo9"), hr()

          ),

          title = "Purple Threads", open=F))


      }





    })


    # Purple Threads Info ----------------------------------------------------------------



    output$PURPLETHREADSinfo2<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Threads",2])
        text<-na.omit(text)
        text
      }


    })

    output$PURPLETHREADSinfo3<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Threads",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$PURPLETHREADSinfo4<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Threads",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$PURPLETHREADSinfo5<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Threads",5])
        text<-na.omit(text)
        text
      }


    })
    output$PURPLETHREADSinfo9<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="Purple Threads",9])
        text<-na.omit(text)
        text
      }


    })


























    # UAlbany Student Emergency Fund Accordian -----------------------------------------------------------


    output$UAEmergFUNDaccord<-renderUI({

      if(input$PMHselector == "Food, Housing, & Financial"){
        FHFdata1<-FHFdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("UAEmergFUNDinfo2"),
                                  uiOutput("UAEmergFUNDinfo3"),
                                  uiOutput("UAEmergFUNDinfo4"),
                                  textOutput("UAEmergFUNDinfo5"),
                                  textOutput("UAEmergFUNDinfo9"), hr()

          ),

          title = "UAlbany Student Emergency Fund", open=F))


      }





    })


    # UAlbany Student Emergency Fund Info ----------------------------------------------------------------



    output$UAEmergFUNDinfo2<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="UAlbany Student Emergency Fund",2])
        text<-na.omit(text)
        text
      }


    })

    output$UAEmergFUNDinfo3<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="UAlbany Student Emergency Fund",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$UAEmergFUNDinfo4<- renderUI({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="UAlbany Student Emergency Fund",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$UAEmergFUNDinfo5<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="UAlbany Student Emergency Fund",5])
        text<-na.omit(text)
        text
      }


    })
    output$UAEmergFUNDinfo9<- renderText({
      if(input$PMHselector == "Food, Housing, & Financial"){

        FHFdata1<-FHFdata


        text<-c(FHFdata1[FHFdata1=="UAlbany Student Emergency Fund",9])
        text<-na.omit(text)
        text
      }


    })



























  })

  #################
  ### Hotlines ###
  ################
  ## OFF CAMPUS ONLY ##


  observeEvent(input$PMHselector,{
    req(input$PMHselector == "Hotlines")
    HLdata<-data[data$Type == 'Hotline',]

    # RAINN HOTLINE Accordian ---------------------------------------------------------

    output$RAINNHOTLINE<-renderUI({

      if(input$PMHselector == "Hotlines" && input$OffCampus == T){

        if(input$OffCampus == F){
          SVdata1<-HLdata[HLdata$Loc == "On",]
        } else {
          HLdata1<-HLdata
        }
        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("RAINNHOTLINEinfo2"),
                                  uiOutput("RAINNHOTLINEinfo3"),
                                  uiOutput("RAINNHOTLINEinfo4"),
                                  textOutput("RAINNHOTLINEinfo5"),
                                  textOutput("RAINNHOTLINEinfo9"), hr()

          ),

          title = "RAINN Sexual Violence", open=F))


      }





    })


    # RAINN HOTLINE Info --------------------------------------------------------------
    output$RAINNHOTLINEinfo2<- renderText({
      if(input$PMHselector == "Hotlines"){

        if(input$OffCampus == F){
          HLdata1<-HLdata[HLdata$Loc == "On",]
        } else {
          HLdata1<-HLdata
        }

        text<-c(HLdata1[HLdata1=="RAINN Sexual Violence",2])
        text<-na.omit(text)
        text
      }


    })


    output$RAINNHOTLINEinfo3<- renderUI({
      if(input$PMHselector == "Hotlines"){

        if(input$OffCampus == F){
          HLdata1<-HLdata[HLdata$Loc == "On",]
        } else {
          HLdata1<-HLdata
        }

        text<-c(HLdata1[HLdata1=="RAINN Sexual Violence",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$RAINNHOTLINEinfo4<- renderUI({
      if(input$PMHselector == "Hotlines"){

        if(input$OffCampus == F){
          HLdata1<-HLdata[HLdata$Loc == "On",]
        } else {
          HLdata1<-HLdata
        }

        text<-c(HLdata1[HLdata1=="RAINN Sexual Violence",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })

    output$RAINNHOTLINEinfo5<- renderText({
      if(input$PMHselector == "Hotlines"){

        if(input$OffCampus == F){
          HLdata1<-HLdata[HLdata$Loc == "On",]
        } else {
          HLdata1<-HLdata
        }

        text<-c(HLdata1[HLdata1=="RAINN Sexual Violence",5])
        text<-na.omit(text)
        text
      }


    })

    output$RAINNHOTLINEinfo9<- renderText({
      if(input$PMHselector == "Hotlines"){

        if(input$OffCampus == F){
          HLdata1<-HLdata[HLdata$Loc == "On",]
        } else {
          HLdata1<-HLdata
        }

        text<-c(HLdata1[HLdata1=="RAINN Sexual Violence",9])
        text<-na.omit(text)
        text
      }


    })





    ## OFF CAMPUS ##
















    # NYS Smokers HL Accordian -----------------------------------------------------------


    output$NYSsmokersHLaccord<-renderUI({

      if(input$PMHselector == "Hotlines"){
        HLdata1<-HLdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("NYSsmokersHLinfo2"),
                                  uiOutput("NYSsmokersHLinfo3"),
                                  uiOutput("NYSsmokersHLinfo4"),
                                  textOutput("NYSsmokersHLinfo5"),
                                  textOutput("NYSsmokersHLinfo9"), hr()

          ),

          title = "New York State Smoker's Quitline", open=F))


      }





    })


    # NYS Smokers HL Info ----------------------------------------------------------------



    output$NYSsmokersHLinfo2<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Smoker's Quitline",2])
        text<-na.omit(text)
        text
      }


    })

    output$NYSsmokersHLinfo3<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Smoker's Quitline",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$NYSsmokersHLinfo4<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Smoker's Quitline",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NYSsmokersHLinfo5<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Smoker's Quitline",5])
        text<-na.omit(text)
        text
      }


    })
    output$NYSsmokersHLinfo9<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Smoker's Quitline",9])
        text<-na.omit(text)
        text
      }


    })





























    # SA Hotline Accordian -----------------------------------------------------------


    output$SexAssaultHLaccord<-renderUI({

      if(input$PMHselector == "Hotlines"){
        HLdata1<-HLdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("SexAssaultHLinfo2"),
                                  uiOutput("SexAssaultHLinfo3"),
                                  uiOutput("SexAssaultHLinfo4"),
                                  textOutput("SexAssaultHLinfo5"),
                                  textOutput("SexAssaultHLinfo9"), hr()

          ),

          title = "24-Hour Sexual Assault Hotline", open=F))


      }





    })



    # SA Hotline Info ----------------------------------------------------------------



    output$SexAssaultHLinfo2<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="24-Hour Sexual Assault Hotline",2])
        text<-na.omit(text)
        text
      }


    })

    output$SexAssaultHLinfo3<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="24-Hour Sexual Assault Hotline",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$SexAssaultHLinfo4<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="24-Hour Sexual Assault Hotline",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$SexAssaultHLinfo5<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="24-Hour Sexual Assault Hotline",5])
        text<-na.omit(text)
        text
      }


    })
    output$SexAssaultHLinfo9<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="24-Hour Sexual Assault Hotline",9])
        text<-na.omit(text)
        text
      }

    })



    # NYS Gamblers Hotline Accordian -----------------------------------------------------------


    output$NYSgambHLaccord<-renderUI({

      if(input$PMHselector == "Hotlines"){
        HLdata1<-HLdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("NYSgambHLinfo2"),
                                  uiOutput("NYSgambHLinfo3"),
                                  uiOutput("NYSgambHLinfo4"),
                                  textOutput("NYSgambHLinfo5"),
                                  textOutput("NYSgambHLinfo9"), hr()

          ),

          title = "New York State Gambler's Hotline", open=F))


      }





    })


    # NYS Gamblers Hotline Info ----------------------------------------------------------------



    output$NYSgambHLinfo2<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Gambler's Hotline",2])
        text<-na.omit(text)
        text
      }


    })

    output$NYSgambHLinfo3<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Gambler's Hotline",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$NYSgambHLinfo4<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Gambler's Hotline",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NYSgambHLinfo5<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Gambler's Hotline",5])
        text<-na.omit(text)
        text
      }

    })



    output$NYSgambHLinfo9<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Gambler's Hotline",9])
        text<-na.omit(text)
        text
      }

    })
























    # NYS Support Hotline Accordian -----------------------------------------------------------


    output$NYSsupportHLaccord<-renderUI({

      if(input$PMHselector == "Hotlines"){
        HLdata1<-HLdata

        tagList(
          f7AccordionItem(f7Block(br(),
                                  textOutput("NYSsupportHLinfo2"),
                                  uiOutput("NYSsupportHLinfo3"),
                                  uiOutput("NYSsupportHLinfo4"),
                                  textOutput("NYSsupportHLinfo5"),
                                  textOutput("NYSsupportHLinfo9"), hr()

          ),

          title = "New York State Support Line", open=F))


      }





    })


    # NYS Support Hotline Info ----------------------------------------------------------------



    output$NYSsupportHLinfo2<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Support Line",2])
        text<-na.omit(text)
        text
      }


    })

    output$NYSsupportHLinfo3<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Support Line",3])
        text<-na.omit(text)
        f7Link("Call now", href=text)
      }


    })

    output$NYSsupportHLinfo4<- renderUI({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Support Line",4])
        text<-na.omit(text)
        f7Link(text, href=text)
      }


    })


    output$NYSsupportHLinfo5<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Support Line",5])
        text<-na.omit(text)
        text
      }

    })



    output$NYSsupportHLinfo9<- renderText({
      if(input$PMHselector == "Hotlines"){

        HLdata1<-HLdata


        text<-c(HLdata1[HLdata1=="New York State Support Line",9])
        text<-na.omit(text)
        text
      }

    })



  })
}
