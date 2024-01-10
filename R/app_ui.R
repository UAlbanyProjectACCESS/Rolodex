#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @import htmltools
#' @noRd
app_ui <- function(request) {

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    f7Page(
      title = "Resource Rolodex",
      options = list(theme=c("auto"), dark=TRUE, preloader = T,  pullToRefresh=TRUE),
      allowPWA=TRUE,
      f7TabLayout(
        # panels are not mandatory. These are similar to sidebars


        navbar = f7Navbar(
          tags$body(HTML('<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-M39QN8M"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>')),

          # tags$body(includeHTML("GA-body.html")),
          title= "Project ACCESS Resource Rolodex"),
        # f7Tabs is a special toolbar with included navigation
        f7Tabs(
          animated = TRUE,
          id = "tab",
          f7Tab(
            tabName = "WelcomeTab",
            icon = f7Icon("house_fill"),
            active = TRUE,
            f7Block(
              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(title="What is Project ACCESS?",
                       uiOutput("welcome"),
                       hairlines = F, strong = T, inset =
                         F, tablet = FALSE))),

            f7Block(
              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(title="Adding the app to your device",
                       uiOutput("installapp"),
                       footer=f7Button(inputId ="helppopup", label = "Quick Introduction", color= "darkorchid3", fill=T, shadow=T, rounded = T, size = "small"),
                       hairlines = F, strong = T, inset =
                         F, tablet = FALSE))),

            f7Align(div(f7Link("Report a bug or issue with the app", href="https://forms.gle/e74AyNsW7jvMqsSt6")), side=c("center"))
          ),


            f7Tab(
              tabName = "Tab1",
              icon = f7Icon("search"),
              active = F,


              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(
                  f7Block(
                    f7Align(h2("Search for on- and off-campus resources and services"), side=("center")),
                    strong = T, inset = T, tablet = FALSE))),


              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(title = "Select a resource category below",
                       f7Block(f7SmartSelect("PMHselector", NULL, type = c("popup"), choices=c("Physical Health",
                                                                                               "Mental Health (MH)",
                                                                                               "MH Resources (Black Communities)",
                                                                                               "MH Resources (Hispanic Communities)",
                                                                                               "LGBTQ+ Resources",
                                                                                               "Sexual Health",
                                                                                               "Sexual Violence Related",
                                                                                               "Alcohol and Other Drugs",
                                                                                               "Problem Gambling",
                                                                                               "Academic Resources",
                                                                                               "Food, Housing, & Financial",
                                                                                               "Legal Resources",
                                                                                               "Hotlines"),
                                             selected=NULL, class = "select smart"),

                               conditionalPanel("input.PMHselector != 'Community Specific Resources'
                                 & input.PMHselector != 'MH Resources (Black Communities)'
                                 & input.PMHselector != 'MH Resources (Hispanic Communities)'
                                 & input.PMHselector != 'Academic Resources'
                                 & input.PMHselector != 'Problem Gambling'
                                 & input.PMHselector != 'Food, Housing, & Financial'
                                 & input.PMHselector != 'Hotlines'" ,f7Toggle("OffCampus", "Show Off-Campus Resources", checked=F, color=NULL))),
                       br(),
                       br()






                )
              ),

              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(
                  f7Block(
                    conditionalPanel("input.PMHselector == 'Physical Health'",
                                     f7Accordion(h4("Physical Health Resources"), multiCollapse = F,
                                                 mod_Accordion_ui('SHS'),
                                                 mod_Accordion_ui('SCS'),
                                                 mod_Accordion_ui('SHAPE'),
                                                 mod_Accordion_ui('IOOV'),
                                                 mod_Accordion_ui('ELLIS'),
                                                 mod_Accordion_ui('AMC'),
                                                 mod_Accordion_ui('AMCwash'),
                                                 mod_Accordion_ui('UrgentC'),
                                                 mod_Accordion_ui('SAMARITAN'),
                                                 mod_Accordion_ui('STPETERS')
                                     )),

                    conditionalPanel("input.PMHselector == 'Mental Health (MH)'",
                                     f7Accordion(h4("Mental Health Resources"), multiCollapse = F,
                                                 mod_Accordion_ui('Mhcaps'),
                                                 mod_Accordion_ui('Mhmiddleearth'),
                                                 mod_Accordion_ui('MH_SuicideLifeline'),
                                                 mod_Accordion_ui('Mhnyspa'),
                                                 mod_Accordion_ui('Mhpsychtoday'),
                                                 mod_Accordion_ui('MHprideCenter'),
                                                 mod_Accordion_ui('MHsuicideFound')
                                     )),

                    conditionalPanel("input.PMHselector == 'MH Resources (Black Communities)'",
                                     f7Accordion(h4("Mental Health Resources for Black Communities"), multiCollapse = F,
                                                 mod_Accordion_ui('akkoma'),
                                                 mod_Accordion_ui('MHBC_SuicideLifeline'),
                                                 mod_Accordion_ui('BEAM'),
                                                 mod_Accordion_ui('BLHF'),
                                                 mod_Accordion_ui('BROMM'),
                                                 mod_Accordion_ui('MHBCinsclusivetherapists'),
                                                 mod_Accordion_ui('Loveland'),
                                                 mod_Accordion_ui('MalaninandMH'),
                                                 mod_Accordion_ui('POCagainstsuicide'),
                                                 mod_Accordion_ui('Qttoc'),
                                                 mod_Accordion_ui('TherapyBlackGirls'),
                                                 mod_Accordion_ui('TherapyBlackMen')
                                     )),


                    conditionalPanel("input.PMHselector == 'MH Resources (Hispanic Communities)'",
                                     f7Accordion(h4("Mental Health Resources for Hispanic Communities"), multiCollapse = F,
                                                 mod_Accordion_ui('CDLatinos'),
                                                 mod_Accordion_ui('MHLC_SuicideLifeline'),
                                                 mod_Accordion_ui('MHLCInclusiveTherapists'),
                                                 mod_Accordion_ui('LifeisPrecious'),
                                                 mod_Accordion_ui('LatinXtherapy'),
                                                 mod_Accordion_ui('NatnlLatinaOrg'),
                                                 mod_Accordion_ui('NatlAllianceHispHealth'),
                                                 mod_Accordion_ui('LatinxPsychAssociation'),
                                                 mod_Accordion_ui('MHLCpocagainstsuicide'),
                                                 mod_Accordion_ui('MHLCqtTherapistsofColor')
                                     )),

                    conditionalPanel("input.PMHselector == 'LGBTQ+ Resources'",
                                     f7Accordion(h4("LGBTQ+ Resources"), multiCollapse = F,
                                                 mod_Accordion_ui('LGB_SHAPE'),
                                                 mod_Accordion_ui('LGB_StudentLegal'),
                                                 mod_Accordion_ui('LGBTQ_TrevorProject'),
                                                 mod_Accordion_ui('LGB_pridecenter'),
                                                 mod_Accordion_ui('LBG_IOOV'),
                                                 mod_Accordion_ui('LGB_APH'),
                                                 mod_Accordion_ui('LGB_DamienCenter'),
                                                 mod_Accordion_ui('LGB_UHPP'),
                                                 mod_Accordion_ui('LGB_InclusiveTherapists'),
                                                 mod_Accordion_ui('LGB_Qttherapistsofcolor'),
                                                 mod_Accordion_ui('LGB_LegalAIDNENY'),
                                                 mod_Accordion_ui('LGBTQ_SuicideLifeline')

                                     )),


                    conditionalPanel("input.PMHselector == 'Sexual Health'",
                                     f7Accordion(h4("Sexual Health"), multiCollapse = F,
                                                 mod_Accordion_ui('SH_SHS'),
                                                 mod_Accordion_ui('SH_AMC'),
                                                 mod_Accordion_ui('SH_APH'),
                                                 mod_Accordion_ui('SH_DamienCenter'),
                                                 mod_Accordion_ui('SH_UHPP'),
                                                 mod_Accordion_ui('SH_PrideCenter'),
                                                 mod_Accordion_ui('SH_WYH')
                                     )),


                    conditionalPanel("input.PMHselector == 'Sexual Violence Related'",
                                     f7Accordion(h4("Sexual Violence Related"), multiCollapse = F,
                                                 mod_Accordion_ui('SV_SLS'),
                                                 mod_Accordion_ui('SV_SVsupportAdvocacy'),
                                                 mod_Accordion_ui('SV_24hrSexualAssaultHotline'),
                                                 mod_Accordion_ui('SV_RAINN'),
                                                 mod_Accordion_ui('SV_Svcenter')
                                     )),


                    conditionalPanel("input.PMHselector == 'Alcohol and Other Drugs'",
                                     f7Accordion(h4("Alcohol and Other Drugs"), multiCollapse = F,
                                                 mod_Accordion_ui('AOD_OHP'),
                                                 mod_Accordion_ui('AOD_CampusDrugPrevINDEX'),
                                                 mod_Accordion_ui('AOD_NUA'),
                                                 mod_Accordion_ui('AOD_NUAspanish'),
                                                 mod_Accordion_ui('AOD_BraveAPP'),
                                                 mod_Accordion_ui('AOD_NaloxoneCal'),
                                                 mod_Accordion_ui('AOD_SMART'),
                                                 mod_Accordion_ui('AOD_Refuge'),
                                                 mod_Accordion_ui('AOD_Aameetings'),
                                                 mod_Accordion_ui('AOD_Equinox'),
                                                 mod_Accordion_ui('AOD_ACCAlbany'),
                                                 mod_Accordion_ui('AOD_OASASlocator')
                                     )),


                    conditionalPanel("input.PMHselector == 'Problem Gambling'",
                                     f7Accordion(h4("Problem Gambling"), multiCollapse = F,
                                                 mod_Accordion_ui('GAMB_Escreener'),
                                                 mod_Accordion_ui('GAMB_NYShotline'),
                                                 mod_Accordion_ui('GAMB_NtnlHotline'),
                                                 mod_Accordion_ui('GAMB_gambAnonymous'),
                                                 mod_Accordion_ui('GAMB_gambAnon'),
                                                 mod_Accordion_ui('GAMB_TxtLocator')
                                     )),

                    conditionalPanel("input.PMHselector == 'Academic Resources'",
                                     f7Accordion(h4("Academic Resources"), multiCollapse = F,
                                                 mod_Accordion_ui('ACA_lib'),
                                                 mod_Accordion_ui('ACA_DAISS'),
                                                 mod_Accordion_ui('ACA_Writing'),
                                                 mod_Accordion_ui('ACA_Tutoring'),
                                                 mod_Accordion_ui('ACA_Excel'),
                                                 mod_Accordion_ui('ACA_CSTEP'),
                                                 mod_Accordion_ui('ACA_SummerResearch'),
                                                 mod_Accordion_ui('ACA_DOS')
                                     )),

                    conditionalPanel("input.PMHselector == 'Food, Housing, & Financial'",
                                     f7Accordion(h4("Food, Housing, & Financial"), multiCollapse = F,
                                                 mod_Accordion_ui('FAO'),
                                                 mod_Accordion_ui('PurplePantry'),
                                                 mod_Accordion_ui('PurpleThreads'),
                                                 mod_Accordion_ui('UAemergencyFund')
                                     )),

                    conditionalPanel("input.PMHselector == 'Legal Resources'",
                                     f7Accordion(h4("Legal Resources"), multiCollapse = F,
                                                 mod_Accordion_ui('LEGAL_SLS'),
                                                 mod_Accordion_ui('LEGAL_LegalAID')
                                     )),

                    conditionalPanel("input.PMHselector == 'Hotlines'",
                                     f7Accordion(h4("Hotlines"), multiCollapse = F,
                                                 mod_Accordion_ui('HL_FindAHelpline'),
                                                 mod_Accordion_ui('HL_SuicideLifeline'),
                                                 mod_Accordion_ui('HL_NYSsupport'),
                                                 mod_Accordion_ui('HL_NYSsexassaultHL'),
                                                 mod_Accordion_ui('HL_RAINN'),
                                                 mod_Accordion_ui('HL_SmokersQuit'),
                                                 mod_Accordion_ui('HL_NYSgamb'),
                                                 mod_Accordion_ui('HL_NtnlGAMB')
                                     )),
                    br(),

                  ))


              )
            ),




          f7Tab(
            tabName = "ApptTab",
            icon = f7Icon("calendar_badge_plus"),
            active = FALSE,

            f7Shadow(
              intensity = 5,
              hover = TRUE,
              f7Card(
                f7Block(
                  f7Align(h2("Project ACCESS offers three types of appointments and a variety of Events!"), side=("center")),
                  strong = T, inset = T, tablet = FALSE))),

            f7Shadow(
              intensity = 5,
              hover = TRUE,
              f7Card(
                title = "Appointments Categories",
                uiOutput("appts"),
                hairlines = F, strong = T, inset =
                  F, tablet = FALSE)),
            f7Shadow(
              intensity = 5,
              hover = TRUE,
              f7Card(title = "Events Schedule",
                     uiOutput("events"),

                     hairlines = F, strong = T, inset =
                       F, tablet = FALSE))
          ),

          f7Tab(tabName="Insta",
                active = FALSE,
                icon = f7Icon("logo_instagram"),


                f7Shadow(
                  intensity = 5,
                  hover = TRUE,
                  f7Card(
                    f7Block(
                      f7Align(h2("Stay up to date!"), side=c("center")),
                      strong = T, inset = T, tablet = FALSE))),

                f7Shadow(
                  intensity = 5,
                  hover = TRUE,
                  f7Card(f7Align(h3("Follow us on Instagram!"), side=c("center")),
                         hr(),
                         uiOutput("instalink"),
                         hairlines = F, strong = T, inset =
                           F, tablet = FALSE)
                )
          )
#
#           f7Tab(tabName="money",
#                 active = FALSE,
#                 icon = f7Icon("money_dollar_circle"),
#
#
#                 f7Shadow(
#                   intensity = 5,
#                   hover = TRUE,
#                   f7Card(
#                     f7Block(
#                       f7Align(h2("3-steps to earn a $30 Amazon Gift Card"), side=c("center")),
#                       strong = T, inset = T, tablet = FALSE))),
#
#                 f7Shadow(
#                   intensity = 5,
#                   hover = TRUE,
#                   f7Card(f7Align(h3("Step 1"), side=c("left")),
#                          f7Align(h4("Schedule and attend an appointment with a Navigator"), side=c("left")),
#                          f7Align(div(f7Link("Schedule a Navigator Appointment", href="https://calendly.com/d/g6j-syy-7z5")),side=c("left")),
#                          hr(),
#                          f7Align(h3("Step 2"), side=c("left")),
#                          f7Align(h4("Complete the 10-minute survey sent via email before your appointment"), side=c("left")),
#                          hr(),
#                          f7Align(h3("Step 3"), side=c("left")),
#                          f7Align(h4("Complete a 10-minute follow-up survey after the appointment"), side=c("left")),
#                          hr(),
#                          f7Align(h3("Thats all!"), side=c("center")),
#                          f7Align(h5("Your responses on the survey are never connected to your name or identifying information. You'll receive 3 automated reminder emails with the follow-up survey link 25 days after you complete first survey and an appointment with a Project ACCESS Navigator"), side=c("center")),
#                          f7Align(h5("Last semester we gave out over $2,000 in Amazon Gift Cards to UAlbany students!"), side=c("center")),
#                          hairlines = F, strong = T, inset =
#                            F, tablet = FALSE)
#                 )
#           )


        )
      )
    )




  )


}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @import htmltools
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  # add_resource_path(
  #   "www",
  #   app_sys("app/www")
  # )

  tags$head(
    # includeHTML("google-analytics.html"),
    HTML("<script async src='https://www.googletagmanager.com/gtag/js?id=G-5XH47X1P8M'></script>
            <script>
            window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', 'G-5XH47X1P8M');
          </script>"),
    HTML('<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({"gtm.start":
        new Date().getTime(),event:"gtm.js"});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!="dataLayer"?"&l="+l:"";j.async=true;j.src=
          "https://www.googletagmanager.com/gtm.js?id="+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,"script","dataLayer","GTM-M39QN8M");</script>'),

    HTML('<link rel="stylesheet" type="text/css" href="https://ewokozwok.github.io/Rolodex/www/framework7.bundle.min.css">')


    # includeCSS("www/framework7.bundle.min.css")
    # bundle_resources(
    #   path = app_sys('app/www'),
    #   app_title = 'Rolodex'
    #   )

    # favicon(),

    # bundle_resources(
    #   path = app_sys("app/www"),
    #   app_title = "SkinnyRolodex"
    # )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
