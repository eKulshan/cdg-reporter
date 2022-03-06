class Report < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3, maximum: 250 }
  validates :description, presence: true, length: { minimum: 3, maximum: 500 }
  validates :grade, inclusion: { in: %w[A B C D E FX F], message: '"%{value}" is not a valid grade' }
end
