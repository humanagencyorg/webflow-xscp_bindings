RSpec.describe Webflow::XscpBindings do
  it "has a version number" do
    expect(Webflow::XscpBindings::VERSION).not_to be nil
  end

  describe ".load" do
    let(:test_value) { "Test" }
    subject { described_class.load(test_value) }

    it { should respond_to(:to_xscp) }
    it { should respond_to(:to_html) }
  end

  describe ".load_template" do
    it "loads the file and templatizes the string" do

    end
  end
end
