Class {
	#name : 'BaselineOfTheNoteTaker',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfTheNoteTaker',
	#package : 'BaselineOfTheNoteTaker'
}

{ #category : 'baselines' }
BaselineOfTheNoteTaker >> applicationGenerator: spec [

	spec
		baseline: 'ApplicationGenerator'
		with: [ spec repository: 'github://hernanmd/PharoApplicationGenerator:allow_dwnld_ui_vm/src' ]
]

{ #category : 'baselines' }
BaselineOfTheNoteTaker >> baseline: spec [

	<baseline>
	spec for: #( common ) do: [
		self ical: spec.
		self microEd: spec.
		self applicationGenerator: spec.
		self objcbridge: spec.

		spec
			package: 'TheNoteTaker';
			package: 'TheNoteTaker-UI' 	with: [ spec requires: #( #MicroEd TheNoteTaker ) ];
			package: 'TheNoteTaker-Release' with: [ spec requires: #( ApplicationGenerator ObjCBridge ) ];
			package: 'TheNoteTaker-Tests' with: [ spec requires: #( TheNoteTaker ) ].
		spec
			group: 'Core' with: #( 'TheNoteTaker' );
			group: 'UI' with: #( 'TheNoteTaker-UI' );
			group: 'Tests' with: #( 'TheNoteTaker' 'TheNoteTaker-Tests' );
			group: 'Release' with: #( 'Core' 'UI' 'ObjCBridge' 'TheNoteTaker-Release' );
			group: 'default' with: #( 'Core' 'Tests' 'UI' ) ]
]

{ #category : 'baselines' }
BaselineOfTheNoteTaker >> ical: spec [

	spec
		baseline: 'ICal'
		with: [ spec repository: 'github://Ducasse/Infhub/src' ]
]

{ #category : 'baselines' }
BaselineOfTheNoteTaker >> microEd: spec [

	spec
		baseline: 'MicroEd'
		with: [ spec repository: 'github://pillar-markup/MicroEd/src' ]
]

{ #category : 'baselines' }
BaselineOfTheNoteTaker >> objcbridge: spec [

	spec baseline: 'ObjCBridge' with: [
		spec repository: 'github://tesonep/objcbridge:master/src' ].	
]
