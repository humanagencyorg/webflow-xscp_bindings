require "webflow/xscp_bindings/elements/node"
require "webflow/xscp_bindings/elements/form_wrapper"
require "securerandom"

module Webflow
  module XscpBindings
    module Components
      class Form < Webflow::XscpBindings::Elements::Node

        def initialize
          super
          @form_wrapper = Webflow::XscpBindings::Elements::FormWrapper.new
        end

        def data
          @form_wrapper.data
        end

        def tag
          @form_wrapper.tag
        end

        def type
          "FormWrapper"
        end

        def children
          @form_wrapper.children
        end
      end
    end
  end
end
