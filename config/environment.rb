require 'bundler/setup'
Bundler.require

require_relative '../lib/bot'
require_relative '../lib/web'

## Turn on logging
SlackRubyBot::Client.logger.level = Logger::WARN
