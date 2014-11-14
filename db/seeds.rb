# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
User.destroy_all
User.create(email: 'gadigottlieb@gmail.com', password: 'hello123', password_confirmation: 'hello123', name: 'Gadi Gottlieb', role: 2)
Statistic.destroy_all
Player.destroy_all
Game.destroy_all
Season.destroy_all

twenty_fourteen = Season.create({
  year: 2014,
  wins: 6,
  losses: 0,
  runs_scored: 97,
  runs_allowed: 27
  })

twenty_thirteen = Season.create({
  year: 2013,
  wins: 5,
  losses: 1,
  runs_scored: 70,
  runs_allowed: 34,
  })

twenty_twelve = Season.create({
  year: 2012,
  wins: 5,
  losses: 3,
  runs_scored: 69,
  runs_allowed: 37,
  })

dovi = Player.create({
  first_name: "Dovi",
  last_name: "Faivish",
  number: 00,
  primary_position: "P",
  secondary_position: "OF | 3B",
  position_description: "Pitchers",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Dovi has been plagued with ankle injuries for the last few years.
  He made his return to the Moonrakers in the summer of 2014 where he helped
  fill in as the starting pitcher. Dovi's unique batting swing springs fear in
  opposing pitchers.",
  height: "5'9",
  weight: 180,
  birthday: "25-2-1978"
  })

gellis = Player.create({
  first_name: "Jonathan",
  last_name: "Gellis",
  number: 11,
  primary_position: "CF",
  secondary_position: "SC | 3B",
  position_description: "Outfielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Jon's leadership on the field has helped the Moonrakers win many
  close games. When an umpire blows a call, Jon will be the first one to express
  the teams views in calm manner. Jon had some big hits for the Moonrakers and
  played a key role in the last two division championships.",
  height: "5'7",
  weight: 185,
  birthday: "28-12-1971"
  })

leib = Player.create({
  first_name: "Leib",
  last_name: "Gershkovich",
  number: 10,
  primary_position: "SC",
  secondary_position: "RF",
  position_description: "Outfielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "",
  height: "6'0",
  weight: 190,
  birthday: "31-3-1973"
  })

shai = Player.create({
  first_name: "Shai",
  last_name: "Gerson",
  number: 0,
  primary_position: "3B",
  secondary_position: "SS",
  position_description: "Infielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Shai's ability to play the hot corner helped the Moonrakers
  tremendously. His ability to hit to opposite field drove in many runs. If only
  he can give the Moonrakers full commitment, they'll be better than ever!",
  height: "5'11",
  weight: 190,
  birthday: "1-1-1900"
  })

jbomb = Player.create({
  first_name: "Jeremy",
  last_name: "Goldzal",
  number: 33,
  primary_position: "C",
  secondary_position: "P",
  position_description: "Catchers",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "When you think of Jeremy, aka JBOMB, you think Crazy. His golf
  swing is good one homerun every summer. His ability to run the bases is
  unmatched by anyone. His willing to slide head or feet first makes him such a
  great player.",
  height: "5'6",
  weight: 200,
  birthday: "1-1-1982"
  })

david = Player.create({
  first_name: "David",
  last_name: "Gottlieb",
  number: 34,
  primary_position: "1B",
  secondary_position: "OF",
  position_description: "Infielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Moonshots. That's what happens when pitchers pitch to David. His
  raw power and bat speed has established David as the cleanup hitter for the
  Moonrakers. Over the years, David has lead the Moonrakers in Homeruns. Now if
  he can start running for himself when he gets on base, the entire team would
  appreciate it.",
  height: "6'0",
  weight: 205,
  birthday: "10-10-1981"
  })

gadi = Player.create({
  first_name: "Gadi",
  last_name: "Gottlieb",
  number: 24,
  primary_position: "LF",
  secondary_position: "OF",
  position_description: "Outfielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Outfielders",
  height: "5'9",
  weight: 160,
  birthday: "16-5-1990"
  })

heshy = Player.create({
  first_name: "Heshy",
  last_name: "Gottlieb",
  number: 44,
  primary_position: "LF",
  secondary_position: "OF | 3B | P",
  position_description: "Outfielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Outfielders",
  height: "5'8",
  weight: 195,
  birthday: "4-1-1949"
  })

josh = Player.create({
  first_name: "Josh",
  last_name: "Gottlieb",
  number: 14,
  primary_position: "CF",
  secondary_position: "OF | 1B",
  position_description: "Outfielders",
  bats: "L",
  throws: "L",
  photo: "gadigottlieb.JPG",
  description: "Outfielders",
  height: "6'3",
  weight: 220,
  birthday: "8-9-1983"
  })

