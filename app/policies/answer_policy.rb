class AnswerPolicy < ApplicationPolicy
  attr_reader :user, :answer

  def initialize(user, answer)
    @user = user
    @answer = answer
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
    user.admin? if user.present?
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
