class BaseDecorator < Draper::Decorator

  include Twitter::Autolink
  include CruiseMonkeyHelper

  def clean_text(text)
    CGI.escapeHTML(text)
  end

  def clean_text_with_cr(text)
    CGI.escapeHTML(text || '').gsub("\n", '<br />')
  end

  def twitarr_auto_linker(text, options = {})
    if options[:app] == 'CM'
      cm_auto_link text, options
    elsif options[:app] == 'plain'
      # plain wants us to not do any markup
      text
    else
      auto_link text
    end
  end

end