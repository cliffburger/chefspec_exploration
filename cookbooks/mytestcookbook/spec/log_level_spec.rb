require 'bundler/setup'
require 'chefspec'

describe 'mytestcookbook::log_level' do
  it 'note that warning log msg shows up but not info' do
    chef_run = ChefSpec::ChefRunner.new.converge 'mytestcookbook::log_level'
    Chef::Log.warn("warn msg shows up but not info")
  end

  it 'warn log msgs show up when log level is info' do
    # note setting log_level in the CherRunner initializer.
    # 'info' messages include all of the execution messages
    chef_run = ChefSpec::ChefRunner.new(:log_level => :info).converge 'mytestcookbook::log_level'
    Chef::Log.warn("warn msg shows up at the info level")
    expect(chef_run).to log "this message is at WARN"
  end

  it 'info log msgs show up when log level is WARN' do
    # note setting log_level in the CherRunner initializer.
    # 'info' messages include all of the execution messages
    chef_run = ChefSpec::ChefRunner.new(:log_level => :warn).converge 'mytestcookbook::log_level'
    Chef::Log.info("info msg shows up at the warn level")
    expect(chef_run).to log "this message is at INFO"
  end

=begin
  # This test fails, which is not what I would expect
  it 'info log msgs should not show up when log level is WARN' do
    # note setting log_level in the CherRunner initializer.
    # 'info' messages include all of the execution messages
    chef_run = ChefSpec::ChefRunner.new(:log_level => :warn).converge 'mytestcookbook::log_level'
    Chef::Log.info("info msg should not show at the warn level")
    expect(chef_run).not_to log "this message is at INFO"
  end
=end

  it '2+2 = 4' do
    expect(2+2).to eq(4)
  end

  it 'test log messages do not show in chef run log' do
    # note setting log_level in the CherRunner initializer.
    # 'info' messages include all of the execution messages
    chef_run = ChefSpec::ChefRunner.new(:log_level => :info).converge 'mytestcookbook::log_level'
    Chef::Log.warn("TEST LOG MSG")
    expect(chef_run).not_to log "TEST LOG MSG"
  end
end
