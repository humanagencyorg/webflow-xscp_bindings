require "webflow/xscp_bindings/xscp_generator"
require "webflow/xscp_bindings/elements/form_wrapper"

RSpec.describe Webflow::XscpBindings::XscpGenerator do

  describe "generate" do

    context "when html is empty" do
      subject { Webflow::XscpBindings::XscpGenerator.new("").generate }

      it "generates an empty xscp document hash" do
        expect(subject).to include("type": "@webflow/XscpData")
        expect(subject).to include("nodes": [])
      end
    end

    context "when there is a div inside of a div inside of a div" do
      before(:each) { allow(SecureRandom).to receive(:uuid).and_return("div_wrapper_1", "div_wrapper_2", "div_wrapper_3") }

      subject { Webflow::XscpBindings::XscpGenerator.new("<div><div><div></div></div></div>").generate }

      it "inserts one node for each element" do
        expect(subject[:nodes].size).to eq(3)
      end

      it "inserts the parent div node into the xscp document" do
        expect(subject).to include(nodes: array_including(hash_including(
            "_id": "div_wrapper_1",
            "tag": "div",
            "classes": [],
            "children": [
              "div_wrapper_2",
            ],
            "data": {
              "attr": {
                "id": "",
              },
            },
        )))
      end

      it "inserts a child div node into the xscp document" do
        expect(subject).to include(nodes: array_including(hash_including(
            "_id": "div_wrapper_2",
            "tag": "div",
            "classes": [],
            "children": [
              "div_wrapper_3",
            ],
        )))
      end

      it "inserts a grandchild div node into the xscp document" do
        expect(subject).to include(nodes: array_including(hash_including(
            "_id": "div_wrapper_3",
            "tag": "div",
            "classes": [],
            "children": [],
        )))
      end
    end

    context "when there are sibling divs" do
      before(:each) { allow(SecureRandom).to receive(:uuid).and_return("div_wrapper_1", "div_wrapper_2", "div_wrapper_3") }

      subject { Webflow::XscpBindings::XscpGenerator.new("<div><div></div><div></div></div>").generate }

      it "the parent div has two children" do
        expect(subject).to include(nodes: array_including(hash_including(
          children: [
            "div_wrapper_2",
            "div_wrapper_3",
          ]
        )))
      end
    end

    context "when there is a form element" do

    end
  end
end
