# frozen_string_literal: true

class AncestryValidator < ActiveModel::Validator
  DEPTH_LIMIT = 5

  def validate(record)
    return unless record.parent.depth == DEPTH_LIMIT - 1

    record.errors.add :parent_id, "ancestry level can't be more that #{DEPTH_LIMIT}"
  end
end
