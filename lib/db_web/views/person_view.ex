defmodule DbWeb.PersonView do
  use DbWeb, :view
  alias DbWeb.PersonView

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      auth0_me_id: person.auth0_me_id,
      auth_token: person.auth_token,
      bio: person.bio,
      birthday: person.birthday,
      email: person.email,
      email_verified: person.email_verified,
      id_token: person.id_token,
      name: person.name,
      name_full: person.name_full,
      target_gender: person.target_gender,
      target_relationship: person.target_relationship,
      token: person.token}
  end
end
