require 'rails_helper'

RSpec.describe Mutant, type: :model do
  describe "validations" do
    it "validate inclusion of required fields" do
        should validate_inclusion_of(:is_mutant)
        .in_array([true, false])
    end
  end
end