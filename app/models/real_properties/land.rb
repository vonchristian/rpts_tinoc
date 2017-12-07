module RealProperties
  class Land < RealProperty
    has_many :buildings, class_name: "RealProperties::Building", foreign_key: 'land_reference_id'
  end
end
