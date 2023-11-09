module Webflow
  module XscpBindings
    module Elements
      class Div < Webflow::XscpBindings::Elements::Node
        def initialize(type: nil, _id: nil, child_nodes: [], classes: [], data_attributes: {})
          super(_id: _id, child_nodes: child_nodes, classes: classes, data_attributes: data_attributes)
          @type = type
        end

        def tag
          "div"
        end

        def type
          @type
        end

        def data
          {
            attr: {
              id: ''
            }
          }
        end
      end
    end
  end
end
