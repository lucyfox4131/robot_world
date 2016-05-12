# Create a new instance of a Robot with these characteristics
class Robot
  attr_reader :name,
              :city,
              :state,
              :avatar,
              :birthday,
              :date_hired,
              :department,
              :id

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
    @avatar = data[:avatar]
    @birthday = data[:birthday]
    @date_hired = data[:date_hired]
    @department = data[:department]
  end

  def robot_age
    # Difference between birthdate and today's date
  end
end
