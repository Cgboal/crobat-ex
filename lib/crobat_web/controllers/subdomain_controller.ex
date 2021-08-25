defmodule CrobatWeb.SubdomainController do
  use CrobatWeb, :controller

  def index(conn, %{"domain" => domain}) do
    subdomains = Crobat.DNS.find_subdomains(domain)
    render(conn, "index.json", subdomains: subdomains)
  end
end
