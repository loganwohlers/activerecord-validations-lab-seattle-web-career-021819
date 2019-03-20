class Post < ActiveRecord::Base
    validates :title, presence:true
    validate :post_title
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Nonfiction)} 
   
    def post_title
        if !self.title.nil?
          phrases = ["Won\'t Believe", "Secret", "Top", "Guess"]
          if !phrases.any? {|phrase| self.title.include?(phrase)}
            errors.add(:title, "Not enough!")
          end
        else
          errors.add(:title, "Not enough!")
        end
    end
end
