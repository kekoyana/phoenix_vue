defmodule App.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :name, :string, comment: "名前"
      add :max_hp, :integer, comment: "MAXHP"
      add :attack, :integer, comment: "攻撃"
      add :defence, :integer, comment: "防御"
      add :speed, :integer, comment: "速さ"
      add :magic, :integer, comment: "魔力"
      add :resist, :integer, comment: "魔法防御"
      add :attribution_1_id, :integer, comment: "メイン属性"
      add :attribution_2_id, :integer, comment: "サブ属性"
      add :action_1_id, :integer, comment: "使える行動"
      add :action_2_id, :integer, comment: "使える行動"
      add :action_3_id, :integer, comment: "使える行動"
      add :action_4_id, :integer, comment: "使える行動"

      timestamps()
    end

  end
end
