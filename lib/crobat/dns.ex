defmodule Crobat.DNS do

  def find_subdomains(query) do
    {:ok, %{domain: domain, tld: tld}} = Domainatrex.parse(query)

    Mongo.find(:mongo, "A", %{domain: domain, tld: tld}, [{:limit, 10000}])
    |> Enum.to_list()
    |> Enum.map(&domain_from_document/1)
  end

  def domain_from_document(%{"subdomain" => subdomain, "domain" => domain, "tld" => tld}) do
    "#{subdomain}.#{domain}.#{tld}"
  end
end
