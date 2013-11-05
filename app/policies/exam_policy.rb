class ExamPolicy < ApplicationPolicy
  attr_reader :user, :exam

  def initialize(user, exam)
    @user = user
    @exam = exam
  end

  def create?
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
