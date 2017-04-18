# frozen_string_literal: true

shared_examples_for 'access_rights' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has access rights' do
    expect(stubby.dc_access_rights).to eq(['access rights'])
  end

  it 'has access rights predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/accessRights')))
  end
end
