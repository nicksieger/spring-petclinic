namespace :cucumber do
  task :remote do
    ENV['TESTHOST'] = 'http://localhost:3000'
    Rake::Task['cucumber'].invoke
  end
end
