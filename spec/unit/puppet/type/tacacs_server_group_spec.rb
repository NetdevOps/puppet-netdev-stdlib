# encoding: utf-8

require 'spec_helper'

describe Puppet::Type.type(:tacacs_server_group) do
  subject { described_class.attrclass(attribute) }

  let(:catalog) { Puppet::Resource::Catalog.new }
  let(:type) { described_class.new(name: 'emanon', catalog: catalog) }

  it_behaves_like 'name is the namevar'
  it_behaves_like 'array of strings property', attribute: :servers
end
