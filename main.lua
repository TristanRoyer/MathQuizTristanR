-- Title: Lives&Timers
-- Name: Tristan Royer
-- Course: Ics2O/3C
-- This program asks the user a varity of math questions

-- sets the background to a different colour
display.setDefault("background",100/255,16/255,180/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create local variables
local questionObject
local correctObject
local numericField
local randomNumber1 = 0
local randomNumber2 = 0
local randomNumber3 = 0
local randomNumber4 = 0
local userAnswer
local correctAnswer = 0
local incorrectObject
local randomOperation = 0
local numericField
local scoreText
local score = 0
local answerDivision = 0
local SquareRoot


local clockText
local totalSeconds = 10
local secondsLeft = 10

local lives = 3
local heart1
local heart2
local heart3


local incorrectObject

-- Creates background images for Win and lose and hides them
local GameOver = display.newImageRect("Images/gameOver.png",1200,1400)
GameOver.x = display.contentCenterX
GameOver.y = display.contentCenterY
GameOver.isVisible = false

 local YouWin = display.newImageRect("Images/YouWin.jpg",1200,1400)
YouWin.x = display.contentCenterX
YouWin.y = display.contentCenterY
YouWin.isVisible = false

-- loads sounds
local GameOverSound = audio.loadSound("Sounds/Game Over Sound Effect.mp3")
local GameOverSoundChannel

local FreeMusic = audio.loadSound("Sounds/bensound-acousticbreeze.mp3")
local FreeMusicChannel
FreeMusicChannel = audio.play(FreeMusic)

local YouWinSound = audio.loadSound("Sounds/applause3.mp3")
local YouWinSoundChannel

local CorrectSound = audio.loadSound("Sounds/SOUND EFFECT TADA.mp3")
local CorrectSoundChannel

local WrongSound = audio.loadSound("Sounds/Aww Sound Effect.mp3")
local WrongSoundChannel


   -- create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100,100)
heart1.x = display.contentWidth * 7 / 8
heart1.y = display.contentHeight * 1 / 7

heart2 = display.newImageRect("images/heart.png", 100, 100)
heart2.x =  display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("images/heart.png", 100, 100)
heart3.x =  display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7


local function UpdateHearts()
    if (lives == 3) then 
    heart3.isVisible = true
    heart2.isVisible = true
    heart1.isVisible = true
    end
    if (lives == 2) then
    heart3.isVisible = false
    heart2.isVisible = true
    heart1.isVisible = true
    end
    if (lives == 1) then
    heart3.isVisible = false
    heart2.isVisible = false
    heart1.isVisible = true
    end

    if (lives == 0) then
    heart3.isVisible = false
    heart2.isVisible = false
    heart1.isVisible = false
    --show image
    GameOver.isVisible = true
end
end



 -- create the incorrect text object and make it invisible
     incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*3/5,nil,50)
     incorrectObject.isVisible = false
     incorrectObject:setTextColor(100/255, 180/255, 19/255)

     --create the correct text object and make it invisible
     correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*3/5,nil,50)
     correctObject.isVisible = false
     correctObject:setTextColor(180/255,120/255,100/255)


     -- displays a question and sets the colour 
     questionObject = display.newText("" , display.contentWidth/3, display.contentHeight/2, nil, 40)
     questionObject:setTextColor(155/255, 0/255, 0/255)

    
     -- displays the timer
      clockText = display.newText("TimeLeft:" .. secondsLeft,500,600,nil,40)
    clockText:setTextColor(155/255,180/255,1/255)

    -- displays the correctAnswer and makes it invisible
 CorrectText = display.newText("" , display.contentWidth/4, display.contentHeight/5, nil, 40)
     questionObject:setTextColor(155/255, 0/255, 0/255)
     CorrectText.isVisible = false


 local function AskQuestion()

    -- program chooses a random number betweer 1-3
      randomOperation = math.random(1,5)
    -- generate 2 random numbers between a max. and a min. number
    randomNumber1 = math.random(0,25)
    randomNumber2 = math.random(0,21)
    randomNumber3 = math.random(0,10)
    randomNumber4 = math.random(0,10)
    randomNumber5 = math.random(50,100)
    randomNumber6 = math.random(1,25)
    randomNumber7 = math.random(3,9)
    
    -- asks the user questions based on the random Number chosen by the program
    if ( randomOperation == 1) then correctAnswer = randomNumber1 + randomNumber2
     
    --create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer

    end

    if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
   -- creates the question in text object and changes the text for the Correct answer
    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer
