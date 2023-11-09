RSpec.shared_examples "xscp node" do |node|
  it { should be_a Webflow::XscpBindings::Elements::Node }

  include_examples "xscp base"

  describe "#child_nodes" do
    it "contains an array of child_nodes" do
      expect(subject.child_nodes).not_to be_nil
      expect(subject.child_nodes).to be_a Array
    end
  end

  describe "#classes" do
    it "contains an array of classes" do
      expect(subject.classes).not_to be_nil
      expect(subject.classes).to be_a Array
    end
  end

  describe "#children" do
    it "is a list of every child node _id" do
      expect(subject.children).to eq(subject.child_nodes.map(&:_id))
    end
  end

  describe "#definition" do
    it "contains a random _id" do
      expect(subject.definition[:_id]).to eq(test_uuid)
    end

    it "contains a tag" do
      expect(subject.definition[:tag]).not_to be_nil
      expect(subject.definition).to include(tag: subject.tag)
    end

    it "contains an array of children" do
      expect(subject.definition[:children]).not_to be_nil
      expect(subject.definition[:children]).to be_a Array
    end

    it "contains a type" do
      expect(subject.definition[:type]).not_to be_nil
      expect(subject.definition).to include(type: subject.type)
    end

    it "contains a data" do
      expect(subject.definition[:data]).not_to be_nil
      expect(subject.definition[:data]).to be_a Hash
    end

    it "contains data attributes "do
      expect(subject.definition[:data]).to include(attr: hash_including(subject.data[:attr]))
      expect(subject.definition[:data]).to include(attr: hash_including(subject.data_attributes))
    end
  end
end
