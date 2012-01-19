require 'rubygems'
require 'mechanize'

agent = Mechanize.new

page = agent.get('http://cli.learncodethehardway.org/book/')

chapter_links = []

page.links.each do |link|
  link_id = link.attributes['id']
  if link_id
    id_split = link_id.split('-')
    chapter_links << link if id_split[0] == "QQ2" and id_split[1].to_i > 3 
  end
en

# Misha was here!
