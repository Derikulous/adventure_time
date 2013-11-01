class Solution < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  belongs_to :report


  def check_answer(q)
    if q == find_answer.to_s
      self.correct = true
      self.save
    end
  end

  private

  def find_answer
    count = 1
    self.question.answers.each do |answer|
      if answer.correct
        return count
      else
        count+=1
      end
    end
  end
end
