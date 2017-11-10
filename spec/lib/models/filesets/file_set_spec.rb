# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::FileSet do
  let(:stubby) { FactoryBot.build(:file_set) }
  let(:rdf) { stubby.resource.dump(:ttl) }

  it 'is a fileset' do
    expect(stubby).to be_file_set
  end

  it_behaves_like 'content_version'
end
