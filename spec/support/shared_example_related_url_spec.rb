# frozen_string_literal: true

shared_examples_for 'related_url' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has related url' do
    expect(stubby.related_url).to eq(['http://www.ulcc.ac.uk'])
  end

  it 'has see also predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://www.w3.org/2000/01/rdf-schema#seeAlso')))
  end
end
