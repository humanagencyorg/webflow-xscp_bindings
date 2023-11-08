require 'securerandom'

module Webflow
  module XscpBindings
    module Elements
      class Base
        attr_accessor :_id

        def initialize(_id: nil)
          self._id ||= SecureRandom.uuid
        end
      end
    end
  end
end

