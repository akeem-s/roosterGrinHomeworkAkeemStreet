class NotesController < ApplicationController
  def new
    @Users = User.all
  end

  def create
    if params["user"].length > 0 && params["note"].length > 0
      user = User.find_by(first_name: params["user"])
      first_name = user.first_name
      last_name = user.last_name
      phone_number = user.phone_number.to_s
      email = user.email
      street_address = user.street_address
      city = user.city
      state = user.state
      zip = user.zip.to_s

      note = params["note"]
      if note.include? "@first_name"
         note.gsub! "@first_name", first_name
      end
      if note.include? "@last_name"
         note.gsub! "@last_name", last_name
      end
      if note.include? "@phone_number"
         note.gsub! "@phone_number", phone_number
      end
      if note.include? "@email"
         note.gsub! "@email", email
      end
      if note.include? "@street_address"
         note.gsub! "@street_address", street_address
      end
      if note.include? "@city"
         note.gsub! "@city", city
      end
      if note.include? "@state"
         note.gsub! "@state", state
      end
      if note.include? "@zip"
         note.gsub! "@zip", zip
      end

      render json: {note: note}
    end
  end
  protect_from_forgery with: :exception
end
