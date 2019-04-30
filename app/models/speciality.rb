# frozen_string_literal: true

class Speciality < ApplicationRecord
  has_many :doctor_specialities
  has_many :doctor, through: :doctor_specialities
end
