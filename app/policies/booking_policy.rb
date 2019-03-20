class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    user_is_the_owner_or_admin?
  end

  def destroy?
    user_is_the_owner_or_admin?
  end

  def index?
    true
  end

  def show
    scope.where(:id => record.id).exists?
  end

  private

  def user_is_the_owner_or_admin?
    user.admin || record.booker == user
  end
end