mordechai = Player.create({
  first_name: "Mordechai",
  last_name: "Gottlieb",
  number: 26,
  primary_position: "LF",
  secondary_position: "OF",
  position_description: "Outfielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Outfielders",
  height: "5'11",
  weight: 210,
  birthday: "22-3-1980"
  })

roni = Player.create({
  first_name: "Roni",
  last_name: "Gottlieb",
  number: 54,
  primary_position: "RF",
  secondary_position: "OF",
  position_description: "Outfielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "",
  height: "5'10",
  weight: 140,
  birthday: "19-8-1996"
  })

isaacs = Player.create({
  first_name: "Yosef",
  last_name: "Isaacs",
  number: 15,
  primary_position: "2B",
  secondary_position: "C",
  position_description: "Infielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Infielders",
  height: "5'11",
  weight: 190,
  birthday: "1-1-1900"
  })

shalom = Player.create({
  first_name: "Shalom",
  last_name: "Motechin",
  number: 77,
  primary_position: "P",
  secondary_position: "SS",
  position_description: "Pitchers",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "Pitchers",
  height: "5'8",
  weight: 180,
  birthday: "19-7-1971"
  })

moshe = Player.create({
  first_name: "Moshe",
  last_name: "Rapfogel",
  number: 49,
  primary_position: "2B",
  secondary_position: "1B | C",
  position_description: "Infielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "",
  height: "5'8",
  weight: 200,
  birthday: "11-5-1991"
  })

willie = Player.create({
  first_name: "Willie",
  last_name: "Rapfogel",
  number: 7,
  primary_position: "1B",
  secondary_position: "SS",
  position_description: "Infielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "",
  height: "5'8",
  weight: 200,
  birthday: "11-5-1991"
  })

yaakov = Player.create({
  first_name: "Yaakov",
  last_name: "Rosenberg",
  number: 1,
  primary_position: "CF",
  secondary_position: "OF",
  position_description: "Outfielders",
  bats: "L",
  throws: "L",
  photo: "gadigottlieb.JPG",
  description: "",
  height: "5'11",
  weight: 185,
  birthday: "5-9-1981"
  })

kenny = Player.create({
  first_name: "Kenny",
  last_name: "Schiff",
  number: 2,
  primary_position: "SS",
  secondary_position: "LF",
  position_description: "Infielders",
  bats: "R",
  throws: "R",
  photo: "gadigottlieb.JPG",
  description: "",
  height: "5'9",
  weight: 165,
  birthday: "1-1-1900"
  })
###############
# GAMES  2014 #
###############
game_1 = Game.create({
  opponent: "Twin Bridge Tigers",
  home_score: 11,
  opponent_score: 4,
  win_result: true,
  date: "6-7-2014",
  home_first_inning: 1,
  home_second_inning: 1,
  home_third_inning: 0,
  home_fourth_inning: 0,
  home_fifth_inning: 0,
  home_sixth_inning: 0,
  home_seventh_inning: 1,
  home_eigth_inning: 8,
  home_ninth_inning: 0,
  opponent_first_inning: 1,
  opponent_second_inning: 2,
  opponent_third_inning: 0,
  opponent_fourth_inning: 0,
  opponent_fifth_inning: 0,
  opponent_sixth_inning: 0,
  opponent_seventh_inning: 1,
  opponent_eigth_inning: 0,
  opponent_ninth_inning: 0,
  season_id: twenty_fourteen.id
  })
game_2 = Game.create({
  opponent: "Beaver Lake Topps",
  home_score: 26,
  opponent_score: 5,
  win_result: true,
  date: "13-7-2014",
  home_first_inning: 6,
  home_second_inning: 2,
  home_third_inning: 3,
  home_fourth_inning: 0,
  home_fifth_inning: 7,
  home_sixth_inning: 3,
  home_seventh_inning: 2,
  home_eigth_inning: 3,
  home_ninth_inning: 0,
  opponent_first_inning: 0,
  opponent_second_inning: 0,
  opponent_third_inning: 1,
  opponent_fourth_inning: 0,
  opponent_fifth_inning: 0,
  opponent_sixth_inning: 1,
  opponent_seventh_inning: 1,
  opponent_eigth_inning: 2,
  opponent_ninth_inning: 0,
  season_id: twenty_fourteen.id
  })
game_3 = Game.create({
  opponent: "Garden View Mountain Lions",
  home_score: 17,
  opponent_score: 4,
  win_result: true,
  date: "20-7-2014",
  season_id: twenty_fourteen.id
  })
