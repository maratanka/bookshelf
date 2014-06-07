require "active_record"
class Book < ActiveRecord::Base

  #include ActiveModel::Validations
  #attr_accessor :name
validates :name, presence: true, uniqueness: true, length: { minimum: 1 }
validates :author, presence: true, length: { minimum: 1 }
end

class User < ActiveRecord::Base
 
end


class BooksUsers < ActiveRecord::Base
validates :name, presence: true, uniqueness: true, length: { minimum: 1 }
validates :author, presence: true, length: { minimum: 1 }

end
#end
