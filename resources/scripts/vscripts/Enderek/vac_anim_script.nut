pathName <- null
selfName <- null

function AssignName(name) // Searches for next path_track name
{
    pathName = name.GetName()
}

function AssignSelfNames(self) // Unused
{
    selfName = self.GetName()
}

function Link(ent)
{
    ent.KeyValueFromString(PathName, target)
}


/*
Aby ten skrypt zadziałał:

Pierwszy path_track musi mieć input z logic_auto FireUser1
Pierwszy path_track - OnUser1 > !self > RunScriptCode > Link(self) (BARDZO WAŻNE! 0.02 opóźnienie, aby PathName miał wartość)
Pierwszy path_track - OnUser1 > outputRel > Trigger

outputRel - entity używane do komunikacji I/O

Tutaj problem, ten path_track musi mieć bezpośrednią komunikację I/O z następnym, aby umożliwić użycie !caller do skryptu, narazie to pomińmy. (Prawdopodobnie da się to zrobić w editoritems, bez zabawy w VBSP_cfg)

Drugi path_track - OnUser1 > !caller > RunScriptCode > AssignName(self)

*/
