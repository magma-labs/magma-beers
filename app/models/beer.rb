class Beer < ApplicationRecord
  #   validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :photo, styles: { thumbnail: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


  def to_s
    name
  end
end
