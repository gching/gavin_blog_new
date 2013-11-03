module ApplicationHelper
  ## To use twitters hashtags
  include Twitter::Autolink

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Gavin Ching's Story"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end


  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(options)
    gravatar_id = Digest::MD5::hexdigest("gavinchingy@gmail.com")
    sizeInput = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, size: "#{sizeInput}x#{sizeInput}", alt: "gavin", class: "gravatar")
  end


end
