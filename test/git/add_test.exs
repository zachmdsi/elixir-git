defmodule Git.AddTest do
  use ExUnit.Case

  @test_dir "git_add_test"
  @file_name "test.txt"
  @file_contents "Test contents"

  setup do
    # Set up a temporary directory
    directory = System.tmp_dir()
    |> Path.join(@test_dir)
    File.mkdir_p!(directory)

    # Initialize a git repo there
    Git.Init.execute(directory)

    # Prepare a test file
    test_file = Path.join(directory, @file_name)
    File.write!(test_file, @file_contents)

    on_exit(fn ->
      File.rm_rf!(directory)
    end)

    # Pass the directory and file path to the test cases
    {:ok, directory: directory, test_file: test_file}
  end

  test "executes successfully and creates a blob", %{directory: directory, test_file: test_file} do
    Git.Add.execute(directory, test_file)

    # Check that the blob was created
    hash = Git.Utils.compute_sha1(@file_contents)
    blob_path = Path.join([directory, ".git", "objects", hash])
    assert File.exists?(blob_path)
  end
end
