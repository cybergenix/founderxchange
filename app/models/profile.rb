class Profile < ActiveRecord::Base
  
	has_attached_file :avatar, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "default.jpg"
	
     

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

#Method to store options in the form of a HashMap to include in the views form.
	PARTNER_ROLE = { 
0 => 'CHOOSE:',			
1 => 'Co-Founder', 
2 => 'Mentor',
3 => 'Adviser',
4 => 'Intern' 
}

#Return function to retrive object stored in the database and match it with the HashMap above.
def return_partner_role
    PARTNER_ROLE[id]
  end

      belongs_to :user
      belongs_to :category
end
