When /^(?:|I )fill in "([^\"]*)" with "([^\"]*)"(?: within "([^\"]*)")? if present$/ do |field, value, selector|
  with_scope(selector) do
    fill_in(field, :with => value) if find_field(field)
  end
end
