namespace :tomcat do
  task :run do
    sh "mvn org.codehaus.mojo:tomcat-maven-plugin:run"
  end
end
