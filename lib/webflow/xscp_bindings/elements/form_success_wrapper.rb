require "webflow/xscp_bindings/elements/div"

module Webflow
  module XscpBindings
    module Elements
      class FormSuccessWrapper < Div

        def initialize(_id: nil, child_nodes: [], data_attributes: {})
          super(_id: _id, child_nodes: child_nodes, data_attributes: data_attributes)
        end

        def type
          "FormSuccessMessage"
        end

        def data
          {
            form: {
              type: "msg-done"
            },
            attr: {
              id: "",
              **data_attributes
            }
          }
        end
      end
    end
  end
end
