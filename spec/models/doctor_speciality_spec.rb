# frozen_string_literal: true    

require 'rails_helper'

RSpec.describe DoctorSpeciality, type: :model do
  describe 'validates relationships' do
    context 'belongs to doctor' do
      it { is_expected.to belong_to(:doctor) }
    end

    context 'belongs to speciality' do
      it { is_expected.to belong_to(:speciality) }
    end
  end
end
