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

def num_points_scored(player_name)
  game_hash.each do |key, value|
#each of the elemnts in game_hash are assigned to variable key or value
#our two keys are home and away, our values our the other keys created
    value[:players].each do |name, info|
#varible value looks through [:players] key. each of the elements are assinged
# either {name} which is a key or {info} which is a value
      if name == player_name
# if the varible name is equal == to argument player_name then do code below
    return info[:points]
#if true we are return the varible info which looks through the[:points] key
# and return its value pair which would the interger of points scored
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, players|
    players[:players].each do |name, info|
      if name == player_name
        return info[:shoe]
      end
    end
  end
end

def team_colors(team)
  ans = nil
#nil=null,none or nothing ans = nothing until we change/assign the value
  game_hash.each do |keys, values|
# each element of hash is assigned either key or value varible
    if values[:team_name] == team
#if second level of hash with key = argument team
      ans = values[:colors]
# assign ans with the value of [:colors] for team

    end
  end
  ans
end


def team_names
  team_arr = []
  game_hash.each do |key, value|
    team_arr << value[:team_name]
  end
  team_arr
end

def player_numbers(team)
  arr = []
  game_hash.each do |key, value|
    value[:players].each do |name, other|
      if value[:team_name] == team
        arr << other[:number]
      end
    end
  end
  arr
end

def player_stats(player)
  ans = {}
  game_hash.each do |key, value|
    value[:players].each do |name, stats|
      if name == player
        ans = stats
      end
    end
  end
  ans
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0

  game_hash.each do |key, value|
    value[:players].each do |name, stats|
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end
