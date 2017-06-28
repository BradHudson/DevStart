class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:yahoo]



  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.yahoo_data"] && session["devise.yahoo_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # user.email = auth.info.email
      # user.password = Devise.friendly_token[0,20]
      # user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end

    @token = auth["credentials"]["token"]

    binding.pry
    week_number = 1
    team = 4
    scoreboard_url = "https://fantasysports.yahooapis.com/fantasy/v2/league/359.l.101698/scoreboard;week=#{ week_number }"
    players_url =  "https://fantasysports.yahooapis.com/fantasy/v2/team/359.l.101698.t.#{ team }/players"

    # query = {
    #     "method"     => "neworder",
    #     "nonce"      => 1404996028,
    #     "order_type" => "buy",
    #     "quantity"   => 1,
    #     "rate"       => 1
    # }
    headers = {
        "Authorization"  => "Bearer #{ @token }",
        "sign" => "0a3888ac7f8e411ad73a0a503c55db70a291bfb9f9a47147d5200882674f717f6ede475669f3453"
    }

    response =HTTParty.get(
        "https://fantasysports.yahooapis.com/fantasy/v2/team/359.l.101698.t.#{ team }/players",
        :headers => headers)

    File.open("data/rosters/2016/2016_roster_#{ team }.json", 'w') do |f|
      f.puts response.to_json
    end

    # while team < 11 do
    #   response =HTTParty.get(
    #       "https://fantasysports.yahooapis.com/fantasy/v2/team/359.l.101698.t.#{ team }/players",
    #       :headers => headers)
    #
    #   File.open("data/rosters/2016/2016_roster_#{ team }.json", 'w') do |f|
    #     f.puts response.to_json
    #   end
    #   team += 1
    # end

  end
end
