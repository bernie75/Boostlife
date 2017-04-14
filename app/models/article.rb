class Article < ApplicationRecord
 validates_presence_of :title, :on => :create, :message => "can't be blank"
 validates_presence_of :text, :on => :create, :message => "can't be blank"
end

