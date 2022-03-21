class Mutant < ApplicationRecord
    validates :is_mutant, inclusion: { in: [true, false]}
end
