require "administrate/field/base"

class PaperclipField < Administrate::Field::Base
  # class Engine < ::Rails::Engine
  # end

  def url
    data.url
  end

  # def style(size = thumbnail)
  #   binding.pry
  #   # data.try(:url, size) || ''
  #   data.url(size)
  # end

  # delegate :url, to: :data

  def thumbnail
    data.url(:thumbnail)
    # style(thumbnail_style)
  end

  def thumb
    data.url(:thumb)
  end

  def small
    data.url(:small)
  end

  def thumb
    data.url(:thumb)
  end

  def small
    data.url(:small)
  end

  def thumb
    data.url(:thumb)
  end

  def small
    data.url(:small)
  end

  def thumb
    data.url(:thumb)
  end

  def small
    data.url(:small)
  end

  def thumb
    data.url(:thumb)
  end

  def small
    data.url(:small)
  end

  def thumb
    data.url(:thumb)
  end

  def small
    data.url(:small)
  end

  def to_s
    data
  end

  # Just display the URL as a link, rather than trying to make it an image
  # def url_only?
  #   binding.pry
  #   options.fetch(:url_only, false)
  # end
  #
  # alias url style
  #
  # private
  #
  # DEFAULT_THUMBNAIL_STYLE = :thumbnail
  # DEFAULT_BIG_STYLE = :original
  #
  # def thumbnail_style
  #   binding.pry
  #   options.fetch(:thumbnail_style, DEFAULT_THUMBNAIL_STYLE)
  # end
  #
  # def big_style
  #   binding.pry
  #   options.fetch(:big_style, DEFAULT_BIG_STYLE)
  # end
end
