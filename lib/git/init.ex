defmodule Git.Init do
  @moduledoc """
  The Init module is responsible for initializing a new Git repository.
  """

  def execute(directory) do
    create_git_directory(directory)
  end

  defp create_git_directory(directory) do
    # Make the .git directory
    :ok = File.mkdir(Path.join(directory, ".git"))

    # Make the necessary subdirectories
    ["objects", "refs/heads", "refs/tags"]
    |> Enum.map(&Path.join([directory, ".git", &1]))
    |> Enum.each(&File.mkdir_p/1)
  end
end
