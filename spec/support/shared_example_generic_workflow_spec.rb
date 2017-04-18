# frozen_string_literal: true

shared_examples_for 'generic_workflow' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has wf_status' do
    expect(stubby.wf_status).to eq(['xxx-xxx-xxx'])
  end
  it 'has wf_status predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#status')))
  end
end
