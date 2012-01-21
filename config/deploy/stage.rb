server "hcimain", :app, :web, :db, :primary => true

if deploy_stage == 'stage'
  configure(:deploy_to "/var/www/apps/hci3-stage" )
end
