server "hcimain", :app, :web, :db, :primary => true

if deploy_stage == 'production'
  configure(:deploy_to "/var/www/apps/hci3" )
end