FROM rolodex_base
COPY renv.lock.prod renv.lock
RUN R -e 'renv::restore()'

COPY srcjs /usr/local/lib/R/site-library/Rolodex/srcsj
COPY www /usr/local/lib/R/site-library/Rolodex/www

RUN R -e 'remotes::install_github("EwokOzwok/Rolodex")'

EXPOSE 3838
CMD R -e "options('shiny.port'=3838,shiny.host='0.0.0.0');library(Rolodex);Rolodex::run_app()"
