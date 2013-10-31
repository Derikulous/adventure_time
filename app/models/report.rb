class Report < ActiveRecord::Base
  has_many :solutions
  belongs_to :test
  belongs_to :user
  accepts_nested_attributes_for :solutions, allow_destroy: true
end
