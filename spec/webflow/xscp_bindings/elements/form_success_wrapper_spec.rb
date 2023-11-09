require "webflow/xscp_bindings/elements/form_success_wrapper"

RSpec.describe Webflow::XscpBindings::Elements::FormSuccessWrapper do
  let(:data_attributes) { { "data-custom": "123"  } }
  subject { described_class.new(data_attributes: data_attributes) }

  describe "#type" do
    it "is FormSuccessMessage" do
      expect(subject.type).to eq("FormSuccessMessage")
    end
  end

  describe "#data" do
    it "has form attribute type" do
      expect(subject.data).to include(form: { type: "msg-done" })
    end

    it "has attr attribute id" do
      expect(subject.data).to include(attr: hash_including({ id: "" }))
    end

    it "includes custom attributes" do
      expect(subject.data).to include(attr: hash_including(**data_attributes))
    end
  end
end
