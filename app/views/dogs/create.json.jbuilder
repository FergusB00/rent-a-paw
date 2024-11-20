if @dog.persisted?
  json.form render(partial: "form", formats: :html, locals: {dog: Dog.new})
  json.inserted_item render(partial: "dog", formats: :html, locals: {dog: @dog})
else
  json.form render(partial: "form", formats: :html, locals: {dog: @dog})
end
