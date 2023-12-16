# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe('create_game') do
    it 'creates a Game instance and returns id' do
      id = described_class.create_game
      expect(id).not_to be_nil
    end
  end
end
