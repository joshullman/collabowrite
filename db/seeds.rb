user = User.create(email: "guest@aol.com", username: "Guest Account")
user = User.create(email: "CaptainPlanet@aol.com", username: "CaptainPlanet")
user = User.create(email: "Kuzy@aol.com", username: "Kuzy")
user = User.create(email: "BuffaloKing@aol.com", username: "BuffaloKing")
user = User.create(email: "TheWizard@aol.com", username: "TheWizard")
user = User.create(email: "Banana@aol.com", username: "Banana")
user = User.create(email: "BlackWidow@aol.com", username: "BlackWidow")
user = User.create(email: "TheSaxMan@aol.com", username: "TheSaxMan")
user = User.create(email: "Carissi@aol.com", username: "Carissi")
user = User.create(email: "Chompy@aol.com", username: "Chompy")
user = User.create(email: "WolfMan@aol.com", username: "WolfMan")
user = User.create(email: "MasterMike@aol.com", username: "MasterMike")
user = User.create(email: "WhitePearl@aol.com", username: "WhitePearl")
user = User.create(email: "Kassanova@aol.com", username: "Kassanova")
user = User.create(email: "Scoob@aol.com", username: "Scoobs")
user = User.create(email: "Chefe@aol.com", username: "Chefe")
user = User.create(email: "TheAdmiral@aol.com", username: "TheAdmiral")
user = User.create(email: "Jenga@aol.com", username: "Jenga")
user = User.create(email: "Banner@aol.com", username: "Banner")
user = User.create(email: "BigKahuna@aol.com", username: "BigKahuna")
user = User.create(email: "BennyAndTheJets@aol.com", username: "BennyAndTheJets")
user = User.create(email: "TheDragon@aol.com", username: "TheDragon")
user = User.create(email: "EZE@aol.com", username: "EZE")
user = User.create(email: "ActionHank@aol.com", username: "ActionHank")
user = User.create(email: "TheMatador@aol.com", username: "TheMatador")
user = User.create(email: "SubZero@aol.com", username: "SubZero")
user = User.create(email: "WildCard@aol.com", username: "WildCard")
user = User.create(email: "Tasty@aol.com", username: "Tasty")
user = User.create(email: "KarateKid@aol.com", username: "KarateKid")
user = User.create(email: "Boomer@aol.com", username: "Boomer")
user = User.create(email: "TomTom@aol.com", username: "TomTom")
user = User.create(email: "BrickThorn@aol.com", username: "BrickThorn")
user = User.create(email: "ChampMan@aol.com", username: "ChampMan")
user = User.create(email: "FrogPrince@aol.com", username: "FrogPrince")

Group.create(title: "Collabowrite Feedback", description: "feedback for Collabowrite", is_private: true, hidden: false)
GroupUser.create(user_id: 1, group_id: 1, mod: true, accepted: true)
30.times do
	is_private = rand(2)
	is_private == 1 ? is_private = true : is_private = false
	hidden = rand(2)
	hidden == 1 ? hidden = true : hidden = false
	group = Group.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, is_private: is_private, hidden: hidden)
	user = rand(User.all.length) + 1
	GroupUser.create(user_id: user, group_id: group.id, mod: true, accepted: true) if !GroupUser.where(user_id: user, group_id: group.id).first
end

150.times do
	user = rand(User.all.length) + 1
	group = rand(Group.all.length) + 1
	if !GroupUser.where(user_id: user, group_id: group).first
		mod = rand(2)
		mod == 1 ? mod = true : mod = false
		if mod
			accepted = true
		else
			accepted = rand(2)
			accepted == 1 ? accepted = true : accepted = false
		end
		GroupUser.create(user_id: user, group_id: group, mod: mod, accepted: accepted)
	end
end

150.times do
	user = rand(User.all.length) + 1
	flip = rand(2)
	flip == 1 ? is_private = true : is_private = false
	Script.create(user_id: user, title: Faker::Company.name, logline: Faker::Company.bs, description: Faker::Lorem.paragraph, is_private: is_private)
end

150.times do
	user = User.all.sample
	group = user.groups.sample
	script = user.scripts.sample
	GroupScript.create(group_id: group.id, script_id: script.id) if group && script && !GroupScript.where(group_id: group.id, script_id: script.id).first
end

500.times do
	user = User.all.sample
	user_two = User.all.sample
	script = user.scripts.sample
	script.comments.create(content: Faker::Lorem.paragraph, user_id: user_two.id) if script && user != user_two
end

150.times do
	group = Group.all.sample
	user = group.members.sample
	group.comments.create(content: Faker::Lorem.paragraph, user_id: user.id) if user
end