shinyloadtest::record_session('http://localhost:3838/')

#Run in Terminal
# shinycannon recording.log http://localhost:3838/ --workers 10 --loaded-duration-minutes 5 --output-dir run1
# shinycannon recording.log http://localhost:3838/ --workers 10 --loaded-duration-minutes 2 --output-dir run10
df <- shinyloadtest::load_runs("run10")
shinyloadtest::shinyloadtest_report(df, "run10.html")

profvis::profvis(print(Rolodex::run_app()))
