#{
  #'_id': '8152039d-a800-b5cf-e367-f9a22ed8e952',
  #'text': true,
  #'v': 'Full Name',
#},

require "webflow/xscp_bindings/elements/node"

module Webflow
  module XscpBindings
    module Elements
      class Text < Node
        attr_accessor :label_text

        def initialize(label_text)
          self.label_text = label_text
        end

        def definition
          {
            "_id": SecureRandom.uuid,
            "text": true,
            "v": self.label_text,
          }
        end
      end
    end
  end
end
