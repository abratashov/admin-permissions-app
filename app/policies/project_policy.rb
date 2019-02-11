class ProjectPolicy < ApplicationPolicy
  def create?
    @user.is_root? || @user.has_role?(:creator, Project)
  end

  def new?
    create?
  end

  def update?
    @user.is_root? || @user.has_role?(:editor, Project)
  end

  def edit?
    update?
  end

  def destroy?
    @user.is_root? || @user.has_role?(:cleaner, Project)
  end
end
