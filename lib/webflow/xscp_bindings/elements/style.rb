#{
  #'_id': 'hidden_class_12345',
  #'fake': false,
  #'type': 'class',
  #'name': 'hidden',
  #'styleLess': 'display: none;',
  #'children': [],
  #'selector': null,
#},

require "webflow/xscp_bindings/elements/base"

module Webflow
  module XscpBindings
    module Elements
      class Style < Base
        attr_accessor :name, :styleLess

        def initialize(name:, styleLess:, _id: nil)
          super(_id: _id)
          self.name = name
          self.styleLess = styleLess
        end

        def definition
          {
            _id: self._id,
            fake: false,
            type: "class",
            name: self.name,
            styleLess: self.styleLess,
            children: [],
            selector: nil,
          }
        end
      end
    end
  end
end
