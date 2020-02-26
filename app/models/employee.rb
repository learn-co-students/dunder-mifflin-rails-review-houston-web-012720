class Employee < ApplicationRecord
  belongs_to :dog

  validates :alias, :allow_nil => true, uniqueness: true, unless: 'nil?'
  validates :title, uniqueness: true
  before_validation :change_none

  def change_none
    if self.alias == "none" || self.alias == ""
      self.alias = nil
    end
  end
end
