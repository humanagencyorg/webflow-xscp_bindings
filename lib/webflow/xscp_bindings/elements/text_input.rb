require "webflow/xscp_bindings/elements/node"

# Example
#{
  #'_id': '8152039d-a800-b5cf-e367-f9a22ed8e953',
  #'tag': 'input',
  #'classes': [],
  #'children': [],
  #'type': 'FormTextInput',
  #'data': {
    #'form': {
      #'type': 'input',
      #'passwordPage': false,
    #},
    #'attr': {
      #'id': 'input-1',
      #'name': 'input-1',
      #'placeholder': '',
      #'type': 'text',
      #'os-form-datafield': '1',
      #'disabled': false,
      #'required': false,
    #},
  #},
#},


module Webflow
  module XscpBindings
    module Elements
      class TextInput < Node
        attr_accessor :id, :name, :placeholder, :disabled, :required

        def initialize(id:, name:, placeholder:,disabled: false, required: false, _id: nil, child_nodes: [], data_attributes: {})
          super(_id: _id, child_nodes: child_nodes, data_attributes: data_attributes)
          self.id = id
          self.name = name
          self.placeholder = placeholder
          self.disabled = disabled
          self.required = required
        end

        def tag
          "input"
        end

        def type
          "FormTextInput"
        end

        def data
          {
            form: {
              type: "input",
              passwordPage: false,
            },
            attr: {
              id: id,
              name: name,
              type: "text",
              disabled: disabled,
              required: required,
              placeholder: placeholder,
          }}
        end
      end
    end
  end
end
