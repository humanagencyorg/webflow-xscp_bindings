require "nokogiri"
require "webflow/xscp_bindings/elements/paste_envelope"
require "webflow/xscp_bindings/elements/form_wrapper"
require "webflow/xscp_bindings/elements/form_success_wrapper"
require "webflow/xscp_bindings/components/form"

module Webflow
  module XscpBindings
    class XscpGenerator
      def initialize(html)
        @html = html
      end

      def generate
        if @html.include?("<form>")
        elsif @html.include?("<div>")
          html = Nokogiri::HTML.fragment(@html)

          parent_node = traverse_divs(html, nil, 0)
          {
            "type": "@webflow/XscpData",
            "nodes": [*parent_node.child_nodes.first.nodes]
          }
        else
          Webflow::XscpBindings::Elements::PasteEnvelope.new.to_h
        end
      end

      private

      def traverse_divs(html, parent_node, item)
        if parent_node.nil?

          parent_node = Webflow::XscpBindings::Elements::PasteEnvelope.new
          html.children.each do |child|
            traverse_divs(child, parent_node, item + 1)
          end
        else
          div2 = Webflow::XscpBindings::Elements::Div.new
          parent_node.add_child(div2)

          html.children.each do |child|
            traverse_divs(child, div2, item + 1)
          end
        end

        parent_node
      end

      def traverse(html, parent_node)
        parent_node.nodes
      end
    end
  end
end
