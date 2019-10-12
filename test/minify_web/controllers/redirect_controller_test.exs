defmodule MinifyWeb.RedirectControllerTest do
  use MinifyWeb.ConnCase

  alias Minify.Domain

  @attrs %{
    long: "some long",
    short: "some short"
  }

  def fixture(:url) do
    {:ok, url} = Domain.create_url(@attrs)
    url
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "show" do
    setup [:create_url]

    test "redirects", %{conn: conn} do
      conn = get(conn, Routes.redirect_path(conn, :show, @attrs[:short]))
      assert redirected_to(conn) == @attrs[:long]
    end
  end

  defp create_url(_) do
    url = fixture(:url)
    {:ok, url: url}
  end
end
