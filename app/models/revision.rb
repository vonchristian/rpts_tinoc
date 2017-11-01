class Revision < ApplicationRecord
  belongs_to :real_property
  after_commit :cancel_previous_tds
  private
  def cancel_previous_tds
    #
  end
end
