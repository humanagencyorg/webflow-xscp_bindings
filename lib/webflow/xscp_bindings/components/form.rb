require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/form_wrapper"
require "securerandom"

module Webflow
  module XscpBindings
    module Components
      class Form < Webflow::XscpBindings::Elements::Node

        def initialize(_id: nil, child_nodes: [])
          super(_id: _id, child_nodes: child_nodes)
          @form_wrapper = Webflow::XscpBindings::Elements::FormWrapper.new
          self.child_nodes << @form_wrapper
        end

        def data
          @form_wrapper.data
        end

        def tag
          @form_wrapper.tag
        end

        def type
          @form_wrapper.type
        end
      end
    end
  end
end
