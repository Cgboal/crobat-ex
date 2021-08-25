defmodule CrobatWeb.Router do
  use CrobatWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CrobatWeb do
    pipe_through :api
  end

  scope "/", CrobatWeb do
    get "/subdomains/:domain", SubdomainController, :index
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      live_dashboard "/dashboard", metrics: CrobatWeb.Telemetry
    end
  end
end
