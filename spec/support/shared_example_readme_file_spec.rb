shared_examples_for 'readme_file' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::').last
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @readme = FactoryGirl.build_stubbed(:file_set)
    @stubby.readmefile << @readme
  end

  it 'has a readme file' do
    expect(@stubby.readmefile.first).to eq(@readme)
  end
  # failing because stubbed objects don't save
  it 'readme file is added to members' do
    @stubby.add_member_fs
    expect(@stubby.members.size).to eq(1)
  end
  it 'readme file is not added to members a second time' do
    @stubby.add_member_fs
    expect(@stubby.members.size).to eq(1)
  end
end
