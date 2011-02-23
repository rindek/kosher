Fabricator(:kosher_condition, :class_name => 'kosher/condition') do
  in_words "new"
end

Fabricator(:unkosher_condition, :class_name => 'kosher/condition') do
  in_words "acceptable"
end
