#
# Cookbook Name:: mytestcookbook
# Recipe:: log_level
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.debug("This message is at DEBUG level at the top of the recipe.")
Chef::Log.warn("This message is at WARN level at the top of the recipe.")
Chef::Log.info("This message is at INFO level at the top of the recipe.")

log "this message is at INFO" do
  level :info
end

log "this message is at WARN" do
  level :warn
end
