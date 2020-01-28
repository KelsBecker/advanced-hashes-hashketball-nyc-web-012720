require 'pry'

def game_hash
  { 
    :home => {:team_name => "Brooklyn Nets",
              :colors => ["Black", "White"],
              :players => [
                { :player_name => "Alan Anderson", 
                  :number => 0, 
                  :shoe => 16,
                  :points => 22,
                  :rebounds => 12, 
                  :assists => 12,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 1 }, 
                { :player_name => "Reggie Evans", 
                  :number => 30, 
                  :shoe => 14,
                  :points => 12,
                  :rebounds => 12, 
                  :assists => 12,
                  :steals => 12,
                  :blocks => 12,
                  :slam_dunks => 7 },
                { :player_name => "Brook Lopez", 
                  :number => 11, 
                  :shoe => 17,
                  :points => 17,
                  :rebounds => 19, 
                  :assists => 10,
                  :steals => 3,
                  :blocks => 1,
                  :slam_dunks => 15 },
                { :player_name => "Mason Plumlee", 
                  :number => 1, 
                  :shoe => 19,
                  :points => 26,
                  :rebounds => 11, 
                  :assists => 6,
                  :steals => 3,
                  :blocks => 8,
                  :slam_dunks => 5 },
                { :player_name => "Jason Terry", 
                  :number => 31, 
                  :shoe => 15,
                  :points => 19,
                  :rebounds => 2, 
                  :assists => 2,
                  :steals => 4,
                  :blocks => 11,
                  :slam_dunks => 1 }
                  ]
                },
    
    :away => {:team_name => "Charlotte Hornets", 
              :colors => ["Turquoise", "Purple"], 
              :players => [ 
                { :player_name => "Jeff Adrien",
                  :number => 4,
                  :shoe => 18,
                  :points => 10,
                  :rebounds => 1,
                  :assists => 1,
                  :steals => 2,
                  :blocks => 7,
                  :slam_dunks => 2 }, 
                { :player_name => "Bismack Biyombo",
                  :number => 0,
                  :shoe => 16,
                  :points => 12,
                  :rebounds => 4,
                  :assists => 7,
                  :steals => 22,
                  :blocks => 15,
                  :slam_dunks => 10 },
                { :player_name => "DeSagna Diop",
                  :number => 2,
                  :shoe => 14,
                  :points => 24,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 4,
                  :blocks => 5,
                  :slam_dunks => 5 },
                { :player_name => "Ben Gordon",
                  :number => 8,
                  :shoe => 15,
                  :points => 33,
                  :rebounds => 3,
                  :assists => 2,
                  :steals => 1,
                  :blocks => 1,
                  :slam_dunks => 0 },
                { :player_name => "Kemba Walker",
                  :number => 33,
                  :shoe => 15,
                  :points => 6,
                  :rebounds => 12,
                  :assists => 12,
                  :steals => 7,
                  :blocks => 5,
                  :slam_dunks => 12 }
                  ]
              }
           }
   end
   
   
def num_points_scored(player_name) #player_name = individual players name
  num_points = 0 
  game_hash.each do |team, stats| #team = :home and :away, stats = all the stats
    stats[:players].each do |player| #player = each players individiual stats
      if player[:player_name] == player_name # if the player name matches the name entered as the argument
       num_points = player[:points] # points scored by each player
      end
    end
  end
 num_points
end


def shoe_size(player_name)
  size = nil
  game_hash.each do |team, stats| #team = :home and :away, stats = all the stats
    stats[:players].each do |player|
      if player[:player_name] == player_name
       size = player[:shoe] #each players shoe size
     end
   end
 end
 size
end


def team_colors(team_name) #team_name = "Brooklyn Nets" and "Chorlotte Hornets"
  game_hash.each do |place, team_hash| #place = :home and :away, team_hash = the entire hash, by each team
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  end
end


def team_names #use .map instead of .each, because map returns an array
  game_hash.map do |place, team_hash|
  team_hash[:team_name]
  end
end


def player_numbers(team_name) #team_name = "Broolyn Nets" and "Charlotte Hornets"
  new_array = []
  game_hash.each do |place, team_hash|
    if team_hash[:team_name] == team_name
      team_hash.each do |team_info, value| #info = :team_name, :team_colors ect, value = "brooklyn nets"
        if team_info == :players
          value.each do |players| #players = individual player hash
            new_array << players[:number]
          end
        end
      end
    end
  end
  new_array
end


def player_stats(player_name)
  new_hash = {}
  game_hash.each do |place, team_hash|
    team_hash.each do |team_info, value| #team_info = :team_name :colors :players hash keys,value = "brooklyn nets" string
      if team_info == :players 
        value.each do |player| #value is an array, player = each individual player hash
          if player[:player_name] == player_name 
            new_hash = player.delete_if do |key, key_value|
              key == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end


def big_shoe_rebounds
  shoe_size = 0 
  rebounds = 0
  game_hash.each do |place, team_hash|
    team_hash[:players].each do |player| #player = each players hash
      if player[:shoe] > shoe_size
        shoe_size = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end










