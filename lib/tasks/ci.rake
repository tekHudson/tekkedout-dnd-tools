unless Rails.env.production?
  require "rubocop/rake_task"
  require "rspec/core/rake_task"

  RuboCop::RakeTask.new
  Rake::Task[:default].clear
  task default: [:rubocop, :spec]
end
