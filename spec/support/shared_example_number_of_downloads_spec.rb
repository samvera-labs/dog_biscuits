# frozen_string_literal: true

shared_examples_for 'number_of_downloads' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has number_of_downloads' do
    expect(stubby.number_of_downloads).to eq('52')
  end
  it 'has number_of_downloads predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#numberOfDownloads')))
  end
end
