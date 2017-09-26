# frozen_string_literal: true

shared_examples_for 'creator' do
  # the class that includes the concern
  model_str = described_class.to_s.split('::')[1]
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  if model_str == 'ExamPaper'
    let(:creator) { FactoryGirl.build_stubbed(:organisation) }

  else
    let(:creator) { FactoryGirl.build_stubbed(:person) }

  end

  before do
    stubby.creator_resource << creator
  end

  it 'has creator' do
    expect(stubby.creator).to eq(['Marr, Johnny'])
  end
  it 'has creator resource' do
    expect(stubby.creator_resource.first).to eq(creator)
  end
  it 'has _label in solr' do
    expect(stubby.to_solr.should(include('creator_label_tesim')))
  end
end
