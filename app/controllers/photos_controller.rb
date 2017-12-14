class PhotosController < ApplicationController

  def destroy
    photo = Photo.find(params[:id])
    @event = photo.event

    if @event.user.id == current_user.id
      photo.destroy

      redirect_to edit_event_path(@event), notice: "Photo deleted."
    else
      redirect_to events_path, notice: "Not your photo."
    end
  end

end
