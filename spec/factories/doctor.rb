# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    name { 'Carlos José' }
    crm { '8447753' }
    phone { '1199512323' }
    doctor_specialities_attributes do
      [
        { speciality_id: create(:speciality).id },
        { speciality_id: create(:speciality).id }
      ]
    end
  end
end
