def game_hash
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
     },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
       :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
    :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismak Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Brendan Haywood",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}

end


def num_points_scored (name)
  points = nil
  # this is currently nothing

  game_hash.each do |team, details_hash|

    players_array = details_hash[:players]

  #  for each hash that has a player we will put it in a new array
  #the players_array

      players_array.each do |player_details_hash|
        # now withing that array we will be the following


        if player_details_hash[:name] == name

        # if the name we took as an arguements equals the name in the hash
        #then the points they made would eqaul the variable points


          points = player_details_hash[:points]
        end
        # end if statemnts

      end
      # end the 1st each operator
  end
  points
  # return the points that player made


end
# end the whole fucntion

def shoe_size(name)
  answer = nil
# answer currently has nothig

  game_hash.each do |team, details_hash|
  # the hash key value pairs would be the team and dets

    players_array = details_hash[:players]
    # players array would be value for each element in  :players
      players_array.each do |player_details_hash|

        # now that array of players and their info will
        if player_details_hash[:name] == name
            # if the arguement we are taking into account is the same as the  hash :name
          #  then the answer would equal the value of :shoe
          answer = player_details_hash[:shoe]

        end
      end
  end
  answer
end


def team_colors (team_name)
   colors = nil
   # colors is currently nil aka nothing

    game_hash.each do |team, team_details_hash|
      # we are going to take each element in the hash game_hash
      #
        if team_details_hash[:team_name] == team_name
          # if the team name we are using is the smae as the key :team_name
          #then colors variable will = the key :color with the values being flatten aka out of the array

            colors = team_details_hash[:colors].flatten
        end
    end
        colors
end


def team_names

  game_hash.collect do |team, team_details_hash|

    # we have both team, and team_details_hash becuase hash are key value pairs


    team_details_hash[:team_name]

    # this is will take the value of team name
  end
end


def player_numbers (team_name)

  player_numbers_list = []

  game_hash.each do |team, team_details_hash|

    if team_details_hash[:team_name] == team_name

      team_details_hash[:players].each do |player|

        player.each do |jersey, jersey_number|

          if jersey == :number

            player_numbers_list << jersey_number
        end
        end
      end
    end
  end
  player_numbers_list
end


def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_details_hash|
    team_details_hash[:players].each do |stats|

      if stats[:name] == player_name
        stats.delete(:name)
        player_stats = stats
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
        end
  rebounds
end
