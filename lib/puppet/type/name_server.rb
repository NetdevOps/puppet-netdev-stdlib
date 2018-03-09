# encoding: utf-8

Puppet::Type.newtype(:name_server) do
  @doc = 'Configure the resolver to use the specified DNS server'

  apply_to_all
  ensurable

  newparam(:name, namevar: true) do
    desc 'The hostname or address of the DNS server'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end
end
