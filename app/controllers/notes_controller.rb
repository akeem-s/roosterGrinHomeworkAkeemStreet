class NotesController < ApplicationController
  def new
    @Users = User.all
  end
end
