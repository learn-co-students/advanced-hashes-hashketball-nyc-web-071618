# Write your code here!
require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

#def good_practices
#  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#    binding.pry
#      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#        binding.pry

#        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end
#good_practices

def num_points_scored(player_name)
  game_hash.each do |team, team_specs|
    team_specs[:players].each do |player, specs|
      if player == player_name
        return specs[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, team_specs|
    team_specs[:players].each do |player, specs|
      if player == player_name
        return specs[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, team_specs|
    if team_specs[:team_name] == team_name
      return  team_specs[:colors]
    end
  end
end

def team_names
  game_hash.map { |team, team_specs|
    team_specs[:team_name]
  }
end

def player_numbers(team_name)
  array = []
  game_hash.each do |team, team_specs|
    if team_specs[:team_name] == team_name
      team_specs[:players].each do |player, specs|
        array << specs[:number]
      end
    end
  end
  array
end

def player_stats(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  if home_players.keys.include?(player_name)
    home_players[player_name]
  else
    away_players[player_name]
  end
end

def big_shoe_rebounds
  big_shoes = 0
  rebounds = 0
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, specs|
      if specs[:shoe] > big_shoes
        big_shoes = specs[:shoe]
        rebounds = specs[:rebounds]
      end
    end
  end
  rebounds
end
#hash.max_by{|k, v| v}[0] should return max value
