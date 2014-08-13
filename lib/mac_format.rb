require "mac_address"
require "mac_format/version"
require "mac_format/mac_format_validator"

module MacFormat

  def self.valid?(mac)
    mac.to_mac.valid_mac?(strict: true)
  end
end
