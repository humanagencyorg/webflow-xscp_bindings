RSpec.describe Webflow::XscpBindings::HtmlParser do

  describe "#to_html" do

    context "when plain html" do
      let(:plain_html) { "<h1>Hello</h1>" }
      subject { described_class.new(plain_html, binding) }

      it "returns html unchanged" do
        expect(subject.to_html).to eq(plain_html)
      end
    end

    context "when ERB" do
      let(:erb) { %q{<h1><%= name %></h1>}.gsub(/^  /, '') }

      it "evaluates all variables in the current context" do
        name = "Steve Jobs"

        expect(described_class.new(erb, binding).to_html).to eq("<h1>Steve Jobs</h1>")
      end
    end
  end
end
