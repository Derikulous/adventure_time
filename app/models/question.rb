class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers, :dependent => :destroy
  has_many :solutions
  accepts_nested_attributes_for :answers, allow_destroy: true
end
