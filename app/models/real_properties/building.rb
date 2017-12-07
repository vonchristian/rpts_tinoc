module RealProperties
  class Building < RealProperty
    belongs_to :land_reference, class_name: "RealProperty", foreign_key: 'land_reference_id'
    has_one :building_description
    has_many :floors
    delegate :kind, :structural_type, to: :building_description, allow_nil: true

    accepts_nested_attributes_for :building_description, :floors
  end
end
