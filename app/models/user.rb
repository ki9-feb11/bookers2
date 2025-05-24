class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]

  has_many :books, dependent: :destroy

  has_one_attached :image

  def email_required?
    true
  end

  def will_save_change_to_email?
    false
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  validates :name, presence: true, uniqueness: true, length: {in: 2..20}
  validates :introduction, length: {maximum: 50}

end
