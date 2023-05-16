defmodule Git.Add do
  @moduledoc """
  The Add module is responsible for adding files to the staging area.
  """

  def execute(directory, file_path) do
    # Read the file
    case File.read(file_path) do
      {:ok, contents} ->
        # Compute the hash and store the blob
        hash = Git.Utils.compute_sha1(contents)
        store_blob(directory, contents, hash)

      {:error, reason} ->
        IO.puts "Error reading file: #{reason}"
    end
  end

  defp store_blob(directory, contents, hash) do
    path = Path.join([directory, ".git", "objects", hash])
    File.mkdir_p(Path.dirname(path)) # Ensure the directory exists
    File.write(path, contents)
  end
end
