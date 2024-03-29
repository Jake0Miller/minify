defmodule MinifyWeb.UrlController do
  use MinifyWeb, :controller

  alias Minify.Domain
  alias Minify.Domain.Url

  action_fallback MinifyWeb.FallbackController

  def index(conn, _params) do
    urls = Domain.list_urls()
    render(conn, "index.json", urls: urls)
  end

  def create(conn, %{"url" => url_params}) do
    with {:ok, %Url{} = url} <- Domain.create_url(url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.url_path(conn, :show, url))
      |> render("show.json", url: url)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Domain.get_url!(id)
    render(conn, "show.json", url: url)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = Domain.get_url!(id)

    with {:ok, %Url{} = url} <- Domain.update_url(url, url_params) do
      render(conn, "show.json", url: url)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = Domain.get_url!(id)

    with {:ok, %Url{}} <- Domain.delete_url(url) do
      send_resp(conn, :no_content, "")
    end
  end
end
