class ReportPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user
        scope.where(user_id: @user[:id])
      end
    end

    private

    attr_reader :user, :scope
  end

  def edit?
    @record[:user_id] == @user[:id]
  end

  def update?
    @record[:user_id] == @user[:id]
  end

  def destroy?
    @record[:user_id] == @user[:id]
  end
end