# encoding: utf-8

Puppet::Type.newtype(:syslog_settings) do
  @doc = 'Configure global syslog settings'

  apply_to_all

  newparam(:name, namevar: true) do
    desc 'Resource name, not used to configure the device'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:enable) do
    desc 'Enable or disable syslog logging [true|false]'
    newvalues(:true, :false)
  end

  newproperty(:console) do
    desc "Console logging severity level [0-7] or 'unset'"

    validate do |value|
      raise "value #{value.inspect} is invalid, must be 0-7 or 'unset'" unless value.to_s.match('^[0-7]$') || value == 'unset'
      super(value)
    end
  end

  newproperty(:monitor) do
    desc "Monitor (terminal) logging severity level [0-7] or 'unset'"

    validate do |value|
      raise "value #{value.inspect} is invalid, must be 0-7 or 'unset'" unless value.to_s.match('^[0-7]$') || value == 'unset'
      super(value)
    end
  end

  newproperty(:source_interface, array_matching: :all) do
    desc 'Source interface to send syslog data from, e.g. "ethernet 2/1" (array of strings for multiple)'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:time_stamp_units) do
    desc 'The unit to log time values in'
    newvalues(:seconds, :milliseconds)
  end

  newproperty(:vrf, array_matching: :all) do
    desc 'The VRF associated with source_interface (array of strings for multiple).'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end
end
