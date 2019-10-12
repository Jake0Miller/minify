defmodule MinifyWeb.RedirectController do
  use MinifyWeb, :controller

  alias Minify.Domain

  action_fallback MinifyWeb.FallbackController

  def show(conn, %{"path" => path}) do
    url = Domain.get_by!(short: path)
    redirect(conn, external: url.long)
  end
end
