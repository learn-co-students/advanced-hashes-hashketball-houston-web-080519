
require "pry"

def game_hash
    hash = {
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
                        :rebounds => 11,
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
    }, :away => {
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
            "Bismack Biyombo" => {
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
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
            "Kemba Walker" => {
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12
            }
            
        }
    }}
    end


def num_points_scored(player)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.include?(player)
               return game_hash[location][attribute][player][:points]
                end
            end
        end
end

def shoe_size(player)
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.include?(player)
                return game_hash[location][attribute][player][:shoe]
                end
            end
        end
    end

def team_colors(name)
    game_hash.each do |location, team_data|
        if game_hash[location].values.include?(name)
            #if the values of either the :home or :away include? the team name we are looking for...
            team_data.each do |attribute, value|
                #... then we iterate through those values (team_name, colors, players) ...
                if attribute == :colors
                    # ... and when we select the right attribute colors...
                    return value
                    # ... we return its value which is the array of colors.
                    end
                end
            end
        end
    end

            
def team_names
    array = []
    game_hash.each do |location, team_data|
            team_data.each do |attribute, value|
                if attribute == :team_name
                    array << value
            end
        end
    end
    return array
end

def player_numbers(team_name)
    array = []
    game_hash.each do |location, team_data|
        if game_hash[location].values.include?(team_name)
            team_data.each do |attribute, value|
                if attribute == :players
                    value.each do |name, stats|
                        array.push(game_hash[location][attribute][name][:number])
                        end
                    end
                end
            end
        end
    array
    end

def player_stats(player)
    hash = {}
    game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
            if data.include?(player)
                hash = game_hash[location][attribute][player]
                end
            end
        end
    hash
    end


def big_shoe_rebounds
    playerrebound = nil
    shoe_data = []
    biggest_shoesize = nil
    game_hash.collect do |location, team_data|
        team_data[:players].collect do |attribute, data|
            shoe_data.push(data[:shoe])
            biggest_shoesize = shoe_data.sort[-1]
            data.collect do |category, stat|
                if category == :shoe
                    if stat == biggest_shoesize
                        playerrebound =  data[:rebounds]
                    end
                end
            end
        end
    end
    playerrebound
end



def most_points_scored
    points_data = []
    most_points = nil
    name = nil
    game_hash.each do |location, team_data|
        team_data[:players].each do |attribute, data|
            points_data.push(data[:points])
            most_points = points_data.sort[-1]
        end
    end
    game_hash.each do |location, team_data|
        name = team_data[:players].each do |name, stats|
            if stats[:points] == most_points
                return name
          end
        end
      end
end

def winning_team
    home_points = []
    away_points = []
    game_hash.each do |location, team_data|
        game_hash[:home][:players].each do |attribute, data|
            home_points.push(data[:points])
            end
        end
    game_hash.each do |location, team_data|
        game_hash[:away][:players].each do |attribute, data|
            away_points.push(data[:points])
            end
        end
    if home_points.sum > away_points.sum
        return game_hash[:home][:team_name]
    else
        return game_hash[:away][:team_name]
    end
end


def player_with_longest_name
    list_of_names = []
    game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
            list_of_names.push(name)
            end
        end
    list_of_names.max_by(&:length)
end

def long_name_steals_a_ton?
    list_of_names = []
    most_steals = []
    game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
            list_of_names.push(name)
            most_steals.push(stats[:steals])
        end
    end
    game_hash.each do |location, team_data|
        team_data[:players].each do |name, stats|
            if name == list_of_names.max_by(&:length) && stats[:steals] == most_steals.max
                return true
            end
        end
    end
end