require "webflow/xscp_bindings/version"
require "webflow/xscp_bindings/html_parser"

module Webflow
  module XscpBindings
    class Error < StandardError; end

    def self.load(html, binding=nil)
      HtmlParser.new(html, binding)
    end

    def self.load_template(path, binding = nil)

    end
  end
end
