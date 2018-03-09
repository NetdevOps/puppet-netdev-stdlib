# encoding: utf-8

Puppet::Type.newtype(:search_domain) do
  @doc = 'Configure the resolver to use the specified search domain'

  apply_to_all
  ensurable

  newparam(:name, namevar: true) do
    desc 'The search domain to configure in the resolver'

    validate do |value|
      raise "value #{value.inspect} is invalid, must be a String." unless value.is_a? String
      super(value)
    end
  end
end
