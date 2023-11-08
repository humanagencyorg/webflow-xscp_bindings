require "webflow/xscp_bindings/elements/div"

module Webflow
  module XscpBindings
    module Elements
      class FormWrapper < Div
        def initialize(_id: nil, child_nodes: [], classes: [])
          super(_id: _id, child_nodes: child_nodes, classes: classes)
          @type = "FormWrapper"
        end

        def children
          []
        end
      end
    end
  end
end
