namespace :tomcat do
  task :run do
    sh "mvn org.codehaus.mojo:tomcat-maven-plugin:run -Dmaven.tomcat.path=/ -Dmaven.tomcat.port=3000"
  end
end
