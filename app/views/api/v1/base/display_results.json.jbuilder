json.array! @surveys do |survey|
  json.extract! survey, :id, :title, :first_proposition, :second_proposition, :room_id
end
