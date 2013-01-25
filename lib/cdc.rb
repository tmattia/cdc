require "cdc/version"

require 'dependo'
require 'json'
require "cdc/builder"
require "cdc/contract"
require "cdc/request"
require "cdc/response"

Dependo::Registry[:service] = Class.new
