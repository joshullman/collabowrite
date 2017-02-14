User.create(email: "guest@aol.com", password: "password", username: "Guest Account")
User.create(email: "CaptainPlanet@aol.com", password: "password", username: "CaptainPlanet")
User.create(email: "Kuzy@aol.com", password: "password", username: "Kuzy")
User.create(email: "BuffaloKing@aol.com", password: "password", username: "BuffaloKing")
User.create(email: "TheWizard@aol.com", password: "password", username: "TheWizard")
User.create(email: "Banana@aol.com", password: "password", username: "Banana")
User.create(email: "BlackWidow@aol.com", password: "password", username: "BlackWidow")
User.create(email: "TheSaxMan@aol.com", password: "password", username: "TheSaxMan")
User.create(email: "Carissi@aol.com", password: "password", username: "Carissi")
User.create(email: "Chompy@aol.com", password: "password", username: "Chompy")
User.create(email: "WolfMan@aol.com", password: "password", username: "WolfMan")
User.create(email: "MasterMike@aol.com", password: "password", username: "MasterMike")
User.create(email: "WhitePearl@aol.com", password: "password", username: "WhitePearl")
User.create(email: "Kassanova@aol.com", password: "password", username: "Kassanova")
User.create(email: "Scoobs@aol.com", password: "password", username: "Scoobs")
User.create(email: "Chefe@aol.com", password: "password", username: "Chefe")
User.create(email: "TheAdmiral@aol.com", password: "password", username: "TheAdmiral")
User.create(email: "Jenga@aol.com", password: "password", username: "Jenga")
User.create(email: "Banner@aol.com", password: "password", username: "Banner")
User.create(email: "BigKahuna@aol.com", password: "password", username: "BigKahuna")
User.create(email: "BennyAndTheJets@aol.com", password: "password", username: "BennyAndTheJets")
User.create(email: "TheDragon@aol.com", password: "password", username: "TheDragon")
User.create(email: "EZE@aol.com", password: "password", username: "EZE")
User.create(email: "ActionHank@aol.com", password: "password", username: "ActionHank")
User.create(email: "TheMatador@aol.com", password: "password", username: "TheMatador")
User.create(email: "SubZero@aol.com", password: "password", username: "SubZero")
User.create(email: "WildCard@aol.com", password: "password", username: "WildCard")
User.create(email: "Tasty@aol.com", password: "password", username: "Tasty")
User.create(email: "KarateKid@aol.com", password: "password", username: "KarateKid")
User.create(email: "Boomer@aol.com", password: "password", username: "Boomer")
User.create(email: "TomTom@aol.com", password: "password", username: "TomTom")
User.create(email: "BrickThorn@aol.com", password: "password", username: "BrickThorn")
User.create(email: "ChampMan@aol.com", password: "password", username: "ChampMan")
User.create(email: "FrogPrince@aol.com", password: "password", username: "FrogPrince")

15.times do
	flip = rand(2)
	flip == 1 ? is_private = true : is_private = false
	group = Group.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, is_private: is_private)
	user = rand(34) + 1
	GroupUser.create(user_id: user, group_id: group.id, mod: true)
end

100.times do
	user = rand(34) + 1
	group = rand(10) + 1
	if !GroupUser.where(user_id: user, group_id: group).first
		flip = rand(2)
		flip == 1 ? is_mod = true : is_mod = false
		GroupUser.create(user_id: user, group_id: group, mod: is_mod)
	end
end

100.times do
	user = rand(34) + 1
	flip = rand(2)
	flip == 1 ? is_private = true : is_private = false
	Script.create(user_id: user, title: Faker::Company.name, description: Faker::Company.bs, is_private: is_private)
end

100.times do
	user = User.find(rand(34) + 1)
	group = user.groups.sample
	script = user.scripts.sample
	GroupScript.create(group_id: group.id, script_id: script.id) if group && script && !GroupScript.where(group_id: group.id, script_id: script.id).first
end