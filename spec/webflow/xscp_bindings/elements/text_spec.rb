require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/text"

RSpec.describe Webflow::XscpBindings::Elements::Text do
  let(:label_text) { "Hello World" }
  subject { described_class.new(label_text) }

  let(:test_uuid) { "abc1234" }
  before do
    allow(SecureRandom).to receive(:uuid).and_return(test_uuid)
  end

  describe "#tag" do
    it "has no tag" do
      expect(subject.tag).to eq(nil)
    end
  end

  describe "#v" do
    it "contains the actual text of the label" do
      expect(subject.label_text).to eq(label_text)
    end
  end

  describe "#data" do
    it "contains a unique id" do
      expect(subject.definition).to include(_id: test_uuid)
    end

    it "contains the text tag true" do
      expect(subject.definition).to include(text: true)
    end

    it "contains the text tag true" do
      expect(subject.definition).to include(v: label_text)
    end
  end
end
