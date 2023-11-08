  <<-DOC
  # {
      '_id': '8152039d-a800-b5cf-e367-f9a22ed8e94f',
      'tag': 'div',
      'classes': [],
      'children': [
        '8152039d-a800-b5cf-e367-f9a22ed8e950',
        'a800-b5cf-e367-f9a22ed8e950',
        'a900-b5cf-e367-f9a22ed8e950',
        '8152039d-a800-b5cf-e367-f9a22ed8e96b',
        '8152039d-a800-b5cf-e367-f9a22ed8e96e',
      ],
      'type': 'FormWrapper',
      'data': {
        'form': {
          'type': 'wrapper',
        },
        'attr': {
          'id': '',
        },
      },
    }
  DOC

require "webflow/xscp_bindings/components/form"
require "webflow/xscp_bindings/elements/form_wrapper"

RSpec.describe Webflow::XscpBindings::Components::Form do
  describe "#definition" do
    subject { described_class.new }

    include_examples "xscp node"

    it "definition is a form wrapper" do
      expect(subject.definition).to eq(Webflow::XscpBindings::Elements::FormWrapper.new.definition)
    end
  end
end
