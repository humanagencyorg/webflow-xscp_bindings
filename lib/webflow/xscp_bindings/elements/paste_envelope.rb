module Webflow
  module XscpBindings
    module Elements
      class PasteEnvelope
        def initialize(nodes = [])
          @nodes = nodes
          @child_nodes = []
        end

        def add_node(node)
          @nodes << node
        end

        def add_child(node)
          @child_nodes << node
        end

        #def nodes
          #@nodes
        #end

        def child_nodes
          @child_nodes
        end

        def nodes
          definition
        end

        def definition
          hash = {
            "type": "@webflow/XscpData",
            "nodes": [*@child_nodes.map(&:to_h)]
          }
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

