# frozen_string_literal: true

shared_examples_for 'contributor' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @contributor = FactoryGirl.build_stubbed(:person)
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.contributor_resource << @contributor
  end
  it 'has creator' do
    expect(@stubby.contributor).to eq(['Joyce, Mike'])
    expect(@stubby.contributor_resource.first).to eq(@contributor)
  end
  # No works are currently indexing contributor resources
  it 'has _value in solr' do
    # expect(@stubby.to_solr.should(include('contributor_value_tesim')))
    # expect(@stubby.to_solr.should(include('contributor_value_sim')))
  end
end
