require "webflow/xscp_bindings/elements/div"
require "webflow/xscp_bindings/elements/form_success_wrapper"

module Webflow
  module XscpBindings
    module Elements
      class FormWrapper < Div
        def initialize(_id: nil, classes: [])
          super(_id: _id, classes: classes)
          @type = "FormWrapper"
          self.child_nodes << Webflow::XscpBindings::Elements::FormSuccessWrapper.new
        end

        def data
          {
            attr: {
              id: ""
            },
            form: {
              type: "wrapper"
            }
          }
        end
      end
    end
  end
end
