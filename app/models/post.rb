class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }

  validate :validate_title_not_true_facts

  private

  def validate_title_not_true_facts
    errors.add(:title, "cannot be 'True Facts'") if title == "True Facts"
  end
end
