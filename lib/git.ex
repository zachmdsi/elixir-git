defmodule Git do
  @moduledoc """
  The Git module is the main entry point for the application.
  """

  def init(directory) do
    MyGit.Init.execute(directory)
  end
end
