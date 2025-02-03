/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR sleep = 0
VAR phone = 0
VAR coffe = 0
VAR right = 0
VAR left = 0

-> bedroom

== bedroom ==
You wake up in your bedroom, expecting to at least the sun, but it is still pitch black outside.
~ phone = 0
~ coffe = 0
~ right = 0
~ left = 0
* [check your alarm clock] -> alarmClock

+ {phone == 0} [go to the bathroom] -> bathroom

+ {phone == 0}[go to attic] -> atticDark

== bedroom2 ==
+ {phone == 0} [go to the bathroom] -> bathroom

+ {phone == 0}[go to attic] -> atticDark

+ {phone == 1 && atticLight == 0}[go to attic] -> atticLight

+ {phone == 1 && atticLight == 1}[go to attic] -> atticLight2

+ {phone == 1}[go downstairs] -> livingroom


== alarmClock == 
Upon inspecting your alarm clock, you realize that it is broken, welp you were going to get a new one anyways.
-> bedroom2

== bathroom ==
You go to the bathroom expecting that you will need to use it, but surpisedly, as soon as you entered you realized you never needed to go.
*[Inspect the bathroom] 
~ phone = 1
-> cellphone

+[Go back] -> bedroom

== cellphone ==
Upon inspecting the bathroom, you see your cellphone in the corner of the room, strange what is it doing there? How did not realized it was missing in the first place?
-> bathroom2

== bathroom2 ==
+[Go back] -> bedroom2

== atticDark ==
Upon going up the attic you it was going to be too dark to see anything, so instead you decide it is best to find a light source to actually see in the attic.
+[Go back]-> bedroom2

== atticLight ==
Now that you have your cellphone, you can use it as a flashlight to explore it.
*[Explore attic]-> atticExplored

+[Go back]-> bedroom2

== atticExplored ==
Nothing interesting for the most part, but you did found a fresh hot cup of coffe, could be useful.
~ coffe = coffe + 1
-> atticLight2

== atticLight2 ==
*{atticExplored == 0}[Explore attic]-> atticExplored
+[Go back]-> bedroom2

== livingroom ==
Upon going downstairs you see that everything is a mess down here, what happened exactly before you went to sleep?
+[wait something is up?]-> UhOh

== UhOh ==
A strange feeling overcomes you, something is off, but you faint before you could realized what is up
-> dream_bedroom

== dream_bedroom ==
You wake up again, but this time everything is different like slightly off, and your alarm clock seems to work now, but it is only displaying a certain number for some reason.
~ sleep = 0

*[check alarm clock]-> checkDreamClock

+{checkDreamClock} [check the clock] -> dreamClock

+[Go to the hallway]-> dreamHallway

== dream_bedroom2 ==
{sleepy()}

*{checkDreamClock == 0}[check alarm clock]-> checkDreamClock

+{checkDreamClock} [check the clock] -> dreamClock

+{dreamHallway == 0}[Go to the hallway]-> dreamHallway

+{dreamHallway == 2}[Go to the hallway]-> dreamHallway2

== checkDreamClock ==
Upon checking this more throughly you realized the number means how tired you are for some reason, wait how does that work aren't you in a dream right now?
-> dream_bedroom2

== dreamClock ==
You're currently at {sleep}
-> dream_bedroom2

== dreamHallway ==
This is off everything is weird here to, every room is blocked off, the only way you can go is down stairs, but {sleepy()}

+[Go back] -> dream_bedroom2

+[Go downstairs] -> dream_downstairs

== dreamHallway2 ==
Back in the hallway, but {sleepy()}
+[Go back] -> dream_bedroom2

+[Go downstairs] -> dream_downstairs

== dream_downstairs ==
For some reason these stairs seem to take way longer to go down like the amount of steps were multipled by 10, and {sleepy()}
-> dream_livingroom

== dream_livingroom ==
Upon entering the living room, the stairs just vanish out of nowhere, so looks like we're stuck in the living room now.
+[check the clock in the living room] -> dreamClock_livingroom
*[Go to the kitchen] -> dream_kitchen

== dream_livingroom2 ==
Everything is just weird, and {sleepy()}
+{dream_kitchen == 0}[Go to the kitchen] -> dream_kitchen
+{dream_kitchen >= 1}[Go to the kitchen]-> dream_kitchen2

== dream_kitchen ==
As you entered the kitchen you noticed that every plate is shattered on the floor, and there seems to be a cup of coffe on the counter, also {sleepy()}
*[grab the coffe] -> kitchen_coffe

+[Go to the basement] -> dream_basement

== kitchen_coffe ==
You grabed the fresh cup of coffe.
~ coffe = coffe + 1
-> dream_kitchen2

== dream_kitchen2 ==
You should probably go to the basement now, before you pass out.
+[Go to the basement] -> dream_basement

== dream_basement ==
As you went down the basement everything looked normal until you reached the bottom, before you could do anything the basement slowly morphed into a maze, isn't that just wonderful, and now {sleepy()}
-> dream_maze

== dream_maze ==
+ {sleep < 120}[Go left] 
~ left = left + 1
-> left_maze

+ {sleep < 120}[Go right] 
~ right = right + 1
-> right_maze

+ {sleep == 120} [You start passing out] -> dream_bedroom

+ {left >= 2 && right >= 3 && sleep < 120} [You see a door that looks different from the other ones go through it?] -> exit_maze

== left_maze ==
As you go down the maze {sleepy()} -> dream_maze

== right_maze ==
As you go down the maze {sleepy()} -> dream_maze

== exit_maze ==
As you exited the weird basement maze you see another cup of coffe and grabed it.
~ coffe = coffe + 1
-> pedestals

== pedestals ==
You see three pedestals, and for some reason you can just tell it is for the coffe you grabed.
+ {coffe == 1} [place the one coffe] -> bad

+ {coffe == 2} [place the 2 coffes] -> bad

+ {coffe == 3} [place all the coffes] -> good

== bad ==
It seems like you only had {coffe} coffes, upon realizing that a shadowy figure appears behind you and knocks you out, your final thoughts before you slip into unconsciousness are I should make sure I find all the coffes
-> bedroom

== good ==
Upon placing all the coffes a flash of a blinding light strikes you, and when you recover you noticed you were back in your bedroom, but this time you see the sunlight, this must've been one hell of a bad dream this whole time, oh well!
-> END

== dreamClock_livingroom ==
You're currently at {sleep}
-> dream_livingroom2

== function sleepy ==
    ~ sleep = sleep + 10
    {
        - sleep == 10:
            ~ return "you starting to get sluggish"
            
        - sleep == 20:
            ~ return "everything seems to be getting darker"
        - sleep == 30:
            ~ return "you think you see a shadowy figure, but that can't be real?"
        - sleep == 40:
            ~ return "you start to get even slower"
        - sleep == 50:
            ~ return "the shadowy figure seems to start looking even more real now?"
        - sleep == 60:
            ~ return "sleep is for the weak right?"
        - sleep == 70:
            ~ return "you begin to start hearing random sounds"
        - sleep == 80:
            ~ return "you think you see a shadowy figure getting closer to you, but this can't be real?"
        - sleep == 90:
            ~ return "the sleep is starting to get to you"
        - sleep == 100:
            ~ return "you feel like these next moves will be your final ones unitl you finally pass out again"
        - sleep == 110:
            ~ return "you need to find a way out of this nightmare"
        - sleep == 120:
            ~ return "the shadowy figure approaches you, and you don't think you can keep yourself up anymore"
    }
        
