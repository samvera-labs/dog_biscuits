# frozen_string_literal: true

shared_examples_for 'date_accepted' do
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has date accepted' do
    expect(stubby.date_accepted).to eq('2014')
  end
  it 'has date accepted predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/dateAccepted')))
  end
end
