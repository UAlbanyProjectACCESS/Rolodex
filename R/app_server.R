#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @importFrom stats na.omit
#' @import magrittr
#' @noRd
app_server <- function(input, output, session) {
  # shinyOptions(cache = cachem::cache_mem(max_size = 500e6))
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
                       h5(f7Icon("money_dollar_circle"), "- Earn a $30 Amazon Gift Card"),
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
                       h5(f7Icon("money_dollar_circle"), "- Earn a $30 Amazon Gift Card"),
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
                                  f7Block(h3("Project ACCESS is an innovative translational research initiative at UAlbany funded by a grant from the federal government and our mission is to help you find and decide on what kind of resources and services might help you."),
                                          hr(),
                                          h4("We offer appointments with peer-navigators to explore free on- and off-campus resources,
                                            education events that help you thrive as a student and in life, and connections to confidential and anonymous on-campus STI testing provided by our community partners"),
                                          HTML('<center><iframe width="auto" height="auto" src="https://www.youtube.com/embed/mbkk2nPw8gY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>'),
                                          f7Align(div(f7Link(h3("Learn more about Project ACCESS"), href="https://www.albany.edu/education/research/behavioral-health-promotion#tab-project-access")),side=c("center")),
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
    if(input$tab=="ApptTab"){
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
}

  })



  # Instagram Link ----------------------------------------------------------
  observeEvent(input$tab,{
    if(input$tab=="Insta"){
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
    }
  })























## 93% reduction in lines of codes by modularizing accordion displays
## Originally, 11,360 lines of code. Reduced to 832.

# Observe PMH selector ----------------------------------------------------


  observeEvent(input$PMHselector,{

    # PHM Accordion -----------------------------------------------------------

    if(input$PMHselector == "Physical Health"){
      selection<-input$PMHselector
    PMHdata<-reactive({
      data[data$Type == 'PhysMH',]
    }) %>% bindCache(data[data$Type == 'PhysMH',])




    observeEvent(input$OffCampus,{

      if(input$OffCampus == F) {

        mod_Accordion_server('SHS', selector=selection, data=PMHdata(), title=c("Student Health Services"),Visible = T)
        mod_Accordion_server('SCS', selector=selection, data=PMHdata(), title=c("Student Care Services"),Visible = T)
        mod_Accordion_server('IOOV', selector=selection, data=PMHdata(), title=c("In Our Own Voices"),Visible = F)
        mod_Accordion_server('SHAPE', selector=selection, data=PMHdata(), title=c("Project SHAPE"),Visible = T)
        mod_Accordion_server('ELLIS', selector=selection, data=PMHdata(), title=c("Ellis Medicine Insurance Programs"),Visible = F)
        mod_Accordion_server('AMC', selector=selection, data=PMHdata(), title=c("Albany Medical Center"),Visible = F)
        mod_Accordion_server('AMCwash', selector=selection, data=PMHdata(), title=c("Albany Med (Washington Ave)"),Visible = F)
        mod_Accordion_server('UrgentC', selector=selection, data=PMHdata(), title=c("EmUrgentCare at Colonie"),Visible = F)
        mod_Accordion_server('SAMARITAN', selector=selection, data=PMHdata(), title=c("Samaritan Hospital"),Visible = F)
        mod_Accordion_server('STPETERS', selector=selection, data=PMHdata(), title=c("St. Peter's Hospital"),Visible = F)

        mod_info_server('SHS', selector=selection, data=PMHdata(), rownametitle=c("Student Health Services"), phone=T, website=T)
        mod_info_server('SCS', selector=selection, data=PMHdata(), rownametitle=c("Student Care Services"), phone=T, website=T)
        mod_info_server('IOOV', selector=selction, data=PMHdata(), rownametitle=c("In Our Own Voices"), phone=T, website=T)
        mod_info_server('SHAPE',selector=selection, data=PMHdata(), rownametitle=c("Project SHAPE (Sexual Health and Peer Education)"), phone=T, website=T)
        mod_info_server('ELLIS',selector=selection, data=PMHdata(), rownametitle=c("Ellis Medicine Medicaid/Health Insurance Programs"), phone=T, website=T)
        mod_info_server('AMC',selector=selection, data=PMHdata(), rownametitle=c("Albany Medical Center"), phone=T, website=T)
        mod_info_server('AMCwash',selector=selection, data=PMHdata(), rownametitle=c("Albany Med (Washington Ave)"), phone=T, website=T)
        mod_info_server('UrgentC',selector=selection, data=PMHdata(), rownametitle=c("EmUrgentCare at Colonie"), phone=T, website=T)
        mod_info_server('SAMARITAN',selector=selection, data=PMHdata(), rownametitle=c("Samaritan Hospital - Albany Memorial Campus"), phone=T, website=T)
        mod_info_server('STPETERS',selector=selection, data=PMHdata(), rownametitle=c("St. Peter's Hospital"), phone=T, website=T)



      } else {
        mod_Accordion_server('SHS', selector=selection, data=PMHdata(), title=c("Student Health Services"),Visible = T)
        mod_Accordion_server('SCS', selector=selection, data=PMHdata(), title=c("Student Care Services"),Visible = T)
        mod_Accordion_server('IOOV', selector=selection, data=PMHdata(), title=c("In Our Own Voices"),Visible = T)
        mod_Accordion_server('SHAPE', selector=selection, data=PMHdata(), title=c("Project SHAPE"),Visible = T)
        mod_Accordion_server('ELLIS', selector=selection, data=PMHdata(), title=c("Ellis Medicine Insurance Programs"),Visible = T)
        mod_Accordion_server('AMC', selector=selection, data=PMHdata(), title=c("Albany Medical Center"),Visible = T)
        mod_Accordion_server('AMCwash', selector=selection, data=PMHdata(), title=c("Albany Med (Washington Ave)"),Visible = T)
        mod_Accordion_server('UrgentC', selector=selection, data=PMHdata(), title=c("EmUrgentCare at Colonie"),Visible = T)
        mod_Accordion_server('SAMARITAN', selector=selection, data=PMHdata(), title=c("Samaritan Hospital"),Visible = T)
        mod_Accordion_server('STPETERS', selector=selection, data=PMHdata(), title=c("St. Peter's Hospital"),Visible = T)

        mod_info_server('SHS', selector=selection, data=PMHdata(), rownametitle=c("Student Health Services"), phone=T, website=T)
        mod_info_server('SCS', selector=selection, data=PMHdata(), rownametitle=c("Student Care Services"), phone=T, website=T)
        mod_info_server('IOOV', selector=selction, data=PMHdata(), rownametitle=c("In Our Own Voices"), phone=T, website=T)
        mod_info_server('SHAPE',selector=selection, data=PMHdata(), rownametitle=c("Project SHAPE (Sexual Health and Peer Education)"), phone=T, website=T)
        mod_info_server('ELLIS',selector=selection, data=PMHdata(), rownametitle=c("Ellis Medicine Medicaid/Health Insurance Programs"), phone=T, website=T)
        mod_info_server('AMC',selector=selection, data=PMHdata(), rownametitle=c("Albany Medical Center"), phone=T, website=T)
        mod_info_server('AMCwash',selector=selection, data=PMHdata(), rownametitle=c("Albany Med (Washington Ave)"), phone=T, website=T)
        mod_info_server('UrgentC',selector=selection, data=PMHdata(), rownametitle=c("EmUrgentCare at Colonie"), phone=T, website=T)
        mod_info_server('SAMARITAN',selector=selection, data=PMHdata(), rownametitle=c("Samaritan Hospital - Albany Memorial Campus"), phone=T, website=T)
        mod_info_server('STPETERS',selector=selection, data=PMHdata(), rownametitle=c("St. Peter's Hospital"), phone=T, website=T)


      }
    })

    }

    # MH Accordion ------------------------------------------------------------


      if(input$PMHselector == "Mental Health (MH)"){
      selection<-input$PMHselector
      MHdata<-reactive({
        data[data$Type == 'MH',]
      }) %>% bindCache(data[data$Type == 'MH',])
      observeEvent(input$OffCampus,{

        if(input$OffCampus == F) {
          # ON CAMPUS
          mod_Accordion_server('Mhcaps', selector=selection, data=MHdata(), title=c("Counseling and Psychological Services Center (CAPS)"),Visible = T)
          mod_Accordion_server('Mhmiddleearth', selector=selection, data=MHdata(), title=c("Middle Earth"),Visible = T)
          mod_Accordion_server('MHprideCenter', selector=selection, data=MHdata(), title=c("Pride Center of the Capital Region"),Visible = F)
          mod_Accordion_server('MHsuicideFound', selector=selection, data=MHdata(), title=c("American Foundation for Suicide Prevention Capital Region"),Visible = F)
          mod_Accordion_server('Mhnyspa', selector=selection, data=MHdata(), title=c("Find a Psychologist (NYSPA)"),Visible = F)
          mod_Accordion_server('Mhpsychtoday', selector=selection, data=MHdata(), title=c("Find a Therapist (Psych Today)"),Visible = F)


          mod_info_server('Mhcaps',selector=selection, data=MHdata(), rownametitle=c("Counseling and Psychological Services Center (CAPS)"), phone=T, website=T)
          mod_info_server('Mhmiddleearth',selector=selection, data=MHdata(), rownametitle=c("Middle Earth"), phone=T, website=T)
          mod_info_server('MHprideCenter',selector=selection, data=MHdata(), rownametitle=c("Pride Center of the Capital Region"), phone=T, website=T)
          mod_info_server('MHsuicideFound',selector=selection, data=MHdata(), rownametitle=c("American Foundation for Suicide Prevention Capital Region"), phone=T, website=T)
          mod_info_server('Mhnyspa',selector=selection, data=MHdata(), rownametitle=c("Find a Psychologist (NYSPA)"), phone=F, website=T)
          mod_info_server('Mhpsychtoday',selector=selection, data=MHdata(), rownametitle=c("Find a Therapist (Psych Today)"), phone=F, website=T)
          mod_Accordion_server('MH_SuicideLifeline', selector=selection, data=MHdata(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = F)
          mod_info_server('MH_SuicideLifeline', selector = selection, data = MHdata(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)


        } else {
          mod_Accordion_server('Mhcaps', selector=selection, data=MHdata(), title=c("Counseling and Psychological Services Center (CAPS)"),Visible = T)
          mod_Accordion_server('Mhmiddleearth', selector=selection, data=MHdata(), title=c("Middle Earth"),Visible = T)
          mod_Accordion_server('MHprideCenter', selector=selection, data=MHdata(), title=c("Pride Center of the Capital Region"),Visible = T)
          mod_Accordion_server('MHsuicideFound', selector=selection, data=MHdata(), title=c("American Foundation for Suicide Prevention Capital Region"),Visible = T)
          mod_Accordion_server('Mhnyspa', selector=selection, data=MHdata(), title=c("Find a Psychologist (NYSPA)"),Visible = T)
          mod_Accordion_server('Mhpsychtoday', selector=selection, data=MHdata(), title=c("Find a Therapist (Psych Today)"),Visible = T)


          mod_info_server('Mhcaps',selector=selection, data=MHdata(), rownametitle=c("Counseling and Psychological Services Center (CAPS)"), phone=T, website=T)
          mod_info_server('Mhmiddleearth',selector=selection, data=MHdata(), rownametitle=c("Middle Earth"), phone=T, website=T)
          mod_info_server('MHprideCenter',selector=selection, data=MHdata(), rownametitle=c("Pride Center of the Capital Region"), phone=T, website=T)
          mod_info_server('MHsuicideFound',selector=selection, data=MHdata(), rownametitle=c("American Foundation for Suicide Prevention Capital Region"), phone=T, website=T)
          mod_info_server('Mhnyspa',selector=selection, data=MHdata(), rownametitle=c("Find a Psychologist (NYSPA)"), phone=F, website=T)
          mod_info_server('Mhpsychtoday',selector=selection, data=MHdata(), rownametitle=c("Find a Therapist (Psych Today)"), phone=F, website=T)
          mod_Accordion_server('MH_SuicideLifeline', selector=selection, data=MHdata(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = T)
          mod_info_server('MH_SuicideLifeline', selector = selection, data = MHdata(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)

        }
      })
}




    # MH Black Communities ----------------------------------------------------


      if(input$PMHselector == "MH Resources (Black Communities)"){
      selection<-input$PMHselector
      MHBC<-reactive({
        data[data$Type == 'MHBC',]
      }) %>% bindCache(data[data$Type == 'MHBC',])


      mod_Accordion_server('akkoma', selector=selection, data=MHBC(), title = c('AAKOMA Project'), Visible = T)
      mod_info_server('akkoma', selector = selection, data = MHBC(), rownametitle = c('AAKOMA Project'), phone = F, website = T)
      mod_Accordion_server('BEAM', selector=selection, data=MHBC(), title = c('Black Mental Wellness'), Visible = T)
      mod_info_server('BEAM', selector = selection, data = MHBC(), rownametitle = c('Black Emotional and Mental Health Collective (BEAM)'), phone = F, website = T)
      mod_Accordion_server('BLHF', selector=selection, data=MHBC(), title = c('The Boris Lawrence Henson Foundation'), Visible = T)
      mod_info_server('BLHF', selector = selection, data = MHBC(), rownametitle = c('The Boris Lawrence Henson Foundation'), phone = F, website = T)
      mod_Accordion_server('BROMM', selector=selection, data=MHBC(), title = c('Brother, You are on My Mind'), Visible = T)
      mod_info_server('BROMM', selector = selection, data = MHBC(), rownametitle = c('Brother, You are on My Mind'), phone = F, website = T)
      mod_Accordion_server('MHBCinsclusivetherapists', selector=selection, data=MHBC(), title = c('Inclusive Therapists'), Visible = T)
      mod_info_server('MHBCinsclusivetherapists', selector = selection, data = MHBC(), rownametitle = c('Inclusive Therapists'), phone = F, website = T)
      mod_Accordion_server('Loveland', selector=selection, data=MHBC(), title = c('The Loveland Foundation'), Visible = T)
      mod_info_server('Loveland', selector = selection, data = MHBC(), rownametitle = c('The Loveland Foundation'), phone = F, website = T)
      mod_Accordion_server('MalaninandMH', selector=selection, data=MHBC(), title = c('Melanin and Mental Health'), Visible = T)
      mod_info_server('MalaninandMH', selector = selection, data = MHBC(), rownametitle = c('Melanin and Mental Health'), phone = F, website = T)
      mod_Accordion_server('POCagainstsuicide', selector=selection, data=MHBC(), title = c('People of Color Against Suicide'), Visible = T)
      mod_info_server('POCagainstsuicide', selector = selection, data = MHBC(), rownametitle = c('National Organization for People of Color Against Suicide'), phone = F, website = T)
      mod_Accordion_server('Qttoc', selector=selection, data=MHBC(), title = c('Queer & Trans Therapists of Color'), Visible = T)
      mod_info_server('Qttoc', selector = selection, data = MHBC(), rownametitle = c('National Queer & Trans Therapists of Color Network'), phone = F, website = T)
      mod_Accordion_server('TherapyBlackGirls', selector=selection, data=MHBC(), title = c('Therapy for Black Girls'), Visible = T)
      mod_info_server('TherapyBlackGirls', selector = selection, data = MHBC(), rownametitle = c('Therapy for Black Girls'), phone = F, website = T)
      mod_Accordion_server('TherapyBlackMen', selector=selection, data=MHBC(), title = c('Therapy for Black Men'), Visible = T)
      mod_info_server('TherapyBlackMen', selector = selection, data = MHBC(), rownametitle = c('Therapy for Black Men'), phone = F, website = T)
      mod_Accordion_server('MHBC_SuicideLifeline', selector=selection, data=MHBC(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = T)
      mod_info_server('MHBC_SuicideLifeline', selector = selection, data = MHBC(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)

}

















    # MH Hispanic Communities -------------------------------------------------



    if(input$PMHselector == "MH Resources (Hispanic Communities)"){
      selection<-input$PMHselector

      MHLC<-reactive({
        data[data$Type == 'MHLC',]
      }) %>% bindCache(data[data$Type == 'MHLC',])



      mod_Accordion_server('CDLatinos', selector=selection, data=MHLC(), title = c('Capital District Latinos'), Visible = T)
      mod_info_server('CDLatinos', selector = selection, data = MHLC(), rownametitle = c('Capital District Latinos'), phone = F, website = T)
      mod_Accordion_server('MHLCInclusiveTherapists', selector=selection, data=MHLC(), title = c('Inclusive Therapists'), Visible = T)
      mod_info_server('MHLCInclusiveTherapists', selector = selection, data = MHLC(), rownametitle = c('Inclusive Therapists'), phone = F, website = T)
      mod_Accordion_server('LifeisPrecious', selector=selection, data=MHLC(), title = c('Life is Precious'), Visible = T)
      mod_info_server('LifeisPrecious', selector = selection, data = MHLC(), rownametitle = c('Life is Precious'), phone = F, website = T)
      mod_Accordion_server('LatinXtherapy', selector=selection, data=MHLC(), title = c('Latinx Therapy'), Visible = T)
      mod_info_server('LatinXtherapy', selector = selection, data = MHLC(), rownametitle = c('Latinx Therapy'), phone = F, website = T)
      mod_Accordion_server('NatnlLatinaOrg', selector=selection, data=MHLC(), title = c('National Latina Organization'), Visible = T)
      mod_info_server('NatnlLatinaOrg', selector = selection, data = MHLC(), rownametitle = c('MANA, A National Latina Organization'), phone = F, website = T)
      mod_Accordion_server('NatlAllianceHispHealth', selector=selection, data=MHLC(), title = c('Alliance for Hispanic Health'), Visible = T)
      mod_info_server('NatlAllianceHispHealth', selector = selection, data = MHLC(), rownametitle = c('National Alliance for Hispanic Health'), phone = F, website = T)
      mod_Accordion_server('LatinxPsychAssociation', selector=selection, data=MHLC(), title = c('Latinx Psych Association'), Visible = T)
      mod_info_server('LatinxPsychAssociation', selector = selection, data = MHLC(), rownametitle = c('National Latinx Psychological Association'), phone = F, website = T)
      mod_Accordion_server('MHLCpocagainstsuicide', selector=selection, data=MHLC(), title = c('People of Color Against Suicide'), Visible = T)
      mod_info_server('MHLCpocagainstsuicide', selector = selection, data = MHLC(), rownametitle = c('National Organization for People of Color Against Suicide'), phone = F, website = T)
      mod_Accordion_server('MHLCqtTherapistsofColor', selector=selection, data=MHLC(), title = c('Queer & Trans Therapists of Color'), Visible = T)
      mod_info_server('MHLCqtTherapistsofColor', selector = selection, data = MHLC(), rownametitle = c('National Queer & Trans Therapists of Color Network'), phone = F, website = T)
      mod_Accordion_server('MHLC_SuicideLifeline', selector=selection, data=MHLC(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = T)
      mod_info_server('MHLC_SuicideLifeline', selector = selection, data = MHLC(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)


    }









    # LGBTQ+ Accordion --------------------------------------------------------



    if(input$PMHselector == "LGBTQ+ Resources"){
      selection<-input$PMHselector
      SLGBT<-reactive({
        data[data$Type == 'SLGBT',]
      }) %>% bindCache(data[data$Type == 'SLGBT',])
      observeEvent(input$OffCampus,{

        if(input$OffCampus == F) {
          # ON CAMPUS

          mod_Accordion_server('LGB_pridecenter', selector=selection, data=SLGBT(), title = c('Pride Center of the Capital Region'), Visible = F)
          mod_info_server('LGB_pridecenter', selector = selection, data = SLGBT(), rownametitle = c('Pride Center of the Capital Region'), phone = T, website = T)
          mod_Accordion_server('LBG_IOOV', selector=selection, data=SLGBT(), title = c('In Our Own Voices'), Visible = F)
          mod_info_server('LBG_IOOV', selector = selection, data = SLGBT(), rownametitle = c('In Our Own Voices'), phone = T, website = T)
          mod_Accordion_server('LGB_APH', selector=selection, data=SLGBT(), title = c('Alliance for Positive Health'), Visible = F)
          mod_info_server('LGB_APH', selector = selection, data = SLGBT(), rownametitle = c('Alliance for Positive Health'), phone = T, website = T)
          mod_Accordion_server('LGB_DamienCenter', selector=selection, data=SLGBT(), title = c('Damien Center'), Visible = F)
          mod_info_server('LGB_DamienCenter', selector = selection, data = SLGBT(), rownametitle = c('Damien Center'), phone = T, website = T)
          mod_Accordion_server('LGB_UHPP', selector=selection, data=SLGBT(), title = c('Upper Hudson Planned Parenthood'), Visible = F)
          mod_info_server('LGB_UHPP', selector = selection, data = SLGBT(), rownametitle = c('Upper Hudson Planned Parenthood'), phone = T, website = T)
          mod_Accordion_server('LGB_InclusiveTherapists', selector=selection, data=SLGBT(), title = c('Inclusive Therapists'), Visible = F)
          mod_info_server('LGB_InclusiveTherapists', selector = selection, data = SLGBT(), rownametitle = c('Inclusive Therapists'), phone = F, website = T)
          mod_Accordion_server('LGB_Qttherapistsofcolor', selector=selection, data=SLGBT(), title = c('Queer & Trans Therapists of Color'), Visible = F)
          mod_info_server('LGB_Qttherapistsofcolor', selector = selection, data = SLGBT(), rownametitle = c('National Queer & Trans Therapists of Color Network'), phone = F, website = T)
          mod_Accordion_server('LGB_SHAPE', selector=selection, data=SLGBT(), title = c('Project SHAPE'), Visible = T)
          mod_info_server('LGB_SHAPE', selector = selection, data = SLGBT(), rownametitle = c('Project SHAPE (Sexual Health and Peer Education)'), phone = T, website = T)
          mod_Accordion_server('LGB_LegalAIDNENY', selector=selection, data=SLGBT(), title = c('Legal Aid of NE New York'), Visible = F)
          mod_info_server('LGB_LegalAIDNENY', selector = selection, data = SLGBT(), rownametitle = c('Legal Aid Society Northeastern New York'), phone = T, website = T)
          mod_Accordion_server('LGB_StudentLegal', selector=selection, data=SLGBT(), title = c('Student Legal Services'), Visible = T)
          mod_info_server('LGB_StudentLegal', selector = selection, data = SLGBT(), rownametitle = c('Student Legal Services'), phone = T, website = T)
          mod_Accordion_server('LGBTQ_SuicideLifeline', selector=selection, data=SLGBT(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = F)
          mod_info_server('LGBTQ_SuicideLifeline', selector = selection, data = SLGBT(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)
          mod_Accordion_server('LGBTQ_TrevorProject', selector=selection, data=SLGBT(), title = c('The Trevor Project'), Visible = F)
          mod_info_server('LGBTQ_TrevorProject', selector = selection, data = SLGBT(), rownametitle = c('The Trevor Project'), phone = T, website = T)


        } else {

          mod_Accordion_server('LGB_pridecenter', selector=selection, data=SLGBT(), title = c('Pride Center of the Capital Region'), Visible = T)
          mod_info_server('LGB_pridecenter', selector = selection, data = SLGBT(), rownametitle = c('Pride Center of the Capital Region'), phone = T, website = T)
          mod_Accordion_server('LBG_IOOV', selector=selection, data=SLGBT(), title = c('In Our Own Voices'), Visible = T)
          mod_info_server('LBG_IOOV', selector = selection, data = SLGBT(), rownametitle = c('In Our Own Voices'), phone = T, website = T)
          mod_Accordion_server('LGB_APH', selector=selection, data=SLGBT(), title = c('Alliance for Positive Health'), Visible = T)
          mod_info_server('LGB_APH', selector = selection, data = SLGBT(), rownametitle = c('Alliance for Positive Health'), phone = T, website = T)
          mod_Accordion_server('LGB_DamienCenter', selector=selection, data=SLGBT(), title = c('Damien Center'), Visible = T)
          mod_info_server('LGB_DamienCenter', selector = selection, data = SLGBT(), rownametitle = c('Damien Center'), phone = T, website = T)
          mod_Accordion_server('LGB_UHPP', selector=selection, data=SLGBT(), title = c('Upper Hudson Planned Parenthood'), Visible = T)
          mod_info_server('LGB_UHPP', selector = selection, data = SLGBT(), rownametitle = c('Upper Hudson Planned Parenthood'), phone = T, website = T)
          mod_Accordion_server('LGB_InclusiveTherapists', selector=selection, data=SLGBT(), title = c('Inclusive Therapists'), Visible = T)
          mod_info_server('LGB_InclusiveTherapists', selector = selection, data = SLGBT(), rownametitle = c('Inclusive Therapists'), phone = F, website = T)
          mod_Accordion_server('LGB_Qttherapistsofcolor', selector=selection, data=SLGBT(), title = c('Queer & Trans Therapists of Color'), Visible = T)
          mod_info_server('LGB_Qttherapistsofcolor', selector = selection, data = SLGBT(), rownametitle = c('National Queer & Trans Therapists of Color Network'), phone = F, website = T)
          mod_Accordion_server('LGB_SHAPE', selector=selection, data=SLGBT(), title = c('Project SHAPE'), Visible = T)
          mod_info_server('LGB_SHAPE', selector = selection, data = SLGBT(), rownametitle = c('Project SHAPE (Sexual Health and Peer Education)'), phone = T, website = T)
          mod_Accordion_server('LGB_LegalAIDNENY', selector=selection, data=SLGBT(), title = c('Legal Aid of NE New York'), Visible = T)
          mod_info_server('LGB_LegalAIDNENY', selector = selection, data = SLGBT(), rownametitle = c('Legal Aid Society Northeastern New York'), phone = T, website = T)
          mod_Accordion_server('LGB_StudentLegal', selector=selection, data=SLGBT(), title = c('Student Legal Services'), Visible = T)
          mod_info_server('LGB_StudentLegal', selector = selection, data = SLGBT(), rownametitle = c('Student Legal Services'), phone = T, website = T)
          mod_Accordion_server('LGBTQ_SuicideLifeline', selector=selection, data=SLGBT(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = T)
          mod_info_server('LGBTQ_SuicideLifeline', selector = selection, data = SLGBT(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)
          mod_Accordion_server('LGBTQ_TrevorProject', selector=selection, data=SLGBT(), title = c('The Trevor Project'), Visible = T)
          mod_info_server('LGBTQ_TrevorProject', selector = selection, data = SLGBT(), rownametitle = c('The Trevor Project'), phone = T, website = T)


        }
      })
    }





    # Sexual Health Accordion -------------------------------------------------



    if(input$PMHselector == "Sexual Health"){
      selection<-input$PMHselector
      HIVSTI<-reactive({
        data[data$Type == 'HIVSTI',]
      }) %>% bindCache(data[data$Type == 'HIVSTI',])
      observeEvent(input$OffCampus,{

        if(input$OffCampus == F) {
          # ON CAMPUS
          mod_Accordion_server('SH_SHS', selector=selection, data=HIVSTI(), title = c('Student Health Services'), Visible = T)
          mod_info_server('SH_SHS', selector = selection, data = HIVSTI(), rownametitle = c('Student Health Services'), phone = T, website = T)
          mod_Accordion_server('SH_APH', selector=selection, data=HIVSTI(), title = c('Alliance for Positive Health'), Visible = F)
          mod_info_server('SH_APH', selector = selection, data = HIVSTI(), rownametitle = c('Alliance for Positive Health'), phone = T, website = T)
          mod_Accordion_server('SH_AMC', selector=selection, data=HIVSTI(), title = c('Albany Med Young Adult Program'), Visible = F)
          mod_info_server('SH_AMC', selector = selection, data = HIVSTI(), rownametitle = c('Albany Med Young Adult Program'), phone = T, website = T)
          mod_Accordion_server('SH_DamienCenter', selector=selection, data=HIVSTI(), title = c('Damien Center'), Visible = F)
          mod_info_server('SH_DamienCenter', selector = selection, data = HIVSTI(), rownametitle = c('Damien Center'), phone = T, website = T)
          mod_Accordion_server('SH_UHPP', selector=selection, data=HIVSTI(), title = c('Upper Hudson Planned Parenthood'), Visible = F)
          mod_info_server('SH_UHPP', selector = selection, data = HIVSTI(), rownametitle = c('Upper Hudson Planned Parenthood'), phone = T, website = T)
          mod_Accordion_server('SH_PrideCenter', selector=selection, data=HIVSTI(), title = c('Pride Center of the Capital Region'), Visible = F)
          mod_info_server('SH_PrideCenter', selector = selection, data = HIVSTI(), rownametitle = c('Pride Center of the Capital Region'), phone = T, website = T)
          mod_Accordion_server('SH_WYH', selector=selection, data=HIVSTI(), title = c('Whitney Young Health'), Visible = F)
          mod_info_server('SH_WYH', selector = selection, data = HIVSTI(), rownametitle = c('Whitney Young Health'), phone = T, website = T)


        } else {

          mod_Accordion_server('SH_SHS', selector=selection, data=HIVSTI(), title = c('Student Health Services'), Visible = T)
          mod_info_server('SH_SHS', selector = selection, data = HIVSTI(), rownametitle = c('Student Health Services'), phone = T, website = T)
          mod_Accordion_server('SH_APH', selector=selection, data=HIVSTI(), title = c('Alliance for Positive Health'), Visible = T)
          mod_info_server('SH_APH', selector = selection, data = HIVSTI(), rownametitle = c('Alliance for Positive Health'), phone = T, website = T)
          mod_Accordion_server('SH_AMC', selector=selection, data=HIVSTI(), title = c('Albany Med Young Adult Program'), Visible = T)
          mod_info_server('SH_AMC', selector = selection, data = HIVSTI(), rownametitle = c('Albany Med Young Adult Program'), phone = T, website = T)
          mod_Accordion_server('SH_DamienCenter', selector=selection, data=HIVSTI(), title = c('Damien Center'), Visible = T)
          mod_info_server('SH_DamienCenter', selector = selection, data = HIVSTI(), rownametitle = c('Damien Center'), phone = T, website = T)
          mod_Accordion_server('SH_UHPP', selector=selection, data=HIVSTI(), title = c('Upper Hudson Planned Parenthood'), Visible = T)
          mod_info_server('SH_UHPP', selector = selection, data = HIVSTI(), rownametitle = c('Upper Hudson Planned Parenthood'), phone = T, website = T)
          mod_Accordion_server('SH_PrideCenter', selector=selection, data=HIVSTI(), title = c('Pride Center of the Capital Region'), Visible = T)
          mod_info_server('SH_PrideCenter', selector = selection, data = HIVSTI(), rownametitle = c('Pride Center of the Capital Region'), phone = T, website = T)
          mod_Accordion_server('SH_WYH', selector=selection, data=HIVSTI(), title = c('Whitney Young Health'), Visible = T)
          mod_info_server('SH_WYH', selector = selection, data = HIVSTI(), rownametitle = c('Whitney Young Health'), phone = T, website = T)

        }
      })
    }



    # Sexual Violence Accordion -----------------------------------------------



    if(input$PMHselector == "Sexual Violence Related"){
      selection<-input$PMHselector
      # SVdata<-data[data$Type == 'SV',]
      observeEvent(input$OffCampus,{

        if(input$OffCampus == F) {
          # ON CAMPUS
          mod_Accordion_server('SV_SLS', selector=selection, data=SVdata(), title = c('Student Legal Services'), Visible = T)
          mod_info_server('SV_SLS', selector = selection, data = SVdata(), rownametitle = c('Student Legal Services'), phone = T, website = T)
          mod_Accordion_server('SV_SVsupportAdvocacy', selector=selection, data=SVdata(), title = c('Sexual Violence Support & Advocacy'), Visible = F)
          mod_info_server('SV_SVsupportAdvocacy', selector = selection, data = SVdata(), rownametitle = c('Sexual Violence Support & Advocacy Services'), phone = T, website = T)
          mod_Accordion_server('SV_24hrSexualAssaultHotline', selector=selection, data=SVdata(), title = c('24-Hour Sexual Assault Hotline'), Visible = F)
          mod_info_server('SV_24hrSexualAssaultHotline', selector = selection, data = SVdata(), rownametitle = c('24-Hour Sexual Assault Hotline'), phone = T, website = T)
          mod_Accordion_server('SV_RAINN', selector=selection, data=SVdata(), title = c('RAINN Sexual Violence'), Visible = F)
          mod_info_server('SV_RAINN', selector = selection, data = SVdata(), rownametitle = c('RAINN Sexual Violence'), phone = T, website = T)
          mod_Accordion_server('SV_Svcenter', selector=selection, data=SVdata(), title = c('Sexual Violence Center'), Visible = F)
          mod_info_server('SV_Svcenter', selector = selection, data = SVdata(), rownametitle = c('Crime Victim and Sexual Violence Center'), phone = T, website = T)



        } else {

          mod_Accordion_server('SV_SLS', selector=selection, data=SVdata(), title = c('Student Legal Services'), Visible = T)
          mod_info_server('SV_SLS', selector = selection, data = SVdata(), rownametitle = c('Student Legal Services'), phone = T, website = T)
          mod_Accordion_server('SV_SVsupportAdvocacy', selector=selection, data=SVdata(), title = c('Sexual Violence Support & Advocacy'), Visible = T)
          mod_info_server('SV_SVsupportAdvocacy', selector = selection, data = SVdata(), rownametitle = c('Sexual Violence Support & Advocacy Services'), phone = T, website = T)
          mod_Accordion_server('SV_24hrSexualAssaultHotline', selector=selection, data=SVdata(), title = c('24-Hour Sexual Assault Hotline'), Visible = T)
          mod_info_server('SV_24hrSexualAssaultHotline', selector = selection, data = SVdata(), rownametitle = c('24-Hour Sexual Assault Hotline'), phone = T, website = T)
          mod_Accordion_server('SV_RAINN', selector=selection, data=SVdata(), title = c('RAINN Sexual Violence'), Visible = T)
          mod_info_server('SV_RAINN', selector = selection, data = SVdata(), rownametitle = c('RAINN Sexual Violence'), phone = T, website = T)
          mod_Accordion_server('SV_Svcenter', selector=selection, data=SVdata(), title = c('Sexual Violence Center'), Visible = T)
          mod_info_server('SV_Svcenter', selector = selection, data = SVdata(), rownametitle = c('Crime Victim and Sexual Violence Center'), phone = T, website = T)


        }
      })
    }




    # AOD Accordion -----------------------------------------------------------


    if(input$PMHselector == "Alcohol and Other Drugs"){
      selection<-input$PMHselector
      AODdata<-reactive({
        data[data$Type == 'AOD',]
      }) %>% bindCache(data[data$Type == 'AOD',])
      observeEvent(input$OffCampus,{

        if(input$OffCampus == F) {

          mod_Accordion_server('AOD_OHP', selector=selection, data=AODdata(), title = c('Collegiate Recovery Program'), Visible = T)
          mod_info_server('AOD_OHP', selector = selection, data = AODdata(), rownametitle = c('Collegiate Recovery Program'), phone = T, website = T)
          mod_Accordion_server('AOD_NUA', selector=selection, data=AODdata(), title = c('Never Use Alone (English)'), Visible = F)
          mod_info_server('AOD_NUA', selector = selection, data = AODdata(), rownametitle = c('Never Use Alone (English)'), phone = T, website = T)
          mod_Accordion_server('AOD_NUAspanish', selector=selection, data=AODdata(), title = c('Never Use Alone (Spanish)'), Visible = F)
          mod_info_server('AOD_NUAspanish', selector = selection, data = AODdata(), rownametitle = c('Never Use Alone (Spanish)'), phone = T, website = T)
          mod_Accordion_server('AOD_BraveAPP', selector=selection, data=AODdata(), title = c('The Brave App'), Visible = F)
          mod_info_server('AOD_BraveAPP', selector = selection, data = AODdata(), rownametitle = c('The Brave App'), phone = F, website = T)
          mod_Accordion_server('AOD_Equinox', selector=selection, data=AODdata(), title = c('Equinox'), Visible = F)
          mod_info_server('AOD_Equinox', selector = selection, data = AODdata(), rownametitle = c('Equinox'), phone = T, website = T)
          mod_Accordion_server('AOD_ACCAlbany', selector=selection, data=AODdata(), title = c('Addictions Care Center of Albany'), Visible = F)
          mod_info_server('AOD_ACCAlbany', selector = selection, data = AODdata(), rownametitle = c('Addictions Care Center of Albany'), phone = T, website = T)
          mod_Accordion_server('AOD_OASASlocator', selector=selection, data=AODdata(), title = c('OASAS Treatment Locator'), Visible = F)
          mod_info_server('AOD_OASASlocator', selector = selection, data = AODdata(), rownametitle = c('OASAS Treatment Locator'), phone = T, website = T)
          mod_Accordion_server('AOD_NaloxoneCal', selector=selection, data=AODdata(), title = c('OASAS Naloxone Training Calendar'), Visible = F)
          mod_info_server('AOD_NaloxoneCal', selector = selection, data = AODdata(), rownametitle = c('OASAS Naloxone Training Calendar'), phone = F, website = T)
          mod_Accordion_server('AOD_SMART', selector=selection, data=AODdata(), title = c('SMART Recovery Meetings'), Visible = F)
          mod_info_server('AOD_SMART', selector = selection, data = AODdata(), rownametitle = c('SMART Recovery Meetings'), phone = F, website = T)
          mod_Accordion_server('AOD_Refuge', selector=selection, data=AODdata(), title = c('Refuge Recovery Meetings'), Visible = F)
          mod_info_server('AOD_Refuge', selector = selection, data = AODdata(), rownametitle = c('Refuge Recovery Meetings'), phone = F, website = T)
          mod_Accordion_server('AOD_Aameetings', selector=selection, data=AODdata(), title = c('AA Meetings'), Visible = F)
          mod_info_server('AOD_Aameetings', selector = selection, data = AODdata(), rownametitle = c('AA Meetings'), phone = F, website = T)
          mod_Accordion_server('AOD_CampusDrugPrevINDEX', selector=selection, data=AODdata(), title = c('Drug Index (CampusDrugPrevention.gov)'), Visible = F)
          mod_info_server('AOD_CampusDrugPrevINDEX', selector = selection, data = AODdata(), rownametitle = c('Drug Index (CampusDrugPrevention.gov)'), phone = F, website = T)








        } else {
          mod_Accordion_server('AOD_OHP', selector=selection, data=AODdata(), title = c('Collegiate Recovery Program'), Visible = T)
          mod_info_server('AOD_OHP', selector = selection, data = AODdata(), rownametitle = c('Collegiate Recovery Program'), phone = T, website = T)
          mod_Accordion_server('AOD_NUA', selector=selection, data=AODdata(), title = c('Never Use Alone (English)'), Visible = T)
          mod_info_server('AOD_NUA', selector = selection, data = AODdata(), rownametitle = c('Never Use Alone (English)'), phone = T, website = T)
          mod_Accordion_server('AOD_NUAspanish', selector=selection, data=AODdata(), title = c('Never Use Alone (Spanish)'), Visible = T)
          mod_info_server('AOD_NUAspanish', selector = selection, data = AODdata(), rownametitle = c('Never Use Alone (Spanish)'), phone = T, website = T)
          mod_Accordion_server('AOD_BraveAPP', selector=selection, data=AODdata(), title = c('The Brave App'), Visible = T)
          mod_info_server('AOD_BraveAPP', selector = selection, data = AODdata(), rownametitle = c('The Brave App'), phone = F, website = T)
          mod_Accordion_server('AOD_Equinox', selector=selection, data=AODdata(), title = c('Equinox'), Visible = T)
          mod_info_server('AOD_Equinox', selector = selection, data = AODdata(), rownametitle = c('Equinox'), phone = T, website = T)
          mod_Accordion_server('AOD_ACCAlbany', selector=selection, data=AODdata(), title = c('Addictions Care Center of Albany'), Visible = T)
          mod_info_server('AOD_ACCAlbany', selector = selection, data = AODdata(), rownametitle = c('Addictions Care Center of Albany'), phone = T, website = T)
          mod_Accordion_server('AOD_OASASlocator', selector=selection, data=AODdata(), title = c('OASAS Treatment Locator'), Visible = T)
          mod_info_server('AOD_OASASlocator', selector = selection, data = AODdata(), rownametitle = c('OASAS Treatment Locator'), phone = T, website = T)
          mod_Accordion_server('AOD_NaloxoneCal', selector=selection, data=AODdata(), title = c('OASAS Naloxone Training Calendar'), Visible = T)
          mod_info_server('AOD_NaloxoneCal', selector = selection, data = AODdata(), rownametitle = c('OASAS Naloxone Training Calendar'), phone = F, website = T)
          mod_Accordion_server('AOD_SMART', selector=selection, data=AODdata(), title = c('SMART Recovery Meetings'), Visible = T)
          mod_info_server('AOD_SMART', selector = selection, data = AODdata(), rownametitle = c('SMART Recovery Meetings'), phone = F, website = T)
          mod_Accordion_server('AOD_Refuge', selector=selection, data=AODdata(), title = c('Refuge Recovery Meetings'), Visible = T)
          mod_info_server('AOD_Refuge', selector = selection, data = AODdata(), rownametitle = c('Refuge Recovery Meetings'), phone = F, website = T)
          mod_Accordion_server('AOD_Aameetings', selector=selection, data=AODdata(), title = c('AA Meetings'), Visible = T)
          mod_info_server('AOD_Aameetings', selector = selection, data = AODdata(), rownametitle = c('AA Meetings'), phone = F, website = T)
          mod_Accordion_server('AOD_CampusDrugPrevINDEX', selector=selection, data=AODdata(), title = c('Drug Index (CampusDrugPrevention.gov)'), Visible = T)
          mod_info_server('AOD_CampusDrugPrevINDEX', selector = selection, data = AODdata(), rownametitle = c('Drug Index (CampusDrugPrevention.gov)'), phone = F, website = T)


        }
      })
    }







    # Problem Gambling Accordion ----------------------------------------------

    if(input$PMHselector == "Problem Gambling"){
      selection<-input$PMHselector
      GAMBdata<-reactive({
        data[data$Type == 'GAMB',]
      }) %>% bindCache(data[data$Type == 'GAMB',])

      mod_Accordion_server('GAMB_NYSmainwebsite', selector=selection, data=GAMBdata(), title = c('NYS Problem Gambling Help'), Visible = T)
      mod_info_server('GAMB_NYSmainwebsite', selector = selection, data = GAMBdata(), rownametitle = c('NYS Problem Gambling Help'), phone = F, website = T)
      mod_Accordion_server('GAMB_Escreener', selector=selection, data=GAMBdata(), title = c('NYS Gambling E-Screener'), Visible = T)
      mod_info_server('GAMB_Escreener', selector = selection, data = GAMBdata(), rownametitle = c('NYS Gambling E-Screener'), phone = F, website = T)
      mod_Accordion_server('GAMB_NYShotline', selector=selection, data=GAMBdata(), title = c('New York State Gamblers Hotline'), Visible = T)
      mod_info_server('GAMB_NYShotline', selector = selection, data = GAMBdata(), rownametitle = c("New York State Gambler's Hotline"), phone = T, website = T)
      mod_Accordion_server('GAMB_NtnlHotline', selector=selection, data=GAMBdata(), title = c('National Gambler Support Line'), Visible = T)
      mod_info_server('GAMB_NtnlHotline', selector = selection, data = GAMBdata(), rownametitle = c('National Gambler Support Line'), phone = T, website = T)
      mod_Accordion_server('GAMB_gambAnonymous', selector=selection, data=GAMBdata(), title = c('Gamblers Anonymous'), Visible = T)
      mod_info_server('GAMB_gambAnonymous', selector = selection, data = GAMBdata(), rownametitle = c('Gamblers Anonymous'), phone = F, website = T)
      mod_Accordion_server('GAMB_gambAnon', selector=selection, data=GAMBdata(), title = c('Gam-Anon'), Visible = T)
      mod_info_server('GAMB_gambAnon', selector = selection, data = GAMBdata(), rownametitle = c('Gam-Anon'), phone = F, website = T)
      mod_Accordion_server('GAMB_TxtLocator', selector=selection, data=GAMBdata(), title = c('Gambling Treatment Locator'), Visible = T)
      mod_info_server('GAMB_TxtLocator', selector = selection, data = GAMBdata(), rownametitle = c('OASAS Problem Gambling Treatment Locator'), phone = F, website = T)



    }







    # Academic Resources Accordion --------------------------------------------
    if(input$PMHselector == "Academic Resources"){
      selection<-input$PMHselector
      Acadata<-reactive({
        data[data$Type == 'Aca',]
      }) %>% bindCache(data[data$Type == 'Aca',])


      mod_Accordion_server('ACA_lib', selector=selection, data=Acadata(), title = c('University Libraries'), Visible = T)
      mod_info_server('ACA_lib', selector = selection, data = Acadata(), rownametitle = c('University Libraries'), phone = T, website = T)
      mod_Accordion_server('ACA_DAISS', selector=selection, data=Acadata(), title = c('Disability Access and Inclusion Student Services'), Visible = T)
      mod_info_server('ACA_DAISS', selector = selection, data = Acadata(), rownametitle = c('Disability Access and Inclusion Student Services'), phone = T, website = T)
      mod_Accordion_server('ACA_Writing', selector=selection, data=Acadata(), title = c('Writing Center'), Visible = T)
      mod_info_server('ACA_Writing', selector = selection, data = Acadata(), rownametitle = c('Writing Center'), phone = T, website = T)
      mod_Accordion_server('ACA_Tutoring', selector=selection, data=Acadata(), title = c('Tutoring'), Visible = T)
      mod_info_server('ACA_Tutoring', selector = selection, data = Acadata(), rownametitle = c('Tutoring'), phone = T, website = T)
      mod_Accordion_server('ACA_Excel', selector=selection, data=Acadata(), title = c('Project Excel'), Visible = T)
      mod_info_server('ACA_Excel', selector = selection, data = Acadata(), rownametitle = c('Project Excel'), phone = T, website = T)
      mod_Accordion_server('ACA_CSTEP', selector=selection, data=Acadata(), title = c('CSTEP'), Visible = T)
      mod_info_server('ACA_CSTEP', selector = selection, data = Acadata(), rownametitle = c('Collegiate Science and Technology Entry Program (CSTEP)'), phone = T, website = T)
      mod_Accordion_server('ACA_SummerResearch', selector=selection, data=Acadata(), title = c('Summer Research Program'), Visible = T)
      mod_info_server('ACA_SummerResearch', selector = selection, data = Acadata(), rownametitle = c('University at Albany Summer Research Program'), phone = T, website = T)
      mod_Accordion_server('ACA_DOS', selector=selection, data=Acadata(), title = c('Dean of Students'), Visible = T)
      mod_info_server('ACA_DOS', selector = selection, data = Acadata(), rownametitle = c('Dean of Students'), phone = T, website = T)

    }



    # Food Housing Financial Accordion ----------------------------------------

    if(input$PMHselector == "Food, Housing, & Financial"){
      selection<-input$PMHselector
      FHFdata<-reactive({
        data[data$Type == 'FHF',]
      }) %>% bindCache(data[data$Type == 'FHF',])

      mod_Accordion_server('FAO', selector=selection, data=FHFdata(), title = c('Financial Aid Office'), Visible = T)
      mod_info_server('FAO', selector = selection, data = FHFdata(), rownametitle = c('Financial Aid Office'), phone = T, website = T)
      mod_Accordion_server('PurplePantry', selector=selection, data=FHFdata(), title = c('Purple Pantry'), Visible = T)
      mod_info_server('PurplePantry', selector = selection, data = FHFdata(), rownametitle = c('Purple Pantry'), phone = T, website = T)
      mod_Accordion_server('PurpleThreads', selector=selection, data=FHFdata(), title = c('Purple Threads'), Visible = T)
      mod_info_server('PurpleThreads', selector = selection, data = FHFdata(), rownametitle = c('Purple Threads'), phone = T, website = T)
      mod_Accordion_server('UAemergencyFund', selector=selection, data=FHFdata(), title = c('UAlbany Student Emergency Fund'), Visible = T)
      mod_info_server('UAemergencyFund', selector = selection, data = FHFdata(), rownametitle = c('UAlbany Student Emergency Fund'), phone = T, website = T)





    }





    # Legal Resources Accordion -----------------------------------------------


    if(input$PMHselector == "Legal Resources"){
      selection<-input$PMHselector
      Legaldata<-reactive({
        data[data$Type == 'Legal',]
      }) %>% bindCache(data[data$Type == 'Legal',])
      observeEvent(input$OffCampus,{

        if(input$OffCampus == F) {

          mod_Accordion_server('LEGAL_SLS', selector=selection, data=Legaldata(), title = c('Student Legal Services'), Visible = T)
          mod_info_server('LEGAL_SLS', selector = selection, data = Legaldata(), rownametitle = c('Student Legal Services'), phone = T, website = T)
          mod_Accordion_server('LEGAL_LegalAID', selector=selection, data=Legaldata(), title = c('Legal Aid Society NE New York'), Visible = F)
          mod_info_server('LEGAL_LegalAID', selector = selection, data = Legaldata(), rownametitle = c('Legal Aid Society Northeastern New York'), phone = T, website = T)


        } else {

          mod_Accordion_server('LEGAL_SLS', selector=selection, data=Legaldata(), title = c('Student Legal Services'), Visible = T)
          mod_info_server('LEGAL_SLS', selector = selection, data = Legaldata(), rownametitle = c('Student Legal Services'), phone = T, website = T)
          mod_Accordion_server('LEGAL_LegalAID', selector=selection, data=Legaldata(), title = c('Legal Aid Society NE New York'), Visible = T)
          mod_info_server('LEGAL_LegalAID', selector = selection, data = Legaldata(), rownametitle = c('Legal Aid Society Northeastern New York'), phone = T, website = T)


        }
      })
    }




    # Hotlines Accordion ------------------------------------------------------

    if(input$PMHselector == "Hotlines"){
      selection<-input$PMHselector
      HLdata<-reactive({
        data[data$Type == 'Hotline',]
      }) %>% bindCache(data[data$Type == 'Hotline',])

      mod_Accordion_server('HL_FindAHelpline', selector=selection, data=HLdata(), title = c('Find a Helpline'), Visible = T)
      mod_info_server('HL_FindAHelpline', selector = selection, data = HLdata(), rownametitle = c('Find a Helpline'), phone = F, website = T)
      mod_Accordion_server('HL_NYSsupport', selector=selection, data=HLdata(), title = c('New York State Support Line'), Visible = T)
      mod_info_server('HL_NYSsupport', selector = selection, data = HLdata(), rownametitle = c('New York State Support Line'), phone = T, website = T)
      mod_Accordion_server('HL_NYSsexassaultHL', selector=selection, data=HLdata(), title = c('24-Hour Sexual Assault Hotline'), Visible = T)
      mod_info_server('HL_NYSsexassaultHL', selector = selection, data = HLdata(), rownametitle = c('24-Hour Sexual Assault Hotline'), phone = T, website = T)
      mod_Accordion_server('HL_RAINN', selector=selection, data=HLdata(), title = c('RAINN Sexual Violence'), Visible = T)
      mod_info_server('HL_RAINN', selector = selection, data = HLdata(), rownametitle = c('RAINN Sexual Violence'), phone = T, website = T)
      mod_Accordion_server('HL_SmokersQuit', selector=selection, data=HLdata(), title = c("New York State Smoker's Quitline"), Visible = T)
      mod_info_server('HL_SmokersQuit', selector = selection, data = HLdata(), rownametitle = c("New York State Smoker's Quitline"), phone = T, website = T)
      mod_Accordion_server('HL_NYSgamb', selector=selection, data=HLdata(), title = c("New York State Gambler's Hotline"), Visible = T)
      mod_info_server('HL_NYSgamb', selector = selection, data = HLdata(), rownametitle = c("New York State Gambler's Hotline"), phone = T, website = T)
      mod_Accordion_server('HL_NtnlGAMB', selector=selection, data=HLdata(), title = c('National Gambler Support Line'), Visible = T)
      mod_info_server('HL_NtnlGAMB', selector = selection, data = HLdata(), rownametitle = c('National Gambler Support Line'), phone = T, website = T)
      mod_Accordion_server('HL_SuicideLifeline', selector=selection, data=HLdata(), title = c('(988) National Suicide & Crisis Lifeline'), Visible = T)
      mod_info_server('HL_SuicideLifeline', selector = selection, data = HLdata(), rownametitle = c('(988) National Suicide & Crisis Lifeline'), phone = T, website = T)




    }





  })





}
