require "nokogiri"
require "open-uri"

# put the library (season, pathway) link here
season_link = "https://www.chineseclass101.com/lesson-library/introductions-numbers-and-more-absolute-beginner-chinese/"

# base link (without the last forward slash)
base_link = "https://www.chineseclass101.com"

# you can choose the library (folder) name here or leave this way to be set automatically from the season link
season_name = season_link.split("/").last; Dir.mkdir season_name if !File.exists? season_name

# access the season page and get a nokogiri object
puts "Entering season page...\n\n"
library = Nokogiri::HTML.parse URI.open season_link

# get all relative links as array
puts "Getting links...\n\n"
relative_links = library.to_s.scan(/<a class=\"Lesson__link_wrap_8cf8\" href=\"(.*?)\">/).map{|link| link[0].to_s}

# iterate through each link, entering the lessons pages
relative_links.each do |relative_link|
    puts "Entering lesson page...\n\n"
    lesson_page = Nokogiri::HTML URI.open base_link + relative_link

    # getting the transcription table
    transcription_table = lesson_page.css("table#lsn3-lesson-transcript-table").css("tbody")

    # name of the lesson will be saved
    lesson_name = "#{season_name}/#{lesson_page.css("div.r101-headline__cell-a").css("h1").text.delete(":?")}.txt"

    # creating the lesson file
    File.open(lesson_name, "w") do |file|
        transcription_table.search("tr").each do |line|
            line = line.text.strip 
            line = "##### INTRODUCTION #####\n\n" if line == "INTRODUCTION"
            line = "\n\n##### DIALOGUE #####\n\n" if line == "DIALOGUE"
            line = "\n\n##### Outro #####\n\n" if line == "Outro"
            line = "\n\n##### VOCAB AND PHRASE USAGE #####\n\n" if line == "VOCAB AND PHRASE USAGE"
            file.puts line
        end
    end
    puts "Saved lesson to #{lesson_name}\n\n"
end
puts "Process Finished"