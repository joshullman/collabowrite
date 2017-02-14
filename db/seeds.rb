User.create(email: "guest@aol.com", password: "password", name: "Guest Account")
User.create(email: "CaptainPlanet@aol.com", password: "password", name: "CaptainPlanet")
User.create(email: "Kuzy@aol.com", password: "password", name: "Kuzy")
User.create(email: "BuffaloKing@aol.com", password: "password", name: "BuffaloKing")
User.create(email: "TheWizard@aol.com", password: "password", name: "TheWizard")
User.create(email: "Banana@aol.com", password: "password", name: "Banana")
User.create(email: "BlackWidow@aol.com", password: "password", name: "BlackWidow")
User.create(email: "TheSaxMan@aol.com", password: "password", name: "TheSaxMan")
User.create(email: "Carissi@aol.com", password: "password", name: "Carissi")
User.create(email: "Chompy@aol.com", password: "password", name: "Chompy")
User.create(email: "WolfMan@aol.com", password: "password", name: "WolfMan")
User.create(email: "MasterMike@aol.com", password: "password", name: "MasterMike")
User.create(email: "WhitePearl@aol.com", password: "password", name: "WhitePearl")
User.create(email: "Kassanova@aol.com", password: "password", name: "Kassanova")
User.create(email: "Scoobs@aol.com", password: "password", name: "Scoobs")
User.create(email: "Chefe@aol.com", password: "password", name: "Chefe")
User.create(email: "TheAdmiral@aol.com", password: "password", name: "TheAdmiral")
User.create(email: "Jenga@aol.com", password: "password", name: "Jenga")
User.create(email: "Banner@aol.com", password: "password", name: "Banner")
User.create(email: "BigKahuna@aol.com", password: "password", name: "BigKahuna")
User.create(email: "BennyAndTheJets@aol.com", password: "password", name: "BennyAndTheJets")
User.create(email: "TheDragon@aol.com", password: "password", name: "TheDragon")
User.create(email: "EZE@aol.com", password: "password", name: "EZE")
User.create(email: "ActionHank@aol.com", password: "password", name: "ActionHank")
User.create(email: "TheMatador@aol.com", password: "password", name: "TheMatador")
User.create(email: "SubZero@aol.com", password: "password", name: "SubZero")
User.create(email: "WildCard@aol.com", password: "password", name: "WildCard")
User.create(email: "Tasty@aol.com", password: "password", name: "Tasty")
User.create(email: "KarateKid@aol.com", password: "password", name: "KarateKid")
User.create(email: "Boomer@aol.com", password: "password", name: "Boomer")
User.create(email: "TomTom@aol.com", password: "password", name: "TomTom")
User.create(email: "BrickThorn@aol.com", password: "password", name: "BrickThorn")
User.create(email: "ChampMan@aol.com", password: "password", name: "ChampMan")
User.create(email: "FrogPrince@aol.com", password: "password", name: "FrogPrince")

15.times do
	flip = rand(2)
	flip == 1 ? is_private = true : is_private = false
	Group.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, is_private: is_private)
end

100.times do
	user = rand(34) + 1
	group = rand(10) + 1
	if Group.find(group).mods.empty?
		GroupUser.create(user_id: user, group_id: group, mod: true)
	elsif !GroupUser.where(user_id: user, group_id: group).first
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