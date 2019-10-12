defmodule Minify.DomainTest do
  use Minify.DataCase

  alias Minify.Domain

  describe "urls" do
    alias Minify.Domain.Url

    @valid_attrs %{long: "https://www.turing.io", short: "https://www.minify.com/abc123"}
    @update_attrs %{long: "https://www.google.com", short: "https://www.minify.com/def456"}
    @invalid_attrs %{long: nil, short: nil}

    def url_fixture(attrs \\ %{}) do
      {:ok, url} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Domain.create_url()

      url
    end

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Domain.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Domain.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      assert {:ok, %Url{} = url} = Domain.create_url(@valid_attrs)
      assert url.long == @valid_attrs.long
      assert url.short == @valid_attrs.short
    end

    test "create_url with repeat data fails" do
      assert {:ok, %Url{} = url_1} = Domain.create_url(@valid_attrs)
      assert {:error, _} = Domain.create_url(@valid_attrs)
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Domain.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      assert {:ok, %Url{} = url} = Domain.update_url(url, @update_attrs)
      assert url.long == @update_attrs.long
      assert url.short == @update_attrs.short
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Domain.update_url(url, @invalid_attrs)
      assert url == Domain.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Domain.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Domain.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Domain.change_url(url)
    end
  end
end
