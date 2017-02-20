module RedcarpetHelper
  def markdown(options)
    #Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    Redcarpet::Markdown.new(HTMLBlockCode, options)
  end
end

class HTMLBlockCode < Redcarpet::Render::HTML
  include Sprockets::Rails::Helper
#  include Sprockets::Helpers::IsolatedHelper
#  include ActionView::Helpers

  def parse_media_link(link)
    matches = link.match(/^(\w+)?\|([\w\s\d]+)?/)
    {
      :size => (matches[1] || 'original').to_sym,
      :class => matches[2]
    } if matches
  end

  def image(link, alt_text, title)
    size = nil
    klass = nil

    if nil != (parse = parse_media_link(link))
      image = Photo.find_by(caption: title)
      if image
        size = image.photo.image_size(parse[:size])
        link = image.photo.url(parse[:size])
        klass = parse[:class]

        image_tag(link, :size => size, :title => title, :alt => alt_text, :class => klass)
      else
        ""
      end
    end
  end

  def link(link, title, content)
    klass = nil
    if nil != (parse = parse_media_link(link))
      image = Photo.find_by(caption: title)
      if image
        link = image.file.url(parse[:size])
        klass = parse[:class]

        link_to(content, link, :title => title, :class => klass)
      else
        ""
      end
    end
  end
end
