class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
      @user_interests = current_user.interests
      @match_interest_rooms = Room.joins(:room_interests).where(room_interests: { interest: @user_interests })
      @unmatch_rooms = Room.where.not(id: @match_interest_rooms.pluck(:id))
      @suggested_rooms = (@match_interest_rooms + @unmatch_rooms).first(3)
    else
      @suggested_rooms = Room.all.sample(3)
    end

    @rooms = Room.all
  end
end
