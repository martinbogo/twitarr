class SeamailMessageDecorator < BaseDecorator
  delegate_all

  def to_hash
    {
        author: author,
        author_display_name: User.display_name_from_username(author),
        text: clean_text_with_cr(text),
        timestamp: timestamp
    }
  end

end