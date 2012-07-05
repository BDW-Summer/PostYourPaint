class User
    attr_accessor :fname, :lname
    
    def initialize(attributes= {})
        @fname = attributes[:fname]
        @lname = attributes[:lname]
    end
    
    def full_name
        "#{fname} #{@lname}"
    end
end