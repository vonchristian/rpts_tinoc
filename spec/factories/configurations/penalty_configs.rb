FactoryBot.define do
  factory :penalty_config, class: "Configurations::PenaltyConfig" do
    max_no_month 1
    penalty_rate "9.99"
  end
end
