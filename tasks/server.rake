# encoding: utf-8
# frozen_string_literal: true
desc 'Launches web-server for CityUTC'
task :launch_web_server! do
  settings = [
    '--max-conns 2048',
    '--address 127.0.0.1',
    '--max-persistent-conns 1024',
    '--threaded',
    '--port 30042',
    '--tag thin_CityUTC_WebServer_30042'
  ].join(' ')
  path_to_config = File.join(__dir__, "..", "server", "config.ru")

  Kernel.system "thin #{settings} -R '#{path_to_config}' start"
end

# desc 'Shows status for web-server (CityUTC#WebServer)'
# task :status do
# end
#
# desc 'Terminates web-server (CityUTC#WebServer)'
# task :terminate_web_server! do
# end
