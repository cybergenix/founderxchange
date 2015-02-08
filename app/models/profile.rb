class Profile < ActiveRecord::Base

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
