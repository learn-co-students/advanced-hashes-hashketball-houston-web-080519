def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          stats: {
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
           assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          }
        }, {
          player_name: "Reggie Evans",
          stats: {
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          }
        }, {
          player_name: "Brook Lopez",
          stats:{
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          }
        }, {
          player_name: "Mason Plumlee",
          stats:{
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          }
        }, {
          player_name: "Jason Terry",
          stats: {
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
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          stats: {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          }
        }, {
          player_name: "Bismack Biyombo",
          stats:{
            number: 0,
            shoe: 16,
            points: 12,
            rebounds: 4,
            assists: 7,
            steals: 22,
            blocks: 15,
            slam_dunks: 10
          }
        }, {
          player_name: "DeSagna Diop",
          stats:{
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5
          }
        }, {
          player_name: "Ben Gordon",
          stats: {
            number: 8,
            shoe: 15,
            points: 33,
            rebounds: 3,
            assists: 2,
            steals: 1,
            blocks: 1,
            slam_dunks: 0
          }
        },{
          player_name: "Kemba Walker",
          stats:{
            number: 33,
            shoe: 15,
            points: 6,
            rebounds: 12,
            assists: 12,
            steals: 7,
            blocks: 5,
           slam_dunks: 12
          }
        }
    ]
    }
  }
end
def num_points_scored(player_name)
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
 all_players.each do |player|
    if player_name == player[:player_name]
      return player[:stats][:points]
    end
end 
end 

def shoe_size(player_name)
   all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
 all_players.each do |player|
    if player_name == player[:player_name]
      return player[:stats][:shoe]
    end
end 
end 
  
def team_colors(team)
  if team == game_hash[:home][:team_name]
    return game_hash[:home][:colors]
  else 
    return game_hash[:away][:colors]
  end
end
    
def team_names
  teams = []
  teams.push(game_hash[:home][:team_name])
  teams.push(game_hash[:away][:team_name])
  return teams
end
  
def player_numbers(team_name)
  new = []
 if team_name == "Brooklyn Nets"
   allplayers = game_hash[:home][:players]
   allplayers.each do |player|
     new.push(player[:stats][:number])
   end
 else 
   allnumbers = game_hash[:away][:players]
   allnumbers.each do |player|
     new.push(player[:stats][:number])
 end
end
return new
end
def player_stats(name)
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
 all_players.each do |player|
    if name == player[:player_name]
      return player[:stats]
    end
end 
end 


def big_shoe_rebounds
  biggest_shoe = 0 
  name = nil 
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  all_players.each do |player|
    if player[:stats][:shoe] > biggest_shoe
      biggest_shoe = player[:stats][:shoe]
      name = player[:player_name]
    end 
  end
  #has mason 
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
 all_players.each do |player|
    if name == player[:player_name]
      return player[:stats][:rebounds]
    end
end 
end

def most_points_scored
  most = 0 
  name = nil
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  all_players.each do |player|
    if player[:stats][:points] > most
      most = player[:stats][:points]
      name = player[:player_name]
    end
  end
  name
end 

def winning_team
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  home_points = 0 
  away_points = 0 
  
  home_players.each do |players|
    home_points += players[:stats][:points]
  end 
  
  away_players.each do |players|
    away_points+= players[:stats][:points]
  end 
  
  if home_points > away_points
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end
end 

def player_with_longest_name
  longest = 0 
  name = nil 
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  all_players.each do |player|
    if player[:player_name].length > longest
      longest = player[:player_name].length
      name = player[:player_name]
    end
  end
  name
end 

def long_name_steals_a_ton?
  longest = 0 
  name1 = nil 
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  all_players.each do |player|
    if player[:player_name].length > longest
      longest = player[:player_name].length
      name = player[:player_name]
    end
  end
# above for name
# below for steals

  most = 0 
  name2 = nil
  all_players = game_hash[:home][:players].concat(game_hash[:away][:players])
  all_players.each do |player|
    if player[:stats][:steals] > most
      most = player[:stats][:steals]
      name = player[:player_name]
    end
  end
  # check if both names is same 
  if name1 == name2
    return true 
  else
    return false 
  end 
end 

  
  
    
  
  
  