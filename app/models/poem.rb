# frozen_string_literal: true

class Poem < ApplicationRecord
  MAX_VERSE_CHAR_LENGTH = 60
  belongs_to :game

  def title
    s = lines&.split
    s.nil? || s.length < 2 ? nil : "#{s.first} #{s.last}"
  end

  def formatted_body
    return nil if !title.present?

    lines.split("\r\n").map do |line|
      line.strip << "<br>"
    end.join
  end
end
