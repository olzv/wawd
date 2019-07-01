namespace :system do
  desc "Runs job with not buffered output"
  task jobs: :environment do
    $stdout.sync = true
    Rake::Task['jobs:work'].invoke
  end
end
