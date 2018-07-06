defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn # usar o halt()
  import Phoenix.Controller # usar o put_flash e redirect

  alias Discuss.Router.Helpers # Alias pra utilizar helpers

  def init(_params) do
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in.")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end 
  end
end
