require "webflow/xscp_bindings/elements/form_block_label"

RSpec.describe Webflow::XscpBindings::Elements::FormBlockLabel do

  subject { described_class.new(attr_for: "input1", text: "Hello World") }

  describe "#type" do
    it "returns FormBlockLabel" do
      expect(subject.type).to eq("FormBlockLabel")
    end
  end
end
