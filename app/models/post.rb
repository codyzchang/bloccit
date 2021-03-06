class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :topic
  
<<<<<<< HEAD
  default_scope { order('created_at DESC')}
=======
 
   def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / (60 * 60 * 24) # 1 day in seconds
     new_rank = points + age_in_days
 
     update_attribute(:rank, new_rank)
   end
  
   def up_votes
     votes.where(value: 1).count
   end
  
   def down_votes
     votes.where(value: -1).count
   end
  
   def points
     votes.sum(:value)
   end
  
   default_scope { order('rank DESC') }
>>>>>>> favorite
  
  scope :ordered_by_title, -> { order('title') }
  scope :ordered_by_reverse_created_at , -> { order('title').reverse }
  
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
<<<<<<< HEAD
=======
  
>>>>>>> favorite
  validates :topic, presence: true
  validates :user, presence: true

  def markdown_title
    render_as_markdown(self.title)
  end

  def markdown_body
    render_as_markdown(self.body)
  end

  def save_with_initial_vote
    ActiveRecord::Base.transaction do
      @post.save
      @post.create_vote
    end
  end
  
  
  private

  def create_vote
    user.votes.create(value: 1, post: self)
  end
  
  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end
end
