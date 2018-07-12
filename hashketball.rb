# Write your code here!\
require 'pry'
def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(playername)
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if player == playername
        return data[:points]
      end
    }
  }
end

def shoe_size(playername)
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if player == playername
        return data[:shoe]
      end
    }
  }
end

def team_colors(teamname)
  game_hash.each { |team, teamdata|
    if teamdata[:team_name] == teamname
        return teamdata[:colors]
    end
  }
end

def team_names
  hometeam = game_hash[:home][:team_name]
  awayteam = game_hash[:away][:team_name]
  teams = [hometeam, awayteam]
  return teams
end

def player_numbers(teamname)
  numbers = []
  game_hash.map { |team, teamdata|
    if teamdata[:team_name] == teamname
      teamdata[:players].map { |player, data|
        numbers << data[:number]
      }
    end
  }
  numbers
end

def player_stats(playername)
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if player == playername
        return data
      end
    }
  }
end

def big_shoe_rebounds
  biggestshoe = 0
  biggestrebounds = 0
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if data[:shoe] > biggestshoe
        biggestshoe = data[:shoe]
        biggestrebounds = data[:rebounds]
      end
    }
  }
  return biggestrebounds
end

def most_points_scored
  mostpoints = 0
  bestplayer = ""
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if data[:points] > mostpoints
        mostpoints = data[:points]
        bestplayer = player
      end
    }
  }
  return bestplayer
end

def winning_team
  homepoints = 0
  awaypoints = 0
    game_hash[:home][:players].each { |player,data|
      homepoints += data[:points]
    }
    game_hash[:away][:players].each { |player,data|
      awaypoints += data[:points]
    }
  if homepoints > awaypoints
    game_hash[:home][:team_name]
  elsif awaypoints > homepoints
    game_hash[:away][:team_name]
  else
    puts "tie game"
  end
end

def most_points_scored
  mostpoints = 0
  bestplayer = ""
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if data[:points] > mostpoints
        mostpoints = data[:points]
        bestplayer = player
      end
    }
  }
  return bestplayer
end

def player_with_longest_name
  longestname = ""
  longestlength = 0
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if player.length > longestlength
        longestlength = player.length
        longestname = player
      end
    }
  }
  longestname
end

def long_name_steals_a_ton?
  longsteals = game_hash[:away][:players]["Brendan Haywood"][:steals]
  moststeals = true
  game_hash.each { |team, teamdata|
    teamdata[:players].each { |player, data|
      if data[:steals] > longsteals
        moststeals = false
      end
    }
  }
  moststeals
end
