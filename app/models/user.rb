class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :email, length: { in: 3..150 }
  validates :first_name, presence: true, length: { in: 3..100 }
  validates :last_name, presence: true, length: { in: 3..100 }

  belongs_to :role
  has_many :reports, dependent: :destroy

  before_validation :set_default_role

  def admin?
    self.role.name == 'admin'
  end

  def reviewer?
    self.role.name == 'reviwer'
  end

  def author?(report)
    self[:id] == report[:user_id]
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('student')
    pp self
  end
end
