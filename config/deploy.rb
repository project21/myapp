require "bundler/capistrano"
require "rvm/capistrano"
set :application, "myapp"
set :repository,  "https://github.com/sparkz19/myapp.git"
set :branch, "master"
set :user, "ubuntu" 
ssh_options[:forward_agent] = true
ssh_options[:keys]=["/Users/david.mbura/Downloads/myapp_davidmbura.pem"]
set :use_sudo, false
 set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :deploy_to, "/home/ubuntu/web_applications"
role :web, "107.22.72.217"                          # Your HTTP server, Apache/etc
role :app, "107.22.72.217"                          # This may be the same as your `Web` server
role :db,  "107.22.72.217", :primary => true # This is where Rails migrations will run
role :db,  "107.22.72.217"
set :default_environment, {
  'PATH' => "/opt/ruby-enterprise/bin/:$PATH"
}
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
 end