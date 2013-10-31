class Solution < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :report
  #accepts_nested_attributes_for :question
end