game_4 = Game.create({
  opponent: "Vacation Villagers",
  home_score: 16,
  opponent_score: 8,
  win_result: true,
  date: "3-8-2014",
  season_id: twenty_fourteen.id
  })
game_5 = Game.create({
  opponent: "Beaver Lake Topps",
  home_score: 9,
  opponent_score: 2,
  win_result: true,
  date: "10-8-2014",
  season_id: twenty_fourteen.id
  })
game_6 = Game.create({
  opponent: "Twin Bridge Tigers",
  home_score: 18,
  opponent_score: 4,
  win_result: true,
  date: "17-8-2014",
  season_id: twenty_fourteen.id
  })

################
#  Games 2013  #
################

game_thirteen_a = Game.create({
  opponent: "Fallsview",
  home_score: 13,
  opponent_score: 4,
  win_result: true,
  date: "30-6-2013",
  season_id: twenty_thirteen.id
  })
game_thirteen_b = Game.create({
  opponent: "Beaver Lake Topps",
  home_score: 6,
  opponent_score: 5,
  win_result: true,
  date: "7-7-2013",
  season_id: twenty_thirteen.id
  })
game_thirteen_c = Game.create({
  opponent: "Garden View Mountain Lions",
  home_score: 21,
  opponent_score: 11,
  win_result: true,
  date: "14-7-2013",
  season_id: twenty_thirteen.id
  })
game_thirteen_d = Game.create({
  opponent: "Yifeiarades",
  home_score: 16,
  opponent_score: 0,
  win_result: true,
  date: "21-7-2013",
  season_id: twenty_thirteen.id
  })
game_thirteen_e = Game.create({
  opponent: "Garden View Mountain Lions",
  home_score: 6,
  opponent_score: 9,
  win_result: false,
  date: "4-8-2013",
  season_id: twenty_thirteen.id
  })
game_thirteen_f = Game.create({
  opponent: "Vacation Villagers",
  home_score: 8,
  opponent_score: 5,
  win_result: true,
  date: "11-8-2013",
  season_id: twenty_thirteen.id
  })

################
#  Games 2012  #
################

game_twelve_a = Game.create({
  opponent: "Vacation Villagers",
  home_score: 3,
  opponent_score: 9,
  win_result: false,
  date: "1-7-2012",
  season_id: twenty_twelve.id
  })
game_twelve_b = Game.create({
  opponent: "Beaver Lake Topps",
  home_score: 7,
  opponent_score: 3,
  win_result: false,
  date: "1-7-2012",
  season_id: twenty_twelve.id
  })
game_twelve_c = Game.create({
  opponent: "Garden View Mountain Lions",
  home_score: 16,
  opponent_score: 2,
  win_result: true,
  date: "15-7-2012",
  season_id: twenty_twelve.id
  })
game_twelve_d = Game.create({
  opponent: "Beaver Lake Topps",
  home_score: 14,
  opponent_score: 2,
  win_result: true,
  date: "22-7-2012",
  season_id: twenty_twelve.id
  })
game_twelve_e = Game.create({
  opponent: "Beaver Lake Topps",
  home_score: 2,
  opponent_score: 3,
  win_result: false,
  date: "22-7-2012",
  season_id: twenty_twelve.id
  })
game_twelve_f = Game.create({
  opponent: "Old Laners",
  home_score: 6,
  opponent_score: 5,
  win_result: true,
  date: "5-8-2012",
  season_id: twenty_twelve.id
  })
game_twelve_g = Game.create({
  opponent: "Fallsview",
  home_score: 18,
  opponent_score: 3,
  win_result: true,
  date: "12-8-2012",
  season_id: twenty_twelve.id
  })
game_twelve_h = Game.create({
  opponent: "Old Laners",
  home_score: 3,
  opponent_score: 10,
  win_result: true,
  date: "19-8-2012",
  season_id: twenty_twelve.id
  })
##############
#Season Roster #
##############
twenty_fourteen.players.push(dovi, gellis, leib, shai, jbomb, david, gadi, heshy, josh, mordechai, roni, isaacs, shalom, moshe, yaakov, kenny)
twenty_thirteen.players.push(gellis, leib, shai, jbomb, david, gadi, heshy, josh, mordechai, roni, isaacs, shalom, moshe, willie, yaakov, kenny)
twenty_twelve.players.push(gellis, leib, jbomb, david, gadi, roni, isaacs, shalom, moshe, willie, kenny)

################
# Game 1 Stats #
################
kenny_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 1,
    hits: 1,
    doubles: 0,
    triples: 0,
    homers: 0,
    rbis: 0,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: kenny.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
