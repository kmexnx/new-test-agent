defmodule SvgServer.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    svg = generate_random_svg()
    send_resp(conn, 200, svg)
  end

  defp generate_random_svg do
    width = :rand.uniform(300) + 100
    height = :rand.uniform(300) + 100
    circle_x = :rand.uniform(width)
    circle_y = :rand.uniform(height)
    radius = :rand.uniform(50) + 10
    color = random_color()

    """
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <svg width="#{width}" height="#{height}" xmlns="http://www.w3.org/2000/svg">
      <circle cx="#{circle_x}" cy="#{circle_y}" r="#{radius}" fill="#{color}" />
    </svg>
    """
  end

  defp random_color do
    r = :rand.uniform(255)
    g = :rand.uniform(255)
    b = :rand.uniform(255)
    "rgb(#{r},#{g},#{b})"
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end