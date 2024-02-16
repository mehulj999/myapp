class IterableApi
  def initialize(user)
    @user = user
  end

  # Define different methods for different methods as they can load different files to render
  def create_event_mail
    # load a template for new event
  end

  def update_event_mail
    # load a template for an update event
  end

  def delete_event_mail
    # load a template for a deleted/cancelled event
  end
end
