class Admin < PARENT_MODEL_CLASS
    
    devise :database_authenticatable, :validatable, :registerable
    include DeviseInvitable::Inviter
end