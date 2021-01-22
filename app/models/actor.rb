class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        fname = self.first_name
        name = self.last_name
        fname + " " + name
    end

    def list_roles
        characters.collect do |character|
            "#{character.name} - #{character.show.name}"
        end
    end
end