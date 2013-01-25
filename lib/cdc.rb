require "cdc/version"

require 'dependo'
require 'faraday'
require 'json'
require 'json-schema'

require "cdc/extensions"
require "cdc/builder"
require "cdc/contract"
require "cdc/request"
require "cdc/response"
require "cdc/schema"

Dependo::Registry[:service] = Faraday.new(:url => ENV['CDC_URL'] || 'http://localhost')
Dependo::Registry[:schema_validator] = JSON::Validator
