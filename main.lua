-- Title: Lives&Timers
-- Name: Tristan Royer
-- Course: Ics2O/3C
--

--
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

local lives = 4
local heart1
local heart2
local heart3
local heart4

local incorrectObject

local GameOver = display.newImageRect("Images/gameOver.png",1200,1400)
GameOver.x = display.contentCenterX
GameOver.y = display.contentCenterY
GameOver.isVisible = false

 local YouWin = display.newImageRect("Images/YouWin.jpg",1200,1400)
YouWin.x = display.contentCenterX
YouWin.y = display.contentCenterY

 YouWin.isVisible = false


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

heart4 = display.newImageRect("images/heart.png", 100, 100)
heart4.x =  display.contentWidth * 4 / 8
heart4.y = display.contentHeight * 1 / 7

local function UpdateHearts()
    if (lives == 4) then
    heart4.isVisible = true
    heart3.isVisible = true 
    heart2.isVisible = true
    heart1.isVisible = true   
    end
    if (lives == 3) then
    heart4.isVisible = false 
    heart3.isVisible = true
    heart2.isVisible = true
    heart1.isVisible = true
    end
    if (lives == 2) then
    heart4.isVisible = false
    heart3.isVisible = false
    heart2.isVisible = true
    heart1.isVisible = true
    end
    if (lives == 1) then
    heart4.isVisible = false
    heart3.isVisible = false
    heart2.isVisible = false
    heart1.isVisible = true
    end

    if (lives == 0) then
    heart4.isVisible = false 
    heart3.isVisible = false
    heart2.isVisible = false
    heart1.isVisible = false
    --show image
    GameOver.isVisible = true
end
end



 -- create the incorrect text object and make it invisible
     incorrectObject = display.newText( "Incorrect", display.contentWidth/2, display.contentHeight*2/3,nil,50)
     incorrectObject.isVisible = false
     incorrectObject:setTextColor(100/255, 180/255, 19/255)

     --create the correct text object and make it invisible
     correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3,nil,50)
     correctObject.isVisible = false
     correctObject:setTextColor(180/255,120/255,100/255)


     -- displays a question and sets the colour 
     questionObject = display.newText("" , display.contentWidth/3, display.contentHeight/2, nil, 40)
     questionObject:setTextColor(155/255, 0/255, 0/255)

    

      clockText = display.newText("TimeLeft:" .. secondsLeft,500,600,nil,40)
    clockText:setTextColor(155/255,180/255,1/255)


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
    
    if ( randomOperation == 1) then correctAnswer = randomNumber1 + randomNumber2
     
    --create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer

    end

    if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
    --create question in text object
    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer
end

if ((correctAnswer < 0) and (randomOperation == 2)) then
        correctAnswer = randomNumber2 - randomNumber1
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
        CorrectText.text = "The correct answer is:" .. correctAnswer
        end

if (randomOperation == 3) then correctAnswer = randomNumber3 * randomNumber4
    --create question in text object
    questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "
    CorrectText.Text = "The correct answer is:" .. correctAnswer

end
if (randomOperation == 4) then answerDivision = randomNumber5 / randomNumber6
correctAnswer = math.ceil(answerDivision)
CorrectText.text = "The correct answer is:" .. correctAnswer
-- create the question in text object
questionObject.text = randomNumber5 .. " / " .. randomNumber6 .. " = " 
end
if (randomOperation == 5) then SquareRoot = math.sqrt(randomNumber7)
    correctAnswer = math.ceil(SquareRoot)
    questionObject.text = " sqrt : " .. randomNumber7 .. " = "
    CorrectText.text = "The correct answer is:" .. correctAnswer

end
end

 CorrectText = display.newText("The correct answer is:" .. correctAnswer , display.contentWidth/4, display.contentHeight/5, nil, 40)
     questionObject:setTextColor(155/255, 0/255, 0/255)
     CorrectText.isVisible = false


 

local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end

local function HideIncorrect()
    incorrectObject.isVisible = false
    AskQuestion()
end

local function HideCorrectAnswer()
  CorrectText.isVisible = false
end





local function UpdateTime()

-- decrement the number of Seconds
secondsLeft = secondsLeft - 1
clockText.text = ("TimeLeft:" .. secondsLeft)

if (secondsLeft == 0) then 
    -- reset the number of seconds left in the clock object
    secondsLeft = totalSeconds
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
            if (score == 5) then
                 YouWin.isVisible = true
    --clear text field
        event.target.text = ""
end
if (lives == 0) then 
    StopTimer()
    audio.stop(FreeMusicChannel)
    GameOverSoundChannel = audio.play(GameOverSound)
end
end
end

    




     -- Create Numeric field
     numericField = native.newTextField( 500, 350, 150, 30)
     numericField.inputType = "number"

     	 scoreText = display.newText("score:" .. score, 500,500, nil, 40)


   
   -- add the event listener for the numeric field
     numericField:addEventListener( "userInput", NumericFieldListener )

     -- asks the question
     AskQuestion()

     Runtime:addEventListener("EnterFrame",StopTimer)
  
  
     
    
