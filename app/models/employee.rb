class Employee < ApplicationRecord
    belongs_to :dog

    # validates :title, uniqueness: true
    # validates :alias, uniqueness: true

    validates :title , exclusion: { in: Employee.pluck(:title)}
    validates :alias , exclusion: { in: Employee.pluck(:alias)}



end
