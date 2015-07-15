class IpController < ApplicationController
  require 'ipaddr'
  before_save :convert_ip

  def self.find_by_ip(value)
    find :first, :conditions => {:ip => IPAddr.new(value).to_i}
  end

  def ip
    convert_ip
    IPAddr.new(read_attribute(:ip), Socket::AF_INET).to_s
  end

  def ip=(value)
    write_attribute(:ip, IPAddr.new(value).to_i)
  end

  def convert_ip
    if read_attribute(:ip) =~ /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})?$/
      write_attribute(:ip, IPAddr.new(read_attribute(:ip)).to_i)
    end
  end
end
