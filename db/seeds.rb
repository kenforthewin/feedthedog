def create_admin
  admin = User.new
  admin.email = 'admin@example.com'
  admin.password = 'password'
  admin.password_confirmation = 'password'
  admin.save!
  admin
end

def create_dog(name, user)
  dog = Dog.create(name: name)
  user.ownerships.build(dog_id: dog.id).save
end

admin = create_admin if Rails.env.development?
create_dog('Hercules', admin)