module Webflow
  module XscpBindings
    class XscpGenerator
      def initialize(html)
        @html = html
      end

      def generate
        hash = {
          "type": "@webflow/XscpData",
          "nodes": []
        }
        if @html.include?("<form>")
          hash[:nodes] = [{
            '_id': '8152039d-a800-b5cf-e367-f9a22ed8e94f',
            'tag': 'div',
            'classes': [],
            'children': [
              '8152039d-a800-b5cf-e367-f9a22ed8e950',
              'a800-b5cf-e367-f9a22ed8e950',
              'a900-b5cf-e367-f9a22ed8e950',
              '8152039d-a800-b5cf-e367-f9a22ed8e96b',
              '8152039d-a800-b5cf-e367-f9a22ed8e96e',
            ],
            'type': 'FormWrapper',
            'data': {
              'form': {
                'type': 'wrapper',
              },
              'attr': {
                'id': '',
              },
            },
          }]
        end
        hash
      end
    end
  end
end
