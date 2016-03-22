set :application,     'beerhunt' # used by default deploy_to. capistrano deploys to /var/www/beerhunt
set :repo_url,        'git@github.com:kylefdoherty/beerhunt.git'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :passenger_restart_with_touch, true
