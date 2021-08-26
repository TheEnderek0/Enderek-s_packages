cubeName <- null
cube <- null //Cube entity
timerName <- null
launcherName <- null
triggerName <- null
delay <- 0 // $timer_delay
spriteOneName <- null
spriteTwoName <- null
count <- 0
dropTriggerName <- null

function OnPostSpawn() //Set a proper model of the cube
{
  self.SetModel("models/props/heprc/heprc_cube.mdl")  
}

function PelletCaptured() //Fires when a pellet is captured
{
  cube.EmitSound("EnergyBall.KillImpact")
  EntFire(triggerName, "Disable")
  EntFire(timerName, "Enable")
  EntFire(spriteOneName, "HideSprite")
  EntFire(spriteTwoName, "ShowSprite", "", 0.20)
}

function OnTimer()
{
  count = count + 1
  if(count < delay)
  {
    cube.EmitSound("Portal.room1_TickTock")
  }
  if(count == delay)
  {
    FirePellet()
    count = 0
  }
}

function FirePellet()
{
  EntFire(launcherName, "LaunchBall")
  EntFire(timerName, "Disable")
  EntFire(spriteTwoName, "HideSprite")
  EntFire(triggerName, "Enable", "", 1.00)
  EntFire(spriteOneName, "ShowSprite", "", 1.00)
}

function CubeFizzled()
{
  count = 0
  EntFire(timerName, "Disable")
  EntFire(cubeName, "KillHierarchy", "", 2.00)
}

function AssignNamesCube(cubeEnt, delayRaw)
{
  cube = cubeEnt
  cubeName = cubeEnt.GetName()
  delay = delayRaw
}

function AssignNamesTimer(timer)
{
  timerName = timer.GetName()
}

function AssignNamesLauncher(launcher)
{
  launcherName = launcher.GetName()
}

function AssignNamesTrigger(trigger)
{
  triggerName = trigger.GetName()
}

function AssignNamesSpriteOne(spriteOne)
{
  spriteOneName = spriteOne.GetName()
}

function AssignNamesSpriteTwo(spriteTwo)
{
  spriteTwoName = spriteTwo.GetName()
}

//This script is used for HEPRC template for standard droppers.
//Vactube droppers already have this functionality.

function AssignNamesTriggerDropper(dropTrig)
{
  dropTriggerName = dropTrig.GetName()
}


function FireFizzledToDropper()
{
  EntFire(dropTriggerName, "FireUser4")
}


function FizzleCube()
{
  EntFire(cubeName, "Dissolve")
}

function AddFizzleEvent(dropTrigger)
{
  dropTrigger.ValidateScriptScope()
  local scope = dropTrigger.GetScriptScope()
  scope.FizzleCube <- FizzleCube
  scope.cubeName <- cubeName
  dropTrigger.ConnectOutput("OnUser3", "FizzleCube")
}