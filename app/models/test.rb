class Test < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :name, presence: true
  validates :questions, presence: true

  def next_question(user)
    if questions.size == user.questions
      nil
    else
      (questions - user.questions).sample
    end
  end

  def generate_score(user)
    score = 0
    t = user.questions & questions
    if t.size == 0
      return 'none'
    else
      t.each do |a|
        s = a.solutions & user.solutions
        s.each do |d|
          if d.correct?
            score+=1
          end
        end
      end
      return ((score / questions.size.to_f) * 100).to_s + ' %'
    end
  end
end
