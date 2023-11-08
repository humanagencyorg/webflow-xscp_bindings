require 'securerandom'
require "webflow/xscp_bindings/elements/base"

module Webflow
  module XscpBindings
    module Elements
      class Node < Base
        attr_accessor :child_nodes
        attr_accessor :classes

        def initialize(_id: nil, child_nodes: [], classes: [])
          super(_id: _id)
          self.child_nodes = child_nodes
          self.classes = classes
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
          children << child
          definition[:children] ||= []
          definition[:children] << child.definition[:name]
        end

        def to_h
          nodes.map(&:to_h)
        end

        def tag; end
        def type; end
        def data; end

        def definition
          {
            _id: SecureRandom.uuid,
            tag: self.tag,
            type: self.type,
            classes: self.classes.map(&:_id),
            children: self.children,
            data: data,
          }
        end
      end
    end
  end
end
