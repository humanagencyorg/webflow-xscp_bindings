require "webflow/xscp_bindings/elements/div"

RSpec.describe Webflow::XscpBindings::Elements::Div do
  subject { described_class.new(type: "Block") }

  include_examples "xscp node"

  it "has a tag of div" do
    expect(subject.tag).to eq("div")
  end


  describe "#data" do
    it "has an empty id attribute" do
      expect(subject.data).to include(attr: { id: '' })
    end
  end

end
