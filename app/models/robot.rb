require 'time'
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

  def birthday_formatted
    Date.parse(@birthday)
  end

  def hire_date_formatted
    Date.parse(@date_hired)
  end

  def robot_age
    bday = birthday_formatted
    if Date.today.month < bday.month
      (Date.today.year - bday.year) -1
    elsif Date.today.month == bday.month && Date.today.day < bday.day
      (Date.today.year - bday.year) -1
    else
      Date.today.year - bday.year
    end
  end
end
