class UserPolicy < ApplicationPolicy
  def index?
    @user.is_root?
  end

  def show?
    index?
  end

  def create?
    @user.is_root?
  end

  def new?
    create?
  end

  def update?
    @user.is_root?
  end

  def edit?
    update?
  end

  def destroy?
    @user.is_root?
  end
end
