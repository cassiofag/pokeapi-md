class Pokemon < ApplicationRecord
    validates :pokedex_number, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :name, presence: true, uniqueness: true
    validates :type_1, presence: true
    validates :total, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :hp, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :attack, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :defense, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :sp_atk, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :sp_def, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :speed, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :generation, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :legendary, :inclusion => { :in => [true, false], message: "must be true or false" }

    scope :pokedex_order, -> { order(pokedex_number: :asc) }
end
