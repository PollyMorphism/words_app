# frozen_string_literal: true

module TransactionsHelper
  def formatted_date(transaction)
    transaction.created_at.strftime("%B %d, %Y %H:%M")
  end

  def points_description(transaction)
    "#{transaction.get? ? 'Got' : 'Spent'} #{pluralize(transaction.points, 'point')} for"
  end
end
