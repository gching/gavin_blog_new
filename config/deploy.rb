# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'gavins_blog'
set :repo_url, 'git@github.com:gching/gavin_blog_new.git'

set :rvm_ruby, '2.0.0'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml config/application.yml config/unicorn.rb config/unicorn_init.sh}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 2 do
       execute :bash, "-l -c 'cd #{release_path} && ./config/unicorn_init.sh restart'"
    end
  end
  desc 'Stop Unicorn'
  task :stop do
    on roles(:app), in: :sequence, wait: 2 do
      execute :bash, "-l -c 'cd #{release_path} && ./config/unicorn_init.sh stop'"
    end
  end

  desc 'Start Unicorn'
  task :start do
    on roles(:app), in: :sequence, wait: 2 do
      execute :bash, "-l -c 'cd #{release_path} && ./config/unicorn_init.sh start'"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
