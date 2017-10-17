# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Importer::Authorities do
  let(:instance) { described_class.new(authority_name) }
  let(:authority_name) { 'subjects' }
  let(:label) { 'label' }
  let(:uri) { 'http://example.com/label' }

  it "creates an entry with a uri" do
    expect(Qa::LocalAuthorityEntry).to receive(:create).with(
      local_authority: instance.authority,
      label: 'label',
      uri: 'http://example.com/label'
    )
    instance.create_record(label, uri)
  end

  it "creates an entry without a uri" do
    expect(Qa::LocalAuthorityEntry).to receive(:create).with(
      local_authority: instance.authority,
      label: 'label',
      uri: 'http://example.com/subjects/label'
    )
    instance.create_record(label)
  end
end
