class Test < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  def next_question(user)
    if questions.size == user.questions
      nil
    else
      (questions - user.questions).sample
    end
  end
end
