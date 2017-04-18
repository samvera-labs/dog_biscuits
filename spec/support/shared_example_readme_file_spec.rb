# frozen_string_literal: true

shared_examples_for 'readme_file' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }
  let(:readme) { FactoryGirl.build_stubbed(:file_set) }

  before do
    stubby.readmefile << readme
  end

  it 'has readme file' do
    expect(stubby.readmefile.first).to eq(readme)
  end
  it 'has readme file in members' do
    stubby.add_member_fs
    expect(stubby.members.size).to eq(1)
  end
  it ' has only one readme file in members' do
    stubby.add_member_fs
    expect(stubby.members.size).to eq(1)
  end
end
