﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8.27
@EndOfDesignText@
'Static code module
#IgnoreWarnings:12
Sub Process_Globals
	Public Name As String = "LifeCode"
	Public Title As String = "Life"
	Private vm As BANanoVM
	Private vue As BANanoVue
	Private BANano As BANano  'ignore
	Private cont As VMContainer
End Sub

Sub Code
	'Establish a reference to the app
	vm = pgIndex.vm
	vue = vm.vue
	'create a container to hold all contents based on the page name
	cont = vm.CreateContainer(Name, Me)
	'the container should be hidden initialy
	cont.Hide
	Dim expgc As VMExpansionPanels = vm.CreateExpansionPanels("explif", Me)
	expgc.SetAccordion(True)
	expgc.SetActivepanel("1")
	expgc.SetPopout(True)
	expgc.SetVisible(True)
	
	Dim recs As List = Main.GetLifeData
	Dim childCnt As Int = 0
	For Each rec As Map In recs
		childCnt = childCnt + 1
		'
		Dim sLessonTitle As String = rec.get("lessontitle")
		Dim sLessonScriptures As String = rec.get("lessonscriptures")
		Dim sVerses As String = rec.get("verses")
		sVerses = BANano.sf(sVerses)
		'
		Dim contChild As VMContainer = pgIndex.ChildContainer($"lf${childCnt}"$, sLessonScriptures, sVerses)
		expgc.AddPanel1($"pnllf${childCnt}"$, sLessonTitle, contChild)
	Next
	
	cont.AddControl(expgc.ExpansionPanels, expgc.tostring, 1, 1, 0, 0, 0, 0, 12, 12, 12, 12)

	'add container to the page
	vm.AddContainer(cont)

End Sub

'show the page
Sub Show
	vue.setdata("heading", "Life")
	'the navbar is visible for this page
	vm.NavBar.Show
	'show the hamburger for this page
	vm.NavBar.Hamburger.SetVisible(True)
	'the logo should be visible for this page
	vm.NavBar.Logo.Show
	vm.HideItem("navLife")
	'Show the page and hide others
	vm.ShowPage(Name)
End Sub