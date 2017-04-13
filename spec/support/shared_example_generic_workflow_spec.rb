# frozen_string_literal: true

shared_examples_for 'generic_workflow' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'has wf_status' do
    expect(@stubby.wf_status).to eq(['xxx-xxx-xxx'])
  end
  it 'has wf_status predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#status')))
  end
end
