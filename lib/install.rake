namespace :spree_multi_domain do
  task_warning = "[WARNING] This task has been removed, please run Rails default task: rake railties:install:migrations"
  task :install do
    puts task_warning
  end

  namespace :install do

    task :migrations do
      puts task_warning
    end

  end

end

