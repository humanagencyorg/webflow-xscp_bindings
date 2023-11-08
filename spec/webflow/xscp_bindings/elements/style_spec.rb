require "webflow/xscp_bindings/elements/style"

RSpec.describe Webflow::XscpBindings::Elements::Style do

  let(:name) { "hidden" }
  let(:styleLess) { "display: none" }
  subject { described_class.new(name: name, styleLess: styleLess) }

  include_examples "xscp base"

  describe "#definition" do
    it "has an _id" do
      expect(subject.definition[:_id]).to eq(test_uuid)
    end

    it "has a fake attribute" do
      expect(subject.definition[:fake]).to eq(false)
    end

    it "has a type attribute" do
      expect(subject.definition[:type]).to eq("class")
    end

    it "has a name attribute" do
      expect(subject.definition[:name]).to eq(name)
    end

    it "has a styleLess attribute" do
      expect(subject.definition[:styleLess]).to eq(styleLess)
    end

    it "has an empty children attribute" do
      expect(subject.definition[:children]).to eq([])
    end

    it "has a selector attribute" do
      expect(subject.definition[:selector]).to be_nil
    end
  end
end
