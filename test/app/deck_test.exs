defmodule App.DeckTest do
  use App.DataCase

  alias App.Deck

  describe "cards" do
    alias App.Deck.Card

    @valid_attrs %{action_1_id: 42, action_2_id: 42, action_3_id: 42, action_4_id: 42, attack: 42, attribution_1_id: 42, attribution_2_id: 42, defence: 42, magic: 42, max_hp: 42, name: "some name", resist: 42, speed: 42}
    @update_attrs %{action_1_id: 43, action_2_id: 43, action_3_id: 43, action_4_id: 43, attack: 43, attribution_1_id: 43, attribution_2_id: 43, defence: 43, magic: 43, max_hp: 43, name: "some updated name", resist: 43, speed: 43}
    @invalid_attrs %{action_1_id: nil, action_2_id: nil, action_3_id: nil, action_4_id: nil, attack: nil, attribution_1_id: nil, attribution_2_id: nil, defence: nil, magic: nil, max_hp: nil, name: nil, resist: nil, speed: nil}

    def card_fixture(attrs \\ %{}) do
      {:ok, card} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Deck.create_card()

      card
    end

    test "list_cards/0 returns all cards" do
      card = card_fixture()
      assert Deck.list_cards() == [card]
    end

    test "get_card!/1 returns the card with given id" do
      card = card_fixture()
      assert Deck.get_card!(card.id) == card
    end

    test "create_card/1 with valid data creates a card" do
      assert {:ok, %Card{} = card} = Deck.create_card(@valid_attrs)
      assert card.action_1_id == 42
      assert card.action_2_id == 42
      assert card.action_3_id == 42
      assert card.action_4_id == 42
      assert card.attack == 42
      assert card.attribution_1_id == 42
      assert card.attribution_2_id == 42
      assert card.defence == 42
      assert card.magic == 42
      assert card.max_hp == 42
      assert card.name == "some name"
      assert card.resist == 42
      assert card.speed == 42
    end

    test "create_card/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Deck.create_card(@invalid_attrs)
    end

    test "update_card/2 with valid data updates the card" do
      card = card_fixture()
      assert {:ok, %Card{} = card} = Deck.update_card(card, @update_attrs)
      assert card.action_1_id == 43
      assert card.action_2_id == 43
      assert card.action_3_id == 43
      assert card.action_4_id == 43
      assert card.attack == 43
      assert card.attribution_1_id == 43
      assert card.attribution_2_id == 43
      assert card.defence == 43
      assert card.magic == 43
      assert card.max_hp == 43
      assert card.name == "some updated name"
      assert card.resist == 43
      assert card.speed == 43
    end

    test "update_card/2 with invalid data returns error changeset" do
      card = card_fixture()
      assert {:error, %Ecto.Changeset{}} = Deck.update_card(card, @invalid_attrs)
      assert card == Deck.get_card!(card.id)
    end

    test "delete_card/1 deletes the card" do
      card = card_fixture()
      assert {:ok, %Card{}} = Deck.delete_card(card)
      assert_raise Ecto.NoResultsError, fn -> Deck.get_card!(card.id) end
    end

    test "change_card/1 returns a card changeset" do
      card = card_fixture()
      assert %Ecto.Changeset{} = Deck.change_card(card)
    end
  end
end
