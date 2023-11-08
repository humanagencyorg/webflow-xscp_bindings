# Example Form
  ## {
    #'_id': '8152039d-a800-b5cf-e367-f9a22ed8e950',
    #'tag': 'form',
    #'classes': [],
    #'children': [
      #'8152039d-a800-b5cf-e367-f9a22ed8e951',
      #'8152039d-a800-b5cf-e367-f9a22ed8e953',
      #'8152039d-a800-b5cf-e367-f9a22ed8e958',
      #'8152039d-a800-b5cf-e367-f9a22ed8e957',
      #'8152039d-a800-b5cf-e367-f9a22ed8e96a',
    #],
    #'type': 'FormForm',
    #'data': {
      #'Source': {
        #'tag': 'Default form',
        #'val': {},
      #},
      #'form': {
        #'type': 'form',
        #'name': '',
      #},
      #'attr': {
        #'redirect': '',
        #'data-redirect': '',
        #'action':
        #'https://avala-3452.formliapp.com/api/v1/data_responses',
        #'method': 'post',
        #'os-form': 'true',
        #'os-form-block': 'aor2jq5j3z',
      #},
    #},
  #},
###############

require "webflow/xscp_bindings/elements/node"

module Webflow
  module XscpBindings
    module Elements
      class Form < Node
        ATTRIBUTES = [:redirect, :data_redirect, :action, :method, :data_attributes]

        attr_accessor *ATTRIBUTES

        def initialize(_id: nil, child_nodes: [], classes: [], attributes: {})
          super(_id: _id, child_nodes: child_nodes, classes: classes)
          attributes.each do |name, value|
            public_send("#{name}=", value) if ATTRIBUTES.include?(name.to_sym)
          end
          self.data_attributes ||= {}
        end

        def tag
          "form"
        end

        def type
          "FormForm"
        end

        def data
          {
            Source: {
              tag: "Default form",
              val: {},
            },
            form: {
              type: "form",
              name: {},
            },
            attr: {
              redirect: redirect,
              "data-redirect": data_redirect,
              action: action,
              method: method,
              **data_attributes
            }
          }
        end
      end
    end
  end
end
