RSpec.shared_examples "xscp base" do |node|
  it { should be_a Webflow::XscpBindings::Elements::Base }

  let(:test_uuid) { "8152039d-a800-b5cf-e367-f9a22ed8e94f" }
  before(:each) do
    allow(SecureRandom).to receive(:uuid).and_return(test_uuid)
  end

  describe "#_id" do
    it "contians a random _id" do
      expect(subject._id).to eq test_uuid
    end
  end
end
