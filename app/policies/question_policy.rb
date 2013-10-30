class QuestionPolicy < ApplicationPolicy
  attr_reader :user, :question

  def initialize(user, question)
    @user = user
    @question = question
  end

  def create?
    user.admin? if user.present?
  end

  def publish?
    user.admin? if user.present?
  end

  alias_method :destroy?, :create?
  alias_method :update?, :create?

  def destroy?
    question.authored_by?(user) || user.admin? if user.present?
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.admin?
        scope.all
      else
        scope.where(:approved => true)
      end
    end
  end
end
