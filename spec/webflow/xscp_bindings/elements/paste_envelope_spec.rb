require "webflow/xscp_bindings/elements/paste_envelope"
require "support/test_node"

RSpec.describe Webflow::XscpBindings::Elements::PasteEnvelope do

  describe ".to_h" do
    context "when the envelope has no nodes" do
      subject { described_class.new.to_h }
      it "returns a type" do
        expect(subject).to include("type": "@webflow/XscpData")
        expect(subject).to include("nodes": [])
      end
    end

    context "when nodes are added to the envelope" do
      let(:node) { TestNode.new }
      subject { described_class.new([node]).to_h }

      it "returns a hash with an additional node" do
        expect(subject[:nodes].count).to eq(1)
      end

      it "returns the node contents" do
        expect(subject.dig(:nodes, 0)).to eq(TestNode.new.to_h)
      end
    end
  end
end
