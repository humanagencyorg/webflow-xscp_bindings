require 'securerandom'
require "webflow/xscp_bindings/elements/base"

module Webflow
  module XscpBindings
    module Elements
      class Node < Base
        attr_accessor :child_nodes
        attr_accessor :classes
        attr_accessor :data_attributes

        def initialize(_id: nil, child_nodes: [], classes: [], data_attributes: {})
          super(_id: _id)
          self.child_nodes = child_nodes
          self.classes = classes
          self.data_attributes = data_attributes
        end

        def nodes
          [definition] + child_nodes.map(&:nodes).flatten
        end

        def styles
          classes.map(&:definition) + child_nodes.map(&:styles).flatten
        end

        def children
          child_nodes.map(&:_id)
        end

        def add_child(child)
          child_nodes << child
        end

        def to_h
          nodes.map(&:to_h)
        end

        def tag; end

        def type; end

        def data
          {
            attr: {}
          }
        end

        def definition
          merged = data
          merged[:attr] = merged[:attr].merge(data_attributes)
          {
            _id: self._id,
            tag: self.tag,
            type: self.type,
            classes: self.classes.map(&:_id),
            children: self.children,
            data: merged,
          }
        end
      end
    end
  end
end
