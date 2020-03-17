defmodule App.Deck.Card do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cards" do
    field :action_1_id, :integer
    field :action_2_id, :integer
    field :action_3_id, :integer
    field :action_4_id, :integer
    field :attack, :integer
    field :attribution_1_id, :integer
    field :attribution_2_id, :integer
    field :defence, :integer
    field :magic, :integer
    field :max_hp, :integer
    field :name, :string
    field :resist, :integer
    field :speed, :integer

    timestamps()
  end

  @doc false
  def changeset(card, attrs) do
    card
    |> cast(attrs, [:name, :max_hp, :attack, :defence, :speed, :magic, :resist, :attribution_1_id, :attribution_2_id, :action_1_id, :action_2_id, :action_3_id, :action_4_id])
    |> validate_required([:name, :max_hp, :attack, :defence, :speed, :magic, :resist, :attribution_1_id, :attribution_2_id, :action_1_id, :action_2_id, :action_3_id, :action_4_id])
  end
end
