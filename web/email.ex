defmodule IpapyWeb.Email do
  use Bamboo.Phoenix, view: IpapyWeb.EmailView

  def send_new_password_temporary_text(email) do
    new_email
    |> to(email)
    |> from("us@example.com")
    |> subject("Welcome!")
    |> text_body("New password")
    |> put_text_layout({IpapyWeb.LayoutView, "email.text"})
    |> render("send_password_temporary.text")
  end

  def send_new_password_temporary_html(email, password) do
    email
    |> send_new_password_temporary_text()
    |> html_body("New password")
    #|> put_html_layout({IpapyWeb.LayoutView, "email.html"})
    |> render("send_password_temporary.html", password: password)
  end
end
