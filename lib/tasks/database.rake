namespace :db do
  task "test:prepare" do
    mysql_connect = "mysql -N -u pc --password=pc petclinic"
    output = `echo 'show tables' | #{mysql_connect}`
    fail "mysql failed to connect to petclinic database:\n#{output}" unless $?.success?
    truncate_script = 'SET foreign_key_checks=0;'
    output.chomp.split.each do |table|
      truncate_script << " truncate table #{table};"
    end
    system "echo '#{truncate_script}' | #{mysql_connect}"
    populate_script = File.expand_path('../../../src/main/resources/db/mysql/populateDB.txt', __FILE__)
    system "echo '\\. #{populate_script}' | #{mysql_connect}"
  end
  task :reset => "db:test:prepare"
end
