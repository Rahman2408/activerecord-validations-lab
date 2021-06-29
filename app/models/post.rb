class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction) }
  validate :clickbait 

    private
    
    def clickbait
       if self.title
        unless self.title.match?(/Won't Believe | Secret | Top | Guess/) 
            self.errors.add(:clickbait, "Not clickbait-y enough")
        end
        end
    end
end
