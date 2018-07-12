require 'pry'


def game_hash
  game_hash = {:home=>{:team_name=>"Brooklyn Nets",
                      :colors=>["Black","White"],
                      :players=>{"Alan Anderson"=>{:number=>0,
                                                   :shoe=>16,
                                                   :points=>22,
                                                   :rebounds=>12,
                                                   :assists=>12,
                                                   :steals=>3,
                                                   :blocks=>1,
                                                   :slam_dunks=>1},
                                 "Reggie Evans"=>{:number=>30,
                                                  :shoe=>14,
                                                  :points=>12,
                                                  :rebounds=>12,
                                                  :assists=>12,
                                                  :steals=>12,
                                                  :blocks=>12,
                                                  :slam_dunks=>7},
                                 "Brook Lopez"=>{:number=>11,
                                                 :shoe=>17,
                                                 :points=>17,
                                                 :rebounds=>19,
                                                 :assists=>10,
                                                 :steals=>3,
                                                 :blocks=>1,
                                                 :slam_dunks=>15},
                                 "Mason Plumlee"=>{:number=>1,
                                                   :shoe=>19,
                                                   :points=>26,
                                                   :rebounds=>12,
                                                   :assists=>6,
                                                   :steals=>3,
                                                   :blocks=>8,
                                                   :slam_dunks=>5},
                                 "Jason Terry"=>{:number=>31,
                                                 :shoe=>15,
                                                 :points=>19,
                                                 :rebounds=>2,
                                                 :assists=>2,
                                                 :steals=>4,
                                                 :blocks=>11,
                                                 :slam_dunks=>1}
                                 }
                               },
               :away=>{:team_name=>"Charlotte Hornets",
                      :colors=>["Turquoise","Purple"],
                      :players=>{"Jeff Adrien"=>{:number=>4,
                                                 :shoe=>18,
                                                 :points=>10,
                                                 :rebounds=>1,
                                                 :assists=>1,
                                                 :steals=>2,
                                                 :blocks=>7,
                                                 :slam_dunks=>2},
                                 "Bismak Biyombo"=>{:number=>0,
                                                    :shoe=>16,
                                                    :points=>12,
                                                    :rebounds=>4,
                                                    :assists=>7,
                                                    :steals=>7,
                                                    :blocks=>15,
                                                    :slam_dunks=>10},
                                 "DeSagna Diop"=>{:number=>2,
                                                  :shoe=>14,
                                                  :points=>24,
                                                  :rebounds=>12,
                                                  :assists=>12,
                                                  :steals=>4,
                                                  :blocks=>5,
                                                  :slam_dunks=>5},
                                 "Ben Gordon"=>{:number=>8,
                                                :shoe=>15,
                                                :points=>33,
                                                :rebounds=>3,
                                                :assists=>2,
                                                :steals=>1,
                                                :blocks=>1,
                                                :slam_dunks=>0},
                                 "Brendan Haywood"=>{:number=>33,
                                                     :shoe=>15,
                                                     :points=>6,
                                                     :rebounds=>12,
                                                     :assists=>12,
                                                     :steals=>22,
                                                     :blocks=>5,
                                                     :slam_dunks=>12}
                                 }
                               }
                             }
end

def num_points_scored(players_name)
  game_hash.each do |location,attributes|
    attributes.each do |attribute,values|
      if attribute == :players
        values.each do |player_name,stat_cloud|
          if player_name == players_name
            stat_cloud.each do |stat,value|
              if stat == :points
                return value
              else
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |location,attributes|
    attributes.each do |attribute,values|
      if attribute == :players
        values.each do |player,stat_cloud|
          if player == players_name
            stat_cloud.each do |stat,value|
              if stat == :shoe
                return value
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location,attributes|
    attributes.each do |attribute,values|
      if values == team_name
        attributes.each do |attribute,values|
          if attribute == :colors
            return values
          end
        end
      end
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location,attributes|
    attributes.each do |attribute,value|
      if attribute == :team_name
        team_names << value
      end
    end
  end
  return team_names
end

def player_numbers(team_name)
  player_numbers =[]
  game_hash.each do |location,attributes|
    attributes.each do |attribute,value|
      if value == team_name
        attributes.each do |attribute,value|
          if attribute == :players
            value.each do |player,stat_cloud|
              stat_cloud.each do |stat,value|
                if stat == :number
                  player_numbers << value
                end
              end
            end
          end
        end
      end
    end
  end
  return player_numbers
end

def player_stats(players_name)
  game_hash.each do |location,attributes|
    attributes.each do |attribute,values|
      if attribute == :players
        values.each do |player,stat_cloud|
          if player == players_name
            return stat_cloud
          end
        end
      end
    end
  end
end


def get_names_vs_shoes_object
  shoes_n_names = {}
  game_hash.each do |location,attributes|
    attributes.each do |attribute,value|
      if attribute == :players
        value.each do |player,stat_cloud|
          stat_cloud.each do |stat,value|
            if stat == :shoe
              shoes_n_names[player] = value
            end
          end
        end
      end
    end
  end
  return shoes_n_names
end

def player_with_biggest_shoes
  names = get_names_vs_shoes_object.keys
  shoes = get_names_vs_shoes_object.collect {|names,shoes| shoes}
  biggest_shoe_size = shoes[0]
  target_player = ""
  shoes.each_with_index do |this_shoe,index|
    if this_shoe > biggest_shoe_size
      biggest_shoe_size = this_shoe
      target_player = names[index]
    end
  end
  return target_player
end

def big_shoe_rebounds
  target_player = player_with_biggest_shoes
  game_hash.each do |location,attributes|
    attributes.each do |attribute,value|
      if attribute == :players
        value.each do |player,stat_cloud|
          if player == target_player
            stat_cloud.each do |stat,num|
              if stat == :rebounds
                return num
              end
            end
          end
        end
      end
    end
  end
end





















#
