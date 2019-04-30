# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Speciality, type: :model do
  describe 'validating relationships' do
    it { is_expected.to have_many(:doctor).through(:doctor_specialities) }
    it { is_expected.to have_many(:doctor_specialities) }
  end
end
