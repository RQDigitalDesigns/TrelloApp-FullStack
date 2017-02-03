defmodule PhoenixTrello.UsersTest do
  use PhoenixTrello.ModelCase

  alias PhoenixTrello.Users

  @valid_attrs %{email: "some content", encrypted_password: "some content", first_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Users.changeset(%Users{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Users.changeset(%Users{}, @invalid_attrs)
    refute changeset.valid?
  end
end
