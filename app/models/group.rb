class Group < ApplicationRecord
  validates  :title, presence: { message: "Group must have a title."}, uniqueness: { message: "Group name is already taken." }
	has_many   :group_users
	has_many   :users, through: :group_users
  has_many   :group_scripts
  has_many   :scripts, through: :group_scripts
  has_many   :comments, as: :commentable

	has_attached_file :image, :default_url => "default_group_icon.png"
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def mods
  	u_groups = GroupUser.where(group_id: self.id, mod: true)
  	users = []
  	u_groups.each do |u_group|
  		users << User.find(u_group.user_id)
  	end
    users
  end

  def members
    members = []
    group_users = self.group_users.where(accepted: true)
    group_users.each do |group_user|
      members << group_user.user
    end
    members
  end

  def pending?(user)
    self.group_users.where(user_id: user.id, accepted: false).first ? true : false
  end

  self.per_page = 16

  def self.search(search)
    if search && search != ""
      Group.all.where(title: "#{search}")
    else
      Group.all.where(is_searchable: true)
    end
  end

  # filterrific(
  # default_filter_params: { sorted_by: 'created_at_desc' },
  # available_filters: [
  #   :sorted_by,
  #   :search_query,
  #   :is_private
  #   ]
  # )

  # scope :search_query, lambda {|query|
  #   return nil if query.blank?
  #   terms = query.downcase.split(/\s+/)
  #   terms = terms.map { |e|
  #     (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  #   }
  #   num_or_conds = 1
  #   where(terms.map { |term|
  #     "(LOWER(groups.title) LIKE ?"
  #     }.join(" AND "), *terms.map {|e| [e] * num_or_conds}.flatten )
  # }

  # scope :sorted_by, lambda {|sort_option|
  #   direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  #   case sort_option.to_s
  #     when /^created_at_/
  #       order("groups.created_at #{ direction }")
  #     when /^title_/
  #       # Simple sort on the name colums
  #       order("LOWER(groups.title) #{ direction }")
  #     when /^is_private_/
  #       # Simple sort on the name colums
  #       order("LOWER(groups.title) AND groups.is_private #{ direction }")
  #     else
  #       raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  #     end
  # }

  # scope :is_private, lambda {|is_private|
  #   where(is_private: [*is_private])
  # }

  # def self.options_for_sorted_by
  #   [
  #     ['Title (a-z)', 'name_asc'],
  #     ['Creation date (newest first)', 'created_at_desc'],
  #     ['Creation date (oldest first)', 'created_at_asc'],
  #     ['Is Private?', 'is_private']
  #   ]
  # end


    
end
