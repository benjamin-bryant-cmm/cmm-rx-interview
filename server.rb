# frozen_string_literal: true

require 'json'
require 'webrick'
require_relative 'lib/api'
require_relative 'lib/db'

CONN = Db.connect

server = WEBrick::HTTPServer.new(Port: 8000)
server.mount_proc('/') do |req, res|
  status, body = Api.handle_request(CONN, req.path, req.query)
  res.status = status
  res['Content-Type'] = 'application/json'
  res.body = JSON.generate(body)
end
trap('INT') { server.shutdown }
server.start
