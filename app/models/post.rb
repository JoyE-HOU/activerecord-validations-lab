class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { :in => %w(Fiction Non-Fiction)}
    validates :invalid_if_not_clickbait, inclusion: { :in => %w("Won't Believe" "Secret" "Top [number]" "Guess")}
    # validates :invalid_if_not_clickbait{("Won't Believe", "Secret", "Top [number]", "Guess")}

    # private

    def invalid_if_not_clickbait
        if title.include?("Won't Believe", "Secret", "Top [number]", "Guess")
            puts "true"
        else
            puts "false"
        end
    end
end
