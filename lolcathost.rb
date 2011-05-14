#!/usr/bin/env ruby
require 'rubygems'
require 'bundler'

Bundler.require

LOCALHOST_URL = "http://localhost/"

configure do
  $sess = Patron::Session.new
  $sess.timeout = 10
  $sess.base_url = LOCALHOST_URL
  $sess.headers['User-Agent'] = 'myapp/1.0'
  $sess.enable_debug "/tmp/patron.debug"
end

get '/' do
  resp = $sess.get("/")
  resp.body
end

get '/:page' do
  resp = $sess.get("#{params[:page]}")
  resp.body
end