json.array!(@vms) do |vm|
  json.extract! vm, :id
  json.url vm_url(vm, format: :json)
end
