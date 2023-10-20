shinyloadtest::record_session('http://localhost:3838/')

#Run in Terminal
# shinycannon recording.log http://localhost:3838/ --workers 10 --loaded-duration-minutes 2 --output-dir run1

df <- shinyloadtest::load_runs("run1")
shinyloadtest::shinyloadtest_report(df, "run1.html")

profv
