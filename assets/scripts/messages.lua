require 'assets/scripts/vendor/MessageInABottle'

local messages = {}
local duration = 30 

function messages.load()
	ocean = Ocean:new()
end

function messages.update(dt)
	ocean:update(dt)
end

function messages.draw()
	ocean:draw()
end

function messages.new_message(cap)
	local texts = {}
	texts.welcome = "I must make decision. I won’t leave this room until I’ve decided to kill my girlfriend or not. How has it come to this? I’ve got little time. Her life is teetering through my fingers."
	texts.cap1preview="She’s gorgeous in this picture. My mother has given me more than I’ll ever be able to give her back. Not only did she give me the gift of life, but a reason to go on. Her lessons and strong character have made me become the man I am now. What I most want in this world is for her to be proud of me. Proud of my work and my partner. But a bitch had to screw it all up."
	texts.cap1stage="She stepped on what I loved most. She attacked all my mother taught me and undermined my deepest beliefs. I don’t believe half-way, like my siblings, but truly. And this girl did nothing but ridicule me. Make fun of me in front of my friends; call me a nutter in private; tell me I was wrong; brand me as a brute - a moron. But she’s the moron! She’s just an immoral, sinful whore…I need to calm down, clear my mind. Listen to God’s Word. If I go out now, I’ll kill her! I must settle down and think straight. God, speak to me!"
	texts.cap2stage=" Corinthians 12:10 That is why, for Christ's sake, I delight in weaknesses, in insults, in hardships, in persecutions, in difficulties. For when I am weak, then I am strong uAs strong as she made me. She laughed at me in front of my friends, but to help me overcome my shyness. She said I was a nutter to help me overcome my issues, to make me realise the obsessions I’d inherited from my mother. Brute when I wasn’t tolerant with others. And I just got upset…like a moron. A part of my soul still belongs to her. But I mustn’t forget where I first met her, where I bought her first kisses. My parents must never know the truth. My mother shall never know about the smokes, the drinks I had. I must destroy that sheet of paper. Nobody must see it."
	texts.cap3stage="While the smoke went through my nostrils, I remembered the barbecue parties we threw every Saturday with my family. My cousins adored her and she got on really well with my uncle and aunt. She was completely integrated in my family, so we invited her to come to this barbecue party. And then, while we were saying grace, she started to eat.  In the silence you could hear her chewing on a greasy sausage. In shock, they all looked at her, and then, at my grimace. I couldn’t believe what was happening. I took her outside to the log cabin. She won’t easily forget what I said to her. I’d never met such an insensitive person, such a…and as an apology she gave us a fucking compact disc as a gift. Does she really think it would make up for what she’d done? What a shitty gift!"
	texts.cap4stage="I love this song. I remember now why she bought this one. It was our song. A hidden apology for me. Maybe I got too carried away. After all, she’s not religious, she’d never said grace. She hadn’t even seen how it’s done. She did what anybody would have done: sit down and start to eat. Poor one. I shouldn’t have accepted the album, her tears were more than enough. She meant no harm. But I did…and now I must kill her. I must do it before she starts telling lies about me and harms my family's reputation. I can't allow this to happen. I'm not gay. I'm not sick. I'm not using this key. I'll go out that door and I'll do her in. No more memories, I've made up my mind."
	texts.endbad="Die, bitch."
	texts.endgood="My bra. It's so uncomfortable. I've always hated wearing it. It makes my breasts hurt. On our first secret anniversary he bought me an outfit. He's got me. He's always helped me grow as a person. To break ties. Like the one I'm in now. Telling my mother I'm a woman who's into other...women. And that the Lord justs wants me to be happy. I've got to be strong.  2 Corinthians 12:10 That is why, for Christ's sake, I delight in weaknesses, in insults, in hardships, in persecutions, in difficulties. For when I am weak, then I am strong uAs strong as she made me. She laughed at me in front of my friends, but to help me overcome my shyness. She said I was a nutter to help me overcome my issues, to make me realise the obsessions I’d inherited from my mother. Brute when I wasn’t tolerant with others. And I just got upset…like a moron. A part of my soul still belongs to her. Thanks my love."
	local bottle = TimeBottle:new(cap, texts['' .. cap], duration)
  	bottle:setX(30)
  	bottle:setY(500)
  	bottle:setWidth(1220)
  	bottle:setHeight(140)
  	bottle:setVolume(0)
  	ocean:addBottle(bottle)
end

return messages

