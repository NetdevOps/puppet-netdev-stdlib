# encoding: utf-8

require 'spec_helper'

describe Puppet::Type.type(:network_vlan) do
  let(:catalog) { Puppet::Resource::Catalog.new }
  let(:type) { described_class.new(name: '100', catalog: catalog) }

  it_behaves_like 'an ensurable type', name: '100'

  describe 'vlan_name' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :vlan_name }

    include_examples 'property'
    include_examples '#doc Documentation'
    include_examples 'accepts values without munging', %w[Engineering]
    include_examples 'rejects values', [[1], { two: :three }]
  end

  describe 'description' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :description }

    include_examples 'property'
    include_examples '#doc Documentation'
    include_examples 'description property'
    include_examples 'accepts values without munging', 'Engineering VLAN'
    include_examples 'rejects values', [0, [1], { two: :three }]
  end

  describe 'id' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :id }

    include_examples 'parameter'
    include_examples '#doc Documentation'
    include_examples 'rejects values', [{ two: :three }, 'abc']

    [100, '100'].each do |val|
      it "validates #{val.inspect} as isomorphic to '100'" do
        type[attribute] = val
        expect(type[attribute]).to eq(val.to_s)
      end
    end
  end

  describe 'shutdown' do
    subject { described_class.attrclass(attribute) }

    let(:attribute) { :shutdown }

    include_examples 'property'
    include_examples '#doc Documentation'
    include_examples 'boolean value'
    include_examples 'rejects values', [0, [1], { two: :three }]
  end
end
