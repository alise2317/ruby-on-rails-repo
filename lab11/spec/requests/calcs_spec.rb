# frozen_string_literal: true

require 'spec_helper'
require 'rails_helper'
RSpec.describe CalcHelper do
  include CalcHelper
  describe 'result of calculations' do
    it 'should get correct result' do
      expect(calc_automorf(1)).to eq([[1, 1]])
      expect(calc_automorf(50)).to eq([[1, 1], [5, 25], [6, 36], [25, 625]])
      expect(calc_automorf(-10)).to eq([])
      expect(calc_automorf(0)).to eq([])
      expect(calc_automorf(101)).to eq([])
    end
  end
end
