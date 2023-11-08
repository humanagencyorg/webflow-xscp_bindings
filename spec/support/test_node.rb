require "webflow/xscp_bindings/elements/node"

class TestNode < Webflow::XscpBindings::Elements::Node

  def to_h
    { name: "Test Node" }
  end

  private
  def definition; end
  def get_children; end
end
