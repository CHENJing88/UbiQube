require 'test_helper'

class VmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save vm without nom and description" do
    vm = Vm.new
    assert_not vm.save, "Saved the vm without a title and description"
  end

end
