# frozen_string_literal: true

shared_examples_for 'date_of_award' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
  end
  # metadata
  it 'has date of award' do
    expect(@stubby.date_of_award).to eq('2016-01-01')
  end

  # predicates
  it 'has date of award predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/dateAccepted')))
  end
end
