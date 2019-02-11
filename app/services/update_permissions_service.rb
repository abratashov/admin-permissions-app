class UpdatePermissionsService < ApplicationService
  def initialize(user, permissions)
    @user = user
    @permissions = permissions
    @success = true
  end

  def call
    Role::RESOURCES.each {|resource| process_resource(resource)}
  rescue StandardError => e
    @success  = false
    @errors   = [e]
  ensure
    @result   = @user
  end

  private

  def process_resource(resource)
    resource_field = resource.to_s.underscore

    if @permissions[resource_field]
      Role::RESOURCE_ROLES.each do |role|
        if @permissions.dig(resource_field, role)
          @user.add_role(role, resource)
        else
          @user.remove_role(role, resource)
        end
      end
    else
      Role::RESOURCE_ROLES.each {|role| @user.remove_role(role, resource) }
    end
  end

end
