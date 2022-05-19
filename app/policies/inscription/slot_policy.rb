class Inscription::SlotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def availabilities?
    return true
  end
end
