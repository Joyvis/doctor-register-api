# frozen_string_literal: true

class SpecialitiesController < ApplicationController
  def index
    specialities = Speciality.ransack(params[:q]).result
    render_success specialities
  end
end
