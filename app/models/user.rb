class User < ApplicationRecord
  ABILITIES = %i{
    read_things
    write_things
    delete_things
    modify_users
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_ability?(ability)
    abilities.include?(ability)
  end

  # Parse out the abilities used based on the mask stored on the User
  def abilities
    ABILITIES.reject do |r|
      (abilities_mask & 2**ABILITIES.index(r)).zero?
    end
  end

  # Calculate the proper mask value when setting abilities from a single ability or array of abilities
  def abilities=(abilities)
    abilities = [*abilities].map { |r| r.to_sym }
    self.abilities_mask = (abilities & ABILITIES).map { |r| 2**ABILITIES.index(r) }.inject(0, :+)
  end
end
