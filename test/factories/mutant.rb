FactoryBot.define do
  factory :mutant do
    is_mutant { true }
  end

  factory :human, class: 'Mutant' do
    is_mutant { false }
  end

end
