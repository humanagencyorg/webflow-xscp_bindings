require "webflow/xscp_bindings/elements/div"

#{
  #'_id': 'form_error_message_wrapper',
  #'tag': 'div',
  #'classes': [],
  #'children': [
    #'form_error_message_element',
  #],
  #'type': 'FormErrorMessage',
  #'data': {
    #'form': {
      #'type': 'msg-fail',
    #},
    #'attr': {
      #'id': '',
    #},
  #},
#},

module Webflow
  module XscpBindings
    module Elements
      class FormErrorWrapper < Div

        def initialize(_id: nil, child_nodes: [], data_attributes: {})
          super(_id: _id, child_nodes: child_nodes, data_attributes: data_attributes)
        end

        def type
          "FormErrorMessage"
        end

        def data
          {
            form: {
              type: "msg-fail"
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
