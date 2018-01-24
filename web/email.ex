defmodule IpapyWeb.Email do
  use Bamboo.Phoenix, view: IpapyWeb.EmailView

  def send_new_password_temporary_text(email) do
    new_email
    |> to(email)
    |> from("us@example.com")
    |> subject("Welcome!")
    |> text_body("New password")
  end

  def send_new_password_temporary_html(email) do
    email
    |> send_new_password_temporary_text()
    |> html_body("New password")
  end
end
