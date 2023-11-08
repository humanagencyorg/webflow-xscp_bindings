require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/style"

RSpec.describe Webflow::XscpBindings::Elements::Node do

  class ExampleNode < Webflow::XscpBindings::Elements::Node
    def initialize(definition, child_nodes: [], classes: [])
      super(child_nodes: child_nodes, classes: classes)
      @definition = definition
    end

    def definition
      @definition
    end

    def child_nodes
      @child_nodes
    end
  end

  let(:child_definition) { { "name": "child" } }
  let(:grandchild_definition) { { "name": "grandchild" } }
  let(:great_grandchild_definition) { { "name": "great grandchild" } }
  let(:child) { ExampleNode.new(child_definition, child_nodes: [grandchild]) }
  let(:grandchild) { ExampleNode.new(grandchild_definition, child_nodes: [great_grandchild]) }
  let(:great_grandchild) { ExampleNode.new(great_grandchild_definition, child_nodes: []) }

  describe "#nodes" do
    context "when no children" do
      it "includes the definition of the node" do
        node = ExampleNode.new(child_definition, child_nodes: [])

        expect(node.nodes).to include(child_definition)
      end
    end

    context "when the node has child_nodes" do
      it "includes the definition of the child node" do
        expect(grandchild.nodes).to include(great_grandchild.definition)
      end
    end

    context "when the node has grandchildren" do
      it "includes the definition of the grandchild node" do
        expect(child.nodes).to include(grandchild.definition)
        expect(child.nodes).to include(great_grandchild.definition)
      end
    end
  end

  describe "#to_h" do
    it "returns all of the nodes as a hash" do
      expect(child.to_h).to include(child_definition)
      expect(child.to_h).to include(grandchild_definition)
      expect(child.to_h).to include(great_grandchild_definition)
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
end
