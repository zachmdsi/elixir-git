defmodule Git.Utils do
  @moduledoc """
  Utility functions used across multiple files.
  """

  @doc """
  Compute the SHA-1 hash of the given data.
  """
  def compute_sha1(data) do
    :crypto.hash(:sha, data)
    |> Base.encode16(case: :lower)
  end
end
