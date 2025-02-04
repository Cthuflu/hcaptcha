defmodule Hcaptcha.Template do
  @moduledoc """
    Responsible for rendering boilerplate hcaptcha HTML code, supports noscript fallback.

    In future this module may be separated out into a Phoenix specific library.
  """
  require Elixir.EEx
  alias Hcaptcha.Config

  EEx.function_from_file(:defp, :render_template, "lib/template.html.eex", [
    :assigns
  ])

  @doc """
  Returns a string with hCAPTCHA code

  To convert the string to html code, use Phoenix.HTML.Raw/1 method
  """
  def display(options \\ []) do
    sitekey =
      options[:sitekey] || Config.get_env(:hcaptcha, :sitekey)

    callback =
      if options[:size] == "invisible" && is_nil(options[:callback]) do
        "hcaptchaCallback"
      else
        options[:callback]
      end

    onload =
      if options[:onload] do
        "onload=#{options[:onload]}&"
      else
        ""
      end

    options_dict = Keyword.put(options, :onload, onload)

    render_template(%{
      sitekey: sitekey,
      callback: callback,
      options: options_dict
    })
  end
end
