set :application, "cougar_jobs"
set :user, "root" # I used root, less problems, but not recommended.
 
set :scm, :git
 
# This distinction is necessary if the way you access github locally
# is different from the way your production environment will access it.
# For me it was the case.
set :local_repository, "git@github.com:gmalicki/cougar_jobs.git"
set :repository, "git@github.com:gmalicki/cougar_jobs.git"
 
set :deploy_to, "/usr/local/www/" # path to app on remote machine
#set :deploy_via, :remote_cache # quicker checkouts from github
 
set :domain, '174.133.53.58' # your remote machine's domain name goes here
role :app, domain
role :web, domain
 
set :runner, user
set :admin_runner, runner
 
namespace :deploy do
  task :start, :roles => [:web, :app] do
    run "cd #{deploy_to}/current && nohup thin -C thin/production_config.yml -R thin/config.ru start"
  end
 
  task :stop, :roles => [:web, :app] do
    run "cd #{deploy_to}/current && nohup thin -C thin/production_config.yml -R thin/config.ru stop"
  end
  
  task :mp3, :roles => [:web, :app] do
    run "cp /root/*.mp3 /usr/local/www/current/public/mp3/"
  end
 
  task :restart, :roles => [:web, :app] do
    deploy.stop
    deploy.start
  end
 
  # This will make sure that Capistrano doesn't try to run rake:migrate (this is not a Rails project!)
  task :cold do
    deploy.update
    #deploy.start
  end
end
