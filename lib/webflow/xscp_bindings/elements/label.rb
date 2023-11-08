#{
  #'_id': '8152039d-a800-b5cf-e367-f9a22ed8e951',
  #'tag': 'label',
  #'classes': [],
  #'children': [
    #'8152039d-a800-b5cf-e367-f9a22ed8e952',
  #],
  #'type': 'FormBlockLabel',
  #'data': {
    #'attr': {
      #'id': '',
      #'for': 'input-1',
    #},
    #'form': {
      #'type': 'label',
    #},
  #},
#},

require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/text"

module Webflow
  module XscpBindings
    module Elements
      class Label < Node
        attr_accessor :attr_for
        attr_accessor :text

        def initialize(_id: nil, attr_for:, text:)
          super(_id: _id)
          self.attr_for = attr_for
          self.text = text
        end

        def tag
          "label"
        end

        def type; end

        def data
          {
            form: { type: "label" },
            attr: {
              id: "",
              for: "input-1",
            },
          }
        end

        def child_nodes
          [
            Webflow::XscpBindings::Elements::Text.new(text)
          ]
        end
      end
    end
  end
end
