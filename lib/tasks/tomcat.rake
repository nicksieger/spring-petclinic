namespace :tomcat do
  task :run do
    sh "mvn org.codehaus.mojo:tomcat-maven-plugin:run -Dmaven.tomcat.path=/ -Dmaven.tomcat.port=3000"
  end

  task :background do
    Thread.new do
      Rake::Task['tomcat:run'].invoke
    end
    loop do
      require 'open-uri'
      begin
        open('http://localhost:3000/')
        break
      rescue
        sleep 2
      end
    end
    puts "Tomcat started in the background"

    at_exit do
      Rake::Task['tomcat:kill'].invoke
    end
  end

  task :kill do
    tomcat_pid = `jps -m`.detect{|l| l =~ /tomcat-maven/}.to_i
    if tomcat_pid > 0
      puts "Killing Tomcat with PID #{tomcat_pid}"
      sh "kill #{tomcat_pid}"
    end
  end
end

namespace :cucumber do
  task :spring => ['tomcat:background', 'cucumber:remote']

  task :remote do
    ENV['TESTURL'] = 'http://localhost:3000'
    Rake::Task['cucumber'].invoke
  end
end
