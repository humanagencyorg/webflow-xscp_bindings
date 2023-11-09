require "webflow/xscp_bindings/elements/text_input"

RSpec.describe Webflow::XscpBindings::Elements::TextInput do

  let(:id) { "id1" }
  let(:name) { "name1" }
  let(:placeholder) { "placeholder1" }
  let(:disabled) { true }
  let(:required) { true }
  let(:data_attributes) { { "data-attr1" => "value1" } }

  subject { described_class.new(id: id, name: name, placeholder: placeholder, disabled: disabled, required: required, data_attributes: data_attributes) }

  include_examples "xscp node"

  describe "#tag" do
    it "returns input" do
      expect(subject.tag).to eq("input")
    end
  end

  describe "#type" do
    it "returns FormTextInput" do
      expect(subject.type).to eq("FormTextInput")
    end
  end

  describe "#data" do
    it "contains form type input" do
      expect(subject.data).to include(form: { type: "input", passwordPage: false })
    end

    it "contains attr id and name" do
      expect(subject.data).to include(attr: hash_including({ id: id, name: name }))
    end

    it "contains attr placeholder" do
      expect(subject.data).to include(attr: hash_including({}))
    end

    it "contains attr type" do
      expect(subject.data).to include(attr: hash_including({ type: "text" }))
    end
    it "contains attr disabled" do
      expect(subject.data).to include(attr: hash_including({ disabled: disabled }))
    end

    it "contains attr required" do
      expect(subject.data).to include(attr: hash_including({ required: required }))
    end
  end

  describe "#definition" do
    it "contains attr required" do
      expect(subject.definition).to include(data: hash_including(attr: hash_including(**data_attributes)))
    end
  end
end
