# frozen_string_literal: true

shared_examples_for 'main_file' do
  # the class that includes the concern

  let(:main) { FactoryGirl.build_stubbed(:file_set) }

  before do
    stubby.mainfile << main
  end

  it 'has main file' do
    expect(stubby.mainfile.first).to eq(main)
  end

  # main file is added to members
  it 'has one member' do
    stubby.add_member
    expect(stubby.members.size).to eq(1)
  end
  it 'has one member when member is added a second time' do
    stubby.add_member
    expect(stubby.members.size).to eq(1)
  end
end
