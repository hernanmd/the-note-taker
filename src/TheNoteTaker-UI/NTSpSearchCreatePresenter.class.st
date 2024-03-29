"
A toolbar with a text entry which has two roles when text is typed 

- A search for notes begins always, if any match then matching notes are returned.
- If none matches, then a new note is created after hitting **enter**

"
Class {
	#name : 'NTSpSearchCreatePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'notesSearchCreateTextPresenter',
		'notesSearchButtonPresenter',
		'model'
	],
	#category : 'TheNoteTaker-UI-Core',
	#package : 'TheNoteTaker-UI',
	#tag : 'Core'
}

{ #category : 'layout' }
NTSpSearchCreatePresenter >> defaultLayout [ 

	^ SpBoxLayout newLeftToRight 
		add: notesSearchCreateTextPresenter;
		add: notesSearchButtonPresenter expand: false;
		yourself
]

{ #category : 'callbacks' }
NTSpSearchCreatePresenter >> filteredNotesFor: aString [ 
	"Answer a <Collection> of <NTNoteObject> whose names match aString"
	
	^ self notes select: [ : note | note title beginsWith: aString ]
]

{ #category : 'initialization' }
NTSpSearchCreatePresenter >> initializePresenters [ 

	notesSearchCreateTextPresenter := self newTextInput
		help: 'Create a note by just typing a name';
		placeholder: 'Type note to search or create';
		whenTextChangedDo: [ self updateNotesList ];		
		yourself.
	notesSearchButtonPresenter := self newButton
		icon: (self iconNamed: #smallFind);
		action: [ self updateNotesList ];		
		help: 'Search note';
		yourself
]

{ #category : 'accessing' }
NTSpSearchCreatePresenter >> model [

	^ model
]

{ #category : 'callbacks' }
NTSpSearchCreatePresenter >> notes [
	"Answer a <Collection> of <NTNoteObject> representing all the application's notes"

	^ self model notes
]

{ #category : 'callbacks' }
NTSpSearchCreatePresenter >> notesList [
	"Answer the <NTSpNoteIndexPresenter> responsible to display the notes"

	^ self owner notesIndexPresenter
]

{ #category : 'accessing - model' }
NTSpSearchCreatePresenter >> setModelBeforeInitialization: aNotesObject [

	model := aNotesObject
]

{ #category : 'callbacks' }
NTSpSearchCreatePresenter >> updateNotesList [

	self notesList items:  (notesSearchCreateTextPresenter text
		ifEmpty: [ self notes ]
		ifNotEmpty: [ :pattern | self filteredNotesFor: pattern ])

]
