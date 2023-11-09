require "webflow/xscp_bindings/elements/form_wrapper"
require "webflow/xscp_bindings/elements/form_success_wrapper"
require "webflow/xscp_bindings/elements/div"

RSpec.describe Webflow::XscpBindings::Elements::FormWrapper do
  subject { described_class.new }

  it { should be_a Webflow::XscpBindings::Elements::Div }

  it "has a type of FormWrapper" do
    expect(subject.type).to eq("FormWrapper")
  end

  describe "#data" do
    it "has attribute attr id" do
      expect(subject.data).to include(attr: hash_including({ id: "" }))
    end

    it "has form attribute type wrapper" do
      expect(subject.data).to include(form: { type: "wrapper" })
    end
  end
end
