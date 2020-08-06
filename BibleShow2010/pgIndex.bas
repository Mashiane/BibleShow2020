B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=8.1
@EndOfDesignText@
'Static code module
#ignorewarnings:12
Sub Process_Globals
	Private BANano As BANano  'ignore
	Public vm As BANanoVM
	Private vue As BANanoVue  'ignore
End Sub

Sub Init
	'initialize the page
	vm.Initialize(Me, Main.appname)
	vue = vm.vue
	Dim cont As VMContainer = vm.CreateContainer("mainx", Me)
	cont.AddRows(1).AddColumns12
	Dim lblH As VMLabel = vm.NewLabel(False, "lblH", "heading", vm.SIZE_H1, "Bible.Show")
	lblH.SetFontFamily("Market Web, Helvetica, sans-serif")
	cont.AddComponent(1, 1, lblH.tostring)
	vm.AddContainer(cont)
	'
	BuildNavBar
	BuildNavDrawer
	BuildFooter
	AddPages
	AddContent
	vm.ux
	'
	pgBiblePromises.Show
End Sub

Sub ChildContainer(childID As String, childTitle As String, childContent As String) As VMContainer   'ignore
	Dim child As VMContainer = vm.CreateContainer(childID, Me)
	'Dim lblHead As VMLabel = vm.newlabel(True, $"lbl${childID}"$, "", vm.SIZE_BLOCKQUOTE, childTitle)
	'child.AddControlS(lblHead.Label,lblHead.ToString,1,1,12,12,12,12)
	Dim lblContent As VMLabel = vm.newlabel(True, $"lbl1${childID}"$, "", vm.SIZE_P, childContent)
	child.AddControlS(lblContent.Label,lblContent.ToString,1,1,12,12,12,12)
	Return child
End Sub

'build the navigation bar
Sub BuildNavBar
	'*copy code after this line
	'add a hamburger
	vm.NavBar.AddHamburger
	vm.NavBar.Hamburger.SetVisible(True)
	'add a logo
	vm.NavBar.Logo.SetBorderRadius("50%")
	vm.NavBar.Logo.SetBorderWidth("1px")
	vm.NavBar.Logo.SetBorderColor("black")
	vm.NavBar.Logo.SetBorderStyle("solid")
	vm.NavBar.Logo.SetSize("46px","46px")
	vm.NavBar.AddLogo("./assets/sponge.png")
	vm.NavBar.Logo.Show
	vm.NavBar.AddTitle("Bible.Show","white--text")
	vm.NavBar.AddSubHeading1("2020")
	vm.NavBar.SetColorIntensity("red","accent-4")
	vm.NavBar.SetFixed(True)
	vm.NavBar.SetVisible(True)
	vm.NavBar.SetClippedLeft(True)
End Sub


'fire when search looses focus
Private Sub appsearch_change(e As BANanoEvent)
	'get the search phrase
	Dim sappsearch As String = vm.GetData("appsearch")
	vm.ShowSnackBar(sappsearch)
End Sub



Sub BuildFooter
	vm.Footer.SHow
	vm.Footer.SetFixed(True)
	vm.Footer.SetColorIntensity("red","accent-4")
	vm.footer.Container.SetTag("div")
	vm.footer.Container.AddRows(1).AddColumns12
	vm.Footer.Container.SetAttrRC(1, 0, "align", "center")
	vm.Footer.AddMadeWithLove(1, 1, "with BANanoVuetify by the", "TGIF Zone Inc", "mbanga.anele@gmail.com")
End Sub