gellis_game_one = Statistic.create({
    played: true,
    at_bats: 3,
    runs: 1,
    hits: 2,
    doubles: 1,
    triples: 0,
    homers: 0,
    rbis: 1,
    walks: 1,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: gellis.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
gadi_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 2,
    hits: 2,
    doubles: 0,
    triples: 0,
    homers: 1,
    rbis: 3,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: gadi.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
david_game_one = Statistic.create({
    played: true,
    at_bats: 3,
    runs: 1,
    hits: 2,
    doubles: 1,
    triples: 0,
    homers: 1,
    rbis: 3,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 1,
    player_id: david.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
moshe_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 1,
    hits: 1,
    doubles: 0,
    triples: 1,
    homers: 0,
    rbis: 1,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 1,
    sac_fly: 0,
    player_id: moshe.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
shai_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 1,
    hits: 3,
    doubles: 1,
    triples: 1,
    homers: 0,
    rbis: 1,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: shai.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
roni_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 0,
    hits: 0,
    doubles: 0,
    triples: 0,
    homers: 0,
    rbis: 1,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: roni.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
jbomb_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 1,
    hits: 1,
    doubles: 0,
    triples: 1,
    homers: 0,
    rbis: 1,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: jbomb.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
leib_game_one = Statistic.create({
    played: true,
    at_bats: 3,
    runs: 1,
    hits: 2,
    doubles: 1,
    triples: 0,
    homers: 0,
    rbis: 0,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 1,
    sac_fly: 0,
    player_id: leib.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
isaacs_game_one = Statistic.create({
    played: true,
    at_bats: 3,
    runs: 0,
    hits: 0,
    doubles: 0,
    triples: 0,
    homers: 0,
    rbis: 0,
    walks: 1,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: isaacs.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
shalom_game_one = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 0,
    hits: 0,
    doubles: 0,
    triples: 0,
    homers: 0,
    rbis: 0,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: shalom.id,
    game_id: game_1.id,
    season_id: twenty_fourteen.id
  })
game_1.players.push(kenny, gellis, gadi, david, moshe, shai, roni, jbomb, leib, isaacs, shalom)

################
# Game 2 Stats #
################
kenny_game_two = Statistic.create({
    played: true,
    at_bats: 5,
    runs: 4,
    hits: 3,
    doubles: 2,
    triples: 0,
    homers: 0,
    rbis: 0,
    walks: 2,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: kenny.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
gellis_game_two = Statistic.create({
    played: true,
    at_bats: 6,
    runs: 4,
    hits: 5,
    doubles: 1,
    triples: 0,
    homers: 0,
    rbis: 2,
    walks: 1,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: gellis.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
gadi_game_two = Statistic.create({
    played: true,
    at_bats: 5,
    runs: 4,
    hits: 4,
    doubles: 1,
    triples: 0,
    homers: 1,
    rbis: 5,
    walks: 1,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: gadi.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
david_game_two = Statistic.create({
    played: true,
    at_bats: 5,
    runs: 4,
    hits: 3,
    doubles: 1,
    triples: 0,
    homers: 2,
    rbis: 3,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: david.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
moshe_game_two = Statistic.create({
    played: true,
    at_bats: 5,
    runs: 1,
    hits: 3,
    doubles: 0,
    triples: 0,
    homers: 1,
    rbis: 5,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 1,
    player_id: moshe.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
shai_game_two = Statistic.create({
    played: true,
    at_bats: 6,
    runs: 4,
    hits: 5,
    doubles: 1,
    triples: 1,
    homers: 1,
    rbis: 5,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: shai.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
dovi_game_two = Statistic.create({
    played: true,
    at_bats: 6,
    runs: 1,
    hits: 3,
    doubles: 0,
    triples: 1,
    homers: 0,
    rbis: 3,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: dovi.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
jbomb_game_two = Statistic.create({
    played: true,
    at_bats: 6,
    runs: 2,
    hits: 3,
    doubles: 0,
    triples: 1,
    homers: 0,
    rbis: 0,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: jbomb.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
roni_game_two = Statistic.create({
    played: true,
    at_bats: 6,
    runs: 1,
    hits: 2,
    doubles: 0,
    triples: 1,
    homers: 1,
    rbis: 2,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: roni.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
shalom_game_two = Statistic.create({
    played: true,
    at_bats: 4,
    runs: 1,
    hits: 2,
    doubles: 0,
    triples: 1,
    homers: 0,
    rbis: 1,
    walks: 0,
    hit_by_pitch: 0,
    strikeouts: 0,
    sac_fly: 0,
    player_id: shalom.id,
    game_id: game_2.id,
    season_id: twenty_fourteen.id
  })
game_2.players.push(kenny, gellis, gadi, david, moshe, shai, dovi, jbomb, roni, shalom)
