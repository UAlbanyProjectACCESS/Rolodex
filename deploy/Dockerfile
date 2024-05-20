FROM rolodex_base
COPY renv.lock.prod renv.lock
RUN R -e 'renv::restore()'

# Copy the entire package source code
COPY Rolodex /Rolodex

# Install the Rolodex package from the local directory
RUN R -e 'remotes::install_local("/Rolodex", upgrade="always")'

RUN mkdir /usr/local/lib/R/site-library/Rolodex/app/www
RUN cp /usr/local/lib/R/site-library/Rolodex/app/manifest.webmanifest /usr/local/lib/R/site-library/Rolodex/app/www/
RUN cp /usr/local/lib/R/site-library/Rolodex/app/service-worker.js /usr/local/lib/R/site-library/Rolodex/app/www/



# RUN R -e 'remotes::install_github("EwokOzwok/Rolodex")'

EXPOSE 3838

CMD R -e "options('shiny.port'=3838,shiny.host='0.0.0.0');library(Rolodex);Rolodex::run_app()"
