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

            f7Align(div(f7Link("Report an bug or issue with the app", href="https://forms.gle/e74AyNsW7jvMqsSt6")), side=c("center"))
          ),


          f7Tab(
            tabName = "Tab1",
            icon = f7Icon("search"),
            active = F,


            f7Shadow(
              intensity = 5,
              hover = TRUE,
              f7Block(
                f7Align(h2("Search for on- and off-campus resources and services"), side=("center")),
                hairlines = F, strong = T, inset =
                  F, tablet = FALSE)),


            f7Shadow(
              intensity = 5,
              hover = TRUE,
              f7Card(
                title = NULL,
                f7Align(h3("Select a resource category below"), side=c("left")),
                f7Block(f7SmartSelect("PMHselector", NULL, type = c("popup"), choices=c("Physical Health",
                                                                                        "Mental Health (MH)",
                                                                                        "MH Resources (Black Communities)",
                                                                                        "MH Resources (Hispanic Communities)",
                                                                                        "LGBTQ+ Resources",
                                                                                        "Sexual Health",
                                                                                        "Sexual Violence Related",
                                                                                        "Alcohol and Other Drug Concerns",
                                                                                        "Academic Support",
                                                                                        "EOP Support",
                                                                                        "Food, Housing, & Financial",
                                                                                        "Legal Resources",
                                                                                        "Hotlines"), selected=NULL, class = "select smart")),
                br(),
                br(),
                conditionalPanel("input.PMHselector != 'Community Specific Resources'
                                 & input.PMHselector != 'MH Resources (Black Communities)'
                                 & input.PMHselector != 'MH Resources (Hispanic Communities)'
                                 & input.PMHselector != 'Academic Support'
                                 & input.PMHselector != 'Food, Housing, & Financial'
                                 & input.PMHselector != 'EOP Support'
                                 & input.PMHselector != 'Hotlines'" ,f7Toggle("OffCampus", "Show Off-Campus Resources", checked=F, color=NULL)),






              )
            ),




            f7Block(
              conditionalPanel("input.PMHselector == 'Physical Health'",
                               f7Accordion("Physical Health Resources", multiCollapse = F,
                                           uiOutput("SHSaccord"),
                                           uiOutput("SCSaccord"),
                                           uiOutput("SHAPEaccord"),
                                           uiOutput("IOOVaccord"),
                                           uiOutput("ELLISaccord"),
                                           uiOutput("AMCaccord"),
                                           uiOutput("AMCWASHaccord"),
                                           uiOutput("EMURGaccord"),
                                           uiOutput("STPETEaccord"),
                                           uiOutput("SAMARITANaccord"))),
              conditionalPanel("input.PMHselector == 'Mental Health (MH)'",
                               f7Accordion("Mental Health Resources", multiCollapse = F,
                                           uiOutput("CAPSaccord"),
                                           uiOutput("MEaccord"),
                                           uiOutput("PsychTodayaccord"),
                                           uiOutput("NYSPApsychaccord"),
                                           uiOutput("PRIDE1accord"),
                                           uiOutput("SUICIDEPREVaccord"))),
              conditionalPanel("input.PMHselector == 'Sexual Violence Related'",
                               f7Accordion("Sexual Violence Related", multiCollapse = F,
                                           uiOutput("LegalSV"),
                                           uiOutput("SVSA"),
                                           uiOutput("SAH1"),
                                           uiOutput("RAINN"),
                                           uiOutput("CVSVC"))),
              conditionalPanel("input.PMHselector == 'Sexual Health'",
                               f7Accordion("Sexual Health", multiCollapse = F,
                                           uiOutput("SHS_sexaccord"),
                                           uiOutput("AMCYAPaccord"),
                                           uiOutput("APHaccord"),
                                           uiOutput("DCaccord"),
                                           uiOutput("UHPPaccord"),
                                           uiOutput("WYHaccord"),
                                           uiOutput("PRIDE2"))),
              conditionalPanel("input.PMHselector == 'Alcohol and Other Drug Concerns'",
                               f7Accordion("Alcohol and Other Drug Concerns", multiCollapse = F,
                                           uiOutput("CRPaccord"),
                                           uiOutput("NUAaccord"),
                                           uiOutput("EQUINOXaccord"),
                                           uiOutput("AODCAREaccord"),
                                           uiOutput("OASASlocatoraccord"))),
              conditionalPanel("input.PMHselector == 'MH Resources (Black Communities)'",
                               f7Accordion("Mental Health Resources for Black Communities", multiCollapse = F,
                                           uiOutput("AAKOMAaccord"),
                                           uiOutput("BEAMaccord"),
                                           uiOutput("BLHFaccord"),
                                           uiOutput("BYOMMaccord"),
                                           uiOutput("ITaccord"),
                                           uiOutput("LFaccord"),
                                           uiOutput("MMHaccord"),
                                           uiOutput("POCASaccord"),
                                           uiOutput("QTPOCaccord"),
                                           uiOutput("TBGaccord"),
                                           uiOutput("TBMaccord"))),
              conditionalPanel("input.PMHselector == 'MH Resources (Hispanic Communities)'",
                               f7Accordion("Mental Health Resources for Hispanic Communities", multiCollapse = F,
                                           uiOutput("CDLaccord"),
                                           uiOutput("ITHISPANICaccord"),
                                           uiOutput("LIPaccord"),
                                           uiOutput("LXTaccord"),
                                           uiOutput("MANAaccord"),
                                           uiOutput("NAHHaccord"),
                                           uiOutput("NLXPaccord"),
                                           uiOutput("POCASHISPANICaccord"),
                                           uiOutput("QTPOCHISPANICaccord"))),
              conditionalPanel("input.PMHselector == 'Academic Support'",
                               f7Accordion("Academic Support", multiCollapse = F,
                                           uiOutput("UALIBaccord"),
                                           uiOutput("DAISSaccord"),
                                           uiOutput("WCaccord"),
                                           uiOutput("Tutoringaccord"),
                                           uiOutput("ProjEXCELaccord"),
                                           uiOutput("CSTEPaccord"),
                                           uiOutput("UAResearchaccord"),
                                           uiOutput("FFThoughtaccord"),
                                           uiOutput("DOSaccord"))),
              conditionalPanel("input.PMHselector == 'EOP Support'",
                               f7Accordion("EOP Support", multiCollapse = F,
                                           uiOutput("EOPCounselingaccord"),
                                           uiOutput("EOPpeerTutoraccord"),
                                           uiOutput("EOPcomp"),
                                           uiOutput("EOPworkshops"),
                                           uiOutput("EOPWC"))),
              conditionalPanel("input.PMHselector == 'Food, Housing, & Financial'",
                               f7Accordion("Food, Housing, & Financial", multiCollapse = F,
                                           uiOutput("FAOaccord"),
                                           uiOutput("PURPLEPANTRYaccord"),
                                           uiOutput("PURPLETHREADSaccord"),
                                           uiOutput("UAEmergFUNDaccord"),
                                           uiOutput("UADIETaccord"))),
              conditionalPanel("input.PMHselector == 'Legal Resources'",
                               f7Accordion("Legal Resources", multiCollapse = F,
                                           uiOutput("Legal2"),
                                           uiOutput("LASLEGALaccord"))),
              conditionalPanel("input.PMHselector == 'LGBTQ+ Resources'",
                               f7Accordion("LGBTQ+ Resources", multiCollapse = F,
                                           uiOutput("SHAPE2accord"),
                                           uiOutput("Legal1"),
                                           uiOutput("PRIDE3accord"),
                                           uiOutput("IOOV2accord"),
                                           uiOutput("APH2accord"),
                                           uiOutput("DC2accord"),
                                           uiOutput("UHPP2accord"),
                                           uiOutput("ITLGBTQaccord"),
                                           uiOutput("QTPOClgbtqaccord"),
                                           uiOutput("LASaccord"))),
              conditionalPanel("input.PMHselector == 'Hotlines'",
                               f7Accordion("Hotlines", multiCollapse = F,
                                           uiOutput("RAINNHOTLINE"),
                                           uiOutput("NYSsmokersHLaccord"),
                                           uiOutput("SexAssaultHLaccord"),
                                           uiOutput("NYSgambHLaccord"),
                                           uiOutput("NYSsupportHLaccord"))),

              br(),
              hairlines = F, strong = T, inset =
                F, tablet = FALSE)

          ),




          f7Tab(
            tabName = "ApptTab",
            icon = f7Icon("calendar_badge_plus"),
            active = FALSE,
            f7Shadow(
              intensity = 5,
              hover = TRUE,
              f7Block(
                f7Align(h3("Project ACCESS offers three types of appointments and a variety of Events!"), side=("center")),
                hairlines = F, strong = T, inset =
                  F, tablet = FALSE)),
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
                  f7Block(
                    f7Align(h2("Stay up to date!"), side=c("center")),
                    hairlines = F, strong = T, inset =
                      F, tablet = FALSE)),
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
