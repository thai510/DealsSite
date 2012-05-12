set :application, "DealsSite"
set :repository,  "git@github.com:thai510/DealsSite.git"
set :deploy_to, "/home/deploy/sites/#{application}"
set :scm, "git"
set :branch, "master"
set :user, "deploy"
set :password, "sidekick512k"
role :app, "173.255.251.13"
role :web, "173.255.251.13"
role :db,  "173.255.251.13", :primary => true
set :rvm_type, :system
default_run_options[:pty] = true


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts
   
 namespace :deploy do
  desc "Restarting Passenger with restart.txt"
   task :restart, :roles => :app, :except => { :no_release => true } do
  run "touch #{current_path}/tmp/restart.txt"
 end

 [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
       task t, :roles => :app do ; end
    end
  end
