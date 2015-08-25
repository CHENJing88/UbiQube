require 'test_helper'

class VmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should save vm with a nom" do
    vm = Vm.create(nom: "example vm")
    assert vm.save, "Saved the vm with a title"
  end

end
