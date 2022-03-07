class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.reviewer?
        scope.all
      else
        scope.where(user_id: @user[:id])
      end
    end

    private

    attr_reader :user, :scope
  end

  def edit?
    return false if Report.where(user_id: @record[:user_id]).count >= 10

    @user.admin? || @user.author?(@record)
  end

  def update?
    return false if Report.where(user_id: @record[:user_id]).count >= 10

    @user.admin? || @user.author?(@record)
  end

  def destroy?
    return false if Report.where(user_id: @record[:user_id]).count >= 10

    @user.admin? || @user.author?(@record)
  end
end