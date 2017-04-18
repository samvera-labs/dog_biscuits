# frozen_string_literal: true

shared_examples_for 'module_code' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has former module code' do
    expect(stubby.module_code).to eq(['XXXXXX'])
  end
  it 'has module code predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#moduleCode')))
  end
end
