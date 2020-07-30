class TimeCardsController < ApplicationController
	
	
	def index
		@user = current_user
	    today = Date.today
	    @year = today.year
	    @month = today.month
	    @time_cards = monthly_time_cards(current_user, @year, @month)
	    @time_card = TimeCard.today(current_user)
	    @times = @user.time_cards
	  end

	  def show
	  	@user = current_user
	    @time_card = TimeCard.today(current_user)
	  end

	  def create
	    @time_card = TimeCard.today(current_user)
	    
	    if params[:in]
	      @time_card.in_at = Time.now
	    elsif params[:out]
	      @time_card.out_at = Time.now
	    end

	    if @time_card.save
	       redirect_to user_path(current_user)
	    else
	       root_path
	    end
	  end

	  private

	    # 指定年月の全ての日のタイムカードの配列を取得する（タイムカードが存在しない日はnil）
	    def monthly_time_cards(user, year, month)
	      number_of_days_in_month = Date.new(year, month, 1).next_month.prev_day.day
	      results = Array.new(number_of_days_in_month) # 月の日数分nilで埋めた配列を用意
	      time_cards = TimeCard.monthly(user, year, month)
	      time_cards.each do |card|
	        results[card.day - 1] = card
	      end
	      results
	    end

end
