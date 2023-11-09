require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/style"

RSpec.describe Webflow::XscpBindings::Elements::Node do

  class ExampleNode < Webflow::XscpBindings::Elements::Node
    def initialize(_id: nil, child_nodes: [], classes: [], data_attributes: {})
      super(_id: _id, child_nodes: child_nodes, classes: classes, data_attributes: data_attributes)
    end

    def data
      {
        attr: {
          "data-foo": "bar",
          id: "abc123",
        }
      }
    end
  end

  before(:each) { allow(SecureRandom).to receive(:uuid).and_return("child", "grandchild", "great grandchild") }

  describe "#nodes" do
    context "when no children" do
      it "includes the definition of the node" do
        node = ExampleNode.new(_id: "parent", child_nodes: [])

        expect(node.nodes).to include(hash_including(_id: "parent"))
      end
    end

    context "when the node has child_nodes" do
      it "includes the definition of the child node" do
        child = ExampleNode.new(_id: "child", child_nodes: [])
        node = ExampleNode.new(_id: "parent", child_nodes: [child])

        expect(node.nodes).to include(hash_including(_id: "child"))
      end
    end

    context "when the node has grandchildren" do
      it "includes the definition of the grandchild node" do
        grandchild = ExampleNode.new(_id: "grandchild", child_nodes: [])
        child = ExampleNode.new(_id: "child", child_nodes: [grandchild])
        node = ExampleNode.new(_id: "parent", child_nodes: [child])

        expect(node.nodes).to include(hash_including(_id: "grandchild"))
      end
    end
  end

  describe "#to_h" do
    it "returns all of the nodes as a hash" do
      grandchild = ExampleNode.new(_id: "grandchild", child_nodes: [])
      child = ExampleNode.new(_id: "child", child_nodes: [grandchild])
      node = ExampleNode.new(_id: "parent", child_nodes: [child])

      expect(node.to_h).to include(hash_including(_id: "parent"))
      expect(node.to_h).to include(hash_including(_id: "child"))
      expect(node.to_h).to include(hash_including(_id: "grandchild"))
    end
  end

  describe "#tag" do
    it "delegates tag to the subclass" do
      
    end
  end

  describe "#definition" do

    it "includes the tag" do

    end
  end

  describe "#child_nodes" do
    let(:node1) { TestNode.new(_id: 1) }
    let(:node2) { TestNode.new(_id: 1) }
    subject { described_class.new(child_nodes: [node1, node2]) }

    it "have nodes nested as children" do
      expect(subject.children).to include(node1._id, node2._id)
    end
  end

  describe "#classes" do
    let(:class1) { Webflow::XscpBindings::Elements::Style.new(name: "hidden-1", styleLess: "display: non") }

    subject { described_class.new(classes: [class1]) }

    it "styles can be attached via the constructor" do
      expect(subject.classes).to include(class1)
    end

    it "has a classes attribute in the definition" do
      expect(subject.definition).to include(classes: [class1._id])
    end
  end

  describe "#styles" do
    let(:class1) { Webflow::XscpBindings::Elements::Style.new(name: "hidden-1", styleLess: "display: non") }
    let(:class2) { Webflow::XscpBindings::Elements::Style.new(name: "hidden-2", styleLess: "display: non") }
    let(:class3) { Webflow::XscpBindings::Elements::Style.new(name: "hidden-3", styleLess: "display: non") }

    subject { described_class.new(classes: [class1]) }

    it "returns the styles for the current node" do
      expect(subject.styles).to include(class1.definition)
    end

    it "returns styles for all child nodes" do
      child_node = described_class.new(classes: [class2])
      subject.child_nodes << child_node

      expect(subject.styles).to include(class1.definition, class2.definition)
    end

    it "returns styles for all grand child nodes" do
      grandchild_node = described_class.new(classes: [class3])
      child_node = described_class.new(child_nodes: [grandchild_node], classes: [class2])
      subject.child_nodes << child_node

      expect(subject.styles).to include(class1.definition, class2.definition, class3.definition)
    end
  end

  describe "#data_attributes" do
    let(:data_attributes) { { "data-test": "test" } }
    let(:test_attributes) { { "data-foo": "bar", id: "abc123" } }

    subject { ExampleNode.new(data_attributes: data_attributes) }

    it "is passed via the constructor" do
      expect(subject.data_attributes).to include(data_attributes)
    end

    it "is included in the data" do
      expect(subject.definition).to include(data: hash_including(attr: hash_including(data_attributes)))
    end

    it "does not overwrite any existing attributes in data" do
      expect(subject.definition).to include(data: hash_including(attr: hash_including(test_attributes)))
    end
  end
end
