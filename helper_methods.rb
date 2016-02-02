class TeamRandomizer

#names is an array of names
#number is an integer and represent the total number of teams

def self.team_count(names, number)
  if number > names.length
    return "ERROR: Too few people for the number of teams"
  end
  teams = []
  people_per_team = (names.length / number)
  names_random = names.shuffle
  while teams.length < number
    teams << names_random.slice!(0, people_per_team)
  end

  count = 0
  while names_random.size > 0
    teams[count] << names_random.pop
    count += 1
  end

  teams
end

def self.per_team(names, number)
  if number > names.length
    return "ERROR: Too few people for the number of teams"
  end
  teams = []
  number_of_teams = (names.length / number.to_f).ceil
  people_per_team = (names.length / number_of_teams)
  names_random = names.shuffle
  while teams.length < number_of_teams
    teams << names_random.slice!(0, people_per_team)
  end


  count = 0
  while names_random.size > 0
    teams[count] << names_random.pop
    count += 1
  end
  teams
end

end
