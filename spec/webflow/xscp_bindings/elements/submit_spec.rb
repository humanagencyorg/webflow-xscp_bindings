require "webflow/xscp_bindings/elements/submit"

RSpec.describe Webflow::XscpBindings::Elements::Submit do

  let(:value) { "Continue" }
  let(:wait) { "Submitting..." }
  subject { described_class.new(value: value, wait: wait) }

  include_examples "xscp node"

  describe "#tag" do
    it "returns input" do
      expect(subject.tag).to eq("input")
    end
  end

  describe "#type" do
    it "returns FormButton" do
      expect(subject.type).to eq("FormButton")
    end
  end

  describe "#data" do
    it "contains form type button" do
      expect(subject.data).to include(form: { type: "button", wait: wait })
    end

    it "contains attr id and type" do
      expect(subject.data).to include(attr: hash_including({ type: "submit", id: "" }))
    end

    it "contains attr value" do
      expect(subject.data).to include(attr: hash_including({ value: value }))
    end

    it "contains attr data-wait" do
      expect(subject.data).to include(attr: hash_including({ "data-wait": wait }))
    end
  end
end
