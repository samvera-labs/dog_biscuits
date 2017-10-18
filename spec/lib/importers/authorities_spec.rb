# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::Importers::Authorities do
  let(:instance) { described_class.new(authority_name) }
  let(:label) { 'label' }
  if `hostname`.include? 'localhost'
    let(:hostname) { 'example.com' }
  else
    let(:hostname) { `hostname`.delete("\n") }
  end
  let(:uri) { "http://example.com/label" }

  context "unregistered authority name" do
    let(:authority_name) { 'unregistered_thing' }

    it "does nothing if the authority is unregistered" do
      expect(Qa::LocalAuthorityEntry).not_to receive(:create)
      described_class.new(authority_name)
    end
  end

  context "registered authority name" do
    let(:authority_name) { 'subjects' }
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
        uri: "http://#{hostname}/subjects/label"
      )
      instance.create_record(label)
    end
  end
end
