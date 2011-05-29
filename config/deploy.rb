require 'bundler/capistrano'

set :application, 'lilyladder'

set :scm, :git
set :repository, 'git@github.com:Kelsin/lilyladder.git'
set :deploy_via, :remote_cache

set :user, 'kelsin'
set :ssh_options, { :forward_agent => true }

role :app, "valefor.com"
role :web, "valefor.com"
role :db,  "valefor.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_release}/tmp/restart.txt"
  end

  desc "Symlink database and config files"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
