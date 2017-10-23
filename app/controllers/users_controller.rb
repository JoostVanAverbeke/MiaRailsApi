class UsersController < ApplicationController
  def index
    render json: UsersDatatable.new(params)
  end
end
# NEW    patient_collection = PatientCollection.new(patients, current_page: @page_to_i, total_items: patients.total_entries,
#                                               total_records: Patient.count, page_size: @limit.to_i)


