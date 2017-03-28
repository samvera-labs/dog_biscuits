require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe DogBiscuits::FileSet do

  let(:fileset) { FactoryGirl.build(:file_set) }

  it 'is a fileset' do
    expect(fileset).to be_file_set
  end

  # Concerns
  it_behaves_like 'content_version'

end
