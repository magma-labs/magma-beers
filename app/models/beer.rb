class Beer < ApplicationRecord
  has_attached_file :photo, styles: { thumbnail: "300x300>", thumb: "100x100>" }, default_url: "noimage.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  has_many :beer_logs

  resourcify

  scope :by_name, ->(beer_name) { where('lower(name) LIKE ?', "%#{beer_name.downcase}") }

  validates_uniqueness_of :name
  validates_presence_of :name
  validates_presence_of :description

  def self.search(search)
    if search
      find(:all, :conditions => ['lower(name) ILIKE ?', "%#{search.downcase}%"])
    else
      find(:all)
    end
  end
end
