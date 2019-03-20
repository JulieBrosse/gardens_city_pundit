class GardenPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
 #     unless user.admin == true
 #       scope.where(user: user) # n'affiche dans l'index que les restos du owner
 #     else
        scope.all #>> permet d'afficher tous les restos dans index
 #     end
    end
 #   class MyScope < Scope
 #     def resolve
 #       scope.where(user: user)
 #     end
 # end
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
    true
  end

  private

  def user_is_the_owner_or_admin?
    user.admin || record.user == user
  end
end