'build the nav drawer
Sub BuildNavDrawer
	'*copy code after this line
	vm.Drawer.Setwidth("350")
	vm.Drawer.SetClipped(True)
	vm.Drawer.SetOpenOnMediumLarge(True)
	vm.Drawer.SetSrc("./assets/cross.jpg")
	vm.Drawer.SetDark(True)
	'vm.Drawer.Show
	'vm.Drawer.SetAbsolute(True)
	'vm.Drawer.AddItem1("pageScriptures", "./assets/reading.png", "", "green", "Scriptures", "Select the book to read", "", "", "")
	'vm.Drawer.AddDivider1(False)
	'vm.Drawer.AddItem1("pageChapters", "./assets/openbook80.png", "", "green", "Chapters", "Select the book chapter to read", "", "", "")
	'vm.Drawer.AddDivider1(False)
	'vm.Drawer.AddItem1("pageVerses", "./assets/book.png", "", "green", "Verses", "View the selected scripture and read it", "", "", "")
	'vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageBiblePromises", "./assets/promises.png", "", "green", "Bible Promises", "Some topic based scriptures", "", "", "")
	vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageParables", "./assets/parables.png", "", "green", "Parables", "Parables of Jesus Christ", "", "", "")
	vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageMiracles", "./assets/miracles.png", "", "green", "Miracles", "Miracles of Jesus Christ", "", "", "")
	vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageLife", "./assets/life.png", "", "green", "Life", "Some scriptures to go through life", "", "", "")
	vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageGreatChapters", "./assets/review.png", "", "green", "Great Chapters", "A collection of some great chapters", "", "", "")
	vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageGreatStories", "./assets/greatstories.png", "", "green", "Great Stories", "A collection of some great stories", "", "", "")
	vm.Drawer.AddDivider1(False)
	vm.Drawer.AddItem1("pageGreatVerses", "./assets/greatverses.png", "", "green", "Great Verses", "A collection of some great verses", "", "", "")
	'vm.Drawer.AddDivider1(False)
	'vm.Drawer.AddItem1("pageQualities", "", "", "green", "Qualities", "Positive and Negative Qualities", "", "", "")
	'vm.Drawer.AddDivider1(False)
	'vm.Drawer.AddItem1("pageBibleInPictures", "./assets/picture.png", "", "green", "Bible In Pictures", "Bible in pictures", "", "", "")
	'vm.Drawer.AddDivider1(False)
End Sub

'add pages to the app
Sub AddPages
	'*copy code after this line
	vm.AddPage(pgScriptures.name, pgScriptures)
	vm.AddPage(pgChapters.name, pgChapters)
	vm.AddPage(pgVerses.name, pgVerses)
	vm.AddPage(pgBiblePromises.name, pgBiblePromises)
	vm.AddPage(pgParables.name, pgParables)
	vm.AddPage(pgMiracles.name, pgMiracles)
	vm.AddPage(pgLife.name, pgLife)
	vm.AddPage(pgGreatChapters.name, pgGreatChapters)
	vm.AddPage(pgGreatStories.name, pgGreatStories)
	vm.AddPage(pgGreatVerses.name, pgGreatVerses)
	vm.AddPage(pgQualities.name, pgQualities)
	vm.AddPage(pgBibleInPictures.name, pgBibleInPictures)
End Sub

'add content to this page
Sub AddContent
	'*copy code here to add to thos page
End Sub

'*IMPORTANT when a drawer item is clicked
Sub draweritems_click(e As BANanoEvent)
	'get the id from the event
	Dim elID As String = vm.GetIDFromEvent(e)
	Select Case elID
	'copy code below this line
		Case "pagescriptures"
			'drawer item click Scriptures
			pgScriptures.Show
		Case "pagechapters"
			'drawer item click Chapters
			pgChapters.Show
		Case "pageverses"
			'drawer item click Verses
			pgVerses.Show
		Case "pagebiblepromises"
			'drawer item click Bible Promises
			pgBiblePromises.Show
		Case "pageparables"
			'drawer item click Parables
			pgParables.Show
		Case "pagemiracles"
			'drawer item click Miracles
			pgMiracles.Show
		Case "pagelife"
			'drawer item click Life
			pgLife.Show
		Case "pagegreatchapters"
			'drawer item click Great Chapters
			pgGreatChapters.Show
		Case "pagegreatstories"
			'drawer item click Great Stories
			pgGreatStories.Show
		Case "pagegreatverses"
			'drawer item click Great Verses
			pgGreatVerses.Show
		Case "pagequalities"
			'drawer item click Qualities
			pgQualities.Show
		Case "pagebibleinpictures"
			'drawer item click Bible In Pictures
			pgBibleInPictures.Show
	End Select
	If BANano.IsPhone Then
		vm.Drawer.hide
	End If
End Sub

'confirm dialog ok click
Sub confirm_ok(e As BANanoEvent)
	Dim sconfirm As String = vm.GetConfirm
	Select Case sconfirm
	'copy code below this line
	End Select
End Sub

'confirm dialog cancel click
Sub cancel_ok(e As BANanoEvent)

End Sub

'alert dialog ok clock
Sub alert_ok(e As BANanoEvent)

End Sub

'confirm dialog cancel click
Sub confirm_cancel(e As BANanoEvent)

End Sub

Sub logo_click(e As BANanoEvent)
End Sub

Sub title_click(e As BANanoEvent)
	
End Sub

