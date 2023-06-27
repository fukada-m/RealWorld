# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def hello
    render html: '<h1>ゆのんちゃん、かわいい</h1>'.html_safe
  end
end

