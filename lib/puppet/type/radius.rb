# encoding: utf-8

Puppet::Type.newtype(:radius) do
  @doc = 'Enable or disable radius functionality'

  apply_to_all

  newparam(:name, namevar: true) do
    desc 'Resource name, not used to manage the device'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end

  newproperty(:enable) do
    desc 'Enable or disable radius functionality [true|false]'
    newvalues(:true, :false)
  end
end
