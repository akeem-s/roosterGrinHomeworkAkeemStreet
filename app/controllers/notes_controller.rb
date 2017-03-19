class NotesController < ApplicationController
  def new
    @Users = User.all
  end

  def create
    user = User.find_by(first_name: params["user"])
    first_name = user.first_name
    last_name = user.last_name
    phone_number = user.phone_number
    email = user.email
    street_address = user.street_address
    city = user.city
    state = user.state
    zip = user.zip

    note = params["note"]
    note.gsub! "@first_name", first_name
    note.gsub! "@last_name", last_name
    note.gsub! "@phone_number", phone_number.to_s
    note.gsub! "@email", email
    note.gsub! "@street_address", street_address
    note.gsub! "@city", city
    note.gsub! "@state", state
    note.gsub! "@zip", zip.to_s

    note.gsub! "@first_name,", first_name
    note.gsub! "@last_name,", last_name
    note.gsub! "@phone_number", phone_number.to_s
    note.gsub! "@email,", email
    note.gsub! "@street_address,", street_address
    note.gsub! "@city,", city
    note.gsub! "@state,", state
    note.gsub! "@zip,", zip.to_s

    render json: note
  end
end
