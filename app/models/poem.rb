# frozen_string_literal: true

class Poem < ApplicationRecord
  has_and_belongs_to_many :users

  def title
    s = lines&.split
    return s.nil? || s.length < 2 ? nil : s.first + " " + s.last
  end
end
