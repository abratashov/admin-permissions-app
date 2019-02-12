root = User.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password')
root.add_role(Role::ROLES[:root])
