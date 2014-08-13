require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'active_model'
require 'mac_format'

class FakeModel
  include ActiveModel::Validations

  attr_accessor :mac

  validates :mac, mac_format: true
end

class FakeModelWithBlankMac
  include ActiveModel::Validations

  attr_accessor :mac

  validates :mac, mac_format: true, allow_blank: true
end
