require "cdc/version"

require 'dependo'
require 'json'
require "cdc/builder"
require "cdc/contract"
require "cdc/request"
require "cdc/response"
require "cdc/schema"

Dependo::Registry[:service] = Class.new
Dependo::Registry[:validator] = Class.new
