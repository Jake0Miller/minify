defmodule MinifyWeb.Router do
  use MinifyWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MinifyWeb do
    pipe_through :api
  end
end
