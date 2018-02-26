require 'json'

class User
  
  attr_accessor :name, :email, :permissions
  
  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template
  end
  
  def permissions_from_template
    file = File.read 'user_perrmission_template.json'
    JSON.load(file, nil)
  end
  
  def save
    self_json = {email:  @email, name: @name, permissions: @permissions}.to_json
    open('users.json', 'a') do |file|
      file puts self_json
    end
  end
  
end