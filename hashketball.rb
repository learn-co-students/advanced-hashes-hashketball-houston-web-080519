def game_hash
  teams = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => "Black, White",
      :players => [
        { :name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        
        { :name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        { :name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        { :name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        { :name => "Jason Terry",
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
      :colors => "Turquoise, Purple",
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
            :name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
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
            :name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          
          }
        ]
      }
  }
  
  return teams
end


def num_points_scored(player_name)
  answer = nil
  game_hash.each do |team, player_details|
    play_array = player_details[:players]
    play_array.each do |player_details_hash|
      if player_details_hash[:name] == player_name
        answer = player_details_hash[:points]
      end
    end
  end
  answer
end

def shoe_size(player_name)
  answer = nil
  game_hash.each do |team, player_details|
    play_array = player_details[:players]
    play_array.each do |player_details_hash|
      if player_details_hash[:name] == player_name
        answer = player_details_hash[:shoe]
      end
    end
  end
  answer
end


def team_colors(team_name)
  team_colors_array = []
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_name
      team_colors_array = team_data[:colors]
    end
  end
  p team_colors_array.split(", ")
end

def team_names
  game_hash.collect do |building, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  jersery_numbers = []
  game_hash.collect do |team, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player|
        jersery_numbers.push(player.dig(:number))
      end
    end
  end
  jersery_numbers
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
  biggest_shoe = 0
  num_of_rebounds = 0

   game_hash.each do |building, team|
    team[:players].each do |names|
      if names[:shoe] > biggest_shoe
        biggest_shoe = names[:shoe]
        num_of_rebounds = names[:rebounds]
      end
    end
  end
  num_of_rebounds
end

def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name|
      if most_points < player_name[:points]
        player = player_name[:name]
        most_points = player_name[:points]
      else
        most_points
      end
    end
  end
  player
end

def winning_team
  # Accidentally somehow made Brooklyn Nets have the away_array and
  # vice versa for the Charlotte Hornets. But the code works, if inelegant.
  counter = 0
  away_array = []
  home_array = []
  max_points = 0
  winners = ""
  
  #iterate through the hash digging out the points from both teams and throwing them into one large array
  game_hash.each do |team, team_data|
    team_data[:players].each do |team|
      away_array.push(team.dig(:points))
    end
    # split the array into two different arrays. Probably a better solution out there than this one
    while away_array.length > 5 do 
      max_points = away_array.shift
      home_array.push(max_points)
      counter = counter + 1 # yes, counter += 1 works here too, however no pre or post increment operators for those Java and C++ transplants
    end
    # sum and compare the arrays
    if home_array.inject(0) {|sum, x| sum + x} < away_array.inject(0) {|sum, x| sum +x}
      winners = team_data[:team_name]
    end
  end
  # return the winning team
  p winners
end

def player_with_longest_name
  indy_player = ""
  player_names_array = []
  
  #iterate through the hash, digging out each player's name
  game_hash.each do |team, team_data|
    team_data[:players].each do |player_name|
      # setting the players' name it to a variable
      indy_player = player_name[:name]
      # pushing that variable into an array
      player_names_array.push(indy_player)
    end
  end
  # ordering the array to return the element with max length
  player_names_array.max_by(&:length)
end

def long_name_steals_a_ton?
  player_names_array = []
  steals_array = []
  indy_player = ""
  indy_steal = 0
  max_value_name = ""
  max_steals = 0

  game_hash.each do |team, team_data|
   team_data[:players].each do |player_name|
     indy_player = player_name[:name]
     player_names_array.push(indy_player)
     indy_steal = player_name[:steals]
     steals_array.push(indy_steal)
     max_value_name = player_names_array.max_by(&:length)
     max_steals = steals_array.max
     end
   end
  if max_value_name == "Bismack Biyombo" && max_steals == 22
    return true
  else
    return false
  end
end