end

if ((correctAnswer < 0) and (randomOperation == 2)) then
        correctAnswer = randomNumber2 - randomNumber1
        -- creates the question in text object and changes the text for the Correct answer
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
        CorrectText.text = "The correct answer is:" .. correctAnswer
        end

if (randomOperation == 3) then correctAnswer = randomNumber3 * randomNumber4
    -- creates the question in text object and changes the text for the Correct answer
    questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer

end
if (randomOperation == 4) then answerDivision = randomNumber5 / randomNumber6
correctAnswer = math.ceil(answerDivision)
-- creates the question in text object and changes the text for the Correct answer
CorrectText.text = "The correct answer is:" .. correctAnswer
questionObject.text = randomNumber5 .. " / " .. randomNumber6 .. " = " 
end
if (randomOperation == 5) then SquareRoot = math.sqrt(randomNumber7)
    correctAnswer = math.ceil(SquareRoot)
    -- creates the question in text object and changes the text for the Correct answer
    questionObject.text = " sqrt : " .. randomNumber7 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer

end
end




 
-- hides Correct and asks a new question
local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end

-- hides incorrect and asks a new question
local function HideIncorrect()
    incorrectObject.isVisible = false
    AskQuestion()
end

-- hides CorrectAnswer and asks a new question
local function HideCorrectAnswer()
  CorrectText.isVisible = false
end




-- updates the timer soo that the seconds go down
local function UpdateTime()

-- decrement the number of Seconds
secondsLeft = secondsLeft - 1
clockText.text = ("TimeLeft:" .. secondsLeft)

if (secondsLeft == 0) then 
    -- reset the number of seconds left in the clock object
    secondsLeft = totalSeconds
     -- removes a life and asks a new question
    lives = lives - 1
    AskQuestion()
    UpdateHearts()
end
end
-- create a countdown timer that loops infinitely
local countDownTimer = timer.performWithDelay( 1000, UpdateTime,0)

local function StopTimer()
		  --stop the timer
     timer.cancel(countDownTimer)
 end
 


     
    

-- allows the NumericField to work
local function NumericFieldListener( event )

    --User begins editing "numericField"
    if ( event.phase == "began" ) then

        --clear text field
        event.target.text = ""

        elseif event.phase == "submitted" then 
            --when the answer is submitted (enter key is pressed) set user input to user's answer
            userAnswer = tonumber(event.target.text)

            --if the users answer and the correct answer are the same:
            if (userAnswer == correctAnswer) then
                correctObject.isVisible = true
                timer.performWithDelay(1000,HideCorrect)
                secondsLeft = totalSeconds
                score = score + 1
		        scoreText.text = ("score:" .. score)
            CorrectSoundChannel = audio.play(CorrectSound)
            event.target.text = ""
              -- if the user's answer is incorrect
                else
                incorrectObject.isVisible = true
                timer.performWithDelay(1000,HideIncorrect)
                lives = lives - 1
                secondsLeft = totalSeconds
                UpdateHearts()
                WrongSoundChannel = audio.play(WrongSound)
                CorrectText.isVisible = true
                timer.performWithDelay(1000,HideCorrectAnswer)
                event.target.text = ""

            end
            -- if the user scores 5 points they win and the win screen is displayed
            if (score == 5) then
                 YouWin.isVisible = true
                 StopTimer()
                 audio.stop(FreeMusicChannel)
                 YouWinSoundChannel = audio.play(YouWinSound)
    --clear text field
        event.target.text = ""
end
-- If the user loses all their lives they Lose the game and the Lose screen is displayed
if (lives == 0) then 
    StopTimer()
    audio.stop(FreeMusicChannel)
    GameOverSoundChannel = audio.play(GameOverSound)
end
end
end

    




     -- Create Numeric field
     numericField = native.newTextField( 500, 350, 150, 100)
     numericField.inputType = "number"

-- displays the scorer
     	 scoreText = display.newText("score:" .. score, 500,500, nil, 40)


   
   -- add the event listener for the numeric field
     numericField:addEventListener( "userInput", NumericFieldListener )

     -- asks the question
     AskQuestion()

    
  
  
     
    
