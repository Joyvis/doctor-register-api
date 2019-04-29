# frozen_string_literal: true    

require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'validating relationships' do
    it { is_expected.to have_many(:specialities).through(:doctor_specialities) }
    it { is_expected.to have_many(:doctor_specialities) }
    it { is_expected.to accept_nested_attributes_for(:doctor_specialities) }
  end

  describe 'validating' do
    let(:doctor) do
      build(:doctor, doctor_specialities_attributes: specialities)
    end

    subject do
      doctor.valid?
    end

    describe 'min of doctor specialities' do
      context 'with 2 or more specialities' do
        let(:specialities) do
          [{ speciality_id: create(:speciality).id },
           { speciality_id: create(:speciality).id }]
        end

        it 'attributes validated' do
          is_expected.to be_truthy
        end
      end

      context 'with 1 or less specialities' do
        let(:specialities) do
          [{ speciality_id: create(:speciality).id }]
        end

        it 'attributes not validated' do
          is_expected.to be_falsey
          expect(doctor.errors[:doctor_specialities]).not_to be_blank
        end
      end
    end

    describe 'equality of doctors_specialities' do
      context 'with same specialities' do
        let(:speciality) { create(:speciality) }
        let(:specialities) do
          [{ speciality_id: speciality.id },
           { speciality_id: speciality.id }]
        end

        it 'attributes validated' do
          is_expected.to be_falsey
        end
      end

      context 'with different specialities' do
        let(:speciality) { create(:speciality) }
        let(:specialities) do
          [{ speciality_id: speciality.id },
           { speciality_id: create(:speciality).id }]
        end

        it 'attributes validated' do
          is_expected.to be_truthy
        end
      end
    end
  end
end
