module Webflow
  module XscpBindings
    class HtmlParser
      def initialize(html, binding)
        @html = html
        @binding = binding
      end

      def to_xscp
        "Hello, Steve Jobs!"
      end

      def to_html
        ERB.new(@html, trim_mode: "%<>").result(@binding)
      end
    end
  end
end
