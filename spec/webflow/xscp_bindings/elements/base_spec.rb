require "webflow/xscp_bindings/elements/base"

RSpec.describe Webflow::XscpBindings::Elements::Base do
  class ExampleBaseNode < Webflow::XscpBindings::Elements::Base
  end

  let(:test_uuid) { "8152039d-a800-b5cf-e367-f9a22ed8e94f" }
  before(:each) do
    allow(SecureRandom).to receive(:uuid).and_return(test_uuid)
  end

  describe "#_id" do
    it "is set randomly by default" do
      expect(ExampleBaseNode.new._id).to eq(test_uuid)
    end

    it "can be passed via the constructor" do
      diff_uuid = "abc123"
      expect(ExampleBaseNode.new(_id: diff_uuid)._id).to eq(diff_uuid)
    end
  end
end
