//When ready
printl("Working!")

entName <- null
manName <- null

//Script
function ConsoleName(ent)
{
    entName = ent.GetName()
    ent.ValidateScriptScope()
    local scope = ent.GetScriptScope()
    scope.FizzleEvent <- FizzleEvent
    scope.manName <- manName
    ent.ConnectOutput( "OnFizzled", "FizzleEvent")
}

function FizzleCube()
{
    EntFire(entName, "FireUser1")
}

function ManagerName(man)
{
    manName = man.GetName()
}

function FizzleEvent()
{
    EntFire(manName, "SetStateBTrue")
}