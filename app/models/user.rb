class User < ActiveRecord::Base
  has_many :report_cards
  has_many :exams, through: :report_cards
  has_many :solutions
  has_many :questions, through: :solutions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
  :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = auth.info.email
    end
  end

  def self.new_with_session(params, session)
    binding.pry
    if session["devise.user_attributes"]
      new session["devise.user_attributes"] do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  def update_level
    if self.experience >= 20000 && self.level != 9
      self.level = 9
      self.save
      return true
    elsif self.experience >= 10000 && self.level != 8
      self.level = 8
      self.save
      return true
    elsif self.experience >= 8000 && self.level != 7
      self.level = 7
      self.save
      return true
    elsif self.experience >= 5000 && self.level != 6
      self.level = 6
      self.save
      return true
    elsif self.experience >= 2000 && self.level != 5
      self.level = 5
      self.save
      return true
    elsif self.experience >= 1000 && self.level != 4
      self.level = 4
      self.save
      return true
    elsif self.experience >= 500 && self.level != 3
      self.level = 3
      self.save
      return true
    elsif self.experience >= 100 && self.level != 2
      self.level = 2
      self.save
      return true
    else
      return false
    end
  end
end
