# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        alan_anderson: {
          number:0,
          shoe:16,
          points:22,
          rebounds:12,
          assists:12,
          steals:3,
          blocks:1,
          slam_dunks:1,
        },
        reggie_evans: {
          number:30,
          shoe:14,
          points:12,
          rebounds:12,
          assists:12,
          steals:12,
          blocks:12,
          slam_dunks:7,
        },
        brook_lopez: {
          number:11,
          shoe:17,
          points:17,
          rebounds:19,
          assists:10,
          steals:3,
          blocks:1,
          slam_dunks:15,
        },
        mason_plumlee: {
          number:1,
          shoe:19,
          points:26,
          rebounds:12,
          assists:6,
          steals:3,
          blocks:8,
          slam_dunks:5,
        },
        jason_terry: {
          number:31,
          shoe:15,
          points:19,
          rebounds:2,
          assists:2,
          steals:4,
          blocks:11,
          slam_dunks:1,
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        jeff_adrien: {
          number:4,
          shoe:18,
          points:10,
          rebounds:1,
          assists:1,
          steals:2,
          blocks:7,
          slam_dunks:2,
        },
        bismak_biyombo: {
          number:0,
          shoe:16,
          points:12,
          rebounds:4,
          assists:7,
          steals:7,
          blocks:15,
          slam_dunks:10,
        },
        desagna_diop: {
          number:2,
          shoe:14,
          points:24,
          rebounds:12,
          assists:12,
          steals:4,
          blocks:5,
          slam_dunks:5,
        },
        ben_gordon: {
          number:8,
          shoe:15,
          points:33,
          rebounds:3,
          assists:2,
          steals:1,
          blocks:1,
          slam_dunks:0,
        },
        brendan_haywood: {
          number:33,
          shoe:15,
          points:6,
          rebounds:12,
          assists:12,
          steals:22,
          blocks:5,
          slam_dunks:12,
        }
      }
    }
  }
end


def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, hash|
          if name == player_name.downcase.sub(/ / , '_').to_sym
            hash.each do |trait, number|
              if trait == :points
                return number
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, hash|
          if name == player_name.downcase.sub(/ / , '_').to_sym
            hash.each do |trait, number|
              if trait == :shoe
                return number
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  team_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_hash = game_hash[location]
      end
    end
  end


  team_hash.each do |attribute, data|
    if attribute == :colors
      return data
    end
  end
  binding.pry

end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names << data
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  team_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        if data == team_name
          team_hash = game_hash[location][:players]
        end
      end
    end
  end

  team_numbers = []

  team_hash.each do |name, traits|
    traits.each do |trait, number|
      if trait == :number
        team_numbers << number
      end
    end
  end

  team_numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, hash|
          if name == player_name.downcase.sub(/ / , '_').to_sym
            return game_hash[location][attribute][name]
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, hash|
          hash.each do |trait, number|
            if trait == :shoe
              shoe_sizes << number
            end
          end
        end
      end
    end
  end

  biggest_shoe_size = shoe_sizes.sort[-1]

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, hash|
          hash.each do |trait, number|
            if trait == :shoe
              if number = biggest_shoe_size
                return game_hash[location][attribute][name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
end
