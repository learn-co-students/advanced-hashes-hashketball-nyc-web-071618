require "pry"

def game_hash
  {
  home:{
    team_name:"Brooklyn Nets",
    colors:["Black","White"],
    players:{
      "Alan Anderson":{
        number:0,
        shoe:16,
        points:22,
        rebounds:12,
        assists:12,
        steals:3,
        blocks:1,
        slam_dunks:1
        },
      "Reggie Evans":{
        number:30,
        shoe:14,
        points:12,
        rebounds:12,
        assists:12,
        steals:12,
        blocks:12,
        slam_dunks:7
        },
      "Brook Lopez":{
        number:11,
        shoe:17,
        points:17,
        rebounds:19,
        assists:10,
        steals:3,
        blocks:1,
        slam_dunks:15
        },
      "Mason Plumlee":{
        number:1,
        shoe:19,
        points:26,
        rebounds:12,
        assists:6,
        steals:3,
        blocks:8,
        slam_dunks:5
        },
      "Jason Terry":{
        number:31,
        shoe:15,
        points:19,
        rebounds:2,
        assists:2,
        steals:4,
        blocks:11,
        slam_dunks:1
        }
      }
  },
  away:{
    team_name:"Charlotte Hornets",
    colors:["Turquoise", "Purple"],
    players:{
      "Jeff Adrien":{
        number:4,
        shoe:18,
        points:10,
        rebounds:1,
        assists:1,
        steals:2,
        blocks:7,
        slam_dunks:2
        },
      "Bismak Biyombo":{
        number:0,
        shoe:16,
        points:12,
        rebounds:4,
        assists:7,
        steals:7,
        blocks:15,
        slam_dunks:10
        },
      "DeSagna Diop":{
        number:2,
        shoe:14,
        points:24,
        rebounds:12,
        assists:12,
        steals:4,
        blocks:5,
        slam_dunks:5
        },
      "Ben Gordon":{
        number:8,
        shoe:15,
        points:33,
        rebounds:3,
        assists:2,
        steals:1,
        blocks:1,
        slam_dunks:0
        },
      "Brendan Haywood":{
        number:33,
        shoe:15,
        points:6,
        rebounds:12,
        assists:12,
        steals:22,
        blocks:5,
        slam_dunks:12
        }
      }
    }
}
end

def num_points_scored(player_name)
  game_hash.each do |location, team|
  team.each do |attribute, value|
    if attribute==:players
      value.each do |player, stats|
        if player.to_s==player_name
          return stats[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team|
  team.each do |attribute, value|
    if attribute==:players
      value.each do |player, stats|
        if player.to_s==name
          return stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team|
    if team[:team_name]==name
      return team[:colors]
    end
  end
end

def team_names
  teams_arr=[]
  game_hash.each do |location, team|
    teams_arr << team[:team_name]
    end
  teams_arr
end

def player_numbers(name)
  new_arr=[]
  game_hash.each do |location, team|
    if team[:team_name]==name
      team[:players].each do |player, stats|
        new_arr << stats[:number]
      end
    end
  end
  new_arr
end

def player_stats(name)
  game_hash.each do |location, team|
    team.each do |attribute, value|
      if attribute==:players
        value.each do |player, stats|
          if player.to_s == name
        return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe=0
  biggest_rebound=0
  game_hash.each do |location, team|
  team[:players].each do |player, stats|
    if stats[:shoe]>largest_shoe
      largest_shoe==stats[:shoe]
      biggest_rebound=stats[:rebounds]
        end
      end
    end
  return biggest_rebound
end

def most_points_scored
  most_points=0
  most_points_player=""
  game_hash.each do |location, team|
  team[:players].each do |player, stats|
    if stats[:points]>most_points
      most_points=stats[:points]
      most_points_player=player.to_s
        end
      end
    end
  return most_points_player
end

def winning_team
  most_points_home=0
  most_points_away=0
  game_hash.each do |location, team|
    if location==[:home]
        team[:players].each do |player, stats|

          most_points_home+=stats[:points]
    if location==[:away]
        team[:players].each do |player, stats|
          most_points_away+=stats[:points]
            end
          end
        end
      end
    end
    if most_points_home > most_points_away
        return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
  end
end
