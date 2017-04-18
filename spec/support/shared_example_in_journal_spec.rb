# frozen_string_literal: true

shared_examples_for 'in_journal' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'will be in a journal' do
    expect(stubby.journal).to eq(['The Journal of Woe'])
  end
  it 'has frbr:partOf predicate' do
    expect(stubby.resource.dump(:ttl).should(include('https://vocab.org/frbr/core#partOf')))
  end
end
