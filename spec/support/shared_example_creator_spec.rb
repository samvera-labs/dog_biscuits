# frozen_string_literal: true

shared_examples_for 'creator' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @creator = if model_str == 'ExamPaper'
                 FactoryGirl.build_stubbed(:organisation)
               else
                 FactoryGirl.build_stubbed(:person)
               end
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @stubby.creator_resource << @creator
  end
  it 'has creator' do
    expect(@stubby.creator).to eq(['Marr, Johnny'])
    expect(@stubby.creator_resource.first).to eq(@creator)
  end
  it 'has _value in solr' do
    expect(@stubby.to_solr.should(include('creator_value_tesim')))
    expect(@stubby.to_solr.should(include('creator_value_sim')))
  end
end
