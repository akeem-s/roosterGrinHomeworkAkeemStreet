class NotesController < ApplicationController
  def new
    @Users = User.all
  end

  def create
    @user = User.find_by(first_name: params["user"])
    note = params[note]
    puts @user
    puts note
  end
end
