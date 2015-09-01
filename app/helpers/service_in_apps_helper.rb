module ServiceInAppsHelper

  

  def service_ins
      @vm_installs=ServiceInApp.services.uniq.plunk(:id)
  end

  def add_vm_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :tasks, :partial => 'task', :object => Task.new
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).class.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
