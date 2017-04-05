shared_examples_for 'readme_file' do
  let(:model) { described_class } # the class that includes the concern

  before do
    model_str = model.to_s.split('::').last
    @stubby = FactoryGirl.build(model_str.underscore.to_sym)
    @readme = FactoryGirl.build_stubbed(:file_set)
    @stubby.readmefile << @readme
  end

  it 'has readme file' do
    expect(@stubby.readmefile.first).to eq(@readme)
  end
  it 'has readme file in members' do
    @stubby.add_member_fs
    expect(@stubby.members.size).to eq(1)
  end
  it ' has only one readme file in members' do
    @stubby.add_member_fs
    expect(@stubby.members.size).to eq(1)
  end
end
