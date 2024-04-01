FactoryBot.define do
  factory :cadastrar_setor, class: SetorModels do
    nomeSetor { Faker::Company.department }
    codIntegracao { Faker::Number.number(digits: 10) }
  end
end
