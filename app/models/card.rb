class GoodnessValidator < ActiveModel::Validator
  def validate(card)
    if card.original_text.upcase.delete(" ")   == card.translated_text.upcase.delete(" ")  
      card.errors[:base] << "Слова совпадают"
    end
  end
end


class Card < ApplicationRecord
	validates :original_text, :translated_text, presence: { message: 'не может быть пустым' },
                    length: { minimum: 2,  message: 'должно быть больше символов' }
   
    validates_with GoodnessValidator 

end
