module Webflow
  module XscpBindings
    module Elements
      class PasteEnvelope
        def initialize(nodes = [])
          @nodes = nodes
        end

        def add_node(node)
          @nodes << node
        end

        def to_h
          hash = {
            "type": "@webflow/XscpData",
            "nodes": [*@nodes.map(&:to_h)]
          }
        end
      end
    end
  end
end

