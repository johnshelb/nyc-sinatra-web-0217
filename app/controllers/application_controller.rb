class ApplicationController < Sinatra::Base
  disable "show_exceptions"

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

end
