defmodule Minify.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :long, :string
      add :short, :string

      timestamps()
    end

    create unique_index(:urls, [:short])
  end
end
