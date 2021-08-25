defmodule CrobatWeb.SubdomainView do
  use CrobatWeb, :view

  def render("index.json", %{subdomains: subdomains}) do
    subdomains
  end
end
