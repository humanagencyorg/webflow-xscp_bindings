#{
  #'_id': '8152039d-a800-b5cf-e367-f9a22ed8e96z',
  #'tag': 'input',
  #'classes': [],
  #'children': [],
  #'type': 'FormButton',
  #'data': {
    #'attr': {
      #'id': '',
      #'type': 'submit',
      #'value': 'Submit',
      #'data-wait': 'Please wait...',
    #},
    #'form': {
      #'type': 'button',
      #'wait': 'Please wait...',
    #},
  #},
#}

module Webflow
  module XscpBindings
    module Elements
      class Submit < Node

        attr_accessor :value, :wait

        def initialize(value:, wait:, _id: nil)
          super(_id: _id)
          self.value = value
          self.wait = wait
        end

        def tag
          "input"
        end

        def type
          "FormButton"
        end

        def data
          {
            form: {
              type: "button",
              wait: wait,
            },
            attr: {
              id: "",
              type: "submit",
              value: value,
              "data-wait": wait,
            }
          }
        end
      end
    end
  end
end
