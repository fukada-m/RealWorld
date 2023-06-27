# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def hello
    render html: '<h1>Hello, ゆのん</h1>'.html_safe
  end
end
