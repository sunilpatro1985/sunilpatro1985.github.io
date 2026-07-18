=begin
require "html-proofer"

Jekyll::Hooks.register :site, :post_write do |site|
  puts "Checking HTML with HTML-Proofer..."
  
  options = {
    :disable_external => true,
    :enforce_https => false,  
    :url_ignore => [
      /^http:\/\/127.0.0.1/,
      /^http:\/\/0.0.0.0/,
      /^http:\/\/localhost/
    ]
  }
  
  #begin
    #HTMLProofer.check_directory(site.config["destination"], options).run
  #rescue => e
    #puts "HTML-Proofer found issues: #{e.message}"
  #end
 end
= end
