Class {
	#name : 'NTSpApplicationTest',
	#superclass : 'TestCase',
	#instVars : [
		'app',
		'noteContainer',
		'previousNotesLocation',
		'settings',
		'memoryFS'
	],
	#category : 'TheNoteTaker-UI-Tests',
	#package : 'TheNoteTaker-UI-Tests'
}

{ #category : 'running' }
NTSpApplicationTest >> setUp [

	super setUp.
	
	settings := NTSettings.
	previousNotesLocation := settings noteLocation.

	memoryFS := FileSystem memory.
	settings noteLocation: memoryFS workingDirectory.

	app := NTSpApplication new.
	noteContainer := app noteTakerContainer.
]

{ #category : 'running' }
NTSpApplicationTest >> tearDown [

	settings noteLocation: previousNotesLocation.
	
	super tearDown
]

{ #category : 'tests' }
NTSpApplicationTest >> testAddNoteByName [

	self assert: noteContainer notes size equals: 0.

	app addNoteNamed: 'test'.

	self assert: noteContainer notes size equals: 1.
	self assert: noteContainer notes first title equals: 'test'
]

{ #category : 'tests' }
NTSpApplicationTest >> testSearchNoteByName [

	| note1 note3 |
	note1 := noteContainer addNoteNamed: 'Test'.
	noteContainer addNoteNamed: 'Test2'.
	note3 :=noteContainer addNoteNamed: 'Test3'.
	
	self assert: (app noteNamed: note1 fileName) equals: note1.
	self assert: (app noteNamed: note3 fileName) equals: note3.
]
