# frozen_string_literal: true

shared_examples_for 'borthwick_note' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has note' do
    expect(stubby.note).to eq(['note'])
  end
  it 'has the note predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/borthwick-registers#note')))
  end
end
