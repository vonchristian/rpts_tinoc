class Revision < ApplicationRecord
  belongs_to :real_property, touch: true
  belongs_to :revised_data, polymorphic: true, dependent: :destroy
  def assessed_value
    real_property.assessed_value(from_date: effectivity_date, to_date: effectivity_date)
  end
end
