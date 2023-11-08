require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/label"

RSpec.describe Webflow::XscpBindings::Elements::Label do

  class TestLabel < Webflow::XscpBindings::Elements::Label
    def type
      "TestLabel"
    end
  end

  let(:test_uuid) { "abc1234" }
  let(:label_text) { "Hello World!" }
  before do
    allow(SecureRandom).to receive(:uuid).and_return(test_uuid)
  end
  let(:input1) { "input-1" }
  subject { TestLabel.new(attr_for: input1, text: label_text) }

  include_examples "xscp node"

  describe "#tag" do
    it "returns form" do
      expect(subject.tag).to eq("label")
    end
  end

  describe "#type" do
    it "returns FormForm" do
      expect(subject.type).to eq("TestLabel")
    end
  end

  describe "#data" do
    it "returns form hash with type label" do
      expect(subject.data).to include(form: { type: "label" })
    end
    
    it "returns form hash with attribute for" do
      expect(subject.data).to include(attr: { id: '', for: "input-1" })
    end
  end

  describe "#child_nodes" do
    it "contains a text node with the label text" do
      text_node = Webflow::XscpBindings::Elements::Text.new(label_text)
      expect(subject.child_nodes.size).to eq(1)
      expect(subject.child_nodes.first.definition).to eq(text_node.definition)
    end
  end
end
