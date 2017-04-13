# frozen_string_literal: true

require 'spec_helper'

describe DogBiscuits::FileSet do
  let(:fileset) { FactoryGirl.build(:file_set) }

  it 'is a fileset' do
    expect(fileset).to be_file_set
  end

  it_behaves_like 'content_version'
end
