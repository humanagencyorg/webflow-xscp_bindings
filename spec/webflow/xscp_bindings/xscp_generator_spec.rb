require "webflow/xscp_bindings/xscp_generator"

RSpec.describe Webflow::XscpBindings::XscpGenerator do

  describe "generate" do

    context "when html is empty" do
      subject { Webflow::XscpBindings::XscpGenerator.new("").generate }

      it "generates an empty xscp document hash" do
        expect(subject).to include("type": "@webflow/XscpData")
        expect(subject).to include("nodes": [])
      end
    end

    context "when there is a form" do
      subject { Webflow::XscpBindings::XscpGenerator.new("<form></form>").generate }

      it "inserts a new node" do
        expect(subject).to include(nodes: [
          {
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
        ])
      end
    end

    context "when there is a div inside of a div" do
      it "adds two nodes"
      it "the second node is a child of the first node"
    end
  end
end
