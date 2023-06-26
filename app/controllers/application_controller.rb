class ApplicationController < ActionController::Base
  def hello
    render html: "<h1>Hello, Real World</h1>".html_safe
  end
end

