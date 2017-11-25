class Appraisal < ApplicationRecord
  belongs_to :real_property
  belongs_to :classification, class_name: "Configurations::Classification"
  belongs_to :sub_classification, class_name: "Configurations::SubClassification"

  delegate :name, to: :classification, prefix: true
  delegate :name, to: :sub_classification, prefix: true
end
