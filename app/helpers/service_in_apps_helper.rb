module ServiceInAppsHelper
  def add_vm_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :tasks, :partial => 'task', :object => Task.new
    end
  end
end
