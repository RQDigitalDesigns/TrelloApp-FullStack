defmodule PhoenixTrello.UserBoard do
  use PhoenixTrello.Web, :model

  schema "user_boards" do
    belongs_to :user, User
    belongs_to :board, Board

    timestamps()
  end


  @required_fiels ~w(user_id board_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:user_id, name: :user_boards_user_id_board_id_index)
  end
end
