require "webflow/xscp_bindings/elements/form"

RSpec.describe Webflow::XscpBindings::Elements::Form do

  include_examples "xscp node"

  describe "#tag" do
    it "returns form" do
      expect(subject.tag).to eq("form")
    end
  end

  describe "#type" do
    it "returns FormForm" do
      expect(subject.type).to eq("FormForm")
    end
  end

  describe "#data" do
    it "returns Source hash" do
      expect(subject.data).to include(Source: { tag: "Default form", val: {} })
    end

    it "returns form hash" do
      expect(subject.data).to include(form: { type: "form", name: {} })
    end

    it "returns attribute hash with redirect" do
      example_url = "https://example.com"
      subject.redirect = example_url

      expect(subject.data).to include(attr: hash_including({ redirect: example_url }))
    end

    it "returns attribute hash with data-redirect" do
      example_url = "https://example.com"
      subject.data_redirect = example_url

      expect(subject.data).to include(attr: hash_including({ :"data-redirect" => example_url }))
    end

    it "returns attribute hash with an action" do
      example_url = "https://example.com"
      subject.action = example_url

      expect(subject.data).to include(attr: hash_including({ action: example_url }))
    end

    it "return attribute hash with a method" do
      method = "POST"
      subject.method = method

      expect(subject.data).to include(attr: hash_including({ method: method }))
    end

    it "returns attribute hash with custom data attributes" do
      custom_attributes = { "data-custom" => "custom" }
      subject.data_attributes = custom_attributes

      expect(subject.data).to include(attr: hash_including(custom_attributes))
    end
  end
end
