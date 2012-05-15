require 'bundler'
Bundler.setup

task :default => [:test]

PKG_NAME = "file-column"
PKG_VERSION = "0.3.3"

PKG_DIR = "release/#{PKG_NAME}-#{PKG_VERSION}"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = PKG_NAME
    gem.version = PKG_VERSION
    gem.summary = "#{PKG_NAME}-#{PKG_VERSION}"
    gem.description = "File column plugin for Rails3"
    gem.email = "alex.borovsky@gmail.com"
    gem.homepage = "http://github.com/partizan/file_column"
    gem.authors = ["Alexander Borovsky"]    
    gem.post_install_message = <<-EOM
#{"*"*50}

  Thank you for installing #{gem.summary}
  
#{"*"*50}
EOM
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

task :clean do
  rm_rf "release"
end

task :setup_directories do
  mkpath "release"
end


task :checkout_release => :setup_directories do
  rm_rf PKG_DIR
  revision = ENV["REVISION"] || "HEAD"
  sh "svn export -r #{revision} . #{PKG_DIR}"
end

task :release_docs => :checkout_release do
  sh "cd #{PKG_DIR}; rdoc lib"
end

task :package => [:checkout_release, :release_docs] do
  sh "cd release; tar czf #{PKG_NAME}-#{PKG_VERSION}.tar.gz #{PKG_NAME}-#{PKG_VERSION}"
end

task :test do
  sh "cd test; ruby file_column_test.rb"
  sh "cd test; ruby file_column_helper_test.rb"
  sh "cd test; ruby magick_test.rb"
  sh "cd test; ruby magick_view_only_test.rb"
end
