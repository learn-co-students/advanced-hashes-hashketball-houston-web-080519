def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end

def num_points_scored(sought_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players

      data.each do |player|
        return player[:points] if player[:player_name] == sought_player_name
      end
    end
  end
end

def shoe_size(sought_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players

      data.each do |player|
        return player[:shoe] if player[:player_name] == sought_player_name
      end
    end
  end
end

def team_colors(team_name)
  game_hash.values.each do |team|
    return team[:colors] if team[:team_name] == team_name
  end
end

def team_names
  game_hash.values.map {|data| data[:team_name]}
end

def player_numbers(team_name)
  game_hash.values.each do |team|
      if team[:team_name] == team_name
        return team[:players].map {|player| player[:number]}
      end
  end
end

def player_stats(player_name)
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:player_name] == player_name
        player.delete(:player_name)
        return player
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:shoe] > largest_shoe
        largest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end

def most_points_scored
  most = 0
  player_dude = ""
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:points] > most
        most = player[:points]
        player_dude = player[:player_name]
      end
    end
  end
  return player_dude
end

def winning_team
  points_total = 0
  new_hash = {}
  game_hash.values.each do |team|
    team[:players].each do |player|
      points_total += player[:points]
    end
    new_hash[team[:team_name]] = points_total
  end
  
  new_hash.key(new_hash.values.max)
  
end

def player_with_longest_name
  longest = ""
  names = []
  game_hash.values.each do |team|
    team[:players].each do |player|
      names << player[:player_name]
    end
  end
  names.max_by{|name| name.length}
end

def long_name_steals_a_ton?
  name_dude = player_with_longest_name
  most_steals = 0
  steals_dude = ""
  game_hash.values.each do |team|
    team[:players].each do |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
        steals_dude = player[:player_name]
      end
    end
  end
  
  return steals_dude == name_dude
end