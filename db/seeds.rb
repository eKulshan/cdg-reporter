['student', 'reviewer', 'admin'].each do |role|
  Role.find_or_create_by({ name: role })
end

User.create!({ first_name: 'admin',
           last_name: 'admin',
           email: 'admin@admin',
           password: 'minimum',
           password_confirmation: 'minimum',
           role: Role.find_by({ name: 'admin' }) })
