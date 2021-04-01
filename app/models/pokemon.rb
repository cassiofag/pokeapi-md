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
    validate :sum_of_stats_should_be_equal_to_total

    scope :pokedex_order, -> { order(pokedex_number: :asc) }

    def sum_of_stats_should_be_equal_to_total
      if total.present? && hp.present? && attack.present? && defense.present? && 
        sp_atk.present? && sp_def.present? && speed.present?
        
        sum = hp + attack + defense + sp_atk + sp_def + speed
        if sum != total
          errors.add(:total, "should be equal to the sum of all stats")
        end
      end
    end
end
