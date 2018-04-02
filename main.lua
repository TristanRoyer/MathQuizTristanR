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


local clockText
local totalSeconds = 10
local secondsLeft = 10

local lives = 4
local heart1
local heart2
local heart3
local heart4

local incorrectObject

local GameOver = display.newImageRect("Images/gameOver.png",500,500)
 GameOver.isVisible = false
 GameOver.X = display.contentWidth/2
 GameOver.Y = display.contentHeight/2

 local scoreText


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
      randomOperation = math.random(1,4)
    -- generate 2 random numbers between a max. and a min. number
    randomNumber1 = math.random(0,25)
    randomNumber2 = math.random(0,21)
    randomNumber3 = math.random(0,10)
    randomNumber4 = math.random(0,10)
    randomNumber5 = math.random(1,100)
    randomNumber6 = math.random(1,100)
    
    if ( randomOperation == 1) then correctAnswer = randomNumber1 + randomNumber2
     
    --create question in text object
    questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    end

    if (randomOperation == 2) then correctAnswer = randomNumber1 - randomNumber2
    --create question in text object
    questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
     
end

if ((correctAnswer < 0) and (randomOperation == 2)) then
        correctAnswer = randomNumber2 - randomNumber1
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
        end

if (randomOperation == 3) then correctAnswer = randomNumber3 * randomNumber4
    --create question in text object
    questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "
end
if (randomOperation == 4) then correctAnswer = randomNumber5 / randomNumber6
	-- create the question in text object
questionObject.text = randomNumber5 .. " / " .. randomNumber6 .. " = " 
end
end
 

local function HideCorrect()
    correctObject.isVisible = false
    AskQuestion()
end

local function HideIncorrect()
    incorrectObject.isVisible = false
    AskQuestion()
end




local function UpdateTime( )

-- decrement the number of Seconds
secondsLeft = secondsLeft - 1
clockText.text = ("TimeLeft:" .. secondsLeft)

if (secondsLeft == 0) then 
    -- reset the number of seconds left in the clock object
    secondsLeft = totalSeconds
    lives = lives - 1

end

end
-- create a countdown timer that loops infinitely
local countDownTimer = timer.performWithDelay( 1000, UpdateTime,0)

local function StopTimer()
	 if (lives == 0) then
		  --stop the timer
     timer.cancel(countDownTimer)
 end
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

                else
                incorrectObject.isVisible = true
                timer.performWithDelay(1000,HideIncorrect)
                lives = lives - 1
                secondsLeft = totalSeconds
            end
    --clear text field
        event.target.text = ""
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
    -- stop timer
    StopTimer()
 
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
  
  
     
    
