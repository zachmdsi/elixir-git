defmodule Git.InitTest do
  use ExUnit.Case

  @git_dir ".git"
  @dirs ["objects", "refs/heads", "refs/tags"]
  @test_dir "test_git"

  setup do
    # Create a temporary directory for testing
    File.mkdir_p!(@test_dir)
    on_exit(fn ->
      # Clean up the directory after the test
      File.rm_rf!(@test_dir)
    end)
    {:ok, directory: @test_dir}
  end

  test "creates a .git directory and its subdirectories", context do
    directory = context[:directory]
    Git.Init.execute(directory)

    assert File.dir?(Path.join(directory, @git_dir))

    for dir <- @dirs do
      assert File.dir?(Path.join([directory, @git_dir, dir]))
    end
  end
end
