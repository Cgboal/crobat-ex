defimpl Jason.Encoder, for: BSON.ObjectId do
  def encode(val, _opts \\ []) do
    val
    |> BSON.encode()
    |> Base.encode16(case: :lower)
  end
end
