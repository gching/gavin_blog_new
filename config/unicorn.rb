## unicorn.rb
# Set your full path to application.
app_dir = File.expand_path('../../', __FILE__)
shared_dir = File.expand_path('../../../shared/', __FILE__)

## Unicorn options
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 2)
timeout 30
preload_app true

if ENV["RAILS_ENV"] == "production"
  # Fill path to your app
  working_directory app_dir

  # Set up socket location
  listen "#{shared_dir}/sockets/unicorn.sock", :backlog => 64

  # Loging
  stderr_path "#{shared_dir}/log/unicorn.stderr.log"
  stdout_path "#{shared_dir}/log/unicorn.stdout.log"

  # Set master PID location
  pid "#{shared_dir}/pids/unicorn.pid"

end

if ENV["RAILS_ENV"] != "production"
  before_fork do |server, worker|
    Signal.trap 'TERM' do
      puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
      Process.kill 'QUIT', Process.pid
    end

    defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
  end

  after_fork do |server, worker|
    Signal.trap 'TERM' do
      puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
    end

    defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
  end
else

  before_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
    old_pid = "#{server.config[:pid]}.oldbin"
    if File.exists?(old_pid) && server.pid != old_pid
      begin
        sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
        Process.kill(sig, File.read(old_pid).to_i)
      rescue Errno::ENOENT, Errno::ESRCH
        # someone else did our job for us
      end
    end
  end

  after_fork do |server, worker|
    defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
  end

  before_exec do |server|
    ENV['BUNDLE_GEMFILE'] = "#{app_dir}/Gemfile"
  end

end
