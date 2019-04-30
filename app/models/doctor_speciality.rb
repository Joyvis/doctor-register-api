# frozen_string_literal: true

class DoctorSpeciality < ApplicationRecord
  belongs_to :doctor
  belongs_to :speciality
end
