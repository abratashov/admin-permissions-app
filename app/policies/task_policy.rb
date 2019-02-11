class TaskPolicy < ApplicationPolicy
  def create?
    @user.is_root? || @user.has_role?(:creator, Task)
  end

  def new?
    create?
  end

  def update?
    @user.is_root? || @user.has_role?(:editor, Task)
  end

  def edit?
    update?
  end

  def destroy?
    @user.is_root? || @user.has_role?(:cleaner, Task)
  end
end
