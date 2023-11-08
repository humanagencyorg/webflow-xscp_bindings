require "webflow/xscp_bindings/elements/form_wrapper"
require "webflow/xscp_bindings/elements/div"

RSpec.describe Webflow::XscpBindings::Elements::FormWrapper do
  subject { described_class.new }

  it { should be_a Webflow::XscpBindings::Elements::Div }

  it "has a type of FormWrapper" do
    expect(subject.type).to eq("FormWrapper")
  end
end
