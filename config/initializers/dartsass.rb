# The hash key is the relative path to a Sass file in app/assets/stylesheets/ 
# and the hash value will be the name of the file output to app/assets/builds/

Rails.application.config.dartsass.builds = {
  "active_admin.scss"       => "active_admin.css"
  # "main.scss"               => "main.css"
}