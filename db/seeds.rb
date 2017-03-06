user = User.create(email: "guest@aol.com", username: "Guest Account")
user.avatar_remote_url = ("http://i.imgur.com/RmKwLcc.jpg")
user.save
user = User.create(email: "CaptainPlanet@aol.com", username: "CaptainPlanet")
user.avatar_remote_url = ("http://i.imgur.com/RugrMDh.jpg")
user.save
user = User.create(email: "Kuzy@aol.com", username: "Kuzy")
user.avatar_remote_url = ("http://i.imgur.com/SjD71UR.jpg")
user.save
user = User.create(email: "BuffaloKing@aol.com", username: "BuffaloKing")
user.avatar_remote_url = ("http://i.imgur.com/3cEejvv.jpg")
user.save
user = User.create(email: "TheWizard@aol.com", username: "TheWizard")
user.avatar_remote_url = ("http://i.imgur.com/Ppg4hKd.jpg")
user.save
user = User.create(email: "Banana@aol.com", username: "Banana")
user.avatar_remote_url = ("http://i.imgur.com/6QY1qKJ.png")
user.save
user = User.create(email: "BlackWidow@aol.com", username: "BlackWidow" )
user.avatar_remote_url = ("http://i.imgur.com/OPFPydc.jpg")
user.save
user = User.create(email: "TheSaxMan@aol.com", username: "TheSaxMan" )
user.avatar_remote_url = ("http://i.imgur.com/2VV5ScK.jpg")
user.save
user = User.create(email: "Carissi@aol.com", username: "Carissi" )
user.avatar_remote_url = ("http://i.imgur.com/PkHG0XT.jpg")
user.save
user = User.create(email: "Chompy@aol.com", username: "Chompy" )
user.avatar_remote_url = ("http://i.imgur.com/tCPOkvF.png")
user.save
user = User.create(email: "WolfMan@aol.com", username: "WolfMan")
user.avatar_remote_url = ("http://i.imgur.com/BnklBdK.jpg")
user.save
user = User.create(email: "MasterMike@aol.com", username: "MasterMike")
user.avatar_remote_url = ("http://i.imgur.com/FGxiNmR.png")
user.save
user = User.create(email: "WhitePearl@aol.com", username: "WhitePearl")
user.avatar_remote_url = ("http://i.imgur.com/xxfQIdA.jpg")
user.save
user = User.create(email: "Kassanova@aol.com", username: "Kassanova")
user.avatar_remote_url = ("http://i.imgur.com/YoWjWt3.jpg")
user.save
user = User.create(email: "Scoobs@aol.com", username: "Scoobs")
user.avatar_remote_url = ("http://i.imgur.com/8PUIERR.jpg")
user.save
user = User.create(email: "Chefe@aol.com", username: "Chefe")
user.avatar_remote_url = ("http://i.imgur.com/raVKMVk.jpg")
user.save
user = User.create(email: "TheAdmiral@aol.com", username: "TheAdmiral")
user.avatar_remote_url = ("http://i.imgur.com/RmNLOx2.jpg")
user.save
user = User.create(email: "Jenga@aol.com", username: "Jenga")
user.avatar_remote_url = ("http://i.imgur.com/7Op03Z2.jpg")
user.save
user = User.create(email: "Banner@aol.com", username: "Banner")
user.avatar_remote_url = ("http://i.imgur.com/Z3uJhnG.jpg")
user.save
user = User.create(email: "BigKahuna@aol.com", username: "BigKahuna")
user.avatar_remote_url = ("http://i.imgur.com/ZrqNQ3P.jpg")
user.save
user = User.create(email: "BennyAndTheJets@aol.com", username: "BennyAndTheJets")
user.avatar_remote_url = ("http://i.imgur.com/HtQMrhr.jpg")
user.save
user = User.create(email: "TheDragon@aol.com", username: "TheDragon")
user.avatar_remote_url = ("http://i.imgur.com/dLCOEII.jpg")
user.save
user = User.create(email: "EZE@aol.com", username: "EZE")
user.avatar_remote_url = ("http://i.imgur.com/yOPVtz3.jpg")
user.save
user = User.create(email: "ActionHank@aol.com", username: "ActionHank")
user.avatar_remote_url = ("http://i.imgur.com/QhMKoJK.jpg")
user.save
user = User.create(email: "TheMatador@aol.com", username: "TheMatador")
user.avatar_remote_url = ("http://i.imgur.com/OZTDeXO.jpg")
user.save
user = User.create(email: "SubZero@aol.com", username: "SubZero")
user.avatar_remote_url = ("http://i.imgur.com/lFN5Ciw.jpg")
user.save
user = User.create(email: "WildCard@aol.com", username: "WildCard")
user.avatar_remote_url = ("http://i.imgur.com/B9p0dd3.jpg")
user.save
user = User.create(email: "Tasty@aol.com", username: "Tasty")
user.avatar_remote_url = ("http://i.imgur.com/No6NsgX.jpg")
user.save
user = User.create(email: "KarateKid@aol.com", username: "KarateKid")
user.avatar_remote_url = ("http://i.imgur.com/imnNKGN.jpg")
user.save
user = User.create(email: "Boomer@aol.com", username: "Boomer")
user.avatar_remote_url = ("http://i.imgur.com/ohAOqzl.jpg")
user.save
user = User.create(email: "TomTom@aol.com", username: "TomTom")
user.avatar_remote_url = ("http://i.imgur.com/h3mnKXP.jpg")
user.save
user = User.create(email: "BrickThorn@aol.com", username: "BrickThorn")
user.avatar_remote_url = ("http://i.imgur.com/hRjnZ5P.jpg")
user.save
user = User.create(email: "ChampMan@aol.com", username: "ChampMan")
user.avatar_remote_url = ("http://i.imgur.com/Tpe9ILP.jpg")
user.save
user = User.create(email: "FrogPrince@aol.com", username: "FrogPrince")
user.avatar_remote_url = ("http://i.imgur.com/BKH5nxY.jpg")
user.save

30.times do
	Group.create(title: "feedback", description: "feedback for Collabowrite", is_private: true, is_searchable: false)
	GroupUser.create(user_id: 1, group_id: 1, mod: true, accepted: true)
	is_private = rand(2)
	is_private == 1 ? is_private = true : is_private = false
	is_searchable = rand(2)
	is_searchable == 1 ? is_searchable = true : is_searchable = false
	group = Group.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, is_private: is_private, is_searchable: is_searchable)
	user = rand(User.all.length) + 1
	GroupUser.create(user_id: user, group_id: group.id, mod: true, accepted: true)
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