# frozen_string_literal: true

shared_examples_for 'language' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has language' do
    expect(stubby.language).to eq(['English'])
  end
  it 'has language predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/elements/1.1/language')))
  end

  it 'has language code' do
    expect(stubby.language_code).to eq(['en-GB'])
  end
  it 'has language code predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/language')))
  end
end
