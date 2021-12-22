Simple ruby scraper script to get all transcripts of chinese class 101 (Japanesepod101, and maybe others...).

I personally think this script complementary to the https://github.com/nedlir/languagepod101-scraper/, (which only downloads the mp3 files.)

Successfully tested with introductions-numbers-and-more-absolute-beginner-chinese and level-2-chinese season/pathways of chinese class 101. Also successfully tested with level-1-japanese from Japanesepod101.
The only requirement is to change the season_link and base_link according to the language you want (lines 5 and 8).

No login is required for the script to work. 

To get the season_link:
1. Go to: https://www.chineseclass101.com/dashboard (or https://www.japanesepod101.com/dashboard if you wanna japanese, or any other language. This part is very intuitive).
2. Choose a pathway, copy the link and paste on line 5 

To get the base_link:
1. Remove all after the .com
    * https://www.chineseclass101.com/dashboard --> https://www.chineseclass101.com
    * https://www.japanesepod101.com/dashboard --> https://www.japanesepod101.com
2. Paste on line 8

The script will automatically create a folder for each season/pathway

Used gems:
* Nokogiri
* Open-uri

Just type bundle install to install them automatically

The first time I tested the script, I had a problem with some lessons not being saved correctly. This happened because they had special characters (like : or ?). So, remember to add these characters on line 30, inside the .delete("").

I didn't map all of the transcripts' subheads. If you want something more organized, just look the line 36 and follow suit.

Feel free to modify as you want.
