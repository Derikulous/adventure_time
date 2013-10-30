class ReportCardPolicy < ApplicationPolicy
  attr_reader :user, :report_card

  def initialize(user, report_card)
    @user = user
    @report_card = report_card
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
    report_card.authored_by?(user) || user.admin? if user.present?
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
