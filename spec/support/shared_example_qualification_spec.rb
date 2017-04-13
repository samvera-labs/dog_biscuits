# frozen_string_literal: true

shared_examples_for 'qualification' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  # metadata
  it 'has qualification name' do
    expect(stubby.qualification_name).to eq(['qualification'])
  end
  it 'has an qualification level' do
    expect(stubby.qualification_level).to eq(['PhD'])
  end

  # predicates
  it 'has qualification level predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationLevel')))
  end
  it 'has qualification name predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/uketd#qualificationName>')))
  end
end
